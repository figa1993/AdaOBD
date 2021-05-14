pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;

package arm_linux_gnueabihf_bits_types_clock_t_h is

  -- Returned by `clock'.   
   subtype clock_t is arm_linux_gnueabihf_bits_types_h.uu_clock_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/bits/types/clock_t.h:7

end arm_linux_gnueabihf_bits_types_clock_t_h;
