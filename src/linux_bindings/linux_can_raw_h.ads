pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;

package linux_can_raw_h is

   --  unsupported macro: SOL_CAN_RAW (SOL_CAN_BASE + CAN_RAW)
  -- SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)  
  -- * linux/can/raw.h
  -- *
  -- * Definitions for raw CAN sockets
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

  -- for socket options affecting the socket (not the global system)  
  -- set 0 .. n can_filter(s)           
  -- set filter for error frames        
  -- local loopback (default:on)        
  -- receive my own msgs (default:off)  
  -- allow CAN FD frames (default:off)  
  -- all filters must match to trigger  
end linux_can_raw_h;
