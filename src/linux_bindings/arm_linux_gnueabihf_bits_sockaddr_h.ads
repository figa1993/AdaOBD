pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;

package arm_linux_gnueabihf_bits_sockaddr_h is

  -- Definition of struct sockaddr_* common members and sizes, generic version.
  --   Copyright (C) 1995-2018 Free Software Foundation, Inc.
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

  -- * Never include this file directly; use <sys/socket.h> instead.
  --  

  -- POSIX.1g specifies this type name for the `sa_family' member.   
   subtype sa_family_t is unsigned_short;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/arm-linux-gnueabihf/bits/sockaddr.h:28

  -- This macro is used to declare the initial common members
  --   of the data types used for socket addresses, `struct sockaddr',
  --   `struct sockaddr_in', `struct sockaddr_un', etc.   

  -- Size of struct sockaddr_storage.   
end arm_linux_gnueabihf_bits_sockaddr_h;
