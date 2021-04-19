pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;

package arm_linux_gnueabihf_bits_types_u_sigset_t_h is

   type uu_sigset_t_array1193 is array (0 .. 31) of aliased unsigned_long;
   type uu_sigset_t is record
      uu_val : aliased uu_sigset_t_array1193;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/types/__sigset_t.h:7
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/types/__sigset_t.h:8

end arm_linux_gnueabihf_bits_types_u_sigset_t_h;
