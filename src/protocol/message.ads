with OBD_Frame; use OBD_Frame;
with MessageHandler; use MessageHandler;
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

package Message is

   type OBD2_Message_Type (theService : Service_Type; thePid : PID_Type;
                     theLength : Payload_Length_Type)
   is abstract tagged private;


   --procedure Initialize(This : in out OBD2_Message_Type);
   procedure Encode (This    : in out OBD2_Message_Type;
                       theFrame: out Frame_type) is abstract;
   procedure Decode (This : in out OBD2_Message_Type;
                         framedData : in Frame_Type) is abstract;

   procedure BuildRequest (This : in out OBD2_Message_Type;
                           framedData : out Frame_Type);
   procedure Process   (This : in out OBD2_Message_Type);
   procedure Subscribe (This : in out OBD2_Message_Type;
                        theHandler : in MessageHandler_Type);


   function Get_pid (This : in OBD2_Message_Type) return PID_Type;
   function Get_service (This : in OBD2_Message_Type) return Service_Type;
   function Get_length (This : in OBD2_Message_Type) return Payload_Length_Type;



private

   package HandlerList is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type  => MessageHandler_Type); use HandlerList;

   type OBD2_Message_Type(theService : Service_Type; thePid : PID_Type;
                          theLength : Payload_Length_Type) is abstract tagged record
      service  : Service_Type := theService;
      pid      : PID_Type := thePid;
      length   : Payload_Length_Type := theLength;
      handlers : HandlerList.List;
   end record;

end Message;
