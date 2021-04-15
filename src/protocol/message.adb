package body Message is

   function get_pid(This : in OBD2_Message) return PID_Type is
   begin
      return This.pid;
   end get_pid;


   function get_service(This : in OBD2_Message) return Service_Type is
   begin
      return This.service;
   end get_service;

   function get_length(This : in OBD2_Message) return Payload_Length_Type is
   begin
      return This.length;
   end get_length;

end Message;
