pragma Ada_2012;
package body SocketCAN is

   -----------
   -- Start --
   -----------

   procedure Start (This : Device) is
   begin
      --  Request a socket from the system
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

   function Receive (This : Device) return CAN_Frame is
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

   procedure Send (This : Device; Frame : CAN_Frame) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Send unimplemented");
      raise Program_Error with "Unimplemented procedure Send";
   end Send;

end SocketCAN;
