pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;
with Interfaces.C.Extensions;

package arm_linux_gnueabihf_sys_types_h is

  -- Copyright (C) 1991-2018 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.   

  -- *	POSIX Standard: 2.6 Primitive System Data Types	<sys/types.h>
  --  

   subtype u_char is arm_linux_gnueabihf_bits_types_h.uu_u_char;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:33

   subtype u_short is arm_linux_gnueabihf_bits_types_h.uu_u_short;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:34

   subtype u_int is arm_linux_gnueabihf_bits_types_h.uu_u_int;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:35

   subtype u_long is arm_linux_gnueabihf_bits_types_h.uu_u_long;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:36

   subtype quad_t is arm_linux_gnueabihf_bits_types_h.uu_quad_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:37

   subtype u_quad_t is arm_linux_gnueabihf_bits_types_h.uu_u_quad_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:38

   subtype fsid_t is arm_linux_gnueabihf_bits_types_h.uu_fsid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:39

   subtype loff_t is arm_linux_gnueabihf_bits_types_h.uu_loff_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:42

   subtype ino_t is arm_linux_gnueabihf_bits_types_h.uu_ino_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:47

   subtype dev_t is arm_linux_gnueabihf_bits_types_h.uu_dev_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:59

   subtype gid_t is arm_linux_gnueabihf_bits_types_h.uu_gid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:64

   subtype mode_t is arm_linux_gnueabihf_bits_types_h.uu_mode_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:69

   subtype nlink_t is arm_linux_gnueabihf_bits_types_h.uu_nlink_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:74

   subtype uid_t is arm_linux_gnueabihf_bits_types_h.uu_uid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:79

   subtype off_t is arm_linux_gnueabihf_bits_types_h.uu_off_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:85

   subtype pid_t is arm_linux_gnueabihf_bits_types_h.uu_pid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:97

   subtype id_t is arm_linux_gnueabihf_bits_types_h.uu_id_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:103

   subtype ssize_t is arm_linux_gnueabihf_bits_types_h.uu_ssize_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:108

   subtype daddr_t is arm_linux_gnueabihf_bits_types_h.uu_daddr_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:114

   subtype caddr_t is arm_linux_gnueabihf_bits_types_h.uu_caddr_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:115

   subtype key_t is arm_linux_gnueabihf_bits_types_h.uu_key_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:121

  -- Old compatibility names for C types.   
   subtype ulong is unsigned_long;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:148

   subtype ushort is unsigned_short;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:149

   subtype uint is unsigned;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:150

  -- These size-specific names are used by some of the inet code.   
  -- These were defined by ISO C without the first `_'.   
  -- For GCC 2.7 and later, we can use specific type-size attributes.   
   subtype u_int8_t is unsigned_char;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:177

   subtype u_int16_t is unsigned_short;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:178

   subtype u_int32_t is unsigned;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:179

   subtype u_int64_t is Extensions.unsigned_long_long;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:180

   subtype register_t is int;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:182

  -- Some code from BIND tests this macro to see if the types above are
  --   defined.   

  -- In BSD <sys/types.h> is expected to define BYTE_ORDER.   
  -- It also defines `fd_set' and the FD_* macros for `select'.   
   subtype blksize_t is arm_linux_gnueabihf_bits_types_h.uu_blksize_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:202

  -- Types from the Large File Support interface.   
  -- Type to count number of disk blocks.   
   subtype blkcnt_t is arm_linux_gnueabihf_bits_types_h.uu_blkcnt_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:209

  -- Type to count file system blocks.   
   subtype fsblkcnt_t is arm_linux_gnueabihf_bits_types_h.uu_fsblkcnt_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:213

  -- Type to count file system inodes.   
   subtype fsfilcnt_t is arm_linux_gnueabihf_bits_types_h.uu_fsfilcnt_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/sys/types.h:217

  -- Type to count number of disk blocks.   
  -- Type to count file system blocks.   
  -- Type to count file system inodes.   
  -- Type to count number of disk blocks.  
  -- Type to count file system blocks.   
  -- Type to count file system inodes.   
  -- Now add the thread types.   
end arm_linux_gnueabihf_sys_types_h;
