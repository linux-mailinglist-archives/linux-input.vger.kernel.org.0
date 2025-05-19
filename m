Return-Path: <linux-input+bounces-12451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96CABC78A
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 21:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E868188EDDA
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 19:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8824C1D8E1A;
	Mon, 19 May 2025 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEnI4Ynn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC6A1E531
	for <linux-input@vger.kernel.org>; Mon, 19 May 2025 19:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747681262; cv=none; b=QgdY+aq24g68thWuDZDAvwumugACPYuGwtpafyKEhh0dJtqWMsxS/IOSDNs9WWJ9vB2KfRSkn5lSJ2UQ7s2wQSDAeZiEIl5WWQokR+aAhfFClsi8wMOdRW/GGLL3ejJ+kSonrp3rqThGmf1W7IRoU87Z+/nKyVkYqFA8uSCRKSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747681262; c=relaxed/simple;
	bh=q4FZGa2nRCs7B7C5Bbejv37qtJfks+G8uWrkNcFAWfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUu3Y+556MtpEiT/H1Rtkh+6jIWOF+LW6wJvVmazIac6SWhzODUjTwjevkwTteo8IUQvD1Vg8M+PjHzul2YUEH6Ob2hKHDzvP2yQlaKwYf/IT/oq4/v2CjxPhyCGP2HaTOiv3P7bzMZlDqlP4NtRVWLwXPY6pp5ZyARAm4OkAb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEnI4Ynn; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7370a2d1981so3860063b3a.2
        for <linux-input@vger.kernel.org>; Mon, 19 May 2025 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747681259; x=1748286059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IudWM3DXP9JnMZQitGSxGpxTsrh3avvu1VHb8pudsXY=;
        b=EEnI4Ynn/p/bloOtwBAGZnWbwWJQCEhP/9xD11xyw9PvmFPQkw1LKMs3dNCWtOZaUA
         lbJj8N9w0y5DXEBljICpw+I2ZTauQIyYwtPZUGFXT83Hn8Z6lcTlK7cbcUmSAlYOeHeg
         yAvY8aT+1bkr8xM6zqGoVhFUQPAt9k0jjQa0PzjEMWF47PIG4MBuD5nKytazBKXJLCyM
         siEyQe2OTdg2U3upy/KD9touhM1+PPMO+1Iih4bghhL0fe/QRsgTHAdsmkg2j9Fu7s1w
         TKJvePtQZ9hyIAB+GH02kzbhtdqdMBwqqeXGXGfCcEMMZyM69JUN32XOl99TU3npYRGx
         FsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747681259; x=1748286059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IudWM3DXP9JnMZQitGSxGpxTsrh3avvu1VHb8pudsXY=;
        b=m1KyA/zJyMNhQHQFRPDb0M1+vfhgAqrEVddtFJrMjZPoRgDURRVds8kV42E6JevIVx
         dA/ef4n+KE6X79eSpr+hSaVU/UgYKToqEty0uNoYyOpu6L4bGEq2yKbf/ML2w75cX+IM
         3dxMsGhy3nhbpadAjmCJGtnp6bjK+qZ2TVF7fGMUfREwxDiKm8fwNAXPejlsQLVvLQj0
         0gVHv2uBhYvtFFV6Tt2QiJuVybYDi4L6hTWvCV/6jaPhoNXQE3vv+HKtStEpGUP7wM9p
         3ww5o38XW5TAGmtQKuU+DBgfnPbycpYRazVc7pjBnubxr8DQtUzPUbPOkialC+STg/5N
         5iOg==
X-Gm-Message-State: AOJu0YzHuVSKhe0IoHcvtV8byTNAwMxw/uqEd3fntxJNArZfNUrLRGLn
	NaGgki/jMXEnNBjWrRGw/AjGMa5/Hag7g/dda8yTxW8q/x9OIZW+mcKky5nm95oh5lekFskFF5X
	4HC6f4Y0UQcIqMpnl8NwLB1yrfNyCsRw=
X-Gm-Gg: ASbGncsheC7Yd+jWGt5ETp45Bsl7E5ODXvj/VLW73dQ2MIZ0RdnMMlHyDU2N5Tyo+ml
	CnRpu7YlbV+CTx30Qe4i6P8WZ8qw5b7RnEdAlYL2AT/y3Mt4pTtKvHHEFJRZ+7qSFmXVUNIYc3P
	P3Ab1ReVehPcjbcexx26JK7gKcidFzeGHjJ7LJVhRBX938ZqKxlAy4IaUIghFHYInldA==
X-Google-Smtp-Source: AGHT+IGZWkepiVoJtxzquZKYVqy0qjICaWO/DGxIkKTRENqMQNsQ6cmAameeFOufnJ4TIjKZeAVYKJKBe733jajOBv8=
X-Received: by 2002:a17:90b:3c90:b0:30a:a50e:349c with SMTP id
 98e67ed59e1d1-30e83226f25mr19474445a91.30.1747681259339; Mon, 19 May 2025
 12:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADUzMVbe=9YgXfMtSDL-XAKhYnjuo-L6_s4pGiN1g1ibU-_G9A@mail.gmail.com>
 <PN3PR01MB9597F80FFCE6A1037092AC04B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959753C721C0B0C29B8F24B4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB959753C721C0B0C29B8F24B4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Ioannis Barkas <jnyb.de@gmail.com>
Date: Mon, 19 May 2025 22:00:45 +0300
X-Gm-Features: AX0GCFuquGcB7GjQtCCL7X4PxiwndnYYOd0NV5GToceGNKH9LFRLowJnnoFzHYo
Message-ID: <CADUzMVaZn6RTUuArHuvT9MAG=BD8HcJKh3PsQEKU08TReXzg5w@mail.gmail.com>
Subject: Re: HID apple error with A1243 keyboard
To: Aditya Garg <gargaditya08@live.com>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Aditya,

Thank you for looking into this! Issue appears to be present on old
kernels as you can see below. This time I tested it on PC.

Fn works fine as expected with kernel 6.12.15 @PC:
[  137.137645] input: Apple Inc. Apple Keyboard as
/devices/pci0000:00/0000:00:12.2/usb2/2-2/2-2.2/2-2.2:1.0/0003:05AC:0250.00=
06/input/input24
[  137.282472] apple 0003:05AC:0250.0006: input,hidraw2: USB HID v1.11
Keyboard [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input0
[  137.282660] apple 0003:05AC:0250.0007: Fn key not found (Apple
Wireless Keyboard clone?), disabling Fn key handling
[  137.282703] input: Apple Inc. Apple Keyboard as
/devices/pci0000:00/0000:00:12.2/usb2/2-2/2-2.2/2-2.2:1.1/0003:05AC:0250.00=
07/input/input25
[  137.338545] apple 0003:05AC:0250.0007: input,hidraw4: USB HID v1.11
Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1

Fn works fine as expected with vanilla debug kernel 6.6.0 @PC:
    3.504563] bus: 'hid': __driver_probe_device: matched device
0003:05AC:0250.0006 with driver apple
[    3.505099] bus: 'hid': really_probe: probing driver apple with
device 0003:05AC:0250.0006
[    3.505649] apple 0003:05AC:0250.0006: no default pinctrl state
[    3.506334] apple 0003:05AC:0250.0006: Fn key not found (Apple
Wireless Keyboard clone?), disabling Fn key handling
[    7.248274] apple 0003:05AC:0250.0006: input,hidraw4: USB HID v1.11
Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1
[    7.248854] driver: 'apple': driver_bound: bound to device
'0003:05AC:0250.0006'
[    7.249456] bus: 'hid': really_probe: bound device
0003:05AC:0250.0006 to driver apple

Fn works fine as expected with debian kernel 6.1.137d @PC:
[    3.118620] apple 0003:05AC:0250.0005: input,hidraw4: USB HID v1.11
Keyboard [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input0
[    3.118765] apple 0003:05AC:0250.0006: Fn key not found (Apple
Wireless Keyboard clone?), disabling Fn key handling
[    3.378932] apple 0003:05AC:0250.0006: input,hidraw0: USB HID v1.11
Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1
[    6.746946] usbcore: registered new device driver apple-mfi-fastcharge

Pressing F11 lowers the volume. Pressing it along with Fn key results
in maximizing the active window as expected. Log entry is false for
sure.

Device has 2 hid raw entries 0, 4. hid logs were captured using debian
kernel 6.1. Initially Fn key was pressed and then F11 or F11+Fn. No
other key was pressed.

hidraw0:
# Apple Inc. Apple Keyboard
# Report descriptor length: 47 bytes
#   Bytes                          // Field Name
       Offset
# -------------------------------------------------------------------------=
---------
# =F0=9F=AE=A5 0x05, 0x0c,                    // Usage Page (Consumer)
          0
# =F0=9F=AD=AC 0x09, 0x01,                    // Usage (Consumer Control)
          2
#   0xa1, 0x01,                    // Collection (Application)
         4
# =F0=9F=AE=A5 0x05, 0x0c,                    //   Usage Page (Consumer)
          6
#   0x75, 0x01,                    //   Report Size (1)
         8
#   0x95, 0x01,                    //   Report Count (1)
         10
#   0x15, 0x00,                    //   Logical Minimum (0)
         12
#   0x25, 0x01,                    //   Logical Maximum (1)
         14
# =F0=9F=AD=AC 0x09, 0xcd,                    //   Usage (Play/Pause)
          16
# =E2=94=87 0x81, 0x06,                    //   Input (Data,Var,Rel)
         18
# =F0=9F=AD=AC 0x09, 0xb5,                    //   Usage (Scan Next Track)
          20
# =E2=94=87 0x81, 0x02,                    //   Input (Data,Var,Abs)
         22
# =F0=9F=AD=AC 0x09, 0xb6,                    //   Usage (Scan Previous Tra=
ck)
          24
# =E2=94=87 0x81, 0x02,                    //   Input (Data,Var,Abs)
         26
# =F0=9F=AD=AC 0x09, 0xb8,                    //   Usage (Eject)
          28
# =E2=94=87 0x81, 0x06,                    //   Input (Data,Var,Rel)
         30
# =F0=9F=AD=AC 0x09, 0xe2,                    //   Usage (Mute)
          32
# =E2=94=87 0x81, 0x06,                    //   Input (Data,Var,Rel)
         34
# =F0=9F=AD=AC 0x09, 0xea,                    //   Usage (Volume Decrement)
          36
# =E2=94=87 0x81, 0x02,                    //   Input (Data,Var,Abs)
         38
# =F0=9F=AD=AC 0x09, 0xe9,                    //   Usage (Volume Increment)
          40
# =E2=94=87 0x81, 0x02,                    //   Input (Data,Var,Abs)
         42
# =E2=94=87 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)
         44
#   0xc0,                          // End Collection
         46
R: 47 05 0c 09 01 a1 01 05 0c 75 01 95 01 15 00 25 01 09 cd 81 06 09
b5 81 02 09 b6 81 02 09 b8 81 06 09 e2 81 06 09 ea 81 02 09 e9 81 02
81 01 c0
N: Apple Inc. Apple Keyboard
I: 3 5ac 250
# Report descriptor:
# ------- Input Report -------
#    | Report size: 8 bits
#   Bit:    0       Usage: 000c/00cd: Consumer / Play/Pause
           Logical Range:     0..=3D1
#   Bit:    1       Usage: 000c/00b5: Consumer / Scan Next Track
           Logical Range:     0..=3D1
#   Bit:    2       Usage: 000c/00b6: Consumer / Scan Previous Track
           Logical Range:     0..=3D1
#   Bit:    3       Usage: 000c/00b8: Consumer / Eject
           Logical Range:     0..=3D1
#   Bit:    4       Usage: 000c/00e2: Consumer / Mute
           Logical Range:     0..=3D1
#   Bit:    5       Usage: 000c/00ea: Consumer / Volume Decrement
           Logical Range:     0..=3D1
#   Bit:    6       Usage: 000c/00e9: Consumer / Volume Increment
           Logical Range:     0..=3D1
#   Bit:    7       ######### Padding
###########################################################################=
###
# Event nodes:
# - /dev/input/event5:  "Apple Inc. Apple Keyboard"
###########################################################################=
###
# Recorded events below in format:
# E: <seconds>.<microseconds> <length-in-bytes> [bytes ...]
#


hidraw4:
# Apple Inc. Apple Keyboard
# Report descriptor length: 75 bytes
#   Bytes                          // Field Name
       Offset
# -------------------------------------------------------------------------=
---------
# =F0=9F=AE=A5 0x05, 0x01,                    // Usage Page (Generic Deskto=
p)
          0
# =F0=9F=AD=AC 0x09, 0x06,                    // Usage (Keyboard)
          2
#   0xa1, 0x01,                    // Collection (Application)
         4
# =F0=9F=AE=A5 0x05, 0x07,                    //   Usage Page (Keyboard/Key=
pad)
          6
# =F0=9F=AD=AC 0x19, 0xe0,                    //   Usage Minimum (224)
          8
# =F0=9F=AD=AC 0x29, 0xe7,                    //   Usage Maximum (231)
          10
#   0x15, 0x00,                    //   Logical Minimum (0)
         12
#   0x25, 0x01,                    //   Logical Maximum (1)
         14
#   0x75, 0x01,                    //   Report Size (1)
         16
#   0x95, 0x08,                    //   Report Count (8)
         18
# =E2=94=87 0x81, 0x02,                    //   Input (Data,Var,Abs)
         20
#   0x95, 0x01,                    //   Report Count (1)
         22
#   0x75, 0x08,                    //   Report Size (8)
         24
# =E2=94=87 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)
         26
# =F0=9F=AE=A5 0x05, 0x08,                    //   Usage Page (LED)
          28
# =F0=9F=AD=AC 0x19, 0x01,                    //   Usage Minimum (1)
          30
# =F0=9F=AD=AC 0x29, 0x05,                    //   Usage Maximum (5)
          32
#   0x95, 0x05,                    //   Report Count (5)
         34
#   0x75, 0x01,                    //   Report Size (1)
         36
# =E2=94=8A 0x91, 0x02,                    //   Output (Data,Var,Abs)
         38
#   0x95, 0x01,                    //   Report Count (1)
         40
#   0x75, 0x03,                    //   Report Size (3)
         42
# =E2=94=8A 0x91, 0x01,                    //   Output (Cnst,Arr,Abs)
         44
# =F0=9F=AE=A5 0x05, 0x07,                    //   Usage Page (Keyboard/Key=
pad)
          46
# =F0=9F=AD=AC 0x19, 0x00,                    //   Usage Minimum (0)
          48
# =F0=9F=AD=AC 0x2a, 0xff, 0x00,              //   Usage Maximum (255)
          50
#   0x95, 0x05,                    //   Report Count (5)
         53
#   0x75, 0x08,                    //   Report Size (8)
         55
#   0x15, 0x00,                    //   Logical Minimum (0)
         57
#   0x26, 0xff, 0x00,              //   Logical Maximum (255)
         59
# =E2=94=87 0x81, 0x00,                    //   Input (Data,Arr,Abs)
         62
# =F0=9F=AE=A5 0x05, 0xff,                    //   Usage Page (Reserved Usa=
ge
Page 00FF)   64
# =F0=9F=AD=AC 0x09, 0x03,                    //   Usage (Reserved Usage 0x=
03)
          66
#   0x75, 0x08,                    //   Report Size (8)
         68
#   0x95, 0x01,                    //   Report Count (1)
         70
# =E2=94=87 0x81, 0x02,                    //   Input (Data,Var,Abs)
         72
#   0xc0,                          // End Collection
         74
R: 75 05 01 09 06 a1 01 05 07 19 e0 29 e7 15 00 25 01 75 01 95 08 81
02 95 01 75 08 81 01 05 08 19 01 29 05 95 05 75 01 91 02 95 01 75 03
91 01 05 07 19 00 2a ff 00 95 05 75 08 15 00 26 ff 00 81 00 05 ff 09
03 75 08 95 01 81 02 c0
N: Apple Inc. Apple Keyboard
I: 3 5ac 250
# Report descriptor:
# ------- Input Report -------
#    | Report size: 64 bits
#   Bit:    0       Usage: 0007/00e0: Keyboard/Keypad / Keyboard
LeftControl         Logical Range:     0..=3D1
#   Bit:    1       Usage: 0007/00e1: Keyboard/Keypad / Keyboard
LeftShift           Logical Range:     0..=3D1
#   Bit:    2       Usage: 0007/00e2: Keyboard/Keypad / Keyboard
LeftAlt             Logical Range:     0..=3D1
#   Bit:    3       Usage: 0007/00e3: Keyboard/Keypad / Keyboard Left
GUI            Logical Range:     0..=3D1
#   Bit:    4       Usage: 0007/00e4: Keyboard/Keypad / Keyboard
RightControl        Logical Range:     0..=3D1
#   Bit:    5       Usage: 0007/00e5: Keyboard/Keypad / Keyboard
RightShift          Logical Range:     0..=3D1
#   Bit:    6       Usage: 0007/00e6: Keyboard/Keypad / Keyboard
RightAlt            Logical Range:     0..=3D1
#   Bit:    7       Usage: 0007/00e7: Keyboard/Keypad / Keyboard Right
GUI           Logical Range:     0..=3D1
#   Bits:   8..=3D15  ######### Padding
#   Bits:  16..=3D55  Usages:
              Logical Range:     0..=3D255
#                   0007/0000: <unknown>
#                   0007/0001: Keyboard/Keypad / ErrorRollOver
#                   0007/0002: Keyboard/Keypad / POSTFail
#                   0007/0003: Keyboard/Keypad / ErrorUndefined
#                   0007/0004: Keyboard/Keypad / Keyboard A
#                   ... use --full to see all usages
#   Bits:  56..=3D63  Usage: 00ff/0003: Reserved Usage Page 00FF /
Reserved Usage 0x03 Logical Range:     0..=3D255
# ------- Output Report -------
#    | Report size: 8 bits
#   Bit:    0       Usage: 0008/0001: LED / Num Lock
           Logical Range:     0..=3D1
#   Bit:    1       Usage: 0008/0002: LED / Caps Lock
           Logical Range:     0..=3D1
#   Bit:    2       Usage: 0008/0003: LED / Scroll Lock
           Logical Range:     0..=3D1
#   Bit:    3       Usage: 0008/0004: LED / Compose
           Logical Range:     0..=3D1
#   Bit:    4       Usage: 0008/0005: LED / Kana
           Logical Range:     0..=3D1
#   Bits:   5..=3D7   ######### Padding
###########################################################################=
###
# Event nodes:
# - /dev/input/event4:  "Apple Inc. Apple Keyboard"
###########################################################################=
###
# Recorded events below in format:
# E: <seconds>.<microseconds> <length-in-bytes> [bytes ...]
#
# Current time: 21:36:37
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000000.000073 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000000.103860 8 00 00 00 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000000.951703 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000001.071739 8 00 00 00 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000001.943577 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000002.055507 8 00 00 00 00 00 00 00 00
# Current time: 21:36:40
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000002.800115 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000002.903383 8 00 00 00 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000005.911108 8 00 00 44 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000006.031015 8 00 00 00 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000006.422933 8 00 00 44 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000006.502931 8 00 00 00 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000006.950889 8 00 00 44 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000007.046852 8 00 00 00 00 00 00 00 00
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000008.702397 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000009.582293 8 00 00 44 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000009.742416 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000010.462202 8 00 00 44 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000010.606141 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000011.118016 8 00 00 44 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000011.254024 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000011.677916 8 00 00 44 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     1
E: 000011.870311 8 00 00 00 00 00 00 00 01
#                 Keyboard LeftControl:     0 |Keyboard LeftShift:
0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
 0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
|Reserved Usage 0x03:     0
E: 000012.229851 8 00 00 00 00 00 00 00 00

Best regards,
Ioannis


On Mon, 19 May 2025 at 21:28, Aditya Garg <gargaditya08@live.com> wrote:
>
>
>
> On 19/05/25 10:45 pm, Aditya Garg wrote:
> > Hi Ioannis
> >
> >> Hello guys,
> >>
> >> I am getting a wrong print with the A1243 wired keyboard:
> >> [  339.368030] usb 1-3.3.1.2: new low-speed USB device number 8 using =
xhci_hcd
> >> [  339.460199] usb 1-3.3.1.2: New USB device found, idVendor=3D05ac,
> >> idProduct=3D0250, bcdDevice=3D 0.74
> >> [  339.460217] usb 1-3.3.1.2: New USB device strings: Mfr=3D1,
> >> Product=3D2, SerialNumber=3D0
> >> [  339.460218] usb 1-3.3.1.2: Product: Apple Keyboard
> >> [  339.460219] usb 1-3.3.1.2: Manufacturer: Apple Inc.
> >> [  339.469425] input: Apple Inc. Apple Keyboard as
> >> /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3.3/1-3.3.1/1-3.3.1.2/1-3.=
3.1.2:1.0/0003:05AC:0250.000F/input/input18
> >> [  339.556178] apple 0003:05AC:0250.000F: input,hidraw12: USB HID
> >> v1.11 Keyboard [Apple Inc. Apple Keyboard] on
> >> usb-0000:00:14.0-3.3.1.2/input0
> >> [  339.558624] apple 0003:05AC:0250.0010: Fn key not found (Apple
> >> Wireless Keyboard clone?), disabling Fn key handling
> >>
> >> I get this with kernel 6.14. Fn key is present for sure and it is
> >> definitely not disabled since it works fine! Same applies to the
> >> onboard Fn key of the laptop.
> >>
> >> Looks like the detection logic needs some adjustment.
> >
> > Was the issue present with older kernels as well? And, is fn toggle wor=
king
> > as intended, i.e., is the log a false positive?
>
>
> Following up, it would be better to get the hid device recorded.
>
> Download hid-recorder from here: https://github.com/hidutils/hid-recorder=
/releases/download/0.6.0/hid-recorder.zip
>
> Extract the binary from the zip file. Then run `sudo /path/to/hid-recorde=
r | tee hid.log`
>
> After running this, choose your keyboard for recording. Then spam the fn =
key multiple times.
> After that kill the terminal and share the hid.log file created.

