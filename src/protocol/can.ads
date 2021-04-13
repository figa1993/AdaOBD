package CAN is

   type Frame_Enum is (Data, Remote, Error, Overload);

   type Std_Arbitration_ID_Type is range 0 .. 16#7FF#;
   type Ext_Arbitration_ID_Type is range 0 .. 16#1FFFFFFF#;

   type Payload_Type is array (1 .. 8) of Character;

   --  Record discriminated on the "Extension" flag
   --  @TODO: Can a frame be variable length?
   --  Should this also be discriminated based on length?
   type CAN_Frame (Is_Extended : Boolean) is record
      Payload : Payload_Type;
      Frame_Type : Frame_Enum;
      case Is_Extended is
      when True => Std_Arbitration_ID : Std_Arbitration_ID_Type;
      when False => Ext_Arbitration_ID : Ext_Arbitration_ID_Type;
      end case;
   end record;

end CAN;
