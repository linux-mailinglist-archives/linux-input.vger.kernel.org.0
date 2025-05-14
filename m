Return-Path: <linux-input+bounces-12373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B71AB77B1
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 23:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C5E3B5923
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 21:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9351FC7CB;
	Wed, 14 May 2025 21:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buUb2huA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B406746E
	for <linux-input@vger.kernel.org>; Wed, 14 May 2025 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257105; cv=none; b=kvEDFAqorvlwliU/2F9i0YQ5DHEg9sXAwnvMT0C18Azf6+ks2z7jnv9FR6ZJD9H1GLBkAD2vQ/jcWP43phudShFFPkPBo8bwUZTAeReq+fql7HG4qUWhXsBzPuRI1l1veoPrRDZPuG32AuTndDXEB+K0+BAd+NflPTyBGaxCbQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257105; c=relaxed/simple;
	bh=9dbM5GJYPO0YE/JLkBaQYgQ4FepH3xget2BB/mJ+Bis=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OUAOnbl8eQabhN/O/P+vU3OzwqkpV+429NMShypoN9I91j1LpsP5zx4go832BPJ3UbB8HJvaxKXLSlYWD2ubrWozAR+LaE7CEU4gaDYp/anSXzVmTGaQePOjh5UssrU+WPtP0IsVyzi9BRo/xpZ9xk4S1kIdEPy4e1bGvxseEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buUb2huA; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fca00812dbso53204a12.1
        for <linux-input@vger.kernel.org>; Wed, 14 May 2025 14:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747257100; x=1747861900; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4JkT2Rooi9BJ02uoyJVjI0HAnxjONXViTGjGuTovlEk=;
        b=buUb2huAcrvsgbdBA+IXQT/F7PwSDsaZzD1oKMPhPeXXIcyxX2LIoL5RUPxrLTgHMS
         3M/8icVSUeSKNW1MApqNwVk6LwQYrVSGWVQ/vmiCt1orQtBPpTdMH0ZOZyqo+Jf9jvwm
         Oa3PqLkp4QuaOvhEIu45UYP+Wabo0FWcfQ/Isa14YbdFVOxpqZ2pBSgrOSCcIjRUSV/p
         YUiu6/mESdE3zxnvjCb+44Nga+SsVTkaKbf+iG+FDdZadFSU5EQgkyqWOiImsQuRgSgv
         mAZk86XReYwPR/+p6DkV+QvGMakpVU3uL2WbIp/B/i6iII55WEqDXzcaYY68Hzp3MLTh
         6sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257100; x=1747861900;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JkT2Rooi9BJ02uoyJVjI0HAnxjONXViTGjGuTovlEk=;
        b=qTzmoRLqUBkV1j+heC95HxZQYVglzFiXeah3Q8YFHjKuZQyuMETf1az61kikvWb/wl
         6C8unDAVsjP8k/iI3N0uJyGurwJMpDah+6T7IzN+d5W5V9GhfpQXWTRznLiwMpovPLNO
         a9yzaQqXF8MwZQDW94KehbJqatFrJDGSBr1n26eH2g/DMoYPEWhTYkCuDjdqeBFhSKhI
         mPzIObAcSk2ueWkp+F4bXAC6Zi8k8N7GqNe6WqybWsIJqoBiyh5LKwgTfsfpAyoSTQHQ
         lZXNTP8F3yWju/imt7wgfmVBGvz8BZqmhH2mrkoAVzD9rZnbtfJQZFY8yg7HitXVZyMJ
         ECRw==
X-Gm-Message-State: AOJu0YzUaZg5dvuwVGa8Ks7ahxHxsehpieeeehhf3G7G3msMmPgSTuJE
	HNWemoKQ5Q19o40Nvoae4UqpRPICSaF2Wcl36mLJHPhMJEJyE7aLGCzWkUi2TOAejcWuTzjYb0B
	WDO0m/kBQ732/t/FLj65OJIVitAy2OLnkvUXh5A==
X-Gm-Gg: ASbGncuGmQZC9USJxXDKZIKTSNfgNZ5E0FVh5d4USDzTY0iDr02xOipezMyB6PEre5j
	jlHINJKv+FO4hJLQuBYV/uCkW1SfpFJvO15wgtVS6J4qCAWuVqcUa9/tpuVr1hyCqqx8oIHcNzJ
	hnjPeKLL3cD7aKPtHkujzWwR6R4b6/vm72
X-Google-Smtp-Source: AGHT+IElFWK69XXA5qeKLzAw9jfpTC6VaIXVFJ02sSub+bAgdQkjysFfWC8sjyFv+oOC2MNKrFIALWP9MlgvlNNkv5Q=
X-Received: by 2002:a05:6402:3494:b0:5f4:35c7:ff65 with SMTP id
 4fb4d7f45d1cf-5ff988a73d4mr1800649a12.4.1747257100024; Wed, 14 May 2025
 14:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Keenplify <keenplify@gmail.com>
Date: Thu, 15 May 2025 05:10:56 +0800
X-Gm-Features: AX0GCFuYPgQT3zSos8CfsNioiC70QbfeAJT5nx0m8Z1z6iqTzuoCVXsnHz-9Bns
Message-ID: <CANTHs-61C+S01crRDHYvS8Sa-mxtG1TeAszc+_PjN9aV4s6-GA@mail.gmail.com>
Subject: =?UTF-8?Q?Rakk_Dasig_X_mouse_=28248a=3A8266=29_=E2=80=93_side_buttons_not_?=
	=?UTF-8?Q?exposed_via_evdev?=
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org
Content-Type: multipart/mixed; boundary="000000000000c777ca06351efef8"

--000000000000c777ca06351efef8
Content-Type: multipart/alternative; boundary="000000000000c777c606351efef6"

--000000000000c777c606351efef6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm reporting an issue with the Rakk Dasig X mouse (VID:PID 248a:8266),
where the side buttons (forward/back) are not generating any evdev input
events under Linux (tested on Fedora 42, kernel 6.14.5).

The buttons appear to be sending HID events, which I confirmed using
`hid-recorder` from `hid-tools`, but they do not show up in `evtest` or
produce mappable input events.

I have attached the output of my HID recorder. The output shows that the
mouse is sending usage values 0x08 and 0x10 in the second byte of the
report, but the kernel does not seem to map them into usable buttons
(BTN_EXTRA / BTN_SIDE, etc.).

Relevant device info:

- Mouse: Rakk Dasig X
- Vendor/Product ID: 248a:8266 (Bluetooth), 248a:fa02 (USB wireless)
- Driver: hid-generic
- Kernel: 6.14.5-300.fc42.x86_64 (Fedora 42)
- dmesg (Bluetooth):
    hid-generic 0005:248A:8266.000B: input,hidraw0: BLUETOOTH HID v0.01
Mouse [RAKK Dasig X] on 14:ac:60:c9:09:54

I=E2=80=99ve filed an upstream bug here with more details:
https://bugzilla.kernel.org/show_bug.cgi?id=3D220126

Happy to provide a `lsusb -v`, full `hid-recorder` output, or test patches
if needed. Is a HID quirk appropriate in this case?

Thanks a lot,
keenplify

--000000000000c777c606351efef6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,<br><br>I&#39;m reporting an issue with the Ra=
kk Dasig X mouse (VID:PID 248a:8266), where the side buttons (forward/back)=
 are not generating any evdev input events under Linux (tested on Fedora 42=
, kernel 6.14.5).<br><br>The buttons appear to be sending HID events, which=
 I confirmed using `hid-recorder` from `hid-tools`, but they do not show up=
 in `evtest` or produce mappable input events.</div><div><br></div><div>I h=
ave attached the output of my HID recorder. The output shows that the mouse=
 is sending usage values 0x08 and 0x10 in the second byte of the report, bu=
t the kernel does not seem to map them into usable buttons (BTN_EXTRA / BTN=
_SIDE, etc.).<br><br>Relevant device info:<br><br>- Mouse: Rakk Dasig X<br>=
- Vendor/Product ID: 248a:8266 (Bluetooth), 248a:fa02 (USB wireless)<br>- D=
river: hid-generic<br>- Kernel: 6.14.5-300.fc42.x86_64 (Fedora 42)<br>- dme=
sg (Bluetooth):<br>=C2=A0 =C2=A0 hid-generic 0005:248A:8266.000B: input,hid=
raw0: BLUETOOTH HID v0.01 Mouse [RAKK Dasig X] on 14:ac:60:c9:09:54<br><br>=
I=E2=80=99ve filed an upstream bug here with more details:<br><a href=3D"ht=
tps://bugzilla.kernel.org/show_bug.cgi?id=3D220126">https://bugzilla.kernel=
.org/show_bug.cgi?id=3D220126</a><br><br>Happy to provide a `lsusb -v`, ful=
l `hid-recorder` output, or test patches if needed. Is a HID quirk appropri=
ate in this case?<br><br>Thanks a lot, =C2=A0<br></div>keenplify<div><br></=
div></div>

--000000000000c777c606351efef6--
--000000000000c777ca06351efef8
Content-Type: text/plain; charset="UTF-8"; name="hid-recorder.txt"
Content-Disposition: attachment; filename="hid-recorder.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_maofpuut0>
X-Attachment-Id: f_maofpuut0

4p6cICBoaWQtdG9vbHMgZ2l0OihtYXN0ZXIpIHN1ZG8gLi9oaWQtcmVjb3JkZXIKQXZhaWxhYmxl
IGRldmljZXM6Ci9kZXYvaGlkcmF3MToJVGVsaW5rIFdpcmVsZXNzIFJlY2VpdmVyCi9kZXYvaGlk
cmF3MjoJRUxBTjAzMDA6MDAgMDRGMzozMjA2Ci9kZXYvaGlkcmF3MzoJVGVsaW5rIFdpcmVsZXNz
IFJlY2VpdmVyClNlbGVjdCB0aGUgZGV2aWNlIGV2ZW50IG51bWJlciBbMS0zXTogMQojIFRlbGlu
ayBXaXJlbGVzcyBSZWNlaXZlcgojIDB4MDUsIDB4MDEsICAgICAgICAgICAgICAgICAgICAvLyBV
c2FnZSBQYWdlIChHZW5lcmljIERlc2t0b3ApICAgICAgICAwCiMgMHgwOSwgMHgwMiwgICAgICAg
ICAgICAgICAgICAgIC8vIFVzYWdlIChNb3VzZSkgICAgICAgICAgICAgICAgICAgICAgIDIKIyAw
eGExLCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gQ29sbGVjdGlvbiAoQXBwbGljYXRpb24p
ICAgICAgICAgICAgNAojIDB4ODUsIDB4MDEsICAgICAgICAgICAgICAgICAgICAvLyAgUmVwb3J0
IElEICgxKSAgICAgICAgICAgICAgICAgICAgICA2CiMgMHgwOSwgMHgwMSwgICAgICAgICAgICAg
ICAgICAgIC8vICBVc2FnZSAoUG9pbnRlcikgICAgICAgICAgICAgICAgICAgIDgKIyAweGExLCAw
eDAwLCAgICAgICAgICAgICAgICAgICAgLy8gIENvbGxlY3Rpb24gKFBoeXNpY2FsKSAgICAgICAg
ICAgICAgMTAKIyAweDA1LCAweDA5LCAgICAgICAgICAgICAgICAgICAgLy8gICBVc2FnZSBQYWdl
IChCdXR0b24pICAgICAgICAgICAgICAgMTIKIyAweDE5LCAweDAxLCAgICAgICAgICAgICAgICAg
ICAgLy8gICBVc2FnZSBNaW5pbXVtICgxKSAgICAgICAgICAgICAgICAgMTQKIyAweDI5LCAweDAz
LCAgICAgICAgICAgICAgICAgICAgLy8gICBVc2FnZSBNYXhpbXVtICgzKSAgICAgICAgICAgICAg
ICAgMTYKIyAweDE1LCAweDAwLCAgICAgICAgICAgICAgICAgICAgLy8gICBMb2dpY2FsIE1pbmlt
dW0gKDApICAgICAgICAgICAgICAgMTgKIyAweDI1LCAweDAxLCAgICAgICAgICAgICAgICAgICAg
Ly8gICBMb2dpY2FsIE1heGltdW0gKDEpICAgICAgICAgICAgICAgMjAKIyAweDc1LCAweDAxLCAg
ICAgICAgICAgICAgICAgICAgLy8gICBSZXBvcnQgU2l6ZSAoMSkgICAgICAgICAgICAgICAgICAg
MjIKIyAweDk1LCAweDA1LCAgICAgICAgICAgICAgICAgICAgLy8gICBSZXBvcnQgQ291bnQgKDUp
ICAgICAgICAgICAgICAgICAgMjQKIyAweDgxLCAweDAyLCAgICAgICAgICAgICAgICAgICAgLy8g
ICBJbnB1dCAoRGF0YSxWYXIsQWJzKSAgICAgICAgICAgICAgMjYKIyAweDc1LCAweDAzLCAgICAg
ICAgICAgICAgICAgICAgLy8gICBSZXBvcnQgU2l6ZSAoMykgICAgICAgICAgICAgICAgICAgMjgK
IyAweDk1LCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gICBSZXBvcnQgQ291bnQgKDEpICAg
ICAgICAgICAgICAgICAgMzAKIyAweDgxLCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gICBJ
bnB1dCAoQ25zdCxBcnIsQWJzKSAgICAgICAgICAgICAgMzIKIyAweDA1LCAweDAxLCAgICAgICAg
ICAgICAgICAgICAgLy8gICBVc2FnZSBQYWdlIChHZW5lcmljIERlc2t0b3ApICAgICAgMzQKIyAw
eDA5LCAweDMwLCAgICAgICAgICAgICAgICAgICAgLy8gICBVc2FnZSAoWCkgICAgICAgICAgICAg
ICAgICAgICAgICAgMzYKIyAweDA5LCAweDMxLCAgICAgICAgICAgICAgICAgICAgLy8gICBVc2Fn
ZSAoWSkgICAgICAgICAgICAgICAgICAgICAgICAgMzgKIyAweDE2LCAweDAxLCAweDgwLCAgICAg
ICAgICAgICAgLy8gICBMb2dpY2FsIE1pbmltdW0gKC0zMjc2NykgICAgICAgICAgNDAKIyAweDI2
LCAweGZmLCAweDdmLCAgICAgICAgICAgICAgLy8gICBMb2dpY2FsIE1heGltdW0gKDMyNzY3KSAg
ICAgICAgICAgNDMKIyAweDc1LCAweDEwLCAgICAgICAgICAgICAgICAgICAgLy8gICBSZXBvcnQg
U2l6ZSAoMTYpICAgICAgICAgICAgICAgICAgNDYKIyAweDk1LCAweDAyLCAgICAgICAgICAgICAg
ICAgICAgLy8gICBSZXBvcnQgQ291bnQgKDIpICAgICAgICAgICAgICAgICAgNDgKIyAweDgxLCAw
eDA2LCAgICAgICAgICAgICAgICAgICAgLy8gICBJbnB1dCAoRGF0YSxWYXIsUmVsKSAgICAgICAg
ICAgICAgNTAKIyAweDA5LCAweDM4LCAgICAgICAgICAgICAgICAgICAgLy8gICBVc2FnZSAoV2hl
ZWwpICAgICAgICAgICAgICAgICAgICAgNTIKIyAweDE1LCAweDgxLCAgICAgICAgICAgICAgICAg
ICAgLy8gICBMb2dpY2FsIE1pbmltdW0gKC0xMjcpICAgICAgICAgICAgNTQKIyAweDI1LCAweDdm
LCAgICAgICAgICAgICAgICAgICAgLy8gICBMb2dpY2FsIE1heGltdW0gKDEyNykgICAgICAgICAg
ICAgNTYKIyAweDc1LCAweDA4LCAgICAgICAgICAgICAgICAgICAgLy8gICBSZXBvcnQgU2l6ZSAo
OCkgICAgICAgICAgICAgICAgICAgNTgKIyAweDk1LCAweDAxLCAgICAgICAgICAgICAgICAgICAg
Ly8gICBSZXBvcnQgQ291bnQgKDEpICAgICAgICAgICAgICAgICAgNjAKIyAweDgxLCAweDA2LCAg
ICAgICAgICAgICAgICAgICAgLy8gICBJbnB1dCAoRGF0YSxWYXIsUmVsKSAgICAgICAgICAgICAg
NjIKIyAweGMwLCAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gIEVuZCBDb2xsZWN0aW9uICAg
ICAgICAgICAgICAgICAgICAgNjQKIyAweGMwLCAgICAgICAgICAgICAgICAgICAgICAgICAgLy8g
RW5kIENvbGxlY3Rpb24gICAgICAgICAgICAgICAgICAgICAgNjUKIyAweDA1LCAweDBjLCAgICAg
ICAgICAgICAgICAgICAgLy8gVXNhZ2UgUGFnZSAoQ29uc3VtZXIgRGV2aWNlcykgICAgICAgNjYK
IyAweDA5LCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gVXNhZ2UgKENvbnN1bWVyIENvbnRy
b2wpICAgICAgICAgICAgNjgKIyAweGExLCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gQ29s
bGVjdGlvbiAoQXBwbGljYXRpb24pICAgICAgICAgICAgNzAKIyAweDg1LCAweDAyLCAgICAgICAg
ICAgICAgICAgICAgLy8gIFJlcG9ydCBJRCAoMikgICAgICAgICAgICAgICAgICAgICAgNzIKIyAw
eDc1LCAweDEwLCAgICAgICAgICAgICAgICAgICAgLy8gIFJlcG9ydCBTaXplICgxNikgICAgICAg
ICAgICAgICAgICAgNzQKIyAweDk1LCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gIFJlcG9y
dCBDb3VudCAoMSkgICAgICAgICAgICAgICAgICAgNzYKIyAweDE1LCAweDAxLCAgICAgICAgICAg
ICAgICAgICAgLy8gIExvZ2ljYWwgTWluaW11bSAoMSkgICAgICAgICAgICAgICAgNzgKIyAweDI2
LCAweDhjLCAweDAyLCAgICAgICAgICAgICAgLy8gIExvZ2ljYWwgTWF4aW11bSAoNjUyKSAgICAg
ICAgICAgICAgODAKIyAweDE5LCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gIFVzYWdlIE1p
bmltdW0gKDEpICAgICAgICAgICAgICAgICAgODMKIyAweDJhLCAweDhjLCAweDAyLCAgICAgICAg
ICAgICAgLy8gIFVzYWdlIE1heGltdW0gKDY1MikgICAgICAgICAgICAgICAgODUKIyAweDgxLCAw
eDAwLCAgICAgICAgICAgICAgICAgICAgLy8gIElucHV0IChEYXRhLEFycixBYnMpICAgICAgICAg
ICAgICAgODgKIyAweGMwLCAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gRW5kIENvbGxlY3Rp
b24gICAgICAgICAgICAgICAgICAgICAgOTAKIyAweDA1LCAweDAxLCAgICAgICAgICAgICAgICAg
ICAgLy8gVXNhZ2UgUGFnZSAoR2VuZXJpYyBEZXNrdG9wKSAgICAgICAgOTEKIyAweDA5LCAweDgw
LCAgICAgICAgICAgICAgICAgICAgLy8gVXNhZ2UgKFN5c3RlbSBDb250cm9sKSAgICAgICAgICAg
ICAgOTMKIyAweGExLCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gQ29sbGVjdGlvbiAoQXBw
bGljYXRpb24pICAgICAgICAgICAgOTUKIyAweDg1LCAweDAzLCAgICAgICAgICAgICAgICAgICAg
Ly8gIFJlcG9ydCBJRCAoMykgICAgICAgICAgICAgICAgICAgICAgOTcKIyAweDA5LCAweDgyLCAg
ICAgICAgICAgICAgICAgICAgLy8gIFVzYWdlIChTeXN0ZW0gU2xlZXApICAgICAgICAgICAgICAg
OTkKIyAweDA5LCAweDgxLCAgICAgICAgICAgICAgICAgICAgLy8gIFVzYWdlIChTeXN0ZW0gUG93
ZXIgRG93bikgICAgICAgICAgMTAxCiMgMHgwOSwgMHg4MywgICAgICAgICAgICAgICAgICAgIC8v
ICBVc2FnZSAoU3lzdGVtIFdha2UgVXApICAgICAgICAgICAgIDEwMwojIDB4MTUsIDB4MDAsICAg
ICAgICAgICAgICAgICAgICAvLyAgTG9naWNhbCBNaW5pbXVtICgwKSAgICAgICAgICAgICAgICAx
MDUKIyAweDI1LCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gIExvZ2ljYWwgTWF4aW11bSAo
MSkgICAgICAgICAgICAgICAgMTA3CiMgMHgxOSwgMHgwMSwgICAgICAgICAgICAgICAgICAgIC8v
ICBVc2FnZSBNaW5pbXVtICgxKSAgICAgICAgICAgICAgICAgIDEwOQojIDB4MjksIDB4MDMsICAg
ICAgICAgICAgICAgICAgICAvLyAgVXNhZ2UgTWF4aW11bSAoMykgICAgICAgICAgICAgICAgICAx
MTEKIyAweDc1LCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gIFJlcG9ydCBTaXplICgxKSAg
ICAgICAgICAgICAgICAgICAgMTEzCiMgMHg5NSwgMHgwMywgICAgICAgICAgICAgICAgICAgIC8v
ICBSZXBvcnQgQ291bnQgKDMpICAgICAgICAgICAgICAgICAgIDExNQojIDB4ODEsIDB4MDIsICAg
ICAgICAgICAgICAgICAgICAvLyAgSW5wdXQgKERhdGEsVmFyLEFicykgICAgICAgICAgICAgICAx
MTcKIyAweDk1LCAweDA1LCAgICAgICAgICAgICAgICAgICAgLy8gIFJlcG9ydCBDb3VudCAoNSkg
ICAgICAgICAgICAgICAgICAgMTE5CiMgMHg4MSwgMHgwMSwgICAgICAgICAgICAgICAgICAgIC8v
ICBJbnB1dCAoQ25zdCxBcnIsQWJzKSAgICAgICAgICAgICAgIDEyMQojIDB4YzAsICAgICAgICAg
ICAgICAgICAgICAgICAgICAvLyBFbmQgQ29sbGVjdGlvbiAgICAgICAgICAgICAgICAgICAgICAx
MjMKIyAweDA1LCAweDAxLCAgICAgICAgICAgICAgICAgICAgLy8gVXNhZ2UgUGFnZSAoR2VuZXJp
YyBEZXNrdG9wKSAgICAgICAgMTI0CiMgMHgwOSwgMHgwMCwgICAgICAgICAgICAgICAgICAgIC8v
IFVzYWdlIChVbmRlZmluZWQpICAgICAgICAgICAgICAgICAgIDEyNgojIDB4YTEsIDB4MDEsICAg
ICAgICAgICAgICAgICAgICAvLyBDb2xsZWN0aW9uIChBcHBsaWNhdGlvbikgICAgICAgICAgICAx
MjgKIyAweDg1LCAweDA1LCAgICAgICAgICAgICAgICAgICAgLy8gIFJlcG9ydCBJRCAoNSkgICAg
ICAgICAgICAgICAgICAgICAgMTMwCiMgMHgxNSwgMHgwMCwgICAgICAgICAgICAgICAgICAgIC8v
ICBMb2dpY2FsIE1pbmltdW0gKDApICAgICAgICAgICAgICAgIDEzMgojIDB4MjYsIDB4ZmYsIDB4
MDAsICAgICAgICAgICAgICAvLyAgTG9naWNhbCBNYXhpbXVtICgyNTUpICAgICAgICAgICAgICAx
MzQKIyAweDk1LCAweDIwLCAgICAgICAgICAgICAgICAgICAgLy8gIFJlcG9ydCBDb3VudCAoMzIp
ICAgICAgICAgICAgICAgICAgMTM3CiMgMHg3NSwgMHgwOCwgICAgICAgICAgICAgICAgICAgIC8v
ICBSZXBvcnQgU2l6ZSAoOCkgICAgICAgICAgICAgICAgICAgIDEzOQojIDB4MDksIDB4MDEsICAg
ICAgICAgICAgICAgICAgICAvLyAgVXNhZ2UgKFBvaW50ZXIpICAgICAgICAgICAgICAgICAgICAx
NDEKIyAweDgxLCAweDAyLCAgICAgICAgICAgICAgICAgICAgLy8gIElucHV0IChEYXRhLFZhcixB
YnMpICAgICAgICAgICAgICAgMTQzCiMgMHgwOSwgMHgwMiwgICAgICAgICAgICAgICAgICAgIC8v
ICBVc2FnZSAoTW91c2UpICAgICAgICAgICAgICAgICAgICAgIDE0NQojIDB4OTEsIDB4MDIsICAg
ICAgICAgICAgICAgICAgICAvLyAgT3V0cHV0IChEYXRhLFZhcixBYnMpICAgICAgICAgICAgICAx
NDcKIyAweGMwLCAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gRW5kIENvbGxlY3Rpb24gICAg
ICAgICAgICAgICAgICAgICAgMTQ5CiMgClI6IDE1MCAwNSAwMSAwOSAwMiBhMSAwMSA4NSAwMSAw
OSAwMSBhMSAwMCAwNSAwOSAxOSAwMSAyOSAwMyAxNSAwMCAyNSAwMSA3NSAwMSA5NSAwNSA4MSAw
MiA3NSAwMyA5NSAwMSA4MSAwMSAwNSAwMSAwOSAzMCAwOSAzMSAxNiAwMSA4MCAyNiBmZiA3ZiA3
NSAxMCA5NSAwMiA4MSAwNiAwOSAzOCAxNSA4MSAyNSA3ZiA3NSAwOCA5NSAwMSA4MSAwNiBjMCBj
MCAwNSAwYyAwOSAwMSBhMSAwMSA4NSAwMiA3NSAxMCA5NSAwMSAxNSAwMSAyNiA4YyAwMiAxOSAw
MSAyYSA4YyAwMiA4MSAwMCBjMCAwNSAwMSAwOSA4MCBhMSAwMSA4NSAwMyAwOSA4MiAwOSA4MSAw
OSA4MyAxNSAwMCAyNSAwMSAxOSAwMSAyOSAwMyA3NSAwMSA5NSAwMyA4MSAwMiA5NSAwNSA4MSAw
MSBjMCAwNSAwMSAwOSAwMCBhMSAwMSA4NSAwNSAxNSAwMCAyNiBmZiAwMCA5NSAyMCA3NSAwOCAw
OSAwMSA4MSAwMiAwOSAwMiA5MSAwMiBjMApOOiBUZWxpbmsgV2lyZWxlc3MgUmVjZWl2ZXIKSTog
MyAyNDhhIGZhMDIKIyBSZXBvcnRJRDogMSAvIEJ1dHRvbjogMCAgMCAgMCAsIDAgLCAxIHwgIyB8
IFg6ICAgICAgMCB8IFk6ICAgICAgMCB8IFdoZWVsOiAgICAwIApFOiAwMDAwMDAuMDAwMDAwIDcg
MDEgMTAgMDAgMDAgMDAgMDAgMDAKIyBSZXBvcnRJRDogMSAvIEJ1dHRvbjogMCAgMCAgMCAsIDAg
LCAwIHwgIyB8IFg6ICAgICAgMCB8IFk6ICAgICAgMCB8IFdoZWVsOiAgICAwIApFOiAwMDAwMDAu
MTg3OTg2IDcgMDEgMDAgMDAgMDAgMDAgMDAgMDAKIyBSZXBvcnRJRDogMSAvIEJ1dHRvbjogMCAg
MCAgMCAsIDEgLCAwIHwgIyB8IFg6ICAgICAgMCB8IFk6ICAgICAgMCB8IFdoZWVsOiAgICAwIApF
OiAwMDAwMDAuNjgxOTU2IDcgMDEgMDggMDAgMDAgMDAgMDAgMDAKIyBSZXBvcnRJRDogMSAvIEJ1
dHRvbjogMCAgMCAgMCAsIDAgLCAwIHwgIyB8IFg6ICAgICAgMCB8IFk6ICAgICAgMCB8IFdoZWVs
OiAgICAwIApFOiAwMDAwMDAuODY1MDA0IDcgMDEgMDAgMDAgMDAgMDAgMDAgMDAKCg==
--000000000000c777ca06351efef8--

