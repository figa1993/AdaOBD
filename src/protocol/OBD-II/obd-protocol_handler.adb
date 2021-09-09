pragma Ada_2012;

with Ada.Unchecked_Conversion;
with Ada.Text_IO; use Ada.Text_IO;

package body OBD.Protocol_Handler is

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize
     (Transceiver : Transceiver_Type'Class;
      RX_Timeout  : Ada.Real_Time.Time_Span)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Initialize unimplemented");
      raise Program_Error with "Unimplemented procedure Initialize";
   end Initialize;

   --------------------
   -- Enable_Request --
   --------------------

   procedure Enable_Request (PID : PID_Type; Service : Service_Type) is
      Key : Subscription_Key := (PID, Service);
   begin
      Subscriptions.Append(Key);
   end Enable_Request;

   ------------------
   -- Receive_Loop --
   ------------------

   task body Receive_Loop is
      Frame : CAN.CAN_Frame;
   begin
      Put_Line ("Protocol Handler receive loop starting");
      loop
         --   Dispatching call to a CAN Transceiver realization
         Frame := Receive(Transceiver);

         --   @TODO: Figure out look-up logic

         delay RX_Timeout;
      end loop;

   end Receive_Loop;

   -------------------
   -- Transmit_loop --
   -------------------

   task body Transmit_loop is
   begin
      Put_Line ("Protocol Handler transmit loop starting");
      loop
         Subscriptions.Request;
         delay RX_Timeout;
      end loop;
   end Transmit_loop;

   ------------------------
   -- Protected_Key_List --
   ------------------------

   protected body Subscribtion_List is

      ------------
      -- Append --
      ------------

      procedure Append (Key : Subscription_Key) is
      begin
         Elements.Append(Key);
      end Append;

      procedure Request is
         Frame : Frame_Type(4);
         function To_Bytes is new Ada.Unchecked_Conversion(Source => Frame_Type,
                                                           Target => OBD_CAN_Payload);
      begin
         for Key of Elements loop
            Put_Line("Requesting PID: " & Key.PID'Image);
            Frame.PID := Key.PID;
            Transceiver.Send ( To_Bytes(Frame),
                               EXTERNAL_TEST_EQUIPMENT_REQUEST_ID,
                               False);
         end loop;
      end Request;

   end Subscribtion_List;

end OBD.Protocol_Handler;
