with Ada.Text_IO; use Ada.Text_IO;

package body OBD.Message_Template.Subscribable is   
   
   protected body Instance_Type is
      
      procedure Subscribe (Handler : Handler_Type) is
      begin
         Put_Line("Installing handler for PID: " & PID_Value'Image);
         Handlers.Append(Handler);
      end Subscribe;
   
      procedure Deserialize (Bytes : Payload_Bytes) is
      begin
         Put_Line("Deserializing PID: " & PID_Value'Image);
         Decode (Bytes, Message.Payload);
         Put_Line("Handling PID: " & PID_Value'Image);
         for Handler of Handlers loop
            Handler(Message.Payload);
         end loop;
      end Deserialize;
   end Instance_Type;
   
end OBD.Message_Template.Subscribable;
