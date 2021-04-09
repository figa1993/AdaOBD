pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_asm_posix_types_h;
with Interfaces.C.Strings;

package asm_generic_posix_types_h is

  -- SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note  
  -- * This file is generally used by user-level software, so you need to
  -- * be a little careful about namespace pollution etc.
  -- *
  -- * First the types that are often defined in different ways across
  -- * architectures, so that you can override them.
  --  

   subtype uu_kernel_long_t is long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:15

   subtype uu_kernel_ulong_t is unsigned_long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:16

   subtype uu_kernel_ino_t is uu_kernel_ulong_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:20

   subtype uu_kernel_pid_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:28

   subtype uu_kernel_suseconds_t is uu_kernel_long_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:41

   subtype uu_kernel_daddr_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:45

   subtype uu_kernel_uid32_t is unsigned;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:49

   subtype uu_kernel_gid32_t is unsigned;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:50

   subtype uu_kernel_old_uid_t is arm_linux_gnueabihf_asm_posix_types_h.uu_kernel_uid_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:54

   subtype uu_kernel_old_gid_t is arm_linux_gnueabihf_asm_posix_types_h.uu_kernel_gid_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:55

  -- * Most 32 bit architectures use "unsigned int" size_t,
  -- * and all 64 bit architectures use "unsigned long" size_t.
  --  

   subtype uu_kernel_size_t is unsigned;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:68

   subtype uu_kernel_ssize_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:69

   subtype uu_kernel_ptrdiff_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:70

   type uu_kernel_fsid_t_array1115 is array (0 .. 1) of aliased int;
   type uu_kernel_fsid_t is record
      val : aliased uu_kernel_fsid_t_array1115;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:80
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:81

  -- * anything below here should be completely generic
  --  

   subtype uu_kernel_off_t is uu_kernel_long_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:87

   subtype uu_kernel_loff_t is Long_Long_Integer;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:88

   subtype uu_kernel_time_t is uu_kernel_long_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:89

   subtype uu_kernel_time64_t is Long_Long_Integer;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:90

   subtype uu_kernel_clock_t is uu_kernel_long_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:91

   subtype uu_kernel_timer_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:92

   subtype uu_kernel_clockid_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:93

   type uu_kernel_caddr_t is new Interfaces.C.Strings.chars_ptr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:94

   subtype uu_kernel_uid16_t is unsigned_short;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:95

   subtype uu_kernel_gid16_t is unsigned_short;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/asm-generic/posix_types.h:96

end asm_generic_posix_types_h;
