with CAN; use CAN;

package CANtransceiver is

   --   @TODO: Refactor for a common CAN Transceiver abstraction
   type Transceiver_Type is abstract tagged private;

   procedure Initialize (This : in out Transceiver_Type) is abstract;

   --   @TODO: Finalize the API, do we want to return bytes sent? success/fail?

   --   This subprogram has the responsibility of constructing the CAN
   --   frame from a given payload, aribtration ID, and frame type
   procedure Send (This : in out Transceiver_Type; Payload : Payload_Type;
                   Tx_Arbitration_Id : Ext_Arbitration_ID_Type )
   is abstract;

   --   @TODO: Figure out how to deal with the various protocols that sit on
   --   top of CAN. How can CAN frames be filtered to the appropriate protocol?
   --   Can it be expected that all CAN Devices support filtering? Linux
   --   SocketCAN does.

   type CAN_Payload_Handler_Type is access procedure (Payload : CAN.Payload_Type);

   procedure Subscribe( This : in out Transceiver_Type;
                        Rx_Arbitration_Id : Ext_Arbitration_ID_Type;
                        Payload_Handler : CAN_Payload_Handler_Type) is abstract;

private
   type Transceiver_Type is abstract tagged null record;
end CANtransceiver;
