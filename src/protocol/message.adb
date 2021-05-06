package body Message is

   function Get_PID(This : in OBD2_Message) return PID_Type is
   begin
      return This.pid;
   end Get_PID;


   function Get_Service(This : in OBD2_Message) return Service_Type is
   begin
      return This.service;
   end Get_Service;

   function Get_Length(This : in OBD2_Message) return Payload_Length_Type is
   begin
      return This.length;
   end Get_Length;

end Message;
