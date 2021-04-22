with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
-- with PIDs; use PIDs;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with SocketCAN; use SocketCAN;
with CAN; use CAN;


procedure Main is
   Dev : SocketCAN.Device;
   Frame : CAN.CAN_Frame := (Is_Extended => False, others => <> );
   Message_Counter : Integer := 0;
begin
   Put_Line ("AdaOBD version 0.0.3");
   --   Parse command line arguments

   --   Initialize the CAN_Transceiver with the device handle,
   --   Establish a connection for CAN_Transceiver

   SocketCAN.Start (Dev, To_Unbounded_String ("can0") );

   while True loop
      Message_Counter := Message_Counter + 1;
      Put_Line( "Message #" & Message_Counter'Image );
      Frame := SocketCAN.Receive (Dev);
      Put_Line( Frame'Image );
      delay 1.0;
   end loop;

   --   Register callbacks on the CAN_Transceiver, Encoder, and Decoder

   --   Determine which PIDs are supported and set-up
   --   deserialization dictionary

   --   Kick off task(s) for querying each PID
   --   @TODO is it possible to determine PID data rates?

   null;
end Main;
