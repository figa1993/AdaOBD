with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;



procedure Main is

begin
   Put_Line ("AdaOBD version 0.0.1");
   --   Parse command line arguments

   --   Initialize the CAN_Transceiver with the device handle,
   --   Establish a connection for CAN_Transceiver

   --   Register callbacks on the CAN_Transceiver, Encoder, and Decoder

   --   Determine which PIDs are supported and set-up
   --   deserialization dictionary

   --   Kick off task(s) for querying each PID
   --   @TODO is it possible to determine PID data rates?

   null;
end Main;
