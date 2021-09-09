with Ada.Unchecked_Conversion;

package body OBD.Payloads is

   procedure Serialize (Payload : in Bitfield; Bytes : out Payload_Bytes) is
      subtype Byte_Array is Payload_Bytes(Payload_Length_Type'First .. (Bit_Array_32'Size/Byte_Type'Size));
      function Convert is new Ada.Unchecked_Conversion (Source => Bit_Array_32,
                                                        Target => Byte_Array);
   begin
      Bytes := Convert(Payload.Bitfield);
   end Serialize;

   procedure Deserialize (Bytes : Payload_Bytes; Payload : out Bitfield) is
      function Convert is new Ada.Unchecked_Conversion (Source => Payload_Bytes,
                                                        Target => Bit_Array_32);
   begin
      Payload.Bitfield := Convert(Bytes);
   end Deserialize;

end OBD.Payloads;
