with CAN; use CAN;
with CANtransceiver; use CANtransceiver;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Ada.Containers.Hashed_Maps; use Ada.Containers;

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
   overriding procedure Send (This : in out Device; Payload : Payload_Type;
                              Tx_Arbitration_Id : Ext_Arbitration_ID_Type );

   overriding procedure Subscribe( This : in out Device;
                                   Rx_Arbitration_Id : Ext_Arbitration_ID_Type;
                                   Payload_Handler : CAN_Payload_Handler_Type);

private

   --   Instantiate Hashed Map container between Arbitration ID and type
   --   since the Arbitration ID is smaller than the Ada.Containers.Hash_Type
   --   and an assumption can be made that the Arbitration IDs will likely be
   --   uniformly chosen by the system designer, the identity function
   --   is a reasonable choice for the Hash function
   function Identity_Hash( Key : in Ext_Arbitration_ID_Type ) return Hash_Type is
     ( Hash_Type(Key) ) with Inline;


   package ID_To_Handler_Maps is new Hashed_Maps(
                                                 Key_Type        =>   Ext_Arbitration_ID_Type,
                                                 Element_Type    =>   CAN_Payload_Handler_Type,
                                                 Hash            =>   Identity_Hash,
                                                 Equivalent_Keys =>   "=");
   use ID_To_Handler_Maps;

   type Device (Device_Name : access Unbounded_String) is new Transceiver_Type
   with record
      Socket_FD : Sockets.C.Int;
      Subscriber_Map : Map;
      -- Device_Name : Unbounded_String;
   end record;

end SocketCAN;
