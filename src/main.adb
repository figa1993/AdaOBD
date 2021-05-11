with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with SocketCAN; use SocketCAN;
with CAN; use CAN;
with OBD; use OBD;
with OBD.CommuncationEngine; use OBD.CommuncationEngine;
with OBD.PIDs; use OBD.PIDs;


procedure Main is
   Device_Name : aliased Unbounded_String := To_Unbounded_String("can0");
   Dev : aliased SocketCAN.Device (Device_Name'Access);
   Frame : CAN.CAN_Frame;
   Message_Counter : Integer := 0;
   CommuncationEngine : CommuncationEngine_Type(Dev'Access);
   PID_0 : Supported_PIDs_Bitfield(1,0,4);
begin
   Put_Line ("AdaOBD version 0.0.6");
   --   Parse command line arguments

   --   Initialize the CAN_Transceiver with the device handle,
   --   Establish a connection for CAN_Transceiver

   Dev.Initialize;

   CommuncationEngine.Request_PID(Message => PID_0);

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
