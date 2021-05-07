--   Standard Ada packages
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with System; use System;

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
with Ada.Text_IO; use Ada.Text_IO;

package body SocketCAN is

   package Socket_Bits renames Arm_Linux_Gnueabihf_Bits_Socket_H;

   -----------
   -- Start --
   -----------

   procedure Initialize (This : in out Device) is
      -- @TODO: does these need to persist while the device is in scope?
      -- @TODO: Figure out how to zero the Socket_Address data before use
      Socket_Address_CAN : aliased Sockaddr_Can;
      --      Socket_Address : aliased Sockaddr
      --        with Address => Socket_Address_CAN'Address;

      Interface_Request : aliased Ifreq;
      Return_Code : Int ;
   begin

      Put_Line ("Starting SocketCAN device " & To_String(This.Device_Name.all) );

      --  @TODO: zero initialize the Socket Address?

      --  Request a socket from the system
      This.Socket_FD := Sockets.C_Socket( PF_CAN, SOCK_RAW, CAN_RAW );

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
      Return_Code := Sockets.C_Bind( This.Socket_FD, Socket_Address_CAN'Address,
                                     Socket_Address_CAN'Size / Storage_Unit);
      if Return_Code < 0 then
         raise Program_Error with
           "System failed to bind socket: " & Errno_Message;
      end if;

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
   function Receive (This : Device) return CAN.CAN_Frame is
      Frame : CAN.CAN_Frame;
   begin

      --  Receive bytes from the socket using recv system call
      if Recv (This.Socket_FD, Frame'Address, Frame'Size / Storage_Unit, 0) > 0 then
         Put_Line (Frame'Image);
      end if;

      return Frame;
      ------------------ NOTES -------------
      -- Observation: The length of the frame is unknown apriori (it is
      -- dependent on fields in the header)

      -- Assumption: Once the protocol is determined, the length of the frame
      -- is known

      -- Observation: Error handling should be performed by hardware
      -- In the general case there are multi-frame messages (but not for OBD-II)
      -- how to handle dropped packets.
      ------------------ /NOTES ------------


      -- Read in the arbitartion field.
      -- Read in the DLC
      -- Read in the Data



      -- use recvmsg() system call to receive message bytes
      -- construct a CAN Frame from the received bytes
      -- return the frame

   end Receive;

   ----------
   -- Send --
   ----------

   procedure Send (This : Device; Frame : CAN.CAN_Frame) is
   begin
      raise Program_Error with "Unimplemented procedure Send";
   end Send;

   procedure Send (This : in out Device; Payload : Payload_Type;
                   Tx_Arbitration_Id : Ext_Arbitration_ID_Type ) is
      Frame : aliased CAN.CAN_Frame(Is_Extended=>True);
      Bytes_Written : int;
   begin
      --   Encapsulate the payload into a CAN frame
      Frame.Ext_Arbitration_ID := Tx_Arbitration_Id;
      Frame.DLC := Payload'Length;
      Frame.Payload := Payload;

      --   Perform system calls to send the Frame
      Bytes_Written := send( This.Socket_FD,
                             Frame'Address,
                             Frame'Size/Storage_Unit,
                             0);

      Put_Line("Wrote " & Bytes_Written'Image & " bytes");

   end Send;

end SocketCAN;
