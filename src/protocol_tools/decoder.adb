with Interfaces;

package body Decoder is


   procedure initialize is
   begin
      null;
   end;

   procedure subscribe (Serive_id : in Service_Type;
                        Pid       : in PID_Type;
                        Message   : in OBD2_Message) is
   theKey     : Message_Key_Type := 0;

   begin
      theKey:= build_key(Serive_id, Pid);
      theMessageMap.Include(theKey, Message);
   end;

   function build_key (Serive_id : in Service_Type;
                       Pid       : in PID_Type) return Message_Key_Type is
   res : Message_Key_Type := 0;

   begin
      res := Message_Key_Type(Serive_id) * 256 + Message_Key_Type(Pid);
      return res;
   end;


   procedure decode (framedData : in Frame_Type) is

      theKey     : Message_Key_Type := 0;
   begin
      theKey := build_key(framedData.Service, framedData.PID);

      if (theMessageMap.Contains(theKey)) then
         declare
            theMessage : OBD2_Message'Class := theMessageMap(theKey);
         begin
            Deserialize(theMessage, framedData);
         end;
      end if;
      -- @Todo: Define what to do if the message is uknown
   end;

end Decoder;
