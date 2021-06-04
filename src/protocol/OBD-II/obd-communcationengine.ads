--  @TODO: Figure out why maps are resulting in linker errors when targeting ARM
with Ada.Containers.Indefinite_Ordered_Maps;  use Ada.Containers;
with OBD.Message; use OBD.Message;
with CANtransceiver; use CANtransceiver;
with CAN; use CAN;

package OBD.CommuncationEngine is

   subtype OBD_CAN_Payload is CAN.Payload_Type(1 .. 8);

   --   @TODO: Add an enumeration of the ISO 1576-4 standardized CAN IDs

   --   @TODO: Add a connect API, as ISO 1576-4 defines a procedure for
   --   connecting to the CAN Bus in order to discover the Arbitration ID type
   --   and the baud rate.

   --   @NOTE: CAN ID's are effectively message identifiers, with the identifier
   --   also being the message priority. ID's are not "addresses" on the CAN Bus
   --   any CPU can decide to send/receive a message with any CAN ID.

   --   Type that provides the service of requesting OBD-II messages
   type CommuncationEngine_Type (CAN_Transceiver : access Transceiver_Type'Class)
   is tagged private;
   type Duration_Type is new Natural;
   type Message_Key_Type is range 0 .. 16#FFFF#;


   function IsSubscribed(Message : in Message_Type)
                         return Boolean with Ghost;


   --   @TODO: Need to better understand the protocol. Should we block until we
   --   get a response?
   procedure SendRequest (This    : in out CommuncationEngine_Type;
                          Message : in Message_Type'Class);


   procedure ReceiveResponse(This       : in out CommuncationEngine_Type;
                             FramedData : in Frame_Type);


   procedure Subscribe(This    : in out CommuncationEngine_Type;
                       Message : in Message_Type)
     with
       Post => IsSubscribed(Message);


   function Build_Key(This       : in out CommuncationEngine_Type;
                      Serive_Id  : in Service_Type;
                      Pid        : in PID_Type) return Message_Key_Type
     with
       Post => Build_Key'Result =  Message_Key_Type(Serive_Id) * 16#100# +
                                   Message_Key_Type(Pid);

private
   type CommuncationEngine_Type (CAN_Transceiver : access Transceiver_Type'Class)
   is tagged record
      Timout : Duration_Type;
   end record;

     package MessageMap is new Ada.Containers.Indefinite_Ordered_Maps
       (Key_Type => Message_Key_Type,
        Element_Type => Message_Type'Class);
   --use MessageMap;
   TheMessageMap : MessageMap.Map;

end OBD.CommuncationEngine;
