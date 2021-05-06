with OBD_Frame; use OBD_Frame;
with Types; use Types;

package Serializer is

   procedure Serialize (framedData : in out Frame_Type;
                        bitfield   : out Bit_Field);

   procedure Deserialize (bitfield   : in out Bit_Field;
                          framedData : out Frame_Type);

end Serializer;
