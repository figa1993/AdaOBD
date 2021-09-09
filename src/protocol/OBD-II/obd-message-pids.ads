with System.Aux_DEC; use System.Aux_DEC;
with OBD.Message; use OBD.Message;
with OBD.Message_Template;

-- Package which will define all the standard OBD-II legislated messages (PIDs)
package OBD.Message.PIDs is

   --  @TODO: Consider creating an abstraction which handles the many to one
   --  relationship of different messages with the same deserialization.
   --  Each Realization of the OBD.Message.Message_Type needs to hard-code
   --  the PID as standardized by ISO 1576-4

   procedure Decode_Bitfield (Bytes : in Payload_Bytes;
                              Bits : out Bit_Array_32);

   procedure Encode_Bitfield (Bits : in Bit_Array_32;
                              Bytes: out Payload_Bytes);

   package Bitfield_Message is new OBD.Message_Template
     (
      Payload_Type => Bit_Array_32,
      Encode       => Encode_Bitfield,
      Decode       => Decode_Bitfield,
      PID_Value => 0,
      Service_Value => 1,
      Length_Value => Bit_Array_32'Size/Byte_Type'Size
     );

   --  SERVICE 1 PID 13
   PID : PID_Type := 13;
   SERVICE : Service_Type := 1;
   SPEED_DATA_INDEX : Payload_Length_Type := 1;



   --  type VehiculeSpeedMsg_Type is new Message_Type with private;
   --  type VehiculeSpeed_Type is range 0 .. 255;
   --
   --  overriding procedure Encode (This : in VehiculeSpeedMsg_Type;
   --                               TheFrame: out Frame_Type);
   --  overriding procedure Decode (This       : in out VehiculeSpeedMsg_Type;
   --                               FramedData : in Frame_Type);

   -- SERVICE 1 PID 12
   --
   --  PID              : PID_Type     := 12;
   --  SERVICE          : Service_Type := 1;
   --
   --  type EngineSpeedMsg_Type is new Message_Type with private;
   --  type EngineSpeed_Type is new Float range 0 .. 16383.75;
   --
   --  overriding procedure Encode (This : in VehiculeSpeedMsg_Type;
   --                               TheFrame: out Frame_Type);
   --  overriding procedure Decode (This       : in out VehiculeSpeedMsg_Type;
   --                               FramedData : in Frame_Type);
   --
   --
   --  PID : PID_Type := 13;
   --  SERVICE : Service_Type := 1;
   --  SPEED_DATA_INDEX : Payload_Length_Type := 1;
   --
   --  --  PID 13
   --  type VehiculeSpeedMsg_Type is new Message_Type with private;
   --  type VehiculeSpeed_Type is range 0 .. 255;
   --
   --  overriding procedure Encode (This : in VehiculeSpeedMsg_Type;
   --                               TheFrame: out Frame_Type);
   --  overriding procedure Decode (This       : in out VehiculeSpeedMsg_Type;
   --                               FramedData : in Frame_Type);
   --
   --
   --  PID : PID_Type := 13;
   --  SERVICE : Service_Type := 1;
   --  SPEED_DATA_INDEX : Payload_Length_Type := 1;


   --  PID 13
   --  type VehiculeSpeedMsg_Type is new Message_Type with private;
   --  type VehiculeSpeed_Type is range 0 .. 255;
   --
   --  overriding procedure Encode (This : in VehiculeSpeedMsg_Type;
   --                               TheFrame: out Frame_Type);
   --  overriding procedure Decode (This       : in out VehiculeSpeedMsg_Type;
   --                               FramedData : in Frame_Type);


private
   --  package Supported_PIDs_Base is new OBD.Message.Base(Service_Value => 1,
   --                                                      PID_Value     => 0,
   --                                                      Length_Value  => 4);
   --  type Supported_PIDs_Bitfield is new Supported_PIDs_Base.Base_Type
   --    with record
   --     Bits : Bit_Array_32;
   --  end record;

   --  type VehiculeSpeedMsg_Type is new Message_Type with record
   --     Speed : VehiculeSpeed_Type := 0;
   --  end record;
end OBD.Message.PIDs;
