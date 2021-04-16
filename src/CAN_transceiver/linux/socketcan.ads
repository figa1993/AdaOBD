with CAN; use CAN;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.Sockets.Thin;

package SocketCAN is

   package Sockets renames GNAT.Sockets.Thin;

   --   @TODO: Consider making this a controlled type with RAII
   --   To start and stop the device
   type Device is private;

   procedure Start (This : in out Device);
   procedure Stop (This : Device);
   function Receive (This : Device) return Can.CAN_Frame;
   procedure Send (This : Device; Frame : Can.CAN_Frame);

private
   type Device is record
      Socket_FD : Sockets.C.Int;
      Device_Name : Unbounded_String;
   end record;

end SocketCAN;
