pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;

package arm_linux_gnueabihf_bits_types_clockid_t_h is

  -- Clock ID used in clock and timer functions.   
   subtype clockid_t is arm_linux_gnueabihf_bits_types_h.uu_clockid_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/types/clockid_t.h:7

end arm_linux_gnueabihf_bits_types_clockid_t_h;
