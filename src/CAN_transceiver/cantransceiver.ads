with CAN; use CAN;

package CANtransceiver is

   --   @TODO: Refactor for a common CAN Transceiver abstraction
   type Transceiver_Type is abstract tagged private;

   --   procedure Transmit(This: GenericTranciver; FrameData : Frame_Type) is abstract;

   --   @TODO: Can there be a common initialization function for all
   --   realization? Yes, if different "constructors" can be provided for each
   procedure Initialize (This : in out Transceiver_Type) is abstract;

   --   @TODO: Finalize the API, do we want to return bytes sent? success/fail?

   --   This subprogram has the responsibility of constructing the CAN
   --   frame from a given payload, aribtration ID, and frame type
   procedure Send (This : in out Transceiver_Type; Payload : Payload_Type;
                   Tx_Arbitration_Id : Ext_Arbitration_ID_Type )
   is abstract;
private
   type Transceiver_Type is abstract tagged null record;
end CANtransceiver;
