with Ada.Unchecked_Conversion;

package body PIDs is

   procedure Encode (This : in Supported_PIDs_Bitfield;
                     TheFrame: out Frame_Type) is
      function Convert is new Ada.Unchecked_Conversion (Source => Bit_Array_32,
                                                        Target => Payload_Type);
   begin
      -- The payload should simply be an unchecked conversion
      --return Convert (This.Bits);
   end Serialize;

   procedure Decode (This : in out Supported_PIDs_Bitfield;
                     FramedData : in Frame_Type) is
   begin
      null;
   end;

   procedure Decode (This       : in out VehiculeSpeedMsg_Type;
                     FramedData : in Frame_Type) is
   begin
      This.Speed := VehiculeSpeed_Type(FramedData.Payload(SPEED_DATA_INDEX));
   end Decode;


   procedure Encode (This    : in out VehiculeSpeedMsg_Type;
                     TheFrame: out Frame_Type) is

   begin
      TheFrame.Payload(SPEED_DATA_INDEX) := Byte_Type(This.Speed);
   end Encode;

end PIDs;
