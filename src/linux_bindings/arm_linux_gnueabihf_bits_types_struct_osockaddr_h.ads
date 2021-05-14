pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;

package arm_linux_gnueabihf_bits_types_struct_osockaddr_h is

  -- This is the 4.3 BSD `struct sockaddr' format, which is used as wire
  --   format in the grotty old 4.3 `talk' protocol.   

   type anon1297_array1298 is array (0 .. 13) of aliased unsigned_char;
   type osockaddr is record
      sa_family : aliased unsigned_short;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/bits/types/struct_osockaddr.h:8
      sa_data : aliased anon1297_array1298;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/bits/types/struct_osockaddr.h:9
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/bits/types/struct_osockaddr.h:6

end arm_linux_gnueabihf_bits_types_struct_osockaddr_h;
