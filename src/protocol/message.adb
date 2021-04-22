package body Message is


   procedure Subscribe (This : in out OBD2_Message_Type;
                        theHandler : in MessageHandler_Type) is
   begin
      This.handlers.Append(theHandler);
   end Subscribe;


   procedure Process (This : in out OBD2_Message_Type) is
   begin
      for theHandler in This.handlers.Iterate loop
         Notify(Element(theHandler));
      end loop;
   end Process;


   function get_pid (This : in OBD2_Message_Type) return PID_Type is
   begin
      return This.pid;
   end get_pid;


   function get_service (This : in OBD2_Message_Type) return Service_Type is
   begin
      return This.service;
   end get_service;

   function get_length (This : in OBD2_Message_Type) return Payload_Length_Type is
   begin
      return This.length;
   end get_length;


   procedure BuildRequest (This : in out OBD2_Message_Type;
                          framedData : out Frame_Type) is
   begin
      framedData.CAN_ID := CAN_ID_Req;
      framedData.Length := get_length(This);
      framedData.Service := get_service(This);
      framedData.PID := get_pid(This);
      framedData.Payload := framedData.Payload;
   end BuildRequest;


end Message;
