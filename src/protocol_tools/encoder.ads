with CANtranceiver; use CANtranceiver;
with OBD_Frame; use OBD_Frame;
with Message; use Message;

package Encoder is

   type CanEncoder is tagged private;

   procedure encode (this       : in out CanEncoder;
                     message    : in OBD2_Message'Class;
                     framedData : in out Frame_Type);

private
   type CanEncoder is tagged record
      tranceiver : GenericTranciver;
   end record;

end Encoder;
