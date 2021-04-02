--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body PIDs.Supported_PIDs_Bitfield_Test_Data is

   Local_Supported_PIDs_Bitfield : aliased GNATtest_Generated.GNATtest_Standard.PIDs.Supported_PIDs_Bitfield;
   procedure Set_Up (Gnattest_T : in out Test_Supported_PIDs_Bitfield) is
   begin
      Gnattest_T.Fixture := Local_Supported_PIDs_Bitfield'Access;
   end Set_Up;

   procedure Tear_Down (Gnattest_T : in out Test_Supported_PIDs_Bitfield) is
   begin
      null;
   end Tear_Down;

end PIDs.Supported_PIDs_Bitfield_Test_Data;
