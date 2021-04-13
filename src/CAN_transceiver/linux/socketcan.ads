with CAN; use CAN;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package SocketCAN is

   --   @TODO: Consider making this a controlled type with RAII
   --   To start and stop the device
   type Device is record
      Device_Name : Unbounded_String;
   end record;

   procedure Start (This : Device);
   procedure Stop (This : Device);
   function Receive (This : Device) return CAN_Frame;
   procedure Send (This : Device; Frame : CAN_Frame);

end SocketCAN;
