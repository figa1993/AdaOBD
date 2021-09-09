with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with SocketCAN; use SocketCAN;
--  with CAN; use CAN;
with CANtransceiver; use CANtransceiver;
--  with OBD; use OBD;
--  with OBD.Protocol; use OBD.Protocol;
--  with OBD.Message; use OBD.Message;
--  with OBD.Message.PIDs; use OBD.Message.PIDs;
with OBD.Protocol_Handler;
with System.Aux_DEC; use System.Aux_DEC;

procedure Main is
   Device_Name : aliased Unbounded_String := To_Unbounded_String("can0");
   Dev : aliased SocketCAN.Device (Device_Name'Access);

begin
   Put_Line ("AdaOBD version 0.0.12");

   --   Parse command line arguments

   --   Initialize the CAN_Transceiver with the device handle,
   --   Establish a connection for CAN_Transceiver
   Dev.Initialize;

   declare
      package Protocol_Handler_Instance is new OBD.Protocol_Handler
        (Transceiver => CANtransceiver.Transceiver_Type'Class(Dev),
         RX_Timeout  => 1.0);

      procedure PID_0_Handler (Bitfield : Bit_Array_32) is
      begin
         Put_Line(Bitfield'Image);
      end PID_0_Handler;
   begin
      --   Subscribe handler to the message
      Protocol_Handler_Instance.Messages.Service_0.PID_0.Subscribe(PID_0_Handler'Access);

      --   Enable request of subscribed message
      Protocol_Handler_Instance.Enable_Request(0,1);
   end;

   --   Determine which PIDs are supported and subscribe more handlers
   --   @TODO: Consider simplifying and just subscribe all handlers apriori.
   --   Need to understand what the protocol does when an unsupported PID is
   --   requested

   --   @TODO is it possible to determine PID data rates?

end Main;
