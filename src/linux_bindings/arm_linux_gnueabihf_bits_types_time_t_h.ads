pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;

package arm_linux_gnueabihf_bits_types_time_t_h is

  -- Returned by `time'.   
   subtype time_t is arm_linux_gnueabihf_bits_types_h.uu_time_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/types/time_t.h:7

end arm_linux_gnueabihf_bits_types_time_t_h;
