with Ada.Containers.Indefinite_Ordered_Maps;  use Ada.Containers;
with OBD.Message; use OBD.Message;
with CANtransceiver; use CANtransceiver;
with CAN; use CAN;
with Ada.Finalization; use Ada.Finalization;

package OBD.Protocol is

   subtype OBD_CAN_Payload is CAN.Payload_Type(1 .. 8);

   --   @TODO: Add an enumeration of the ISO 1576-4 standardized CAN IDs

   --   @TODO: Add a connect API, as ISO 1576-4 defines a procedure for
   --   connecting to the CAN Bus in order to discover the Arbitration ID type
   --   and the baud rate.

   --   @NOTE: CAN ID's are effectively message identifiers, with the identifier
   --   also being the message priority. ID's are not "addresses" on the CAN Bus
   --   any CPU can decide to send/receive a message with any CAN ID.

   --   Type that provides the service of requesting OBD-II messages
   type Communication_Engine_Type (CAN_Transceiver : access Transceiver_Type'Class)
   is new Ada.Finalization.Limited_Controlled with private;

   --  protected type State_Type (CAN_Transceiver : access Transceiver_Type'Class)
   --  is
   --     procedure enable_request( PID : PID_Type);
   --  private
   --     I : Integer;
   --  end State_Type;

   type Duration_Type is new Natural;

   -- @TODO: Would it make more sense to make this a record with a rep clause?
   -- The way we currently use it seems very C-like
   type Message_Key_Type is range 0 .. 16#FFFF#;


   function IsSubscribed(Message : in Message_Type'Class)
                         return Boolean with Ghost;


   -- @TODO: Consider creating an override which takes a PID as the argument
   -- Sends a request for the message specified
   procedure SendRequest (This    : in out Communication_Engine_Type;
                          Message : in Message_Type'Class);


   procedure ReceiveResponse(This       : in out Communication_Engine_Type;
                             FramedData : in Frame_Type);


   procedure Subscribe(This    : in out Communication_Engine_Type;
                       Message : in Message_Type'Class)
     with
       Post => IsSubscribed(Message);


   function Build_Key(This       : in out Communication_Engine_Type;
                      Serive_Id  : in Service_Type;
                      Pid        : in PID_Type) return Message_Key_Type
     with
       Post => Build_Key'Result =  Message_Key_Type(Serive_Id) * 16#100# +
                                   Message_Key_Type(Pid);

private

   package MessageMap is new Ada.Containers.Indefinite_Ordered_Maps
       (Key_Type => Message_Key_Type,
        Element_Type => Message_Type'Class);
   TheMessageMap : MessageMap.Map;


   --   @TODO: Want a communication engine per CAN interface
   --   @TODO: Want a sending task per communication engine
   --   @TODO: Want a receiving task (or task pool) per communication engine
   --   @TODO: Want a shared map of the PIDs to request and their handlers.
   --   @TODO: Want initialization of object to start tasks, and
   --          and finalization to terminate the tasks

   --   Deisgn 1: Accesses to task types, and dynamic creation of tasks in
   --   the CE initialization function
   --   Pros:
   --   Cons: Probably brings us outside the Ravenscar/Jorvik profile,
   --         Incurs a heap-allocation penalty even though task number is known
   --         statically

   --   Design 2: Receive


   -- @TODO: The serialization/deserialization of standard OBD-II messages is
   -- known statically. Does it make sense to create a "global" data structure
   -- that the receive task can use to quickly look-up the
   -- serialize/deserialize subprogram? Then the dynamic map need only to map
   -- to a handler.

   protected type Protected_Message_Map_Type is
      procedure Subscribe( Message : in Message_Type'Class );
   private
      Data : MessageMap.Map;
   end Protected_Message_Map_Type;

   type State_Type(CAN_Transceiver : access Transceiver_Type'Class) is record
      Map : Protected_Message_Map_Type;
   end record;

   task type Receive_Loop (State : access State_Type := null);
   task type Transmit_loop (State : access State_Type := null);

   --   Type used to manage requesting and processing of OBD-II legislated
   --   PIDs using tasks that it spawns on initialization.
   type Communication_Engine_Type (CAN_Transceiver : access Transceiver_Type'Class)
   is new Ada.Finalization.Limited_Controlled with record
      State : State_Type(CAN_Transceiver);
      Receive_Work : Receive_Loop;
      Transmit_Work : Transmit_Loop;
   end record;

   overriding procedure Initialize (Object : in out Communication_Engine_Type);
   --overriding procedure Finalize (Object : in out Communication_Engine_Type);

end OBD.Protocol;
