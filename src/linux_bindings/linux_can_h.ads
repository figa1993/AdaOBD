pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with asm_generic_int_ll64_h;
with linux_socket_h;

package linux_can_h is

   CAN_EFF_FLAG : constant := 16#80000000#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:55
   CAN_RTR_FLAG : constant := 16#40000000#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:56
   CAN_ERR_FLAG : constant := 16#20000000#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:57

   CAN_SFF_MASK : constant := 16#000007FF#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:60
   CAN_EFF_MASK : constant := 16#1FFFFFFF#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:61
   CAN_ERR_MASK : constant := 16#1FFFFFFF#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:62

   CAN_SFF_ID_BITS : constant := 11;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:74
   CAN_EFF_ID_BITS : constant := 29;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:75

   CAN_MAX_DLC : constant := 8;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:86
   CAN_MAX_DLEN : constant := 8;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:87

   CANFD_MAX_DLC : constant := 15;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:90
   CANFD_MAX_DLEN : constant := 64;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:91

   CANFD_BRS : constant := 16#01#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:129
   CANFD_ESI : constant := 16#02#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:130
   --  unsupported macro: CAN_MTU (sizeof(struct can_frame))
   --  unsupported macro: CANFD_MTU (sizeof(struct canfd_frame))

   CAN_RAW : constant := 1;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:154
   CAN_BCM : constant := 2;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:155
   CAN_TP16 : constant := 3;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:156
   CAN_TP20 : constant := 4;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:157
   CAN_MCNET : constant := 5;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:158
   CAN_ISOTP : constant := 6;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:159
   CAN_NPROTO : constant := 7;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:160

   SOL_CAN_BASE : constant := 100;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:162

   CAN_INV_FILTER : constant := 16#20000000#;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:199
   CAN_RAW_FILTER_MAX : constant := 512;  --  /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:200

  -- SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)  
  -- * linux/can.h
  -- *
  -- * Definitions for CAN network layer (socket addr / CAN frame / CAN filter)
  -- *
  -- * Authors: Oliver Hartkopp <oliver.hartkopp@volkswagen.de>
  -- *          Urs Thuermann   <urs.thuermann@volkswagen.de>
  -- * Copyright (c) 2002-2007 Volkswagen Group Electronic Research
  -- * All rights reserved.
  -- *
  -- * Redistribution and use in source and binary forms, with or without
  -- * modification, are permitted provided that the following conditions
  -- * are met:
  -- * 1. Redistributions of source code must retain the above copyright
  -- *    notice, this list of conditions and the following disclaimer.
  -- * 2. Redistributions in binary form must reproduce the above copyright
  -- *    notice, this list of conditions and the following disclaimer in the
  -- *    documentation and/or other materials provided with the distribution.
  -- * 3. Neither the name of Volkswagen nor the names of its contributors
  -- *    may be used to endorse or promote products derived from this software
  -- *    without specific prior written permission.
  -- *
  -- * Alternatively, provided that this notice is retained in full, this
  -- * software may be distributed under the terms of the GNU General
  -- * Public License ("GPL") version 2, in which case the provisions of the
  -- * GPL apply INSTEAD OF those given above.
  -- *
  -- * The provided data structures and external interfaces from this code
  -- * are not restricted to be used by modules with a GPL compatible license.
  -- *
  -- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  -- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  -- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  -- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  -- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  -- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  -- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  -- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  -- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  -- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  -- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
  -- * DAMAGE.
  --  

  -- controller area network (CAN) kernel definitions  
  -- special address description flags for the CAN_ID  
  -- valid bits in CAN ID for frame formats  
  -- * Controller Area Network Identifier structure
  -- *
  -- * bit 0-28	: CAN identifier (11/29 bit)
  -- * bit 29	: error message frame flag (0 = data frame, 1 = error message)
  -- * bit 30	: remote transmission request flag (1 = rtr frame)
  -- * bit 31	: frame format flag (0 = standard 11 bit, 1 = extended 29 bit)
  --  

   subtype canid_t is asm_generic_int_ll64_h.uu_u32;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:72

  -- * Controller Area Network Error Message Frame Mask structure
  -- *
  -- * bit 0-28	: error class mask (see include/linux/can/error.h)
  -- * bit 29-31	: set to zero
  --  

   subtype can_err_mask_t is asm_generic_int_ll64_h.uu_u32;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:83

  -- CAN payload length and DLC definitions according to ISO 11898-1  
  -- CAN FD payload length and DLC definitions according to ISO 11898-7  
  --*
  -- * struct can_frame - basic CAN frame structure
  -- * @can_id:  CAN ID of the frame and CAN_*_FLAG flags, see canid_t definition
  -- * @can_dlc: frame payload length in byte (0 .. 8) aka data length code
  -- *           N.B. the DLC field from ISO 11898-1 Chapter 8.4.2.3 has a 1:1
  -- *           mapping of the 'data length code' to the real payload length
  -- * @__pad:   padding
  -- * @__res0:  reserved / padding
  -- * @__res1:  reserved / padding
  -- * @data:    CAN frame payload (up to 8 byte)
  --  

  -- 32 bit CAN_ID + EFF/RTR/ERR flags  
   type anon1144_array1146 is array (0 .. 7) of aliased asm_generic_int_ll64_h.uu_u8;
   type can_frame is record
      can_id : aliased canid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:105
      can_dlc : aliased asm_generic_int_ll64_h.uu_u8;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:106
      uu_pad : aliased asm_generic_int_ll64_h.uu_u8;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:107
      uu_res0 : aliased asm_generic_int_ll64_h.uu_u8;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:108
      uu_res1 : aliased asm_generic_int_ll64_h.uu_u8;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:109
      data : aliased anon1144_array1146;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:110
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:104

  -- frame payload length in byte (0 .. CAN_MAX_DLEN)  
  -- padding  
  -- reserved / padding  
  -- reserved / padding  
  -- * defined bits for canfd_frame.flags
  -- *
  -- * The use of struct canfd_frame implies the Extended Data Length (EDL) bit to
  -- * be set in the CAN frame bitstream on the wire. The EDL bit switch turns
  -- * the CAN controllers bitstream processor into the CAN FD mode which creates
  -- * two new options within the CAN FD frame specification:
  -- *
  -- * Bit Rate Switch - to indicate a second bitrate is/was used for the payload
  -- * Error State Indicator - represents the error state of the transmitting node
  -- *
  -- * As the CANFD_ESI bit is internally generated by the transmitting CAN
  -- * controller only the CANFD_BRS bit is relevant for real CAN controllers when
  -- * building a CAN FD frame for transmission. Setting the CANFD_ESI bit can make
  -- * sense for virtual CAN interfaces to test applications with echoed frames.
  --  

  --*
  -- * struct canfd_frame - CAN flexible data rate frame structure
  -- * @can_id: CAN ID of the frame and CAN_*_FLAG flags, see canid_t definition
  -- * @len:    frame payload length in byte (0 .. CANFD_MAX_DLEN)
  -- * @flags:  additional flags for CAN FD
  -- * @__res0: reserved / padding
  -- * @__res1: reserved / padding
  -- * @data:   CAN FD frame payload (up to CANFD_MAX_DLEN byte)
  --  

  -- 32 bit CAN_ID + EFF/RTR/ERR flags  
   type anon1148_array1150 is array (0 .. 63) of aliased asm_generic_int_ll64_h.uu_u8;
   type canfd_frame is record
      can_id : aliased canid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:142
      len : aliased asm_generic_int_ll64_h.uu_u8;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:143
      flags : aliased asm_generic_int_ll64_h.uu_u8;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:144
      uu_res0 : aliased asm_generic_int_ll64_h.uu_u8;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:145
      uu_res1 : aliased asm_generic_int_ll64_h.uu_u8;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:146
      data : aliased anon1148_array1150;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:147
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:141

  -- frame payload length in byte  
  -- additional flags for CAN FD  
  -- reserved / padding  
  -- reserved / padding  
  -- particular protocols of the protocol family PF_CAN  
  --*
  -- * struct sockaddr_can - the sockaddr structure for CAN sockets
  -- * @can_family:  address family number AF_CAN.
  -- * @can_ifindex: CAN network interface index.
  -- * @can_addr:    protocol specific address information
  --  

  -- transport protocol class address information (e.g. ISOTP)  
   type anon1152_struct1154 is record
      rx_id : aliased canid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:175
      tx_id : aliased canid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:175
   end record
   with Convention => C_Pass_By_Copy;
   type anon1152_union1153 (discr : unsigned := 0) is record
      case discr is
         when others =>
            tp : aliased anon1152_struct1154;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:175
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type sockaddr_can is record
      can_family : aliased linux_socket_h.uu_kernel_sa_family_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:171
      can_ifindex : aliased int;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:172
      can_addr : aliased anon1152_union1153;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:178
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:170

  -- reserved for future CAN protocols address information  
  --*
  -- * struct can_filter - CAN ID based filter in can_register().
  -- * @can_id:   relevant bits of CAN ID which are not masked out.
  -- * @can_mask: CAN mask (see description)
  -- *
  -- * Description:
  -- * A filter matches, when
  -- *
  -- *          <received_can_id> & mask == can_id & mask
  -- *
  -- * The filter can be inverted (CAN_INV_FILTER bit set in can_id) or it can
  -- * filter for error message frames (CAN_ERR_FLAG bit set in mask).
  --  

   type can_filter is record
      can_id : aliased canid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:195
      can_mask : aliased canid_t;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:196
   end record
   with Convention => C_Pass_By_Copy;  -- /home/gajowniczek/Documents/repositories/AdaOBD/sysroot/usr/include/linux/can.h:194

end linux_can_h;
