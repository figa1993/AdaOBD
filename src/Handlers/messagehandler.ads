package MessageHandler is

   type MessageHandler_Type is private;

   procedure Start (This : MessageHandler_Type);
   procedure Notify (This : MessageHandler_Type);


private

   type MessageHandler_Type is null record;

end MessageHandler;
