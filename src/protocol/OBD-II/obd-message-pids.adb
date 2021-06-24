with Ada.Unchecked_Conversion;

package body OBD.Message.PIDs is

   procedure Encode (This : in Supported_PIDs_Bitfield;
                     TheFrame: out Frame_Type) is
      function Convert is new Ada.Unchecked_Conversion (Source => Bit_Array_32,
                                                        Target => Payload_Type);
   begin
      TheFrame.Payload := Convert(This.Bits);
      TheFrame.Length := This.Get_Length;
      TheFrame.PID := This.Get_PID;
      TheFrame.Service := This.Get_Service;
   end Encode;

   procedure Decode (This : in out Supported_PIDs_Bitfield;
                     FramedData : in Frame_Type) is
   begin
      null;
   end;

   --  procedure Decode (This       : in Out VehiculeSpeedMsg_Type;
   --                    FramedData : in Frame_Type) is
   --  begin
   --     This.Speed := VehiculeSpeed_Type(FramedData.Payload(SPEED_DATA_INDEX));
   --  end Decode;
   --
   --
   --  procedure Encode (This    : in VehiculeSpeedMsg_Type;
   --                    TheFrame: out Frame_Type) is
   --
   --  begin
   --     TheFrame.Payload(SPEED_DATA_INDEX) := Byte_Type(This.Speed);
   --  end Encode;

end OBD.Message.PIDs;
