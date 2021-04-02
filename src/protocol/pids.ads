with System.Aux_DEC; use System.Aux_DEC;
with OBD_Frame; use OBD_Frame;
with Message; use Message;

package PIDs is

   --  PID 0
   type Supported_PIDs_Bitfield is new Message_Interface with record
      Bits : Bit_Array_32;
   end record;

   overriding function Serialize (This : Supported_PIDs_Bitfield) return Payload_Type;
   overriding procedure Deserialize (This : Supported_PIDs_Bitfield; Bytes : Payload_Type);

end PIDs;
