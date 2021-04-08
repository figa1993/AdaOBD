with OBD_Frame; use OBD_Frame;

package Message is

   type Message_Interface is interface;

   type OBD2_Message is null record;
  -- function Serialize (This : Message_Interface) return Payload_Type is abstract;
   procedure Deserialize (This : Message_Interface; Bytes : Payload_Type) is abstract;

   procedure Serialize (This : OBD2_Message);

end Message;
