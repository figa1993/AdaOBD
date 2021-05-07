with CAN; use CAN;
with CANtransceiver; use CANtransceiver;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

--   Internal non-portable GNAT packages
pragma Warnings(Off);
with GNAT.Sockets.Thin;
pragma Warnings(Off);

package SocketCAN is

   package Sockets renames GNAT.Sockets.Thin;

   --   @TODO: Consider making this a controlled type with RAII
   --   To start and stop the device
   type Device (Device_Name : access Unbounded_String) is new Transceiver_Type
   with private;

   procedure Initialize (This : in out Device);
   procedure Stop (This : Device);
   function Receive (This : Device) return Can.CAN_Frame;
   procedure Send (This : Device; Frame : Can.CAN_Frame);
   overriding procedure Send (This : in out Device; Payload : Payload_Type;
                              Tx_Arbitration_Id : Ext_Arbitration_ID_Type );

private
   type Device (Device_Name : access Unbounded_String) is new Transceiver_Type
   with record
      Socket_FD : Sockets.C.Int;
      -- Device_Name : Unbounded_String;
   end record;

end SocketCAN;
