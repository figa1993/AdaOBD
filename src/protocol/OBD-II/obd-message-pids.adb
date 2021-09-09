with Ada.Unchecked_Conversion;

package body OBD.Message.PIDs is

   procedure Decode_Bitfield (Bytes : in Payload_Bytes;
                              Bits : out Bit_Array_32) is
      function Convert is new Ada.Unchecked_Conversion (Source => Payload_Bytes,
                                                        Target => Bit_Array_32);
   begin
      Bits := Convert(Bytes);
   end Decode_Bitfield;

   procedure Encode_Bitfield (Bits : in Bit_Array_32;
                              Bytes: out Payload_Bytes) is
      subtype Byte_Array is Payload_Bytes(Payload_Length_Type'First .. (Bit_Array_32'Size/Byte_Type'Size));
      function Convert is new Ada.Unchecked_Conversion (Source => Bit_Array_32,
                                                        Target => Byte_Array);
   begin
      Bytes := Convert(Bits);
   end Encode_Bitfield;

   --  procedure Decode (This       : in Out VehiculeSpeedMsg_Type;
   --                    FramedData : in Frame_Type) is
   --  begin
   --     This.Speed := VehiculeSpeed_Type(FramedData.Payload(SPEED_DATA_INDEX));
   --  end Decode;
   --
   --
   --  procedure Encode (This    : in VehiculeSpeedMsg_Type;
   --                    TheFrame: out Frame_Type) is
   --
   --  begin
   --     TheFrame.Payload(SPEED_DATA_INDEX) := Byte_Type(This.Speed);
   --  end Encode;

end OBD.Message.PIDs;
