pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;
with arm_linux_gnueabihf_bits_sockaddr_h;
with System;
limited with arm_linux_gnueabihf_bits_types_struct_iovec_h;
with stddef_h;

package arm_linux_gnueabihf_bits_socket_h is

   PF_UNSPEC : constant := 0;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:41
   PF_LOCAL : constant := 1;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:42
   --  unsupported macro: PF_UNIX PF_LOCAL
   --  unsupported macro: PF_FILE PF_LOCAL

   PF_INET : constant := 2;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:45
   PF_AX25 : constant := 3;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:46
   PF_IPX : constant := 4;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:47
   PF_APPLETALK : constant := 5;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:48
   PF_NETROM : constant := 6;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:49
   PF_BRIDGE : constant := 7;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:50
   PF_ATMPVC : constant := 8;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:51
   PF_X25 : constant := 9;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:52
   PF_INET6 : constant := 10;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:53
   PF_ROSE : constant := 11;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:54
   PF_DECnet : constant := 12;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:55
   PF_NETBEUI : constant := 13;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:56
   PF_SECURITY : constant := 14;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:57
   PF_KEY : constant := 15;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:58
   PF_NETLINK : constant := 16;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:59
   --  unsupported macro: PF_ROUTE PF_NETLINK

   PF_PACKET : constant := 17;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:61
   PF_ASH : constant := 18;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:62
   PF_ECONET : constant := 19;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:63
   PF_ATMSVC : constant := 20;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:64
   PF_RDS : constant := 21;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:65
   PF_SNA : constant := 22;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:66
   PF_IRDA : constant := 23;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:67
   PF_PPPOX : constant := 24;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:68
   PF_WANPIPE : constant := 25;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:69
   PF_LLC : constant := 26;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:70
   PF_IB : constant := 27;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:71
   PF_MPLS : constant := 28;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:72
   PF_CAN : constant := 29;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:73
   PF_TIPC : constant := 30;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:74
   PF_BLUETOOTH : constant := 31;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:75
   PF_IUCV : constant := 32;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:76
   PF_RXRPC : constant := 33;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:77
   PF_ISDN : constant := 34;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:78
   PF_PHONET : constant := 35;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:79
   PF_IEEE802154 : constant := 36;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:80
   PF_CAIF : constant := 37;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:81
   PF_ALG : constant := 38;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:82
   PF_NFC : constant := 39;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:83
   PF_VSOCK : constant := 40;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:84
   PF_KCM : constant := 41;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:85
   PF_QIPCRTR : constant := 42;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:86
   PF_SMC : constant := 43;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:87
   PF_MAX : constant := 44;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:88
   --  unsupported macro: AF_UNSPEC PF_UNSPEC
   --  unsupported macro: AF_LOCAL PF_LOCAL
   --  unsupported macro: AF_UNIX PF_UNIX
   --  unsupported macro: AF_FILE PF_FILE
   --  unsupported macro: AF_INET PF_INET
   --  unsupported macro: AF_AX25 PF_AX25
   --  unsupported macro: AF_IPX PF_IPX
   --  unsupported macro: AF_APPLETALK PF_APPLETALK
   --  unsupported macro: AF_NETROM PF_NETROM
   --  unsupported macro: AF_BRIDGE PF_BRIDGE
   --  unsupported macro: AF_ATMPVC PF_ATMPVC
   --  unsupported macro: AF_X25 PF_X25
   --  unsupported macro: AF_INET6 PF_INET6
   --  unsupported macro: AF_ROSE PF_ROSE
   --  unsupported macro: AF_DECnet PF_DECnet
   --  unsupported macro: AF_NETBEUI PF_NETBEUI
   --  unsupported macro: AF_SECURITY PF_SECURITY
   --  unsupported macro: AF_KEY PF_KEY
   --  unsupported macro: AF_NETLINK PF_NETLINK
   --  unsupported macro: AF_ROUTE PF_ROUTE
   --  unsupported macro: AF_PACKET PF_PACKET
   --  unsupported macro: AF_ASH PF_ASH
   --  unsupported macro: AF_ECONET PF_ECONET
   --  unsupported macro: AF_ATMSVC PF_ATMSVC
   --  unsupported macro: AF_RDS PF_RDS
   --  unsupported macro: AF_SNA PF_SNA
   --  unsupported macro: AF_IRDA PF_IRDA
   --  unsupported macro: AF_PPPOX PF_PPPOX
   --  unsupported macro: AF_WANPIPE PF_WANPIPE
   --  unsupported macro: AF_LLC PF_LLC
   --  unsupported macro: AF_IB PF_IB
   --  unsupported macro: AF_MPLS PF_MPLS
   --  unsupported macro: AF_CAN PF_CAN
   --  unsupported macro: AF_TIPC PF_TIPC
   --  unsupported macro: AF_BLUETOOTH PF_BLUETOOTH
   --  unsupported macro: AF_IUCV PF_IUCV
   --  unsupported macro: AF_RXRPC PF_RXRPC
   --  unsupported macro: AF_ISDN PF_ISDN
   --  unsupported macro: AF_PHONET PF_PHONET
   --  unsupported macro: AF_IEEE802154 PF_IEEE802154
   --  unsupported macro: AF_CAIF PF_CAIF
   --  unsupported macro: AF_ALG PF_ALG
   --  unsupported macro: AF_NFC PF_NFC
   --  unsupported macro: AF_VSOCK PF_VSOCK
   --  unsupported macro: AF_KCM PF_KCM
   --  unsupported macro: AF_QIPCRTR PF_QIPCRTR
   --  unsupported macro: AF_SMC PF_SMC
   --  unsupported macro: AF_MAX PF_MAX

   SOL_RAW : constant := 255;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:144
   SOL_DECNET : constant := 261;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:145
   SOL_X25 : constant := 262;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:146
   SOL_PACKET : constant := 263;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:147
   SOL_ATM : constant := 264;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:148
   SOL_AAL : constant := 265;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:149
   SOL_IRDA : constant := 266;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:150
   SOL_NETBEUI : constant := 267;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:151
   SOL_LLC : constant := 268;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:152
   SOL_DCCP : constant := 269;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:153
   SOL_NETLINK : constant := 270;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:154
   SOL_TIPC : constant := 271;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:155
   SOL_RXRPC : constant := 272;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:156
   SOL_PPPOL2TP : constant := 273;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:157
   SOL_BLUETOOTH : constant := 274;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:158
   SOL_PNPIPE : constant := 275;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:159
   SOL_RDS : constant := 276;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:160
   SOL_IUCV : constant := 277;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:161
   SOL_CAIF : constant := 278;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:162
   SOL_ALG : constant := 279;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:163
   SOL_NFC : constant := 280;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:164
   SOL_KCM : constant := 281;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:165
   SOL_TLS : constant := 282;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:166

   SOMAXCONN : constant := 128;  --  /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:169
   --  unsupported macro: MSG_OOB MSG_OOB
   --  unsupported macro: MSG_PEEK MSG_PEEK
   --  unsupported macro: MSG_DONTROUTE MSG_DONTROUTE
   --  unsupported macro: MSG_CTRUNC MSG_CTRUNC
   --  unsupported macro: MSG_PROXY MSG_PROXY
   --  unsupported macro: MSG_TRUNC MSG_TRUNC
   --  unsupported macro: MSG_DONTWAIT MSG_DONTWAIT
   --  unsupported macro: MSG_EOR MSG_EOR
   --  unsupported macro: MSG_WAITALL MSG_WAITALL
   --  unsupported macro: MSG_FIN MSG_FIN
   --  unsupported macro: MSG_SYN MSG_SYN
   --  unsupported macro: MSG_CONFIRM MSG_CONFIRM
   --  unsupported macro: MSG_RST MSG_RST
   --  unsupported macro: MSG_ERRQUEUE MSG_ERRQUEUE
   --  unsupported macro: MSG_NOSIGNAL MSG_NOSIGNAL
   --  unsupported macro: MSG_MORE MSG_MORE
   --  unsupported macro: MSG_WAITFORONE MSG_WAITFORONE
   --  unsupported macro: MSG_BATCH MSG_BATCH
   --  unsupported macro: MSG_ZEROCOPY MSG_ZEROCOPY
   --  unsupported macro: MSG_FASTOPEN MSG_FASTOPEN
   --  unsupported macro: MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
   --  arg-macro: function CMSG_DATA (cmsg)
   --    return (cmsg).__cmsg_data;
   --  arg-macro: procedure CMSG_NXTHDR (mhdr, cmsg)
   --    __cmsg_nxthdr (mhdr, cmsg)
   --  arg-macro: function CMSG_FIRSTHDR (mhdr)
   --    return (size_t) (mhdr).msg_controllen >= sizeof (struct cmsghdr) ? (struct cmsghdr *) (mhdr).msg_control : (struct cmsghdr *) 0;
   --  arg-macro: function CMSG_ALIGN (len)
   --    return ((len) + sizeof (size_t) - 1) and (size_t) ~(sizeof (size_t) - 1);
   --  arg-macro: function CMSG_SPACE (len)
   --    return CMSG_ALIGN (len) + CMSG_ALIGN (sizeof (struct cmsghdr));
   --  arg-macro: function CMSG_LEN (len)
   --    return CMSG_ALIGN (sizeof (struct cmsghdr)) + (len);
   --  unsupported macro: SCM_RIGHTS SCM_RIGHTS

  -- System-specific socket constants and types.  Linux version.
  --   Copyright (C) 1991-2018 Free Software Foundation, Inc.
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

  -- Type for length arguments in socket calls.   
   subtype socklen_t is arm_linux_gnueabihf_bits_types_h.uu_socklen_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:33

  -- Get the architecture-dependent definition of enum __socket_type.   
  -- Protocol families.   
  -- Address families.   
  -- Socket level values.  Others are defined in the appropriate headers.
  --   XXX These definitions also should go into the appropriate headers as
  --   far as they are available.   

  -- Maximum queue length specifiable by listen.   
  -- Get the definition of the macro to define the common sockaddr members.   
  -- Structure describing a generic socket address.   
  -- Common data: address family and length.   
   subtype anon1280_array1282 is Interfaces.C.char_array (0 .. 13);
   type sockaddr is record
      sa_family : aliased arm_linux_gnueabihf_bits_sockaddr_h.sa_family_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:177
      sa_data : aliased anon1280_array1282;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:178
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:175

  -- Address data.   
  -- Structure large enough to hold any socket address (with the historical
  --   exception of AF_UNIX).   

  -- Address family, etc.   
   subtype anon1283_array1285 is Interfaces.C.char_array (0 .. 121);
   type sockaddr_storage is record
      ss_family : aliased arm_linux_gnueabihf_bits_sockaddr_h.sa_family_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:190
      uu_ss_padding : aliased anon1283_array1285;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:191
      uu_ss_align : aliased unsigned_long;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:192
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:188

  -- Force desired alignment.   
  -- Bits in the FLAGS argument to `send', `recv', et al.   
  -- Process out-of-band data.   
  -- Peek at incoming messages.   
  -- Don't use local routing.   
  -- DECnet uses a different name.   
  -- Control data lost before delivery.   
  -- Supply or ask second address.   
  -- Nonblocking IO.   
  -- End of record.   
  -- Wait for a full request.   
  -- Confirm path validity.   
  -- Fetch message from error queue.   
  -- Do not generate SIGPIPE.   
  -- Sender will send more.   
  -- Wait for at least one packet to return. 
  -- sendmmsg: more messages coming.   
  -- Use user data in kernel path.   
  -- Send data in TCP SYN.   
  -- Set close_on_exit for file
  --					   descriptor received through
  --					   SCM_RIGHTS.   

  -- Structure describing messages sent by
  --   `sendmsg' and received by `recvmsg'.   

  -- Address to send to/receive from.   
   type msghdr is record
      msg_name : System.Address;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:256
      msg_namelen : aliased socklen_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:257
      msg_iov : access arm_linux_gnueabihf_bits_types_struct_iovec_h.iovec;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:259
      msg_iovlen : aliased stddef_h.size_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:260
      msg_control : System.Address;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:262
      msg_controllen : aliased stddef_h.size_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:263
      msg_flags : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:268
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:254

  -- Length of address data.   
  -- Vector of data to send/receive into.   
  -- Number of elements in the vector.   
  -- Ancillary data (eg BSD filedesc passing).  
  -- Ancillary data buffer length.
  --				   !! The type should be socklen_t but the
  --				   definition of the kernel is incompatible
  --				   with this.   

  -- Flags on received message.   
  -- Structure used for storage of ancillary data object information.   
  -- Length of data in cmsg_data plus length
  --				   of cmsghdr structure.
  --				   !! The type should be socklen_t but the
  --				   definition of the kernel is incompatible
  --				   with this.   

   type anon1289_array1291 is array (0 .. 0) of aliased unsigned_char;
   type cmsghdr is record
      cmsg_len : aliased stddef_h.size_t;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:274
      cmsg_level : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:279
      cmsg_type : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:280
      uu_cmsg_data : aliased anon1289_array1291;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:282
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:272

  -- Originating protocol.   
  -- Protocol specific type.   
  -- Ancillary data.   
  -- Ancillary data object manipulation macros.   
   --  skipped func __cmsg_nxthdr

  -- The kernel header does this so there may be a reason.   
  -- No more entries.   
  -- Socket level message types.  This must match the definitions in
  --   <linux/socket.h>.   

  -- Transfer file descriptors.   
  -- Credentials passing.   
  -- User visible structure for SCM_CREDENTIALS message  
  -- PID of sending process.   
  -- UID of sending process.   
  -- GID of sending process.   
  -- Ugly workaround for unclean kernel headers.   
  -- Get socket manipulation related informations from kernel headers.   
  -- Structure used to manipulate the SO_LINGER option.   
  -- Nonzero to linger on close.   
   type linger is record
      l_onoff : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:446
      l_linger : aliased int;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:447
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/OBD-II-CAN-telemetry/sysroot/usr/include/arm-linux-gnueabihf/bits/socket.h:444

  -- Time to linger.   
end arm_linux_gnueabihf_bits_socket_h;
