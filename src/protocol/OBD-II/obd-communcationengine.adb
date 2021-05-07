 with Types; use Types;
 with Ada.Unchecked_Conversion;
 with CAN; use CAN;

package body OBD.CommuncationEngine is


   --procedure Show_Bit (V : Boolean) is
   --begin
   --   case V is
   --      when False => Put ("0");
   --      when True  => Put ("1");
   --   end case;
   --end Show_Bit;

   --   Subprogram to control which message the CommunicationEngine will
   --   request
   --  procedure Subscribe(This    : in out CommuncationEngine_Type;
   --                      Message : in Message_Type) is
   --     TheKey     : Message_Key_Type := 0;
   --
   --  begin
   --     TheKey:= Build_Key(This, Message.Get_Service, Message.Get_Pid);
   --     TheMessageMap.Include(TheKey, Message);
   --  end Subscribe;



   --   Builds a unique key from an OBD message Service Type and PID
   --  function Build_Key(This       : in out CommuncationEngine_Type;
   --                     Serive_Id  : in Service_Type;
   --                     Pid        : in PID_Type) return Message_Key_Type is
   --     Res : Message_Key_Type := 0;
   --
   --  begin
   --     Res := Message_Key_Type(Serive_Id) * 256 +
   --       Message_Key_Type(Pid);
   --     return Res;
   --  end Build_Key;


   --   @TODO Per Section 7 of ISO 1576-2 the OBD-II Message must be encoded
   --   in a CAN frame with a DLC of 8 and and 8 byte payload. The value
   --   of the unused bytes is not defined.


   procedure SendRequest(This       : in out CommuncationEngine_Type;
                         FramedData : in Frame_Type) is

      --  Raw_Data_Buffer : Bit_Field (0 .. FramedData'Size - 1)
      --    with Address => FramedData'Address, Import, Volatile;
   begin
      -- This.CAN_Transceiver.Send();
      --TODO => cantraceiver.send(Raw_data_buffer);
      null;
   end SendRequest;

   procedure Request_PID( This       : in out CommuncationEngine_Type;
                          Message : in Message_Type'Class) is
      Request : Frame_Type;
      function To_Bytes is new Ada.Unchecked_Conversion(Source => Frame_Type,
                                                    Target => CAN.Payload_Type);
   begin
      Request.PID := Message.Get_PID;
      This.CAN_Transceiver.Send( To_Bytes(Request), 16#7DF# );
   end Request_PID;


   --   @TODO: How is this used?
   --   Processes an OBD Frame into a message.
   --  procedure ReceiveResponse(This       : in out CommuncationEngine_Type;
   --                            FramedData : in Frame_Type) is
   --
   --     TheKey     : Message_Key_Type := 0;
   --  begin
   --     TheKey := Build_Key(This, FramedData.Service, FramedData.PID);
   --
   --     if (TheMessageMap.Contains(TheKey)) then
   --        declare
   --           TheMessage : Message_Type'Class := TheMessageMap(TheKey);
   --        begin
   --           TheMessage.Decode(FramedData);
   --           TheMessage.Process;
   --        end;
   --     end if;
   --
   --
   --     null;
   --  end ReceiveResponse;

end OBD.CommuncationEngine;
