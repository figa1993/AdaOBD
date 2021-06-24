with MessageHandler; use MessageHandler;
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

package OBD.Message is

   type Message_Type is abstract tagged private;

   procedure Encode (This    : in Message_Type;
                     theFrame: out Frame_type) is abstract;
   procedure Decode (This       : in out Message_Type;
                     framedData : in Frame_Type) is abstract;


   function Get_PID (This : in Message_Type) return PID_Type is abstract;
   function Get_Service (This : in Message_Type) return Service_Type is abstract;
   function Get_Length (This : in Message_Type) return Payload_Length_Type is abstract;

   function IsSubscribed(Message    : in Message_Type;
                         theHandler : in MessageHandler_Type)
                         return Boolean with Ghost;
   procedure Process   (This : in out Message_Type);
   procedure Subscribe (This       : in out Message_Type;
                        theHandler : in MessageHandler_Type)
     with
       Post => IsSubscribed(This, theHandler);

private

   package HandlerList is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type  => MessageHandler_Type); use HandlerList;

   type Message_Type is abstract tagged record
      handlers : HandlerList.List;
   end record;

   generic
      Service_Value : Service_Type;
      PID_Value : PID_Type;
      Length_Value : Payload_Length_Type;
   package Base is
      type Base_Type is abstract new Message_Type with null record;

      overriding function Get_PID (This : in Base_Type) return PID_Type;
      overriding function Get_Service (This : in Base_Type) return Service_Type;
      overriding function Get_Length (This : in Base_Type) return Payload_Length_Type;
   end Base;

end OBD.Message;
