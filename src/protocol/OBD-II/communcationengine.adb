With Types; use Types;

package body CommuncationEngine is


   --procedure Show_Bit (V : Boolean) is
   --begin
   --   case V is
   --      when False => Put ("0");
   --      when True  => Put ("1");
   --   end case;
   --end Show_Bit;

   --   Subprogram to control which message the CommunicationEngine will
   --   request
   procedure Subscribe(This    : in out CommuncationEngine_Type;
                       Message : in OBD2_Message_Type) is
      theKey     : Message_Key_Type := 0;

   begin
      theKey:= Build_key(this, Message.get_service, Message.get_pid);
      theMessageMap.Include(theKey, Message);
   end subscribe;



   --   Builds a unique key from an OBD message Service Type and PID
   function Build_key(This       : in out CommuncationEngine_Type;
                      Serive_id  : in Service_Type;
                      Pid        : in PID_Type) return Message_Key_Type is
   res : Message_Key_Type := 0;

   begin
      res := Message_Key_Type(Serive_id) * 256 +
        Message_Key_Type(Pid);
      return res;
   end build_key;


   --   @TODO Per Section 7 of ISO 1576-2 the OBD-II Message must be encoded
   --   in a CAN frame with a DLC of 8 and and 8 byte payload. The value
   --   of the unused bytes is not defined.


   procedure SendRequest(This       : in out CommuncationEngine_Type;
                         framedData : in Frame_Type) is

      Raw_data_buffer : Bit_Field (0 .. framedData'Size - 1)
        with Address => framedData'Address, Import, Volatile;
   begin
      --TODO => cantraceiver.send(Raw_data_buffer);
      null;
   end SendRequest;

   --   @TODO: How is this used?
   --   Processes an OBD Frame into a message.
   procedure ReceiveResponse(This       : in out CommuncationEngine_Type;
                             framedData : in Frame_Type) is

      theKey     : Message_Key_Type := 0;
   begin
      theKey := build_key(This, framedData.Service, framedData.PID);

      if (theMessageMap.Contains(theKey)) then
         declare
            theMessage : OBD2_Message_Type'Class := theMessageMap(theKey);
         begin
            theMessage.Decode(framedData);
            theMessage.Process;
         end;
      end if;


      null;
   end ReceiveResponse;

end CommuncationEngine;
