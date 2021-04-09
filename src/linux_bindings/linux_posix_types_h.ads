pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;

package linux_posix_types_h is

  -- SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note  
  -- * This allows for 1024 file descriptors: if NR_OPEN is ever grown
  -- * beyond that you'll have to change this too. But 1024 fd's seem to be
  -- * enough even for such "real" unices like OSF/1, so hopefully this is
  -- * one limit that doesn't have to be changed [again].
  -- *
  -- * Note that POSIX wants the FD_CLEAR(fd,fdsetp) defines to be in
  -- * <sys/time.h> (and thus <linux/time.h>) - but this is a more logical
  -- * place for them. Solved by having dummy defines in <sys/time.h>.
  --  

  -- * This macro may have been defined in <gnu/types.h>. But we always
  -- * use the one here.
  --  

   type uu_kernel_fd_set_array1089 is array (0 .. 31) of aliased unsigned_long;
   type uu_kernel_fd_set is record
      fds_bits : aliased uu_kernel_fd_set_array1089;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/posix_types.h:26
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/posix_types.h:27

  -- Type of a signal handler.   
   type uu_kernel_sighandler_t is access procedure (arg1 : int)
   with Convention => C;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/posix_types.h:30

  -- Type of a SYSV IPC key.   
   subtype uu_kernel_key_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/posix_types.h:33

   subtype uu_kernel_mqd_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/linux/posix_types.h:34

end linux_posix_types_h;
