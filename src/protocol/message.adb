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


   function Get_PID(This : in OBD2_Message_Type) return PID_Type is
   begin
      return This.pid;
   end Get_PID;



   function Get_Service(This : in OBD2_Message_Type) return Service_Type is
   begin
      return This.service;
   end Get_Service;

   function Get_Length(This : in OBD2_Message_Type) return Payload_Length_Type is
   begin
      return This.length;
   end Get_Length;


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
