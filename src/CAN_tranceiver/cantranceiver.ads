with OBD_Frame; use OBD_Frame;
with Types; use Types;

package CANtranceiver is

   type GenericTranciver is null record;
   procedure transmit(this: GenericTranciver; frameData : Frame_Type) is abstract;
   procedure initialize;

end CANtranceiver;
