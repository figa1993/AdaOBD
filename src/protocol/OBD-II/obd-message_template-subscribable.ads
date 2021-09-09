with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

generic 
package OBD.Message_Template.Subscribable is
   
   type Handler_Type is access procedure ( Payload : Payload_Type);
   
   package Handler_Lists is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type  => Handler_Type); use Handler_Lists;

   protected type Instance_Type is
      procedure Subscribe (Handler : Handler_Type);
      procedure Deserialize (Bytes : Payload_Bytes);
   private
      Handlers : List;
      Message : OBD.Message_Template.Instance_Type;
   end Instance_Type;
   
private
                        
end OBD.Message_Template.Subscribable;
