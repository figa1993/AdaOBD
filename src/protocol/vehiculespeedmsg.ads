with Message; use Message;
with OBD_Frame; use OBD_Frame;
--with Encoder; use Encoder;

package VehiculeSpeedMsg is

   PID : PID_Type := 13;
   SERVICE : Service_Type := 1;
   SPEED_DATA_INDEX : Payload_Length_Type := 1;


   type VehiculeSpeedMsg_Type is new OBD2_Message_Type with private;
   type VehiculeSpeed_Type is range 0 .. 255;

   overriding procedure Encode (This : in out VehiculeSpeedMsg_Type;
                       theFrame: out Frame_type);
   overriding procedure Decode (This       : in out VehiculeSpeedMsg_Type;
                                     framedData : in Frame_Type);

private

   type VehiculeSpeedMsg_Type is new OBD2_Message_Type with record
      Speed : VehiculeSpeed_Type := 0;
   end record;


end VehiculeSpeedMsg;
