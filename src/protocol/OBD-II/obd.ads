with CAN; use CAN;

package OBD is

   type Payload_Length_Type is range 1 .. 4;
   type Service_Type is range 1 .. 10 with Size => 8;
   type PID_Type is range 0 .. 16#C4# with Size => 8;
   type Byte_Type is mod 2 ** 8 with Size => 8;


   --   OBD-II Payloads are big-endian. Since the payload is never interpreted
   --   as a multi-byte field this may be irrelevant.
   --   TODO: Consider adding "domain specific" functions to access each byte,
   --   using its standard OBD-II designation (A,B,C,D)

   --  type Payload_Type is array (Payload_Length_Type) of Byte_Type with Size => 32;
   --  with Scalar_Storage_Order => System.High_Order_First;

   type Payload_Bytes is array (Payload_Length_Type range <> ) of Byte_Type;

   --   Interface for a type that consume an OBD-II payload to decode it
   --   as well as generate an OBD-II payload encoding of itself
   type Payload_Transcoder is interface;
   procedure Encode (This    : in Payload_Transcoder;
                     Payload_Bytes : out Payload_Type) is abstract;
   procedure Decode (This    : in out Payload_Transcoder;
                     Payload_Bytes : in Payload_Type) is abstract;

   --   @TODO: Determine whether this is part of OBD-II protocol or CAN protocol
   type Frame_Type (Length : Payload_Length_Type) is record
      Service : Service_Type;
      PID     : PID_Type;
      Payload : Payload_Bytes(Payload_Length_Type'First .. Length);
      Unused  : Byte_Type;
      --   @TODO: there is a spare byte in each frame, need it be reflected?
   end record;

   --   @TODO figure out the record representation clause once length field
   --   is clarified

   --   Legistlated OBD CAN identifiers as defined in Table 3 of ISO 15765-4
   EXTERNAL_TEST_EQUIPMENT_REQUEST_ID : constant Std_Arbitration_ID_Type := 16#7DF#;

end OBD;
