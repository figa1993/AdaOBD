with Message; use Message;
with OBD_Frame; use OBD_Frame;
with Encoder; use Encoder;

package VehiculeSpeedMsg is

   PID : PID_Type := 13;
   SERVICE : Service_Type := 1;
   SPEED_DATA_INDEX : Payload_Length_Type := 1;


   type VehiculeSpeedMsgType is new OBD2_Message with private;
   type VehiculeSpeed is range 0 .. 255;

   overriding procedure Serialize(This : in out VehiculeSpeedMsgType;
                       theFrame: out Frame_type);
   overriding procedure Deserialize (This       : in out VehiculeSpeedMsgType;
                                     framedData : in Frame_Type);
private

   type VehiculeSpeedMsgType is new OBD2_Message with record
      Speed : VehiculeSpeed := 0;
   end record;


end VehiculeSpeedMsg;
