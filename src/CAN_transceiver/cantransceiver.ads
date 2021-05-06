package CANtransceiver is

--   @TODO: Refactor for a common CAN Transceiver abstraction
   type GenericTranciver is null record;
--   procedure Transmit(This: GenericTranciver; FrameData : Frame_Type) is abstract;
   procedure Initialize;

end CANtransceiver;
