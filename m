Return-Path: <linux-input+bounces-5448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197294C1AF
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 17:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F27F7289EC8
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 15:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C2F18FC6E;
	Thu,  8 Aug 2024 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="LrjPGq5t"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A51917DD;
	Thu,  8 Aug 2024 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723131776; cv=none; b=BVb4k1rtW29vtXUGpYy1BCAN0sXjXIdlfs4C0u2AlJQS/4bin8zG3Jb0jJzkd5Wc8nPdFliA+C05nZBOz9yuu33L3PpyHZt9MgI3W2VTjTre5tpKWw5xitH66Wc8RcSHCJT2SHWAlLsFv6Bx4AXqwHVE31beXg9MpeYeq4o1nDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723131776; c=relaxed/simple;
	bh=zmto6cKXxTLY1EfcUmT/XW+2KBUh2EyiAWTZvq1vJVI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lxyomH88BFrYGh/yNk53d9wWBMTW+DtBoRlnbplv6ooqUg1MlGwt1L6hP6qWAOengsoXJZrbqH4fBo77jraI2ksWPHvWAH2+eAMUt+owiGQ//bN1D/5g6c9g3SffjekGavoEtVmNVm1TtkgzWYomw8waKTbTQUpOa89Un509y9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=LrjPGq5t; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 6DE882E03C76;
	Thu,  8 Aug 2024 18:35:37 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1723131337;
	bh=EprGj8vFgI9d7BWkN3OaJ9vxO6abMDbHeU/66+o+nCo=;
	h=Received:From:Subject:To;
	b=LrjPGq5tygshQEQ08Si2+H/NmmpcFVFM5Hg6Y9advFrgEyG78biQ4dJkOeLCiH3C4
	 dJ3vn6+jnyIhZAy/yAY4n+vx4mSSYd0eQ+AWBfhCWcOG7eg8o7JBwFnyQ8MjPfqa/w
	 ZqJ6KwFqwtlGOl7QRlLm0pbaD7iUpeVwTCAgKSA8=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f149845fbaso12614431fa.3;
        Thu, 08 Aug 2024 08:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5xKZEj9LNLpieppb391pTTjygvecyjZWwTUFe9evj/fP0Hc6H4Wuj5jh0SWGDL0T+GABScOKzoKY4eUcd4wNWqLIxfFcneX6lUqou6KFKvPbmVhLuEON2qHHSaePg1LkXkDIAhqeHY+M=
X-Gm-Message-State: AOJu0YzBD49e3AEgwH38eyS56szKvyJ3Y6qF03m4kOS7vy8rQozdd5Zb
	l/Fl+N1bJkn7Ht/o/buONMV6ixNw08acZcTY7FgYBlxnRngLBLidsd80kOArSkDZ6Hmj4nXTIJu
	laiO/L8OslBkX5T1Th4isyOnt4h8=
X-Google-Smtp-Source: 
 AGHT+IGFm9XaWnZk03C4gh37TM1UGegUJaPMYWnU+SP0OSs3buEHQKlAPStFAV8BX+EUYm5Qgz3klgAwpf0YIcT2Lqk=
X-Received: by 2002:a2e:860e:0:b0:2ef:1bbb:b6f8 with SMTP id
 38308e7fff4ca-2f19de666f1mr17799361fa.32.1723131336378; Thu, 08 Aug 2024
 08:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 8 Aug 2024 18:35:25 +0300
X-Gmail-Original-Message-ID: 
 <CAGwozwHDwswam-Q40YqXMDJt6oui=UHv-bkjuF+X5fOmT+6PaA@mail.gmail.com>
Message-ID: 
 <CAGwozwHDwswam-Q40YqXMDJt6oui=UHv-bkjuF+X5fOmT+6PaA@mail.gmail.com>
Subject: Re: [PATCH] hid-asus-ally: Add full gamepad support
To: luke@ljones.dev
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <172313133777.5017.12619719960847266657@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Hi Luke,
I reviewed this patch and leave some of my thoughts below.

I am the creator of the Handheld Daemon (HHD) (https://github.com/hhd-dev/hhd)
app, which offers a lot of this functionality using a userspace implementation,
and have thousands of handheld users, a lot of whom are on both Allies,
so I believe I have some valuable feedback on this.

First for some background:
The original Ally used a composite USB device with the following components:
a vendor interface for Armoury Crate, an XInput gamepad device, and a Keyboard
device for things such as WASD and Mouse mode support.
Armoury Crate uses the vendor interface to control device mappings and how the
device should act, including by sending faux commands to it for gyro emulation
using the Bosch gyro built into the screen. As such, no drivers are required for
it in Windows, and the same can be said of Linux. Although without Armoury Crate
in either Windows or Linux, the controller does not behave properly.

In Ally X, Asus seems to have been told by Microsoft that the XInput driver is
being deprecated and they've had to move on to a different one.
For Asus, this meant doing a HID implementation which seems to be
similar to the Xbox Adaptive Controller, and using a custom windows
driver for it
in Windows. Therefore, unlike the original Ally, which did not require Windows
drivers to have its controller work, Ally X does.

It is a similar situation in Linux, where without a kernel driver, the
controller
of the Ally reads as a HID Gamepad with a wrong mapping, and does not have
vibration support.

The patch I am replying to does three things (which ideally should be separated
into different patches): provide an in-kernel equivalent for Armoury
Crate options
that will configure both Ally and Ally X, a HID driver for the Ally X that
restores vibration functionality and a sane mapping to the controllers, and
finally, a cross-interface "hack" which only works on the X and pulls the vendor
"Armoury" and "ROG Crate" buttons into the new HID gamepad driver and turns them
into "BTN_GUIDE" and "BTN_GUIDE+BTN_SOUTH" (which is recognized by
Steam to open the
side menu and by now defunct yuzu to switch from windowed to full screen).

Let me add notes for each one.

## Gamepad HID Driver
For the HID gamepad driver: we are in agreement that such a driver should exist
for the X. It makes basic functionality accessible to users without a userspace
tool and restores mapping and vibration.

Your implementation seems straightforward and I only have a couple of
notes for it:

First, you are hardcoding `desc.bEndpointAddress`, which is error
prone and could
break in the future with an MCU/EC update. You should instead use the Usage Page
and Usage of the device, which in this case are unique. Referencing HHD, for the
HID gamepad, the usage page is 0xFF31 and the usage is 0x0080. And perhaps there
is a gamepad driver already that could support Ally X with a simple quirk.

Following, you attempted to mimic an Xinput device, but your driver does not set
the ABS values of the device properly. For your convenience, here are the values
from the Legion Go, which uses an XInput gamepad:
```
   0x0000: ABS_X
     > [val 0, min -32768, max 32767, fuzz 16, flat 128, res 0]
   0x0001: ABS_Y
     > [val -1, min -32768, max 32767, fuzz 16, flat 128, res 0]
   0x0002: ABS_Z
     > [val 0, min 0, max 255, fuzz 0, flat 0, res 0]
   0x0003: ABS_RX
     > [val 0, min -32768, max 32767, fuzz 16, flat 128, res 0]
   0x0004: ABS_RY
     > [val 0, min -32768, max 32767, fuzz 16, flat 128, res 0]
   0x0005: ABS_RZ
     > [val 0, min 0, max 255, fuzz 0, flat 0, res 0]
   0x0010: ABS_HAT0X
     > [val 0, min -1, max 1, fuzz 0, flat 0, res 0]
   0x0011: ABS_HAT0Y
     > [val 0, min -1, max 1, fuzz 0, flat 0, res 0]
```
Specifically, your ABS_X, ABS_Y, ABS_RX, ABS_RY values are set from 0
to ABS_MAX, which is
a deviation from XInput and more similar to DInput. This means that if I added
support for your patchset to HHD which supports over 30 XInput
devices, I would have to
quirk it only for the Ally X. If you break HHD, the chance you break
userspace in
general (e.g., random proton game) is very high.

## Armoury Crate Functionality
Let me move over to armoury crate functionality, which you first started in
December as the XPAD patchset, and as such I have a certain familiarity with it.
I will not reiterate the `desc.bEndpointAddress` quirk.
The vendor interface is a HID device and it is the case both in Linux
and Windows
that configuration is usually done by userspace programs.
I recall multiple examples of this in Linux as well, e.g., Solaar for Logitech,
asusctl (your daemon) for Asus, libratbag for mice, and OpenRGB for
rgb which includes
the Ally. Can you justify the deviation here and the need for a kernel driver?

I am afraid that it might be unreliable, and applying kernel patches
is something
very difficult that most users can not do. Furthermore, given the user chooses
to install a userspace program to manage their controller (e.g., HHD),
you should
ensure this driver functionality can be disabled, from boot, so that it does not
interfere with userspace programs.

For example, one problem I recall that before we removed the XPAD patchset
from the distribution Bazzite, I noticed during reviewing logs that your patch
regularly failed the ready check on certain allies, and after trying
the ready check
myself as part of HHD, I had to pull it after 10 hours because users
came out of
the woodwork to report their controller misbehaved.
Of course, in those cases HHD handled initialization, so your patch failing did
not affect functionality.

I know that some basic initialization is required regardless for the
gamepad to work
without e.g., HHD. In my experience changing the gamepad mode to
Gamepad (from Mouse
mode) with a single HID command should suffice. Then, the rest of the settings
are initialized to manufacturer defaults.

## Xbox/Xbox + A Quirk
As mentioned above, the vendor device of the Ally reports the front manufacturer
buttons as HID commands from the special vendor device. This allows Armoury
crate to open in windows. Of course, in Linux there is no Armoury crate, so
these buttons are unused by default. Userspace programs can fix this
quirk and your previous kernel patches do as much, by exposing the buttons as
F15, F16, F17, F18.

A final component to this patchset is taking this vendor device and making it
accessible from the gamepad driver. This is uniquely possible on the
Ally X, because
the gamepad happens to be HID and located on the same USB interface, so you can,
with a bit of trickery, receive the front button commands from the
gamepad driver.
This allows you to quirk them, and here specifically for steam, to
Xbox and Xbox+A
("BTN_GUIDE" and "BTN_GUIDE+BTN_SOUTH"), which have similar functionality to
the Steamdeck's steam and three dot buttons.

In my opinion, that borders a bit on being too opinionated, and perhaps e.g.,
Asus would also share this opinion. Imagine if Asus tried to add some sort of
official support to linux, only to find out the Linux driver is remapping the
buttons and they have to work around that. Also, combining two HID devices is
a bit unorthodox, and may cause other issues (see `desc.bEndpointAddress`).
So perhaps Asus needs to be consulted here?

Further, I have some advice for your button implementation.
80ms is too short for steam and is a delay I have tried before. It
will fail in low
device TDPs, as Steam will begin to lag and miss the commands. For
your reference,
HHD uses 150ms for this and I have tried 80ms in the past.

In general, I am trying to move away from Xbox+A as it tends to add delay and
since I prefer to multiplex the right vendor button for double
presses, it starts
to become noticable. It also does not work if the user presses the
Nintendo layout
button in the Steam UI.

In addition, you are freezing the kernel driver to send those commands for 240ms
which is around 100 reports.
I would advise that you store that the user has pressed the vendor button and
then when you process the following HID reports, you set the Xbox
button as 1 for
300ms after the button is pressed and the A button to 1 after 150ms until 300ms.
It is fine to release both buttons at the same time.

## Other issues
These are my overall thoughts. Since I went through the effort of
posting to lkml,
I will also draw your attention to 2 other patches you upstreamed and
cause issues
for the original Ally and now Ally X.

The first one is allowing users to enable mcu_powersave in February.
Beforehand, it was force disabled by the kernel by your previous patch.
This feature remains broken when the device is at low TDPs and unplugged.
We force disable it now as part of the distribution Bazzite now.
Applies to both Ally and Ally X.

The second occasion was 3 weeks ago when you pushed the Ally X quirk
and converted
`ally_mcu_usb_switch` into a DMI table. It seems that a DMI table does
not work in
this codepath, and it is something that we had tried over a week
before you posted the
patch and had reverted it. If you had asked me I would have told you as much.
After this patch got cherry picked by CachyOS and ChimeraOS, it ended
up breaking
both Allies, which is not a favorable user experience.

Moving forward, I will try to be more attentive in the kernel conversation and,
e.g., upstream patches. And perhaps you can be a bit more thorough
testing before you push your patches up to the kernel ;).

Good luck with this patch series!

Of course, once you fix the notes I have above and/or your patchset is
integrated
to the kernel, I will make sure HHD is forward compatible with it, while being
backwards compatible with older kernels.

Best Regards,
Antheas

