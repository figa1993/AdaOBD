 with Types; use Types;
 with Ada.Unchecked_Conversion;

--
-- Package     : CommuncationEngine
--
-- Description : The Communication engine is the interface between
--               the CAN tranceiver and the application layer.
--               Sending and Receiving messages are handle by this
--               package.


package body OBD.CommuncationEngine is


   function IsSubscribed(Message : in Message_Type) return Boolean is
     (TheMessageMap.Contains(Message_Key_Type(Message.Get_Service) * 16#100# +
                              Message_Key_Type(Message.Get_PID)));

   --
   -- Procedure   : Subscribe
   --
   -- Description : This function allows the communication engine to subscribe
   --               to a particular message. When subscribing to a message, the
   --               communication engine will handle it. If we receive a message
   --               not subscibed the communication engien skip it.
   --
   -- Parameters  : Message - The message we subscribe to.
   --
   -- 1. We build a key which is the concatenation of the serviceId and the PID.
   -- 2. We add Message to a Map that we use to save the messages.

   procedure Subscribe(This    : in out CommuncationEngine_Type;
                       Message : in Message_Type) is
      TheKey     : Message_Key_Type := 0;

   begin
      -- 1
      TheKey:= Build_Key(This, Message.Get_Service, Message.Get_Pid);
      -- 2
      TheMessageMap.Include(TheKey, Message);
   end Subscribe;



   --
   -- Procedure   : Build_Key
   --
   -- Description : Builds a unique key from an OBD message Service Type and PID
   --
   -- Parameters  : Serive_Id - The Service id of the OBD message
   --               Pid       - The Pid of the OBD message
   --
   -- 1. We build a key which is the concatenation of the serviceId and the PID.
   --
   -- Example: Service_Id := 0x05 and Pid = 0x15 => Key  := 0x0515

   function Build_Key(This       : in out CommuncationEngine_Type;
                      Serive_Id  : in Service_Type;
                      Pid        : in PID_Type) return Message_Key_Type is
      Key : Message_Key_Type := 0;

   begin
      -- 1
      Key := Message_Key_Type(Serive_Id) * 16#100# +
        Message_Key_Type(Pid);
      return Key;
   end Build_Key;


   --   @TODO Per Section 7 of ISO 1576-2 the OBD-II Message must be encoded
   --   in a CAN frame with a DLC of 8 and and 8 byte payload. The value
   --   of the unused bytes is not defined.

   --
   -- Procedure   : SendRequest
   --
   -- Description : SendRequest is the function call by the application to send
   --               a message.
   --
   -- Parameters  : Message - The message to be send.
   --
   -- 1. Translate the message (nto a byte buffer.
   -- 2. Transmit the buffer to the CAN tranceiver.


   procedure SendRequest (This    : in out CommuncationEngine_Type;
                          Message : in Message_Type'Class) is
      Request : Frame_Type;
      function To_Bytes is new Ada.Unchecked_Conversion(Source => Frame_Type,
                                                    Target => OBD_CAN_Payload);
   begin
      Request.PID := Message.Get_PID;
      This.CAN_Transceiver.Send( To_Bytes(Request), 16#7DF#, True );
   end SendRequest;


   --   @TODO: How is this used?
   --   Processes an OBD Frame into a message.


   --
   -- Procedure   : ReceiveResponse
   --
   -- Description : ReceiveResponse is the function call by the can tranceiver
   --               when a message is received
   --
   -- Parameters  : FramedData - The record representing the message.
   --
   -- 1. Build the key of the message received to check if we handle it
   -- 2. Check in the Map 'TheMessageMap' if we handle this message
   -- 3. Decode the message received and process it.

   procedure ReceiveResponse(This       : in out CommuncationEngine_Type;
                             FramedData : in Frame_Type) is

      TheKey     : Message_Key_Type := 0;
   begin
      -- 1
      TheKey := Build_Key(This, FramedData.Service, FramedData.PID);
      -- 2
      if (TheMessageMap.Contains(TheKey)) then
         declare
            TheMessage : Message_Type'Class := TheMessageMap(TheKey);
         begin
            -- 3
            TheMessage.Decode(FramedData);
            TheMessage.Process;
         end;
      end if;
      null;
   end ReceiveResponse;

end OBD.CommuncationEngine;
