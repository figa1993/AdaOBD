with System.Aux_DEC; use System.Aux_DEC;
with OBD_Frame; use OBD_Frame;
with Message; use Message;

package PIDs is

   --  PID 0
   type Supported_PIDs_Bitfield is new OBD2_Message with private;

   function Serialize (This : in Supported_PIDs_Bitfield)
                                  return Payload_Type;
   procedure Deserialize
     (This : in out Supported_PIDs_Bitfield; Bytes : Payload_Type);
private
    type Supported_PIDs_Bitfield is new OBD2_Message with record
      Bits : Bit_Array_32;
   end record;
end PIDs;
