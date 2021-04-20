pragma Ada_2012;

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
with linux_can_h; use linux_can_h;
with arm_linux_gnueabihf_bits_socket_h; use arm_linux_gnueabihf_bits_socket_h;
with net_if_h; use net_if_h;
with Ada.Text_IO; use Ada.Text_IO;

package body SocketCAN is

   package Socket_Bits renames arm_linux_gnueabihf_bits_socket_h;

   -----------
   -- Start --
   -----------

   procedure Start (This : in out Device; Device_Name : Unbounded_String) is
      -- @TODO: does these need to persist while the device is in scope?
      -- @TODO: Figure out how to zero the Socket_Address data before use
      Socket_Address_CAN : aliased sockaddr_can;
--      Socket_Address : aliased Sockaddr
--        with Address => Socket_Address_CAN'Address;

      Interface_Request : aliased ifreq;
      Return_Code : int ;
   begin

      Put_Line ("Starting SocketCAN device " & To_String(Device_Name) );

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
                        Interface_Request.ifr_ifrn.ifrn_name
                          'Unrestricted_Access );
      begin
         To_C( To_String(Device_Name), Interface_Request.ifr_ifrn.ifrn_name,
               Chars_Written, True );
         Interface_Request.Ifr_Ifru.Ifru_Ivalue :=
           Interfaces.C.int(if_nametoindex (Interface_Name_Access ) );
      end;

      --  Check if the interface name was recognized by the system
      if Interface_Request.ifr_ifru.ifru_ivalue = 0 then
         raise Program_Error with
           "Interface " & To_String(Device_Name) &
           " does not exist";
      end if;
      Socket_Address_CAN.can_ifindex := Interface_Request.ifr_ifru.ifru_ivalue;

      --  Bind the socket
      Return_Code := Sockets.C_Bind( This.Socket_FD, Socket_Address_CAN'Address,
                                     Socket_Address_CAN'Size / Storage_Unit);
      if Return_Code < 0 then
         raise Program_Error with
           "System failed to bind socket: " & Errno_Message;
      end if;

   end Start;

   ----------
   -- Stop --
   ----------

   procedure Stop (This : Device) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Stop unimplemented");
      raise Program_Error with "Unimplemented procedure Stop";
   end Stop;

   -------------
   -- Receive --
   -------------

   function Receive (This : Device) return CAN.CAN_Frame is
   begin
      pragma Compile_Time_Warning (Standard.True, "Receive unimplemented");
      return raise Program_Error with "Unimplemented function Receive";

      -- use recvmsg() system call to receive message bytes
      -- construct a CAN Frame from the received bytes
      -- return the frame

   end Receive;

   ----------
   -- Send --
   ----------

   procedure Send (This : Device; Frame : CAN.CAN_Frame) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Send unimplemented");
      raise Program_Error with "Unimplemented procedure Send";
   end Send;

end SocketCAN;
