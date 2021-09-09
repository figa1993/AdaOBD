with Ada.Containers.Doubly_Linked_Lists;
with CANtransceiver; use CANtransceiver;
with CAN; use CAN;
with OBD.Message.PIDs;
with OBD.Message_Template.Subscribable;
with Ada.Real_Time;

--   Package which provides the following services:

--   @TODO: Can this package expose a static resource, which clients
--   can use to statically attach handlers?

--   @NOTE: Assumption is that the application does not have dynamic
--   requirements of how messages are handled.
--   @NOTE: Assumption is that there is a single handler per message

--   Usage:
--   Clients assigns the handler corresponding to each message in the
--   Handlers protected object.
--   The RX Task makes blocking calls to receive CAN Frames and
--   decapsulates them. It reads the PID field and invokes the corresponding
--   handler.

--   @TODO: How can this be done without a giant switch statement?
--   Perhaps the Handlers can be subtypes of some type for which a jagged 2D
--   array is defined privately and statically populated.

--   @TODO: Consider restricting the support to Service 0/1?
generic
   Transceiver : in out Transceiver_Type'Class;
   RX_Timeout : Duration;
package OBD.Protocol_Handler is

   subtype OBD_CAN_Payload is CAN.Payload_Type(1 .. 8);
   
   --   @TODO: Define a static list of all messages. Add these messages
   --   to a static array in the private section, for look-up.
   
   --  type Subscription_Manager is private;

   --  type Subscribable_Message is abstract new Base_Type with private;

   --  The Handler needs to be able to handle the particular Payload_Transcoder?
   --  procedure Subscribe ( Object : in out Subscribable_Message; Handler ...


   --   @TODO: Add an enumeration of the ISO 1576-4 standardized CAN IDs

   --   @TODO: Add a connect API, as ISO 1576-4 defines a procedure for
   --   connecting to the CAN Bus in order to discover the Arbitration ID type
   --   and the baud rate.

   --   @NOTE: CAN ID's are effectively message identifiers, with the identifier
   --   also being the message priority. ID's are not "addresses" on the CAN Bus
   --   any CPU can decide to send/receive a message with any CAN ID.
   
   procedure Initialize (Transceiver : Transceiver_Type'Class; RX_Timeout : Ada.Real_Time.Time_Span);
   
   procedure Enable_Request (PID : PID_Type;
                             Service : Service_Type);
   
      
   package Subscribable_Bitfield is new OBD.Message.PIDs.Bitfield_Message.Subscribable;
   PID_0 : Subscribable_Bitfield.Instance_Type;
   
   type Service_0_Messages is record
      PID_0 : Subscribable_Bitfield.Instance_Type;
   end record;
   
   --   Data structure which provides storage for the handler callbacks
   --   for each message. This design provides type-safety: compiler will
   --   statically check that client code's handler is of correct type.
   type Messages_Type is record
      Service_0 : Service_0_Messages;
   end record;
   Messages : Messages_Type;

private

   -- CAN_Transceiver : access Transceiver_Type'Class;

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

   task Receive_Loop;

   task Transmit_loop;
   
   --  task type Receive_Loop is
   --     entry Start;
   --  end Receive_Loop;
   --  
   --  task type Transmit_loop is
   --     entry Start;
   --  end Transmit_loop;

   type Subscription_Key is record
      PID : PID_Type;
      Service : Service_Type;
   end record;
   
   package Key_Lists is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type  => Subscription_Key);
      
   protected type Subscribtion_List is
      procedure Append (Key : Subscription_Key);
      procedure Request;
   private
      Elements : Key_Lists.List;
   end Subscribtion_List;
   
   Subscriptions : Subscribtion_List;

end OBD.Protocol_Handler;
