package body Encoder is

   procedure encode (framedData : in Frame_Type) is

   theKey     : Message_Key_Type := 0;
   theMessage : OBD2_Message;
   begin
      theKey := build_key(framedData.Service, framedData.PID);

      if (theMessageMap.Contains(theKey)) then
         theMessage := theMessageMap(theKey);
         Serialize(theMessage);
      end if;
      -- @Todo: Define what to do if the message is uknown
   end;

end Encoder;
