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

   --   @TODO: Is there a way to avoid ducplication of the Is_Extended and DLC
   --   fields in both the frame and the payload?
   type CAN_Frame( Is_Extended : Boolean := True;
                     DLC : Data_Length_Code := 0 ) is record
      Header : CAN_Header(Is_Extended, DLC);
      Payload : Payload_Type(Data_Length_Code'First .. DLC);
   end record;

end CAN;
