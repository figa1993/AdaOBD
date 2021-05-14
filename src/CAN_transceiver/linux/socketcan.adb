--   Standard Ada packages
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System; use System;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

--   GNAT specific packages
with GNAT.OS_Lib; use GNAT.OS_Lib;

--   Internal non-portable GNAT packages
pragma Warnings(Off);
with GNAT.Sockets.Constants; use GNAT.Sockets.Constants;
pragma Warnings(On);

--   Non-portable Linux binding packages
with Linux_Can_H; use Linux_Can_H;
with Arm_Linux_Gnueabihf_Bits_Socket_H; use Arm_Linux_Gnueabihf_Bits_Socket_H;
with Arm_Linux_Gnueabihf_Sys_Socket_H; use Arm_Linux_Gnueabihf_Sys_Socket_H;
with Net_If_H; use Net_If_H;
With unistd_h; use unistd_h;



package body SocketCAN is

   package Socket_Bits renames Arm_Linux_Gnueabihf_Bits_Socket_H;

   --  Thick binding for the Linux kernel can_frame type
   type SocketCAN_DLC_Type is new Data_Length_Code with Size =>32;
   SocketCAN_Header_Length : constant Natural := 64;

   type SocketCAN_Header (Is_Extended : Boolean := True)
   is record
      Is_RTR : Boolean;
      Is_Error : Boolean;
      DLC : SocketCAN_DLC_Type;
      case Is_Extended is
      when False =>
         Std_Arbitration_ID : Std_Arbitration_ID_Type;
      when True =>
         Ext_Arbitration_ID : Ext_Arbitration_ID_Type;
      end case;
   end record with Size => SocketCAN_Header_Length;

   for SocketCAN_Header use record
      Std_Arbitration_ID at 0 range 0 .. 10;
      Ext_Arbitration_ID at 0 range 0 .. 28;
      Is_RTR at 0 range 29 .. 29;
      Is_Error at 0 range 30 .. 30;
      Is_Extended at 0 range 31 .. 31;
      DLC at 0 range 32 .. 32 + Data_Length_Code'Size-1;
   end record;

   type SocketCAN_Frame
   is record
      Header : SocketCAN_Header;
      Payload : Payload_Type(1 .. 8);
   end record;

   for SocketCAN_Frame use record
      Header at 0 range 0 .. SocketCAN_Header_Length-1;
      Payload at 0 range SocketCAN_Header_Length .. SocketCAN_Header_Length + 64 -1;
   end record;

   pragma Assert (SocketCAN_Frame'Size = linux_can_h.can_frame'Size,
                  "SocketCAN_Frame size does not match Linux kernel can_frame size");

   -----------
   -- Start --
   -----------

   procedure Initialize (This : in out Device) is
      -- @TODO: does these need to persist while the device is in scope?
      -- @TODO: Figure out how to zero the Socket_Address data before use
      Socket_Address_CAN : aliased sockaddr_can;
      Interface_Request : aliased Ifreq;
      Return_Code : Int ;
   begin

      Put_Line ("Starting SocketCAN device " & To_String(This.Device_Name.all) );

      --  @TODO: zero initialize the Socket Address?

      --  Request a socket from the system
      This.Socket_FD := socket( PF_CAN, SOCK_RAW, CAN_RAW );

      --  Check socket resource was provided without error
      if This.Socket_FD < 0 then
         raise Program_Error with "System failed to open socket";
      end if;

      --  Set the Socket address family to CAN
      --  @NOTE: This is NOT PORTABLE and should use the value AF_CAN
      --  which the binding generator failed to convert
      Socket_Address_CAN.Can_Family := PF_CAN;

      --  Convert the interface name to the index used in the system
      declare
         Chars_Written : Size_T;
         Interface_Name_Access : Chars_Ptr :=
           To_Chars_Ptr(
                        Interface_Request.Ifr_Ifrn.Ifrn_Name
                          'Unrestricted_Access );
      begin
         To_C( To_String(This.Device_Name.all),
               Interface_Request.Ifr_Ifrn.Ifrn_Name,
               Chars_Written, True );
         Interface_Request.Ifr_Ifru.Ifru_Ivalue :=
           Interfaces.C.Int(If_Nametoindex (Interface_Name_Access ) );
      end;

      --  Check if the interface name was recognized by the system
      if Interface_Request.Ifr_Ifru.Ifru_Ivalue = 0 then
         raise Program_Error with
           "Interface " & To_String(This.Device_Name.all) &
           " does not exist";
      end if;
      Socket_Address_CAN.Can_Ifindex := Interface_Request.Ifr_Ifru.Ifru_Ivalue;

      --  Bind the socket
      declare
         Socket_Address : aliased arm_linux_gnueabihf_bits_socket_h.Sockaddr
           with Address => Socket_Address_CAN'Address;
         --  function Convert is new Ada.Unchecked_Conversion
         --    (
         --     Source => sockaddr_can,
         --     Target => arm_linux_gnueabihf_bits_socket_h.sockaddr
         --    );
      begin
         Return_Code := Bind(This.Socket_FD,
                             Socket_Address'Access,
                             Socket_Address_CAN'Size / Storage_Unit);
         if Return_Code < 0 then
            raise Program_Error with
              "System failed to bind socket: " & Errno_Message;
         else
            Put_Line( "System provided socket with FD: " & This.Socket_FD'Image );
         end if;
      end;


   end Initialize;

   ----------
   -- Stop --
   ----------

   procedure Stop (This : Device) is
   begin
      raise Program_Error with "Unimplemented procedure Stop";
   end Stop;

   -------------
   -- Receive --
   -------------

   --  @TODO: Determine if this should be a blocking call with a timeout
   --  @TODO: Add error handling
   function Receive (This : in out Device) return Can.CAN_Frame is
      Header : aliased SocketCAN_Header;
      Bytes_Read : int := 0;
   begin

      --  Receive bytes from the socket using recv system call
      Bytes_Read := recv(This.Socket_FD,
                         Header'Address,
                         Header'Size / Storage_Unit,
                         0);
      if Bytes_Read /= (Header'Size / Storage_Unit) then
         raise Program_Error with "Failed to read CAN Header";
      end if;

      declare
         Frame : Can.CAN_Frame( Header.Is_Extended, Data_Length_Code (Header.DLC) );
      begin
         if Frame.Header.Is_Extended then
            Frame.Header.Ext_Arbitration_ID := Header.Ext_Arbitration_ID;
         else
            Frame.Header.Std_Arbitration_ID := Header.Std_Arbitration_ID;
         end if;
         Frame.Header.Is_RTR := Header.Is_RTR;
         Frame.Header.Is_Error := Header.Is_Error;

         Bytes_Read := Recv(This.Socket_FD,
                            Frame.Payload'Address,
                            Frame.Payload'Size / Storage_Unit,
                            0);
         if Bytes_Read /= (Frame.Payload'Size / Storage_Unit) then
            raise Program_Error with "Failed to read CAN Payload";
         end if;
         return Frame;
      end;

   end Receive;

   ----------
   -- Send --
   ----------

   procedure Send (This : in out Device;
                   Payload : Payload_Type;
                   TX_Arbitration_Id : Ext_Arbitration_ID_Type;
                   Is_Extended : Boolean) is

      Header : SocketCAN_Header(Is_Extended);
      Frame : aliased SocketCAN_Frame;
      Bytes_Written : int;
   begin
      --   @TODO How does this interact with filtering capabilities?
      if Header.Is_Extended then
         Header.Ext_Arbitration_ID := TX_Arbitration_Id;
      else
         Header.Std_Arbitration_ID := Std_Arbitration_ID_Type (TX_Arbitration_Id);
      end if;
      Header.DLC := Payload'Length;
      Frame.Header := Header;
      Frame.Payload := Payload;

      --   Perform system calls to send the Frame
      Bytes_Written := write( This.Socket_FD,
                             Frame'Address,
                             Frame'Size/Storage_Unit);

      Put_Line("Wrote " & Bytes_Written'Image & " of " & Int(Frame'Size/Storage_Unit)'Image & " bytes");

      if Bytes_Written < 0 then
         raise Program_Error with
           "Failed to write CAN Frame: " & Errno_Message;
      end if;

      --   @TODO: Determine whether payload bytes need to be padded
      --   @TODO: Determine whether the entire frame needs to be sent at once

   end Send;

   procedure Subscribe( This : in out Device;
                        Rx_Arbitration_Id : Ext_Arbitration_ID_Type;
                        Payload_Handler : CAN_Payload_Handler_Type) is
   begin
      This.Subscriber_Map.Include(Rx_Arbitration_Id, Payload_Handler);
   end Subscribe;

end SocketCAN;
