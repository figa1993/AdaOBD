--  @TODO: Figure out why maps are resulting in linker errors when targeting ARM
--  with Ada.Containers.Indefinite_Ordered_Maps;  use Ada.Containers;
with OBD.Message; use OBD.Message;
with CANtransceiver; use CANtransceiver;

package OBD.CommuncationEngine is

   --   @TODO: Add an enumeration of the ISO 1576-4 standardized CAN IDs

   --   Type that provides the service of requesting OBD-II messages
   type CommuncationEngine_Type (CAN_Transceiver : access Transceiver_Type'Class)
   is tagged private;
   type Duration_Type is new Natural;
   type Message_Key_Type is range 0 .. 16#FFFF#;


   --   @TODO: Need to better understand the protocol. Should we block until we
   --   get a response?
   --  procedure SendRequest(This       : in out CommuncationEngine_Type;
   --                        FramedData : in Frame_Type);

   procedure Request_PID( This       : in out CommuncationEngine_Type;
                          Message : in Message_Type'Class);

   --  procedure ReceiveResponse(This       : in out CommuncationEngine_Type;
   --                            FramedData : in Frame_Type);


   --  procedure Subscribe(This    : in out CommuncationEngine_Type;
   --                      Message : in Message_Type);
   --
   --
   --  function Build_Key(This       : in out CommuncationEngine_Type;
   --                     Serive_Id  : in Service_Type;
   --                     Pid        : in PID_Type) return Message_Key_Type;

private
   type CommuncationEngine_Type (CAN_Transceiver : access Transceiver_Type'Class)
   is tagged record
      Timout : Duration_Type;
   end record;

   --  package MessageMap is new Ada.Containers.Indefinite_Ordered_Maps
   --    (Key_Type => Message_Key_Type,
   --     Element_Type => Message_Type'Class);
   --  use MessageMap;
   --
   --  TheMessageMap : Map;

end OBD.CommuncationEngine;
