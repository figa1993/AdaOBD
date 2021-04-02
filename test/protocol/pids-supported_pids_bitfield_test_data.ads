--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.


with AUnit.Test_Fixtures;

with GNATtest_Generated;

package PIDs.Supported_PIDs_Bitfield_Test_Data is

   type Supported_PIDs_Bitfield_Access is access all GNATtest_Generated.GNATtest_Standard.PIDs.Supported_PIDs_Bitfield'Class;

--  begin read only
   type Test_Supported_PIDs_Bitfield is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : Supported_PIDs_Bitfield_Access;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_Supported_PIDs_Bitfield);
   procedure Tear_Down (Gnattest_T : in out Test_Supported_PIDs_Bitfield);

end PIDs.Supported_PIDs_Bitfield_Test_Data;
