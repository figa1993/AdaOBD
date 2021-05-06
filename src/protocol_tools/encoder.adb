with Ada.Text_IO; use Ada.Text_IO;

with Types; use Types;

package body Encoder is


   procedure Show_Bit (V : Boolean) is
      begin
         case V is
         when False => Put ("0");
         when True  => Put ("1");
      end case;
   end Show_Bit;

   procedure encode (This       : in out CanEncoder;
                     message    : in OBD2_Message'Class;
                     framedData : in out Frame_Type) is
      --Raw_data_buffer : Bit_Field (0 .. OBD2_frame'Size - 1)
     --with Address => OBD2_frame'Address, Import, Volatile;

   begin

      framedData.CAN_ID := CAN_ID_Req;
      framedData.Length := Get_Length(message);
      framedData.Service := Get_Service(message);
      framedData.PID := Get_PID(message);
      framedData.Payload := framedData.Payload;

      --Put_Line("Bit: ");
      --for E of Raw_data_buffer loop
      --   Show_Bit (E);
      --end loop;

      --transmit(this.tranceiver, Raw_data_buffer);
   end;

end Encoder;
