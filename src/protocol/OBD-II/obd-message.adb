--
-- Package     : OBD.Message
--
-- Description : The OBD.Message package is reponsible of the implementation
--               of the messages defined by the OBD protocol.

package body OBD.Message is

   --
   -- function    : IsSubscribed
   --
   -- Description : return the length of the message
   --
   function IsSubscribed(Message    : in Message_Type;
                         theHandler : in MessageHandler_Type) return Boolean is
   begin
      for iterator in Message.handlers.Iterate loop
         if (theHandler = Element(iterator)) then
            return True;
         end if;
      end loop;
      return False;
   end IsSubscribed;

   --
   -- Procedure   : Subscribe
   --
   -- Description : This function is used to register a handler to a specific
   --               message. When the application call the Process function,
   --               the handler will be notify.
   --
   -- Parameters  : theHandler - The handler we subscribe
   --
   -- 1. Add the handler to handlers double linked list to remember it.

   procedure Subscribe (This       : in out Message_Type;
                        theHandler : in MessageHandler_Type) is
   begin
      -- 1
      This.handlers.Append(theHandler);
   end Subscribe;

   --
   -- Procedure   : Process
   --
   -- Description : This function is used to notify all handler subscribed to a
   --               message to process the data.
   --
   -- 1. Go through the list and call notify function of all subscribe handler

   procedure Process (This : in out Message_Type) is
   begin
      -- 1
      for theHandler in This.handlers.Iterate loop
         Notify(Element(theHandler));
      end loop;
   end Process;

   package body Base is
      --
      -- function    : Get_PID
      --
      -- Description : return PID of the message
      --
      function Get_PID(This : in Base_Type) return PID_Type is
      begin
           return PID_Value;
      end Get_PID;


      --
      -- function    : Get_Service
      --
      -- Description : return Service ID of the message
      --
      function Get_Service(This : in Base_Type) return Service_Type is (Service_Value);


      --
      -- function    : Get_Length
      --
      -- Description : return the length of the message
      --
      function Get_Length(This : in Base_Type) return Payload_Length_Type is
        (Length_Value);
   end Base;

end OBD.Message;
