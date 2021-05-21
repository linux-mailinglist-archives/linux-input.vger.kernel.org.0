Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA72D38C0D6
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 09:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhEUHlM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 03:41:12 -0400
Received: from butterbrot.org ([176.9.106.16]:60763 "EHLO butterbrot.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233567AbhEUHlM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 03:41:12 -0400
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 May 2021 03:41:11 EDT
Received: from [192.168.178.23] (d40afbdd.rev.stofanet.dk [212.10.251.221])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id 83E154AF2120;
        Fri, 21 May 2021 09:34:02 +0200 (CEST)
To:     linux-input <linux-input@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Raphael Wimmer <raphael.wimmer@ur.de>
From:   Florian Echtler <floe@butterbrot.org>
Subject: Regression in sur40 in v5.13
Message-ID: <50a6066a-2111-33ab-cc89-2dae7883c6ca@butterbrot.org>
Date:   Fri, 21 May 2021 09:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ihXEn7fRH4Q5zXaVsR9KN095LFZteaZeM"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ihXEn7fRH4Q5zXaVsR9KN095LFZteaZeM
Content-Type: multipart/mixed; boundary="6mXlifHjoPitE2EOIWHXWLVj41boLEhUq";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: linux-input <linux-input@vger.kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: Raphael Wimmer <raphael.wimmer@ur.de>
Message-ID: <50a6066a-2111-33ab-cc89-2dae7883c6ca@butterbrot.org>
Subject: Regression in sur40 in v5.13

--6mXlifHjoPitE2EOIWHXWLVj41boLEhUq
Content-Type: multipart/mixed;
 boundary="------------773AFE26C4CDF9DE135CCF75"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------773AFE26C4CDF9DE135CCF75
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello everyone,

we came across a regression in the V4L2 part of the sur40 driver. I've be=
en out=20
of the loop with V4L2 development for some time, so I'd appreciate any bi=
t of=20
input for debugging this.

When trying to read from the associated video device, the following stack=
trace=20
gets dumped by the kernel:

[55921.426292] CPU: 1 PID: 304262 Comm: guvcview Tainted: G            E =

5.13.0-rc2+ #1
[55921.426296] Hardware name: Samsung SUR40/SDNE-R78BA2-20, BIOS=20
SDNE-R78BA2-2000 02/23/2012
[55921.426297] RIP: 0010:dma_map_sg_attrs+0x37/0x50
[55921.426301] Code: 85 c0 48 0f 44 05 b9 e3 d9 01 83 f9 02 77 19 48 83 b=
f 40 02=20
00 00 00 74 11 48 85 c0 75 11 e8 50 18 00 00 85 c0 78 13 c3 0f 0b <0f> 0b=
 31 c0=20
c3 48 8b 40 50 e8 ab f6 ae 00 eb e9 0f 0b 0f 1f 80 00
[55921.426303] RSP: 0018:ffffad8a81a4bc38 EFLAGS: 00010246
[55921.426306] RAX: ffffffff8ee0a140 RBX: 0000000000002dc0 RCX: 000000000=
0000002
[55921.426307] RDX: 0000000000000007 RSI: ffff88fd05ce8100 RDI: ffff88fe0=
c026830
[55921.426309] RBP: 000000000000007f R08: 0000000000000020 R09: 000000000=
0000000
[55921.426310] R10: 0000000000000000 R11: ffffd73b80000000 R12: ffff88fe0=
4748880
[55921.426311] R13: 000000000007f000 R14: 0000000000000000 R15: 000000000=
0000000
[55921.426313] FS:  00007fc2fb796440(0000) GS:ffff88fe33d00000(0000)=20
knlGS:0000000000000000
[55921.426315] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[55921.426316] CR2: 00007fc2fa9d6000 CR3: 000000000cfee000 CR4: 000000000=
00006e0
[55921.426318] Call Trace:
[55921.426322]  vb2_dma_sg_alloc+0x1a2/0x2a0 [videobuf2_dma_sg]
[55921.426329]  __vb2_queue_alloc+0x177/0x3c0 [videobuf2_common]
[55921.426337]  vb2_core_reqbufs+0x237/0x3b0 [videobuf2_common]
[55921.426344]  vb2_ioctl_reqbufs+0x77/0xb0 [videobuf2_v4l2]
[55921.426351]  __video_do_ioctl+0x39e/0x3d0 [videodev]
[55921.426379]  video_usercopy+0x177/0x750 [videodev]
[55921.426393]  ? v4l_print_control+0x20/0x20 [videodev]
[55921.426408]  v4l2_ioctl+0x48/0x50 [videodev]
[55921.426422]  __x64_sys_ioctl+0x83/0xb0
[55921.426426]  do_syscall_64+0x40/0xb0
[55921.426429]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[55921.426432] RIP: 0033:0x7fc3050a29b9
[55921.426435] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 4=
8 89 f8=20
48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d=
 01 f0=20
ff ff 73 01 c3 48 8b 0d a7 54 0c 00 f7 d8 64 89 01 48
[55921.426437] RSP: 002b:00007ffcb50d6a28 EFLAGS: 00000246 ORIG_RAX:=20
0000000000000010
[55921.426439] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007fc30=
50a29b9
[55921.426440] RDX: 0000563371288e90 RSI: 00000000c0145608 RDI: 000000000=
0000004
[55921.426442] RBP: 00000000c0145608 R08: 0000000000000000 R09: 000000000=
0000000
[55921.426443] R10: 00007fc304fa5020 R11: 0000000000000246 R12: 000000000=
0000004
[55921.426444] R13: 0000000000000000 R14: 00007fc304fa5020 R15: 000056337=
1288e90
[55921.426447] ---[ end trace fd6bcb1bcbdb4e65 ]---

In addition, v4l2-compliance reports some failures regarding buffer ioctl=
s (see=20
attachment).

I can't pinpoint any recent commits to the driver itself that might have =
caused=20
this, so I assume it's related to a change in the framework itself.

Any suggestions very much appreciated!

Best, Florian
--=20
SENT FROM MY DEC VT50 TERMINAL

--------------773AFE26C4CDF9DE135CCF75
Content-Type: text/plain; charset=UTF-8;
 name="v4l2-compliance.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="v4l2-compliance.txt"

djRsMi1jb21wbGlhbmNlIFNIQTogbm90IGF2YWlsYWJsZQosIDY0IGJpdHMsIDY0LWJpdCB0
aW1lX3QKCkNvbXBsaWFuY2UgdGVzdCBmb3Igc3VyNDAgZGV2aWNlIC9kZXYvdmlkZW8wOgoK
RHJpdmVyIEluZm86CglEcml2ZXIgbmFtZSAgICAgIDogc3VyNDAKCUNhcmQgdHlwZSAgICAg
ICAgOiBTYW1zdW5nIFNVUjQwCglCdXMgaW5mbyAgICAgICAgIDogdXNiLTAwMDA6MDA6MTMu
Mi0xCglEcml2ZXIgdmVyc2lvbiAgIDogNS4xMy4wCglDYXBhYmlsaXRpZXMgICAgIDogMHg5
NTIwMDAwMQoJCVZpZGVvIENhcHR1cmUKCQlUb3VjaCBEZXZpY2UKCQlSZWFkL1dyaXRlCgkJ
U3RyZWFtaW5nCgkJRXh0ZW5kZWQgUGl4IEZvcm1hdAoJCURldmljZSBDYXBhYmlsaXRpZXMK
CURldmljZSBDYXBzICAgICAgOiAweDE1MjAwMDAxCgkJVmlkZW8gQ2FwdHVyZQoJCVRvdWNo
IERldmljZQoJCVJlYWQvV3JpdGUKCQlTdHJlYW1pbmcKCQlFeHRlbmRlZCBQaXggRm9ybWF0
CgpSZXF1aXJlZCBpb2N0bHM6Cgl0ZXN0IFZJRElPQ19RVUVSWUNBUDogT0sKCkFsbG93IGZv
ciBtdWx0aXBsZSBvcGVuczoKCXRlc3Qgc2Vjb25kIC9kZXYvdmlkZW8wIG9wZW46IE9LCgl0
ZXN0IFZJRElPQ19RVUVSWUNBUDogT0sKCXRlc3QgVklESU9DX0cvU19QUklPUklUWTogT0sK
CXRlc3QgZm9yIHVubGltaXRlZCBvcGVuczogT0sKCgl0ZXN0IGludmFsaWQgaW9jdGxzOiBP
SwpEZWJ1ZyBpb2N0bHM6Cgl0ZXN0IFZJRElPQ19EQkdfRy9TX1JFR0lTVEVSOiBPSyAoTm90
IFN1cHBvcnRlZCkKCXRlc3QgVklESU9DX0xPR19TVEFUVVM6IE9LIChOb3QgU3VwcG9ydGVk
KQoKSW5wdXQgaW9jdGxzOgoJdGVzdCBWSURJT0NfRy9TX1RVTkVSL0VOVU1fRlJFUV9CQU5E
UzogT0sgKE5vdCBTdXBwb3J0ZWQpCgl0ZXN0IFZJRElPQ19HL1NfRlJFUVVFTkNZOiBPSyAo
Tm90IFN1cHBvcnRlZCkKCXRlc3QgVklESU9DX1NfSFdfRlJFUV9TRUVLOiBPSyAoTm90IFN1
cHBvcnRlZCkKCXRlc3QgVklESU9DX0VOVU1BVURJTzogT0sgKE5vdCBTdXBwb3J0ZWQpCgl0
ZXN0IFZJRElPQ19HL1MvRU5VTUlOUFVUOiBPSwoJdGVzdCBWSURJT0NfRy9TX0FVRElPOiBP
SyAoTm90IFN1cHBvcnRlZCkKCUlucHV0czogMSBBdWRpbyBJbnB1dHM6IDAgVHVuZXJzOiAw
CgpPdXRwdXQgaW9jdGxzOgoJdGVzdCBWSURJT0NfRy9TX01PRFVMQVRPUjogT0sgKE5vdCBT
dXBwb3J0ZWQpCgl0ZXN0IFZJRElPQ19HL1NfRlJFUVVFTkNZOiBPSyAoTm90IFN1cHBvcnRl
ZCkKCXRlc3QgVklESU9DX0VOVU1BVURPVVQ6IE9LIChOb3QgU3VwcG9ydGVkKQoJdGVzdCBW
SURJT0NfRy9TL0VOVU1PVVRQVVQ6IE9LIChOb3QgU3VwcG9ydGVkKQoJdGVzdCBWSURJT0Nf
Ry9TX0FVRE9VVDogT0sgKE5vdCBTdXBwb3J0ZWQpCglPdXRwdXRzOiAwIEF1ZGlvIE91dHB1
dHM6IDAgTW9kdWxhdG9yczogMAoKSW5wdXQvT3V0cHV0IGNvbmZpZ3VyYXRpb24gaW9jdGxz
OgoJdGVzdCBWSURJT0NfRU5VTS9HL1MvUVVFUllfU1REOiBPSyAoTm90IFN1cHBvcnRlZCkK
CXRlc3QgVklESU9DX0VOVU0vRy9TL1FVRVJZX0RWX1RJTUlOR1M6IE9LIChOb3QgU3VwcG9y
dGVkKQoJdGVzdCBWSURJT0NfRFZfVElNSU5HU19DQVA6IE9LIChOb3QgU3VwcG9ydGVkKQoJ
dGVzdCBWSURJT0NfRy9TX0VESUQ6IE9LIChOb3QgU3VwcG9ydGVkKQoKQ29udHJvbCBpb2N0
bHMgKElucHV0IDApOgoJdGVzdCBWSURJT0NfUVVFUllfRVhUX0NUUkwvUVVFUllNRU5VOiBP
SwoJdGVzdCBWSURJT0NfUVVFUllDVFJMOiBPSwoJdGVzdCBWSURJT0NfRy9TX0NUUkw6IE9L
Cgl0ZXN0IFZJRElPQ19HL1MvVFJZX0VYVF9DVFJMUzogT0sKCQlmYWlsOiB2NGwyLXRlc3Qt
Y29udHJvbHMuY3BwKDgzNSk6IHN1YnNjcmliZSBldmVudCBmb3IgY29udHJvbCAnVXNlciBD
b250cm9scycgZmFpbGVkCgl0ZXN0IFZJRElPQ18oVU4pU1VCU0NSSUJFX0VWRU5UL0RRRVZF
TlQ6IEZBSUwKCXRlc3QgVklESU9DX0cvU19KUEVHQ09NUDogT0sgKE5vdCBTdXBwb3J0ZWQp
CglTdGFuZGFyZCBDb250cm9sczogNSBQcml2YXRlIENvbnRyb2xzOiAwCgpGb3JtYXQgaW9j
dGxzIChJbnB1dCAwKToKCXRlc3QgVklESU9DX0VOVU1fRk1UL0ZSQU1FU0laRVMvRlJBTUVJ
TlRFUlZBTFM6IE9LCgl0ZXN0IFZJRElPQ19HL1NfUEFSTTogT0sKCXRlc3QgVklESU9DX0df
RkJVRjogT0sgKE5vdCBTdXBwb3J0ZWQpCgl0ZXN0IFZJRElPQ19HX0ZNVDogT0sKCXRlc3Qg
VklESU9DX1RSWV9GTVQ6IE9LCgl0ZXN0IFZJRElPQ19TX0ZNVDogT0sKCXRlc3QgVklESU9D
X0dfU0xJQ0VEX1ZCSV9DQVA6IE9LIChOb3QgU3VwcG9ydGVkKQoJdGVzdCBDcm9wcGluZzog
T0sgKE5vdCBTdXBwb3J0ZWQpCgl0ZXN0IENvbXBvc2luZzogT0sgKE5vdCBTdXBwb3J0ZWQp
Cgl0ZXN0IFNjYWxpbmc6IE9LIChOb3QgU3VwcG9ydGVkKQoKQ29kZWMgaW9jdGxzIChJbnB1
dCAwKToKCXRlc3QgVklESU9DXyhUUllfKUVOQ09ERVJfQ01EOiBPSyAoTm90IFN1cHBvcnRl
ZCkKCXRlc3QgVklESU9DX0dfRU5DX0lOREVYOiBPSyAoTm90IFN1cHBvcnRlZCkKCXRlc3Qg
VklESU9DXyhUUllfKURFQ09ERVJfQ01EOiBPSyAoTm90IFN1cHBvcnRlZCkKCkJ1ZmZlciBp
b2N0bHMgKElucHV0IDApOgoJCWZhaWw6IHY0bDItdGVzdC1idWZmZXJzLmNwcCg2MTIpOiBx
LnJlcWJ1ZnMobm9kZSwgMSkKCXRlc3QgVklESU9DX1JFUUJVRlMvQ1JFQVRFX0JVRlMvUVVF
UllCVUY6IEZBSUwKCQlmYWlsOiB2NGwyLXRlc3QtYnVmZmVycy5jcHAoNzQ5KTogVklESU9D
X0VYUEJVRiBpcyBzdXBwb3J0ZWQsIGJ1dCB0aGUgVjRMMl9NRU1PUllfTU1BUCBzdXBwb3J0
IGlzIG1pc3Npbmcgb3IgbWFsZnVuY3Rpb25pbmcuCgkJZmFpbDogdjRsMi10ZXN0LWJ1ZmZl
cnMuY3BwKDc1MCk6IFZJRElPQ19FWFBCVUYgaXMgc3VwcG9ydGVkLCBidXQgdGhlIFY0TDJf
TUVNT1JZX01NQVAgc3VwcG9ydCBpcyBtaXNzaW5nLCBwcm9iYWJseSBkdWUgdG8gZWFybGll
ciBmYWlsaW5nIGZvcm1hdCB0ZXN0cy4KCXRlc3QgVklESU9DX0VYUEJVRjogT0sgKE5vdCBT
dXBwb3J0ZWQpCgl0ZXN0IFJlcXVlc3RzOiBPSyAoTm90IFN1cHBvcnRlZCkKClRvdGFsIGZv
ciBzdXI0MCBkZXZpY2UgL2Rldi92aWRlbzA6IDQ1LCBTdWNjZWVkZWQ6IDQzLCBGYWlsZWQ6
IDIsIFdhcm5pbmdzOiAwCg==
--------------773AFE26C4CDF9DE135CCF75--

--6mXlifHjoPitE2EOIWHXWLVj41boLEhUq--

--ihXEn7fRH4Q5zXaVsR9KN095LFZteaZeM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCYKdiaQUDAAAAAAAKCRDsLPKyEa9q2Ggp
AKDa1gheDwGZxX0Hit0564BDvWw6bQCglHEqHuaempiPnb9OFj5t6tpN8F4=
=MVrE
-----END PGP SIGNATURE-----

--ihXEn7fRH4Q5zXaVsR9KN095LFZteaZeM--
