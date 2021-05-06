package body Serializer is

   procedure Serialize (framedData : in out Frame_Type;
                        bitfield   : out Bit_Field) is
   begin
      -- TODO frame type to bitfield
      null;
   end Serialize;

   procedure Deserialize (bitfield   : in out Bit_Field;
                          framedData : out Frame_Type) is
   begin
      -- TODO bitfield to Frame
      null;
   end Deserialize;

end Serializer;
