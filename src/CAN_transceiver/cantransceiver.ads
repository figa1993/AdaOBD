with CAN; use CAN;

package CANtransceiver is

   --   @TODO: Refactor for a common CAN Transceiver abstraction
   type Transceiver_Type is interface;

   procedure Initialize (This : in out Transceiver_Type) is abstract;

   --   @TODO: Finalize the API, do we want to return bytes sent? success/fail?

   --   This subprogram has the responsibility of constructing the CAN
   --   frame from a given payload, aribtration ID, and frame type
   procedure Send (This : in out Transceiver_Type;
                   Payload : Payload_Type;
                   TX_Arbitration_Id : Ext_Arbitration_ID_Type;
                   Is_Extended : Boolean) is abstract;

   --   @TODO: Determine if higher level protocols need all the infromation
   --   in a CAN frame
   function Receive (This : in out Transceiver_Type) return Can.CAN_Frame
                     is abstract;

   function Receive (This : in out Transceiver_Type'Class) return Can.CAN_Frame
                        is abstract;

   --   @TODO: Add the ability to filter based on CAN ID. This
   --   filters which CAN messages will be received. The meaning of CAN ID's
   --   is defined by the particular CAN bus architecture.

   --   @TODO: Add API to configure the CAN protcol parameters:
   --   arbitration type, data rate, etc.
   --   @NOTE: Assumption is these parameters are constant and properties of
   --   the CAN bus


private
   --  type Transceiver_Type is abstract tagged null record;
end CANtransceiver;
