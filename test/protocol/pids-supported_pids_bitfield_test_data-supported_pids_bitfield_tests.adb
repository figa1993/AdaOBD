--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into PIDs.Supported_PIDs_Bitfield_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body PIDs.Supported_PIDs_Bitfield_Test_Data.Supported_PIDs_Bitfield_Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Serialize (Gnattest_T : in out Test_Supported_PIDs_Bitfield);
   procedure Test_Serialize_7bcd2f (Gnattest_T : in out Test_Supported_PIDs_Bitfield) renames Test_Serialize;
--  id:2.2/7bcd2f422ac13889/Serialize/1/0/
   procedure Test_Serialize (Gnattest_T : in out Test_Supported_PIDs_Bitfield) is
   --  pids.ads:12:4:Serialize
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Serialize;
--  end read only


--  begin read only
   procedure Test_Deserialize (Gnattest_T : in out Test_Supported_PIDs_Bitfield);
   procedure Test_Deserialize_a0d471 (Gnattest_T : in out Test_Supported_PIDs_Bitfield) renames Test_Deserialize;
--  id:2.2/a0d4711978f79c68/Deserialize/1/0/
   procedure Test_Deserialize (Gnattest_T : in out Test_Supported_PIDs_Bitfield) is
   --  pids.ads:13:4:Deserialize
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Deserialize;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end PIDs.Supported_PIDs_Bitfield_Test_Data.Supported_PIDs_Bitfield_Tests;
