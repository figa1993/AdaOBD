with OBD_Frame; use OBD_Frame;

package body VehiculeSpeedMsg is


   procedure Serialize(This    : in out VehiculeSpeedMsgType;
                       theFrame: out Frame_type) is
      theEncoder : CanEncoder;

   begin
      theEncoder.encode(This, theFrame);
   end Serialize;

   procedure Deserialize (This       : in out VehiculeSpeedMsgType;
                          framedData : in Frame_Type) is
   begin
      This.Speed := VehiculeSpeed(framedData.Payload(SPEED_DATA_INDEX));
   end Deserialize;

end VehiculeSpeedMsg;
