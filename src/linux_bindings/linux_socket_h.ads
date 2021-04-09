pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;

package linux_socket_h is

  -- SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note  
  -- * Desired design of maximum size and alignment (see RFC2553)
  --  

  -- Implementation specific desired alignment  
   subtype uu_kernel_sa_family_t is unsigned_short;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/socket.h:12

  -- address family  
   subtype anon1080_array1082 is Interfaces.C.char_array (0 .. 125);
   type uu_kernel_sockaddr_storage is record
      ss_family : aliased uu_kernel_sa_family_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/socket.h:15
      uu_data : aliased anon1080_array1082;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/socket.h:17
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/socket.h:14

  -- Following field(s) are implementation specific  
  -- space to achieve desired size,  
  -- _SS_MAXSIZE value minus size of ss_family  
  -- force desired alignment  
   type sockaddr is null record;   -- incomplete struct

end linux_socket_h;
