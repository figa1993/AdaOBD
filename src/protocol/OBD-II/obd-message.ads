with MessageHandler; use MessageHandler;

--  @TODO: Figure out why linked lists are resulting in link-time issues
--  when targeting ARM
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

package OBD.Message is

   type Message_Type (theService : Service_Type; thePid : PID_Type;
                     theLength : Payload_Length_Type)
   is abstract tagged private;

   function IsSubscribed(Message    : in Message_Type;
                         theHandler : in MessageHandler_Type)
                         return Boolean with Ghost;

   procedure Encode (This    : in Message_Type;
                     theFrame: out Frame_type) is abstract;
   procedure Decode (This       : in out Message_Type;
                     framedData : in Frame_Type) is abstract;


   function Get_PID (This : in Message_Type) return PID_Type;
   function Get_Service (This : in Message_Type) return Service_Type;
   function Get_Length (This : in Message_Type) return Payload_Length_Type;

   procedure Process   (This : in out Message_Type);
   procedure Subscribe (This       : in out Message_Type;
                        theHandler : in MessageHandler_Type)
     with
       Post => IsSubscribed(This, theHandler);

private

   package HandlerList is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type  => MessageHandler_Type); use HandlerList;

   type Message_Type(theService : Service_Type; thePid : PID_Type;
                          theLength : Payload_Length_Type) is abstract tagged record
      service  : Service_Type := theService;
      pid      : PID_Type := thePid;
      length   : Payload_Length_Type := theLength;
      handlers : HandlerList.List;
   end record;

end OBD.Message;
