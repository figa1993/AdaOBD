pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with arm_linux_gnueabihf_bits_socket_h;
with arm_linux_gnueabihf_bits_types_h;

package net_if_h is

   IF_NAMESIZE : constant := 16;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:31
   --  unsupported macro: IFF_UP IFF_UP
   --  unsupported macro: IFF_BROADCAST IFF_BROADCAST
   --  unsupported macro: IFF_DEBUG IFF_DEBUG
   --  unsupported macro: IFF_LOOPBACK IFF_LOOPBACK
   --  unsupported macro: IFF_POINTOPOINT IFF_POINTOPOINT
   --  unsupported macro: IFF_NOTRAILERS IFF_NOTRAILERS
   --  unsupported macro: IFF_RUNNING IFF_RUNNING
   --  unsupported macro: IFF_NOARP IFF_NOARP
   --  unsupported macro: IFF_PROMISC IFF_PROMISC
   --  unsupported macro: IFF_ALLMULTI IFF_ALLMULTI
   --  unsupported macro: IFF_MASTER IFF_MASTER
   --  unsupported macro: IFF_SLAVE IFF_SLAVE
   --  unsupported macro: IFF_MULTICAST IFF_MULTICAST
   --  unsupported macro: IFF_PORTSEL IFF_PORTSEL
   --  unsupported macro: IFF_AUTOMEDIA IFF_AUTOMEDIA
   --  unsupported macro: IFF_DYNAMIC IFF_DYNAMIC
   --  unsupported macro: ifa_broadaddr ifa_ifu.ifu_broadaddr
   --  unsupported macro: ifa_dstaddr ifa_ifu.ifu_dstaddr

   IFHWADDRLEN : constant := 6;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:128
   --  unsupported macro: IFNAMSIZ IF_NAMESIZE
   --  unsupported macro: ifr_name ifr_ifrn.ifrn_name
   --  unsupported macro: ifr_hwaddr ifr_ifru.ifru_hwaddr
   --  unsupported macro: ifr_addr ifr_ifru.ifru_addr
   --  unsupported macro: ifr_dstaddr ifr_ifru.ifru_dstaddr
   --  unsupported macro: ifr_broadaddr ifr_ifru.ifru_broadaddr
   --  unsupported macro: ifr_netmask ifr_ifru.ifru_netmask
   --  unsupported macro: ifr_flags ifr_ifru.ifru_flags
   --  unsupported macro: ifr_metric ifr_ifru.ifru_ivalue
   --  unsupported macro: ifr_mtu ifr_ifru.ifru_mtu
   --  unsupported macro: ifr_map ifr_ifru.ifru_map
   --  unsupported macro: ifr_slave ifr_ifru.ifru_slave
   --  unsupported macro: ifr_data ifr_ifru.ifru_data
   --  unsupported macro: ifr_ifindex ifr_ifru.ifru_ivalue
   --  unsupported macro: ifr_bandwidth ifr_ifru.ifru_ivalue
   --  unsupported macro: ifr_qlen ifr_ifru.ifru_ivalue
   --  unsupported macro: ifr_newname ifr_ifru.ifru_newname
   --  unsupported macro: ifc_buf ifc_ifcu.ifcu_buf
   --  unsupported macro: ifc_req ifc_ifcu.ifcu_req

  -- net/if.h -- declarations for inquiring about network interfaces
  --   Copyright (C) 1997-2018 Free Software Foundation, Inc.
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

  -- Length of interface name.   
  -- 1, 2, ...  
   type if_nameindex is record
      if_index : aliased unsigned;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:35
      if_name : Interfaces.C.Strings.chars_ptr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:36
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:33

  -- null terminated name: "eth0", ...  
  -- Standard interface flags.  
  -- Interface is up.   
  -- Broadcast address valid.   
  -- Turn on debugging.   
  -- Is a loopback net.   
  -- Interface is point-to-point link.   
  -- Avoid use of trailers.   
  -- Resources allocated.   
  -- No address resolution protocol.   
  -- Receive all packets.   
  -- Not supported  
  -- Receive all multicast packets.   
  -- Master of a load balancer.   
  -- Slave of a load balancer.   
  -- Supports multicast.   
  -- Can set media type.   
  -- Auto media select active.   
  -- Dialup device with changing addresses.   
  -- The ifaddr structure contains information about one address of an
  --   interface.  They are maintained by the different address families,
  --   are allocated and attached when an address is set, and are linked
  --   together so all addresses for an interface can be located.   

  -- Address of interface.   
  -- Back-pointer to interface.   
   type iface is null record;   -- incomplete struct

   type anon1334_union1335 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ifu_broadaddr : aliased arm_linux_gnueabihf_bits_socket_h.sockaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:93
         when others =>
            ifu_dstaddr : aliased arm_linux_gnueabihf_bits_socket_h.sockaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:94
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type ifaddr;
   type ifaddr is record
      ifa_addr : aliased arm_linux_gnueabihf_bits_socket_h.sockaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:90
      ifa_ifu : aliased anon1334_union1335;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:95
      ifa_ifp : access iface;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:96
      ifa_next : access ifaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:97
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:88

  -- Next address for interface.   
  -- Device mapping structure. I'd just gone off and designed a
  --   beautiful scheme using only loadable modules with arguments for
  --   driver options and along come the PCMCIA people 8)
  --   Ah well. The get() side of this is good for WDSETUP, and it'll be
  --   handy for debugging things. The set side is fine for now and being
  --   very small might be worth keeping for clean configuration.   

   type ifmap is record
      mem_start : aliased unsigned_long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:113
      mem_end : aliased unsigned_long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:114
      base_addr : aliased unsigned_short;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:115
      irq : aliased unsigned_char;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:116
      dma : aliased unsigned_char;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:117
      port : aliased unsigned_char;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:118
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:111

  -- 3 bytes spare  
  -- Interface request structure used for socket ioctl's.  All interface
  --   ioctl's must have parameter definitions which begin with ifr_name.
  --   The remainder may be interface specific.   

  -- Interface name, e.g. "en0".   
   subtype anon1340_array1343 is Interfaces.C.char_array (0 .. 15);
   type anon1340_union1341 (discr : unsigned := 0) is record
      case discr is
         when others =>
            ifrn_name : aliased anon1340_array1343;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:132
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type anon1340_union1344 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ifru_addr : aliased arm_linux_gnueabihf_bits_socket_h.sockaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:137
         when 1 =>
            ifru_dstaddr : aliased arm_linux_gnueabihf_bits_socket_h.sockaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:138
         when 2 =>
            ifru_broadaddr : aliased arm_linux_gnueabihf_bits_socket_h.sockaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:139
         when 3 =>
            ifru_netmask : aliased arm_linux_gnueabihf_bits_socket_h.sockaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:140
         when 4 =>
            ifru_hwaddr : aliased arm_linux_gnueabihf_bits_socket_h.sockaddr;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:141
         when 5 =>
            ifru_flags : aliased short;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:142
         when 6 =>
            ifru_ivalue : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:143
         when 7 =>
            ifru_mtu : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:144
         when 8 =>
            ifru_map : aliased ifmap;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:145
         when 9 =>
            ifru_slave : aliased anon1340_array1343;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:146
         when 10 =>
            ifru_newname : aliased anon1340_array1343;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:147
         when others =>
            ifru_data : arm_linux_gnueabihf_bits_types_h.uu_caddr_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:148
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type ifreq is record
      ifr_ifrn : aliased anon1340_union1341;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:133
      ifr_ifru : aliased anon1340_union1344;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:149
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:126

  -- Just fits the size  
  -- Structure used in SIOCGIFCONF request.  Used to retrieve interface
  --   configuration for machine (useful for programs which must know all
  --   networks accessible).   

  -- Size of buffer.   
   type anon1345_union1346 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ifcu_buf : arm_linux_gnueabihf_bits_types_h.uu_caddr_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:181
         when others =>
            ifcu_req : access ifreq;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:182
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type ifconf is record
      ifc_len : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:178
      ifc_ifcu : aliased anon1345_union1346;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:183
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:176

  -- Convert an interface name to an index, and vice versa.   
   function if_nametoindex (uu_ifname : Interfaces.C.Strings.chars_ptr) return unsigned  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:193
   with Import => True, 
        Convention => C, 
        External_Name => "if_nametoindex";

   function if_indextoname (arg1 : unsigned; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:194
   with Import => True, 
        Convention => C, 
        External_Name => "if_indextoname";

  -- Return a list of all interfaces and their indices.   
--   function if_Nameindex return access if_nameindex  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:197
--   with Import => True, 
--        Convention => C, 
--        External_Name => "if_nameindex";

  -- Free the data returned from if_nameindex.   
   procedure if_freenameindex (uu_ptr : access if_nameindex)  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/net/if.h:200
   with Import => True, 
        Convention => C, 
        External_Name => "if_freenameindex";

end net_if_h;
