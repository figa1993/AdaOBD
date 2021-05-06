with OBD_Frame; use OBD_Frame;

package body VehiculeSpeedMsg is


   procedure Decode (This       : in out VehiculeSpeedMsg_Type;
                          framedData : in Frame_Type) is
   begin
      This.Speed := VehiculeSpeed_Type(framedData.Payload(SPEED_DATA_INDEX));
   end Decode;


   procedure Encode (This    : in out VehiculeSpeedMsg_Type;
                       theFrame: out Frame_type) is

   begin
      theFrame.Payload(SPEED_DATA_INDEX) := Byte_Type(This.Speed);
   end Encode;



end VehiculeSpeedMsg;
