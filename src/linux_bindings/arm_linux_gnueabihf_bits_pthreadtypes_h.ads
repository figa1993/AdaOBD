pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_thread_shared_types_h;
with arm_linux_gnueabihf_bits_pthreadtypes_arch_h;

package arm_linux_gnueabihf_bits_pthreadtypes_h is

  -- Declaration of common pthread types for all architectures.
  --   Copyright (C) 2017-2018 Free Software Foundation, Inc.
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

  -- For internal mutex and condition variable definitions.   
  -- Thread identifiers.  The structure of the attribute type is not
  --   exposed on purpose.   

   subtype pthread_t is unsigned_long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:27

  -- Data structures for mutex handling.  The structure of the attribute
  --   type is not exposed on purpose.   

   subtype pthread_mutexattr_t_array1243 is Interfaces.C.char_array (0 .. 3);
   type pthread_mutexattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_mutexattr_t_array1243;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:34
         when others =>
            uu_align : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:35
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:36

  -- Data structure for condition variable handling.  The structure of
  --   the attribute type is not exposed on purpose.   

   subtype pthread_condattr_t_array1243 is Interfaces.C.char_array (0 .. 3);
   type pthread_condattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_condattr_t_array1243;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:43
         when others =>
            uu_align : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:44
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:45

  -- Keys for thread-specific data  
   subtype pthread_key_t is unsigned;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:49

  -- Once-only execution  
   subtype pthread_once_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:53

   subtype anon1249_array1251 is Interfaces.C.char_array (0 .. 35);
   type pthread_attr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased anon1249_array1251;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:58
         when others =>
            uu_align : aliased long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:59
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:56

   subtype pthread_mutex_t_array1255 is Interfaces.C.char_array (0 .. 23);
   type pthread_mutex_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased arm_linux_gnueabihf_bits_thread_shared_types_h.uu_pthread_mutex_s;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:69
         when 1 =>
            uu_size : aliased pthread_mutex_t_array1255;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:70
         when others =>
            uu_align : aliased long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:71
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:72

   subtype pthread_cond_t_array1259 is Interfaces.C.char_array (0 .. 47);
   type pthread_cond_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased arm_linux_gnueabihf_bits_thread_shared_types_h.uu_pthread_cond_s;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:77
         when 1 =>
            uu_size : aliased pthread_cond_t_array1259;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:78
         when others =>
            uu_align : aliased Long_Long_Integer;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:79
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:80

  -- Data structure for reader-writer lock variable handling.  The
  --   structure of the attribute type is deliberately not exposed.   

   subtype pthread_rwlock_t_array1262 is Interfaces.C.char_array (0 .. 31);
   type pthread_rwlock_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased arm_linux_gnueabihf_bits_pthreadtypes_arch_h.uu_pthread_rwlock_arch_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:88
         when 1 =>
            uu_size : aliased pthread_rwlock_t_array1262;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:89
         when others =>
            uu_align : aliased long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:90
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:91

   subtype pthread_rwlockattr_t_array1266 is Interfaces.C.char_array (0 .. 7);
   type pthread_rwlockattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_rwlockattr_t_array1266;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:95
         when others =>
            uu_align : aliased long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:96
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:97

  -- POSIX spinlock data type.   
   subtype pthread_spinlock_t is int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:103

  -- POSIX barriers data type.  The structure of the type is
  --   deliberately not exposed.   

   subtype pthread_barrier_t_array1272 is Interfaces.C.char_array (0 .. 19);
   type pthread_barrier_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_barrier_t_array1272;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:110
         when others =>
            uu_align : aliased long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:111
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:112

   subtype pthread_barrierattr_t_array1243 is Interfaces.C.char_array (0 .. 3);
   type pthread_barrierattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_barrierattr_t_array1243;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:116
         when others =>
            uu_align : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:117
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:118

end arm_linux_gnueabihf_bits_pthreadtypes_h;
