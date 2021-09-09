generic
   type Payload_Type is private;
   with procedure Encode (Payload : in Payload_Type; Bytes : out Payload_Bytes);
   with procedure Decode (Bytes : Payload_Bytes; Payload : out Payload_Type);
   Service_Value : Service_Type;
   PID_Value : PID_Type;
   Length_Value : Payload_Length_Type;
package OBD.Message_Template is

   type Instance_Type is tagged record
      Payload : Payload_Type;
   end record;

   function Get_PID return PID_Type is (PID_Value);
   function Get_Length return Payload_Length_Type is (Length_Value);
   function Get_Service return Service_Type is (Service_Value);

end OBD.Message_Template;
