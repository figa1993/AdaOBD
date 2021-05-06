with Interfaces;

package body Decoder is


   procedure initialize is
   begin
      null;
   end;

   --   Maps an OBD Message to a Service ID and PID so that the decode
   --   subprogram can handle it
   procedure subscribe (Service_ID : in Service_Type;
                        Pid       : in PID_Type;
                        Message   : in OBD2_Message) is
   theKey     : Message_Key_Type := 0;

   begin
      theKey:= build_key(Service_ID, Pid);
      theMessageMap.Include(theKey, Message);
   end;

   --   Creates a unique key based on an OBD Service type and PID
   function build_key (Service_ID : in Service_Type;
                       Pid       : in PID_Type) return Message_Key_Type is
   res : Message_Key_Type := 0;

   begin
      res := Message_Key_Type(Service_ID) * 256 + Message_Key_Type(Pid);
      return res;
   end;


   --   Subprogram which process an OBD Frame for the corresponding ID and PID
   --   by deserializing it into a message.
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
