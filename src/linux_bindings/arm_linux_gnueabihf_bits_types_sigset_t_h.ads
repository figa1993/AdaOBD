pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_u_sigset_t_h;

package arm_linux_gnueabihf_bits_types_sigset_t_h is

  -- A set of signals to be blocked, unblocked, or waited for.   
   subtype sigset_t is arm_linux_gnueabihf_bits_types_u_sigset_t_h.uu_sigset_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/bits/types/sigset_t.h:7

end arm_linux_gnueabihf_bits_types_sigset_t_h;
