pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;

package arm_linux_gnueabihf_bits_types_struct_timeval_h is

  -- A time value that is accurate to the nearest
  --   microsecond but also has a range of years.   

  -- Seconds.   
   type timeval is record
      tv_sec : aliased arm_linux_gnueabihf_bits_types_h.uu_time_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/types/struct_timeval.h:10
      tv_usec : aliased arm_linux_gnueabihf_bits_types_h.uu_suseconds_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/types/struct_timeval.h:11
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/types/struct_timeval.h:8

  -- Microseconds.   
end arm_linux_gnueabihf_bits_types_struct_timeval_h;
