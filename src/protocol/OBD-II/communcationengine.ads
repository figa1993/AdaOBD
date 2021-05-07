with OBD_Frame; use OBD_Frame;
with Ada.Containers.Indefinite_Ordered_Maps;  use Ada.Containers;
with Message; use Message;

package CommuncationEngine is

   --   Type that provides the service of requesting OBD-II messages
   type CommuncationEngine_Type is tagged private;
   type Duration_Type is new Natural;
   type Message_Key_Type is range 0 .. 16#FFFF#;


   procedure SendRequest(This       : in out CommuncationEngine_Type;
                         framedData : in Frame_Type);

   procedure ReceiveResponse(This       : in out CommuncationEngine_Type;
                             framedData : in Frame_Type);


   procedure Subscribe(This    : in out CommuncationEngine_Type;
                       Message : in OBD2_Message_Type);


   function Build_key(This       : in out CommuncationEngine_Type;
                      Serive_id  : in Service_Type;
                      Pid        : in PID_Type) return Message_Key_Type;

private
   type CommuncationEngine_Type is tagged record
      timout : Duration_Type;
   end record;

   package MessageMap is new Ada.Containers.Indefinite_Ordered_Maps
     (Key_Type => Message_Key_Type,
      Element_Type => OBD2_Message_Type'Class);
   use MessageMap;

   theMessageMap : Map;

end CommuncationEngine;
