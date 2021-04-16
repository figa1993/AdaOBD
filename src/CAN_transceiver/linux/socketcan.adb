pragma Ada_2012;

with GNAT.Sockets.Constants; use GNAT.Sockets.Constants;

with linux_can_h; use linux_can_h;
with arm_linux_gnueabihf_bits_socket_h; use arm_linux_gnueabihf_bits_socket_h;

package body SocketCAN is

   package Socket_Bits renames arm_linux_gnueabihf_bits_socket_h;

   -----------
   -- Start --
   -----------

   procedure Start (This : in out Device) is
   begin
      --  Request a socket from the system
      This.Socket_FD := Sockets.C_Socket( PF_CAN, SOCK_RAW, CAN_RAW );
      --  Check socket resource was provided without error

      --  Set the Socket address family to CAN

      --  Convert the CAN socket Address to a raw socket address
      --  Bind the socket
      pragma Compile_Time_Warning (Standard.True, "Start unimplemented");
      raise Program_Error with "Unimplemented procedure Start";
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
