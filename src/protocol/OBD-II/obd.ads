package OBD is

   --   @TODO: Still need to figure out how many bits the length field is
   type Payload_Length_Type is range 1 .. 4;
   type Service_Type is range 1 .. 10 with Size => 8;
   type PID_Type is range 0 .. 16#C4# with Size => 8;
   type Identifier_Type is range 0 .. 16#7FF# with Size => 11;
   type Byte_Type is mod 2 ** 8 with Size => 8;


   --   OBD-II Payloads are big-endian. Since the payload is never interpreted
   --   as a multi-byte field this may be irrelevant.
   --   TODO: Consider adding "domain specific" functions to access each byte,
   --   using its standard OBD-II designation (A,B,C,D)

   type Payload_Type is array (Payload_Length_Type) of Byte_Type with Size => 32;
   --  with Scalar_Storage_Order => System.High_Order_First;

   type Frame_Type is record
      Length  : Payload_Length_Type;
      Service : Service_Type;
      PID     : PID_Type;
      Payload : Payload_Type;
      Unused  : Byte_Type;
      --   @TODO: there is a spare byte in each frame, need it be reflected?
   end record;


  -- for Frame_Type use record
    --  Length at range 11 .. 12
   --end record;



   --   @TODO figure out the record representation clause once length field
   --   is clarified

   CAN_ID_Req : Identifier_Type := 16#7DF#;

end OBD;
