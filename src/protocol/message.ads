with OBD_Frame; use OBD_Frame;

package Message is

   type OBD2_Message (theService : Service_Type; thePid : PID_Type;
                     theLength : Payload_Length_Type)
   is abstract tagged private;

   --  procedure Initialize(This : in out OBD2_Message);
   procedure Serialize (This    : in OBD2_Message;
                       theFrame: out Frame_type) is abstract;
   procedure Deserialize (This : in out OBD2_Message;
                         framedData : in Frame_Type) is abstract;

   function Get_PID (This : in OBD2_Message) return PID_Type;
   function Get_Service (This : in OBD2_Message) return Service_Type;
   function Get_Length (This : in OBD2_Message) return Payload_Length_Type;

   --  procedure subscribe(This : OBD2_Message) is abstract;

private

   type OBD2_Message (theService : Service_Type; thePid : PID_Type;
                     theLength : Payload_Length_Type) is abstract tagged record
      service : Service_Type := theService;
      pid     : PID_Type := thePid;
      length  : Payload_Length_Type := theLength;
   end record;

end Message;
