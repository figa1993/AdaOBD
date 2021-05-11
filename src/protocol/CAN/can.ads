package CAN is

   type Frame_Enum is (Data, Remote, Error, Overload);

   type Ext_Arbitration_ID_Type is range 0 .. 16#1FFFFFFF#;
   subtype Std_Arbitration_ID_Type is  Ext_Arbitration_ID_Type range 0 .. 16#7FF#;

   type Arbitration_ID_Type(Is_Extended : Boolean := True) is record
      case Is_Extended is
      when False =>
         Std_Arbitration_ID : Std_Arbitration_ID_Type;
      when True =>
         Ext_Arbitration_ID : Ext_Arbitration_ID_Type;
      end case;
   end record;

   type Data_Length_Code is range 0 .. 8;

   -- @TODO: Probably better to use a type that is guaranteed
   -- 8 bits
   type Payload_Type is array (Data_Length_Code range <>) of Character;

   --  @TODO: Does the CAN_Frame even need to be public?
   --  It should really only relevant in the datalink layer

   --  @TODO: Should the frame length be varied based on
   --  whether the FD version of the protocol is used?

   --  Record discriminated on the "Extension" flag
   type CAN_Header (Is_Extended : Boolean := True; DLC : Data_Length_Code := 0)
   is record
      Is_RTR : Boolean := False;
      Is_Error : Boolean := False;
      case Is_Extended is
      when False =>
         Std_Arbitration_ID : Std_Arbitration_ID_Type;
      when True =>
         Ext_Arbitration_ID : Ext_Arbitration_ID_Type;
      end case;
   end record;

   --   Option 1: CAN_Frame is totally abstract with getters for the fields
   --   each realization defines its own representation. That representation
   --   is used throughout.

   --   Option 2: CAN_Frame is flat, header and payload are at the same level
   --   Discriminated on format and DLC. Each "realization" defines its own
   --   representation and then uses Change of Representation to convert.
   --   Con: Payload has to get copied twice?

   --   Option 3: CAN_Frame is split into header and payload. Header is
   --   disciminated by extension type. Payload is an access type to Payload
   --   since its value isn't known initially.
   --   Con: Access types aren't idiomatic Ada.

   --   Option 4: CAN_Frame is flat, header and payload are at the same level
   --   Mutably discriminated on format and DLC. The transceiver is in charge
   --   allocating the CAN_Frame, since it can read in the header and have all
   --   information to define the internal representation

   --   Observation: The type is clearly "dynamic" since it has a variable
   --   length until header is read in. Dynamic allocation of the Payload, or
   --   assumption of the worst case scenario seems necessary.

   --  type CAN_Frame is record
   --        Header : CAN_Header;
   --        Payload : Access Payload_Type;
   --  end record;

   type CAN_Frame( Is_Extended : Boolean := True;
                     DLC : Data_Length_Code := 0 ) is record
      Header : CAN_Header(Is_Extended, DLC);
      Payload : Payload_Type(Data_Length_Code'First .. DLC);
   end record;

   --  type Extended_Format_Frame is private;
private

--   type Std_Aribtration_Type is record
--      Identifier : Std_Arbitration_ID_Type;
--      RTR : Boolean;
--   end record;

   --   @TODO: Verify this format from wikipedia is correct

   --   The Extended Frame Format can be interpreted as
   --   a standard frame format based on the value of the
   --   IDE bit
   --  type Extended_Format_Header is record
   --     Identifier_A : Natural range 0 .. 2**11;
   --     SRR : Boolean := True;
   --     IDE : Boolean := True;
   --     Identifier_B : Natural range 0 .. 2*18;
   --     RTR : Boolean;
   --     DLC : Data_Length_Code;
   --  end record;
   --
   --  for Extended_Format_Header use record
   --     Identifier_A at 0 range 0 .. 11;
   --     SRR at 0 range 12 .. 12;
   --     IDE at 0 range 13 .. 13;
   --     Identifier_B at 0 range 14 .. 31;
   --     RTR at 0 range 32 .. 32;
   --     DLC at 0 range 1000 .. 1003;
   --  end record;
   --
   --  type Extended_Format_Frame is record
   --     Header : Extended_Format_Header;
   --     Data : Payload_Type;
   --  end record;

end CAN;
