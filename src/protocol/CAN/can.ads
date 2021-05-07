package CAN is

   type Frame_Enum is (Data, Remote, Error, Overload);

   type Std_Arbitration_ID_Type is range 0 .. 16#7FF#
     with Size => 11;
   type Ext_Arbitration_ID_Type is range 0 .. 16#1FFFFFFF#
     with Size => 29;

   type Data_Length_Code is range 0 .. 8 with Size => 32;

   -- @TODO: Probably better to use a type that is guaranteed
   -- 8 bits
   type Payload_Type is array (1 .. 8) of Character;

   --  @TODO: Should the frame length be varied based on
   --  whether the FD version of the protocol is used?

   --  Should this also be discriminated based on length?
   --  The interpretation of the first 32 bits is driven by
   --  the protocol. Assume that the protocol can not change
   --  during the runtime, so the message format will be
   --  constant. Variant record seems inappropriate here,
   --  since there is no data in the message that influences
   --  how the rest of the message is interpreted?

   --  Can determine if the Frame is extended by masking the
   --  arbitration ID

   -- CAN Frame begins with an arbitration field (32 bits)
   -- The location of the SRR, RTR, and reserved bits varies
   -- based on the frame format.
   -- Followed by a Data length code (DLC)
   -- Followed by a variable length data field

   -- Conclusion is that the CAN Frame data should be private
   -- with accessors

   --  Record discriminated on the "Extension" flag
   type CAN_Frame (Is_Extended : Boolean := True) is record
      Payload : Payload_Type;
      DLC : Data_Length_Code;
      Is_RTR : Boolean := False;
      Is_Error : Boolean := False;
      case Is_Extended is
      when False =>
         Std_Arbitration_ID : Std_Arbitration_ID_Type;
      when True =>
         Ext_Arbitration_ID : Ext_Arbitration_ID_Type;
      end case;
   end record;


   for CAN_Frame use record
      Std_Arbitration_ID at 0 range 0 .. 10;
      Ext_Arbitration_ID at 0 range 0 .. 28;
      Is_RTR at 0 range 29 .. 29;
      Is_Error at 0 range 30 .. 30;
      Is_Extended at 0 range 31 .. 31;
      DLC at 0 range 32 .. 32 + Data_Length_Code'Size-1;
      Payload at 0 range 64 .. 64 + 64 - 1;
   end record;

   type Extended_Format_Frame is private;
private

--   type Std_Aribtration_Type is record
--      Identifier : Std_Arbitration_ID_Type;
--      RTR : Boolean;
--   end record;

   --   @TODO: Verify this format from wikipedia is correct

   --   The Extended Frame Format can be interpreted as
   --   a standard frame format based on the value of the
   --   IDE bit
   type Extended_Format_Header is record
      Identifier_A : Natural range 0 .. 2**11;
      SRR : Boolean := True;
      IDE : Boolean := True;
      Identifier_B : Natural range 0 .. 2*18;
      RTR : Boolean;
      DLC : Data_Length_Code;
   end record;

   for Extended_Format_Header use record
      Identifier_A at 0 range 0 .. 11;
      SRR at 0 range 12 .. 12;
      IDE at 0 range 13 .. 13;
      Identifier_B at 0 range 14 .. 31;
      RTR at 0 range 32 .. 32;
      DLC at 0 range 1000 .. 1003;
   end record;

   type Extended_Format_Frame is record
      Header : Extended_Format_Header;
      Data : Payload_Type;
   end record;

end CAN;
