Return-Path: <linux-input+bounces-14113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89054B2B454
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 01:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 451453B7457
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 23:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824FB27281D;
	Mon, 18 Aug 2025 23:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CtTaCnVP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFDE258ED8
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558636; cv=none; b=XEgsNsxXDDvopP15y4oSBkf140eSp1dJvIVH6yJeVNehi9Czdt8Iyzfe7pW1mU+URFQ5ls7JjqRhEd+fmV5vHG9FU8vLJ5BbVUDQ2KfiEk+vSkiKRcEacysmuIMOHbwR6QG1X75NxqEQltbOwhCRNUEphsSvTl7teNQ4s34plhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558636; c=relaxed/simple;
	bh=RyQjuAVoMgAA9YpJ6D6dEPTFvEGYzUGuj3WM9EwNxco=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eBLo4z3pPe6U8WaI3tAnDmIuj1Ur2aD+w/w05OQk7XrT4na1fnvcEt5MDt9RMG1zrmtJ7OwYIOSo5cUFaFNHMjDAqp+HVf1257pFS26Rl8LaGqdqgPrNaExUlTSEVCZ0iHKid3RQhSPIVKcJ+5b71STrDphp5VF6CzLYYsjtG2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CtTaCnVP; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3e56ff1127cso59640025ab.0
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 16:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558633; x=1756163433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rAqUY5h06bm5cqb+b+T+MwHeQO+bYsP0Aec131Iq9gU=;
        b=CtTaCnVPobOa9jvEwwytcOVBBJVrVtuDZXL1HFixZbc1hgT87oQ7EOiBsUk+0ps42c
         aK4+oO5E3/i19zvR8BiDbiR+m0RB9npI3xXW5IUFOjzDvqLZZHNO+5xhK429wT/Pdpv6
         Nj/G40PFFvDjBimYFKqMa3NSolzHjtTOWU+x7fvmpzXbPOB6J/y3SQF+rgwu0o1DSTt+
         MXrUkdTZmkt4KvSYL+TOeRdPsfQVcF53xzF9PqgGQfV1n4vnpHdKBB16gU6ktcP6ywC7
         EuBuXYL6Uoik6QbWpNkd9V2dTvn4jrNsGirVRPJszpapwOcxHe6pO8ukBCyvHb8u+rXy
         e7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558633; x=1756163433;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAqUY5h06bm5cqb+b+T+MwHeQO+bYsP0Aec131Iq9gU=;
        b=QuRlE9KNIT9HjGJu7roLrbaj2i1ydAJA7Dn16cbUKa77RSCAOX/QrRpJcxhcGSb0Yx
         xLcMuiAZuR19q8kkZmQufEx3u6DjphUYoHpFborpUl3ES8EuLi9UnJ8thoXO+qCHJma2
         ytb+arLQ4yC6rL3dQth4bQgD9XxgcSdsNqD5Mvth/R8tRFleJr9xuTIrG0LOkiXn6BXB
         4BA2aabU80OJPsUXWf3prRDPYv1oxL4caKHsMt58kfPatapuWauN+SKVGLMwbNfIkg8O
         +2J0YjnmAg7nTaMgIy7UG2Z9M10bbVPGTDcfPsMp74SAH/vd1YU4g0NwohbgqG+ksgKZ
         XN7A==
X-Gm-Message-State: AOJu0Ywip4f3E+C70haYw7QLPFr4V6J/SPy/tyqT2XKeUE3mV+vslQid
	7HLBvVJDQn80zxjnfPHJA/eJGw2QCy7uzOmw6aDMxIBBDHYQ+1m0YONm/SVtefXPdhxsYEeKJnM
	iv0j+5DJ9ew==
X-Google-Smtp-Source: AGHT+IGhDVCxvQhtgjmsTjdUYfLup5LiyikdLR4mXVyFh11fiimp3GV7qEcyhzMJgr94Ah0N+wKRxIeZ9Hg+
X-Received: from jablr10.prod.google.com ([2002:a05:6638:ab0a:b0:503:6331:8c2])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1487:b0:3e5:4fee:75e7
 with SMTP id e9e14a558f8ab-3e67665e58fmr7743515ab.17.1755558633457; Mon, 18
 Aug 2025 16:10:33 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:41 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHmyo2gC/23NQQ7CIBCF4as0rMUAhdK68h7GBcLQkmghUImm6
 d2ldWFMuvxfMt/MKEF0kNCpmlGE7JLzY4n6UCE9qLEH7ExpxAgTpGECp2cIPk7Y+qghKJMwuXE
 ruTW1IQqVuxDButdmXq6lB5cmH9/bi0zX9atJyne0TDHBkmqpiZC81d25976/w1H7B1q5zH5ES 9s9ghVCKyZ4AzXtjPgjlmX5AJoM4g32AAAA
X-Change-Id: 20250625-support-forcepads-0b4f74fd3d0a
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Subject: [PATCH v3 00/11] HID: Implement haptic touchpad support
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
 * struct ff_haptic_effect
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
struct ff_haptic_effect {
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
Changes in v3:
- Change CONFIG_HID_HAPTIC from bool to tristate
- Fix devm_kzalloc calls in hid-multitouch.c to use correct device
- Minor comment cleanup + grammar fix
- Link to v2: https://lore.kernel.org/r/20250818-support-forcepads-v2-0-ca2=
546e319d5@google.com

Changes in v2:
- Rename FF_HID and ff_hid_effect to FF_HAPTIC and ff_haptic_effect
- Add more detail to CONFIG_HID_HAPTIC config option description
- Remove CONFIG_MULTITOUCH_HAPTIC config option
- Utilize devm api in hid-multitouch haptic functions
- Link to v1: https://lore.kernel.org/all/20250714-support-forcepads-v1-0-7=
1c7c05748c9@google.com

---
Angela Czubak (11):
      HID: add haptics page defines
      Input: add FF_HAPTIC effect type
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
 drivers/hid/Kconfig                    |  11 +
 drivers/hid/Makefile                   |   1 +
 drivers/hid/hid-haptic.c               | 580 +++++++++++++++++++++++++++++=
++++
 drivers/hid/hid-haptic.h               | 127 ++++++++
 drivers/hid/hid-input.c                |  18 +-
 drivers/hid/hid-multitouch.c           |  47 +++
 drivers/input/input-mt.c               |  14 +-
 include/linux/hid.h                    |  29 ++
 include/linux/input/mt.h               |   1 +
 include/uapi/linux/input-event-codes.h |   1 +
 include/uapi/linux/input.h             |  22 +-
 12 files changed, 858 insertions(+), 7 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250625-support-forcepads-0b4f74fd3d0a

Best regards,
--=20
Jonathan Denose <jdenose@google.com>


