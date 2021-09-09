--   Defines the Payload interface
--   Provides implementations for the legislated OBD-II payloads
--   Usage:
--   Types herein should be used to serialize and deserialize the OBD-II
--   payloads.
--   Plan for this type to be used in the definition of an OBD-II message
--   type/interface

with System.Aux_DEC; use System.Aux_DEC;

package OBD.Payloads is

   --   Abstraction for a payload. Consists of data and behavior for
   --   Serializing/Deserializing to/from raw OBD bytes.
   type Instance_Type is interface;
   procedure Serialize (Payload : in Instance_Type; Bytes : out Payload_Bytes)
   is abstract;
   procedure Deserialize (Payload : out Instance_Type; Bytes : Payload_Bytes)
   is abstract;
   
   type Bitfield is new Instance_Type with record
      Bits : Bit_Array_32;
   end record;
   
   overriding procedure Serialize (Payload : in Bitfield; Bytes : out Payload_Bytes);
   overriding procedure Deserialize (Payload : out Bitfield; Bytes : Payload_Bytes);
   
end OBD.Payloads;
