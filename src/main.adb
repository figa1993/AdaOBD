with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with SocketCAN; use SocketCAN;
with CAN; use CAN;
with OBD; use OBD;
with OBD.CommuncationEngine; use OBD.CommuncationEngine;
with OBD.Message; use OBD.Message;
with OBD.Message.PIDs; use OBD.Message.PIDs;


procedure Main is
   Device_Name : aliased Unbounded_String := To_Unbounded_String("can0");
   Dev : aliased SocketCAN.Device (Device_Name'Access);
   Device_Name1 : aliased Unbounded_String := To_Unbounded_String("can1");
   Dev1 : aliased SocketCAN.Device (Device_Name1'Access);
   Message_Counter : Integer := 0;
   CommuncationEngine : CommuncationEngine_Type(Dev'Access);
   PID_0 : Supported_PIDs_Bitfield;
begin
   Put_Line ("AdaOBD version 0.0.11");
   --   Parse command line arguments

   --   Initialize the CAN_Transceiver with the device handle,
   --   Establish a connection for CAN_Transceiver

   Dev.Initialize;
   Dev1.Initialize;

   while True loop
      CommuncationEngine.sendRequest(Message => Message_Type'Class(PID_0));
      delay 0.01;
   end loop;

   --  while True loop
   --     Message_Counter := Message_Counter + 1;
   --     Put_Line( "Message #" & Message_Counter'Image );
   --     Frame := SocketCAN.Receive (Dev);
   --     Put_Line( Frame'Image );
   --     delay 1.0;
   --  end loop;

   --   Register callbacks on the CAN_Transceiver, Encoder, and Decoder

   --   Determine which PIDs are supported and set-up
   --   deserialization dictionary

   --   Kick off task(s) for querying each PID
   --   @TODO is it possible to determine PID data rates?

   null;
end Main;
