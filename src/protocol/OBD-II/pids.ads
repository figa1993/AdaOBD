with System.Aux_DEC; use System.Aux_DEC;
with OBD.Message; use OBD.Message;

-- Package which will define all the OBD-II messages (PIDs)
package PIDs is

   --  @TODO: Consider creating an abstraction which handles the many to one
   --  relationship of different messages with the same deserialization.
   --  Each Realization of the OBD.Message.Message_Type needs to hard-code
   --  the PID as standardized by ISO 1576-4

   --  PID 0
   type Supported_PIDs_Bitfield is new Message_Type with private;

   overriding procedure Encode (This : in Supported_PIDs_Bitfield;
                                TheFrame: out Frame_Type);
   overriding procedure Decode (This : in out Supported_PIDs_Bitfield;
                                FramedData : in Frame_Type);


   PID : PID_Type := 13;
   SERVICE : Service_Type := 1;
   SPEED_DATA_INDEX : Payload_Length_Type := 1;


   --  PID 13
   type VehiculeSpeedMsg_Type is new Message_Type with private;
   type VehiculeSpeed_Type is range 0 .. 255;

   overriding procedure Encode (This : in out VehiculeSpeedMsg_Type;
                                TheFrame: out Frame_Type);
   overriding procedure Decode (This       : in out VehiculeSpeedMsg_Type;
                                FramedData : in Frame_Type);

private
   type Supported_PIDs_Bitfield is new Message_Type with record
      Bits : Bit_Array_32;
   end record;

   type VehiculeSpeedMsg_Type is new Message_Type with record
      Speed : VehiculeSpeed_Type := 0;
   end record;
end PIDs;
