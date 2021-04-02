with Ada.Unchecked_Conversion;

package body PIDs is

   function Serialize (This : Supported_PIDs_Bitfield) return Payload_Type is
      function Convert is new Ada.Unchecked_Conversion (Source => Bit_Array_32,
                                                        Target => Payload_Type);
   begin
      -- The payload should simply be an unchecked conversion
      return Convert (This.Bits);
   end Serialize;

   procedure Deserialize (This : Supported_PIDs_Bitfield; Bytes : Payload_Type) is
   begin
      null;
   end;

end PIDs;
