Return-Path: <linux-input+bounces-13516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B7DB042FB
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55B3516FED0
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CAB25B1F4;
	Mon, 14 Jul 2025 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rGwKz8EB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD664259C83
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505781; cv=none; b=Tj5Om6vE4pnD/cu/O35loeeVvyQrP6bV9eml5jMbpAqL+IstMkIhA6B16JOUWhQgWlF3reXBZUN4fvaWBuFGk2mzzZH6zQ7MWvW+wPGTjV3v1tT+C0QeZ+NnpSzL2Y7xtPENV5WzcIUwCxlvwIc7Rr+jrx/DK52coO4dxt8TYxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505781; c=relaxed/simple;
	bh=JZRbIpTy7v2BG9THlk9Gd3ahR+gQHII/Lrd69JKoZy0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=U2xv5hBtXvmFs7ngkcZMk4B2JVpUUYGNFb4LdLzNnmHSfgx8p8HB1DzbwJ70wXbIUnATcMyxGxsDRCO4r+OFZHCEfj0pUR8ggWi+BKgK39el9I9i2mtrOCGJTHzxUZr4uVK1MycsPl7G5Qsp2rru9xQUut9Oj1OqDBeWaftDU34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rGwKz8EB; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-86d07ccc9ecso314801739f.0
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505777; x=1753110577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7sAoQ6WXv5weRfGZX+vT68HUKhZo5ldUaCADfBNufk=;
        b=rGwKz8EBEckY2NTpxgmcgsbxe6RK6A5h9cmrl2PfPrXTEkdmDv7Yr21acCnf/r0UyB
         fqK7Ym2K5j3aQGMAezaIMbUOyvciBzHtke49z+8/sS5Ll4so2y0O7FW+9QqDoG4l+S98
         XJVv8matVfsw6Af5NyJF8KICEB3rUzWM0lwgVF7GPhmp5B5QhasQSEYBUL4ZrH1LSnsK
         nT5yZbQPtnI6PTS0dD1mbSJOvuHUmWhnV77bRux30NUolQGTF20KFZqdAx2Ag19IFZ2W
         HhMYWTthZV6p24EOJvNmgyXvC7uaXhoIWVHsbuoLuIyuL34Zvkkv5V36GBci9i2aV+yz
         G/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505777; x=1753110577;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7sAoQ6WXv5weRfGZX+vT68HUKhZo5ldUaCADfBNufk=;
        b=fOtD2gCx7u9oADTPdna00OHVH5hyALVNSrTVLGDEHjBR+GTt1diJioJTdvRajvK0fz
         26kNlCA5tk2yGd3BX7UWOeWKU8rvgMFeVgiZdLW14LylK8rEU2iMOg1IXHRs07kibReT
         7G0r+iDjbUvrSaSWuN4KCr6eSXx1dxyQrm5WFj9ToWnWs80RimOsMKSJta03xt/d+1X2
         5Rz9Db3bYxfIEAd05DIRKwbFIso3ZAPD7P9mU3Od7IcaUcXVXfME5F1juTtjuOWBFlWp
         G9EaR1Hm07MuK0eabh0R6USFTRUkdSUSiCrFySc/nCjYad3pDnf2ROV4sSkilRddn6Yg
         yvtQ==
X-Gm-Message-State: AOJu0YxWo+c1SavR+t87nXRtqg9oN4x286BxGDVhEX75UpstCtB6QyHp
	p91Qa9oizPfN2omJuMvOveHYh+nk1TG4/D4aS1Ljtzb/kTLThNWBw4VA74uUJOU4QFSb88q9ScF
	03XraM1jsMg==
X-Google-Smtp-Source: AGHT+IH7kAiiBApUp6BQnrRbipEvqna7Hh1BZiW2O4wH/G4yngx7byVT+oVXJJz+DQNVi9XFxPhCLaZF16aZ
X-Received: from ioiq22.prod.google.com ([2002:a5e:a616:0:b0:86c:f57f:3ddf])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:60c3:b0:879:674e:2c73
 with SMTP id ca18e2360f4ac-87977f54b53mr1574029239f.4.1752505777058; Mon, 14
 Jul 2025 08:09:37 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:33 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK0ddWgC/x3MTQqAIBBA4avIrBPM/qCrRAvLsWajMlMRRHdPW
 n6L9x4QZEKBUT3AeJFQigV1pWDdXdxQky8Ga2xnettpOXNOfOiQeMXsvGiztGFog2+8cVC6zBj o/p/T/L4fOmfakGMAAAA=
X-Change-Id: 20250625-support-forcepads-0b4f74fd3d0a
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Subject: [PATCH 00/11] HID: Implement haptic forcepad support
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

This is an updated implementation of the interface for controlling haptic
touchpads.

Below is an updated design proposal for the userspace and HID interfaces,
modified from what one of my colleagues submitted in 2019 [0].

We would appreciate any feedback you might have.

Thank you,

Jonathan Denose
Chromium OS Team

Background
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

There are multiple independent projects to develop a touchpad with force se=
nsors
and haptic actuators, instead of a traditional button.  These haptic touchp=
ads
have several advantages and potential uses; they allow clicking across the
entire touchpad surface, adjusting the force requirement for clicks, haptic
feedback initiated by UI, etc. Supporting these features will potentially
require two new communication channels at the kernel level:
* Control of haptic motor by the host
* Force sensor data from device to host

This document includes two related proposals:
1. HID design proposal, that hardware makers would need to implement
2. Kernel design proposal

Objective
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Develop a standard protocol to allow userspace applications to communicate =
with
haptic touchpads, and minimize duplicated code and effort.

Requirements:
1. Support UI-initiated haptic feedback.
2. Allow userspace to control when button press and button release haptic
   effects are triggered. (Useful when detecting a false click, changing fo=
rce
   thresholds, or sending context-dependent effects).
3. Reveal force sensor readings to userspace applications.
4. Only allow OS-controlled haptic feedback for those systems which support=
 it.

Proposal
=3D=3D=3D=3D=3D=3D=3D=3D

In order to minimize duplicated effort, we propose standardized haptic touc=
hpad
support in the linux kernel.

HID API
-------

Modes
.....

The haptic touchpad should be able to operate under two different modes.

1. Device-controlled mode

The haptic touchpad should start up in "device-controlled mode"
(HID_HAPTIC_MODE_DEVICE), meaning it acts as a normal touchpad. This means =
it
should perform the press and release haptic feedback autonomously at predef=
ined
force thresholds, and send the appropriate BTN_* events.

2. Host-controlled mode

Once the touchpad has been confirmed as supporting haptics (described in mo=
re
detail in the the "Click and release control" section below), the device sh=
ould
enter "host-controlled mode" (HID_HAPTIC_MODE_HOST). In this mode userspace
should take control. From here, userspace will take control over
press/release haptic feedback, relying on the effects sent by the kernel.

Multitouch
..........

The HID API for multitouch reports should follow the Microsoft precision
touchpad spec [1], with the following changes:
* A tip pressure field [2] should be used to report the force. The physical=
 unit
  Type (Newtons or grams), exponent, and limits should be reported in the
  report descriptor for the force field.
* The device will always report the button state according to its predefine=
d
  force thresholds, even when not in device-controlled mode.
* The device must expose a "simple haptic controller" logical collection
  alongside the touchpad collection.

Haptic control
..............

The HID protocol described in HUTRR63[3] must be used.

The following waveforms should be supported:

| WAVEFORMNONE             | Implicit waveforms required by protocol       =
    |
| WAVEFORMSTOP             |                                               =
    |
| ------------------------ | ----------------------------------------------=
--- |
| WAVEFORMPRESS            | To be used to simulate button press. In device=
-   |
|                          | controlled mode, it will also be used to simul=
ate |
|                          | button release.                               =
    |
| ------------------------ | ----------------------------------------------=
--- |
| WAVEFORMRELEASE          | To be used to simulate button release.        =
    |

All waveforms will have an associated duration; continuous waveforms will b=
e
ignored by the kernel.

Triggers & Mode switching
.........................

The =E2=80=9Cauto trigger waveform=E2=80=9D should be set to WAVEFORM_PRESS=
 by default, and the
button from the touchpad collection should be set as the =E2=80=9Cauto trig=
ger
associated control=E2=80=9D.

The kernel can trigger the different modes in the following ways:
* Device-controlled mode can be enabled by setting the =E2=80=9Cauto trigge=
r waveform=E2=80=9D to
  WAVEFORM_PRESS.
* Host-controlled mode can be enabled by setting the "auto trigger waveform=
" to
  WAVEFORM_STOP.

The device must also support manual triggering. If intensity modification f=
or
waveforms is supported by the device, the intensity control should be inclu=
ded
in the manual trigger output report. This allows modification of the intens=
ity
on a per-waveform basis. Retriggering does not need to be supported by the
device.

Userspace API
-------------

Multitouch protocol
...................

ABS_MT_PRESSURE will be used to report force. The resolution of ABS_MT_PRES=
SURE
should also be defined and reported in force units of grams or Newtons.
ABS_PRESSURE should be reported as the total force applied to the touchpad.
When the kernel is in host-controlled mode, it should always forward the bu=
tton
press and release events to userspace.

Use Force Feedback protocol to request pre-defined effects
..........................................................

The force feedback protocol [4] should be used to control predefined effect=
s.

Typical use of the force feedback protocol requires loading effects to the
driver by describing the output waveform, and then requesting those effects
using an ID provided by the driver. However, for haptic touchpads we do not=
 want
to describe the output waveform explicitly, but use a set of predefined eff=
ects,
which are identified by HID usage.

The force feedback protocol will need to be extended to allow requests for =
HID
haptic effects. This requires a new feedback effect type:

/**
 * struct ff_hid_effect
 * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
 * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defined
 * range
 * @vendor_id: the vendor waveform page if hid_usage is in the vendor-defin=
ed
 * range
 * @intensity: strength of the effect
 * @repeat_count: number of times to retrigger effect
 * @retrigger_period: time before effect is retriggered (in ms)
 */
struct ff_hid_effect {
        __u16 hid_usage;
        __u16 vendor_id;
        __u8  vendor_waveform_page;
        __s16 intensity;
        __u16 repeat_count;
        __u16 retrigger_period;
}

Since the standard waveform id namespace does not overlap with the vendor
waveform id namespace, the vendor id and page can be ignored for standard
waveforms.

Click and release control
.........................

Haptic functionality shall be gated behind the HID_MULTITOUCH_HAPTIC kernel
configuration option, and this kernel configuration option should only be
enabled if userspace will support haptic capabilities. Haptic functionality=
 will
only be initialized and used if HID_MULTITOUCH_HAPTIC is enabled, and if th=
e
following conditions have been met:
* ABS_MT_PRESSURE is defined and reporting force units of Newtons or grams.
* The device supports haptic effects according to the hid protocol defined =
in
  HUTRR63 [3].
These checks will happen when the driver probes and initializes the multito=
uch
device.

In the case when the kernel configuration option has been set and the devic=
e
reports pressure and haptic effects as defined above, the kernel will initi=
alize
the haptic device and configure the haptic driver to signal that the touchp=
ad is
haptic-compatible. To signal to userspace that the touchpad is haptic-compa=
tible
the kernel will mark INPUT_PROP_HAPTIC_TOUCHPAD.

With userspace willing and able to take control, the kernel will signal to =
the
device to exit device-controlled mode once a WAVEFORMPRESS or WAVEFORMRELEA=
SE
event is uploaded. From here, userspace will take control over press/releas=
e
haptic feedback, relying on the effects sent by the kernel.

In all other cases, the driver will take no action to enable haptic
functionality.

Summary of normal use-case
1. The kernel waits for userspace to upload WAVEFORMPRESS or
   WAVEFORMRELEASE.
2. Userspace determines when a click has been performed based on its own
   criteria and tells the touchpad to perform a haptic effect.
3. When userspace erases the WAVEFORMPRESS or WAVEFORMRELEASE effect, signa=
l the
   device to return to device-controlled mode.

[0]: https://www.spinics.net/lists/linux-input/msg60938.html
[1]: https://learn.microsoft.com/en-us/windows-hardware/design/component-gu=
idelines/touchpad-devices
[2]: Usage ID 0x30 of HID usage table 0x0D. See chapter 16:
     https://www.usb.org/sites/default/files/documents/hut1_12v2.pdf
[3]: https://www.usb.org/sites/default/files/hutrr63b_-_haptics_page_redlin=
e_0.pdf
[4]: https://www.kernel.org/doc/html/v4.20/input/ff.html

Signed-off-by: Jonathan Denose <jdenose@google.com>
---
Angela Czubak (11):
      HID: add haptics page defines
      Input: add FF_HID effect type
      Input: add INPUT_PROP_HAPTIC_TOUCHPAD
      HID: haptic: introduce hid_haptic_device
      HID: input: allow mapping of haptic output
      HID: haptic: initialize haptic device
      HID: input: calculate resolution for pressure
      HID: haptic: add functions handling events
      Input: MT - add INPUT_MT_TOTAL_FORCE flags
      HID: haptic: add hid_haptic_switch_mode
      HID: multitouch: add haptic multitouch support

 Documentation/input/event-codes.rst    |  14 +
 drivers/hid/Kconfig                    |  20 ++
 drivers/hid/Makefile                   |   1 +
 drivers/hid/hid-haptic.c               | 580 +++++++++++++++++++++++++++++=
++++
 drivers/hid/hid-haptic.h               | 131 ++++++++
 drivers/hid/hid-input.c                |  18 +-
 drivers/hid/hid-multitouch.c           | 136 +++++++-
 drivers/input/input-mt.c               |  14 +-
 include/linux/hid.h                    |  29 ++
 include/linux/input/mt.h               |   1 +
 include/uapi/linux/input-event-codes.h |   1 +
 include/uapi/linux/input.h             |  22 +-
 12 files changed, 959 insertions(+), 8 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250625-support-forcepads-0b4f74fd3d0a

Best regards,
--=20
Jonathan Denose <jdenose@google.com>


