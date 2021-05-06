with OBD_Frame; use OBD_Frame;
with Ada.Containers.Indefinite_Ordered_Maps;  use Ada.Containers;
with Message; use Message;

package Decoder is

   type Message_Key_Type is range 0 .. 16#FFFF#;
   procedure initialize;

   procedure decode (framedData : in Frame_Type)
     with Pre => framedData.Length /= 0;

   procedure subscribe (Service_ID : in Service_Type;
                        Pid       : in PID_Type;
                        Message   : in OBD2_Message);


   function build_key (Service_ID : in Service_Type;
                       Pid       : in PID_Type) return Message_Key_Type;

private


   package MessageMap is new Ada.Containers.Indefinite_Ordered_Maps
     (Key_Type => Message_Key_Type,
      Element_Type => OBD2_Message'Class);
   use MessageMap;

   theMessageMap : Map;

end Decoder;
