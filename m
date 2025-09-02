Return-Path: <linux-input+bounces-14442-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E040B40F61
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 23:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9E5017911B
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 21:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733A72517AA;
	Tue,  2 Sep 2025 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ciElb1mv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E47E573
	for <linux-input@vger.kernel.org>; Tue,  2 Sep 2025 21:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756848651; cv=none; b=YnhehHgqKwjAnUOVqJ2faktsrVrplUKKhRzDgS9gNJ++4dE6zRKJqXszuKjF8PqH1a2vgRdBK6F0ceb/Cyxi0bSwwZN7KCWj2+TLH6xGEEMmEtp0UU1vCK4FuluW5OIvf9X21MwHAfb9AHcLpwdknJwhfyvnEEfAXe3YEp+JDBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756848651; c=relaxed/simple;
	bh=9JbTzKYuqfuzYi4Nb2SDELIeela7dMgZPTL4BrExznY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVUQJqPT5zB3lL6OZB3iNBRPo/9T/x9UHksp4QTG2oKDjrmZWHVYgyBGuPVkfesYXFQca1X9tuUFgBWiR+q1a+aZ44/iAUSe+qs1AyIoH2HJfEQd0fCh58KeqhijTF2gKiEb1QvDQN1jqgzAcaR24aPyRUOBwMhVI3soUKrPOqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ciElb1mv; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b38d4de6d9so5761661cf.1
        for <linux-input@vger.kernel.org>; Tue, 02 Sep 2025 14:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756848648; x=1757453448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIHyBNWlR0xVVObfQSwFPOXxexHsOFj65lhH0sk5/ps=;
        b=ciElb1mvVk31zSfXF0ZA/OwJzHH1+Z2apunIacU0OmmY7Vf8jOd4jSsUkBOYIqyFIo
         +csl2jV4dKwTuPetbCYcIFjrkqkk9OsJMKjh6DiqKB7eafNI8M/Nd0gD6cnYaC5AJjtE
         omeAM4O/UPCh2HiqtDtDS4fg256oV+SVGHSEbeBpvbvmTrx64tXxizqlMUJrs2Z1zjED
         fVIgbUSq8aSRdx2S3QsEUHVYR3T879hMBGpJD1XOw3ViXfOjBOQZDvLStbpSE/rSOd/x
         pd3en6TaLTONhxH8xNbmipVCq9goNhde1rvDDOmmHOXulT1+hljrZUQrM1IUmoPDyG5W
         DKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756848648; x=1757453448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIHyBNWlR0xVVObfQSwFPOXxexHsOFj65lhH0sk5/ps=;
        b=adfQPtaZFCdQWHjJ2E6LEPZFPwCUzRl7Do1SGgwdKGwa1S/CLOVPAKmJLERX/Rh25p
         yqlAHDqqP6hB2NvAiozTq7tzlQTkasa6rvuFVWCODbC4Y8nF1Oocg4Ds73BuF4h5reBJ
         /ZRY3BpOttTkmP4YDhe0YW4eGBh7VwnZP7aHPHXnS+OpLwbXGHKsHcsZg4/IU1a0xFcT
         156oUiAIY5T8ZA661vDeHLEN6y7EW3rGdkhSMQpPxrrJb0InfqL4aP/6LQwemuDbzsSs
         ZSjGHP55etDN2ZVS3535ntVE+3eb7Jee/7M6PSFMk4Z/CqQIbqCEpkNAA4/AtA9aiU17
         uCqQ==
X-Gm-Message-State: AOJu0YzYvEqodAMqt48Lsd0sxOaoi2Dh8xhSGN9u/B95zcv9K039Fq1Z
	SHh3CrpwfRqo+8MHhfUyfvmfT3pd1gzOxxVQktWK1uIi5fHpfYBs1ZqWeY0dAUS6r8S98Uft5Aj
	/u04wMXzMDritEU4l+FXspx20ODdAl8kYULq6V52j
X-Gm-Gg: ASbGncssrmCtqeuUQkZrYZgBq77wpjcmeeAD7AUrFsGhe+C/2oQPfFHfQB8gH0sgiUm
	Nhx2MC2f+espbdlzkR3KgTguLgPCXU/kErAz4khDFm2+CIZ33RqjDyPXFXkJ90FRNJ26bMVnz7m
	8gmpKs3UJv/dBbb3fexRuennSUJuPPSBp7AOyPl3ADfI7P/Q+Y37KQgMts2qb/fGNys8pcxrtej
	aWTyURkcDHCVj48MNNOYUnsKpfWJvtHy7XwL/U5zkm/IvnA+mvmJoRVJQjiPCcLMtTMJTljACQD
	CNJ8qw/5VHhdrxr48hLK7bS0
X-Google-Smtp-Source: AGHT+IGaSaZZ/mwFe2rWX5IoTc9Yr7dBVALnKPhIk/KX9xd+MEcEetsVsz/oWICul0xvgYqFnqui4SYElqFA2gCr4ms=
X-Received: by 2002:a05:622a:2cd:b0:4b3:c78:fc18 with SMTP id
 d75a77b69052e-4b31dc84d8cmr161903731cf.68.1756848647663; Tue, 02 Sep 2025
 14:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
From: Jonathan Denose <jdenose@google.com>
Date: Tue, 2 Sep 2025 16:30:36 -0500
X-Gm-Features: Ac12FXwKv6W57zxcScGDO_HzqTjYPJKie3JgclspE9ji5LQdztiAetxXMV8DHjE
Message-ID: <CAMCVhVOUn-un9N_Bv00RVJ7kAw1O+AHgAHOzSGM6UuMBZVdtYw@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] HID: Implement haptic touchpad support
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 6:10=E2=80=AFPM Jonathan Denose <jdenose@google.com=
> wrote:
>
> Hello,
>
> This is an updated implementation of the interface for controlling haptic
> touchpads.
>
> Below is an updated design proposal for the userspace and HID interfaces,
> modified from what one of my colleagues submitted in 2019 [0].
>
> We would appreciate any feedback you might have.
>
> Thank you,
>
> Jonathan Denose
> Chromium OS Team
>
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> There are multiple independent projects to develop a touchpad with force =
sensors
> and haptic actuators, instead of a traditional button.  These haptic touc=
hpads
> have several advantages and potential uses; they allow clicking across th=
e
> entire touchpad surface, adjusting the force requirement for clicks, hapt=
ic
> feedback initiated by UI, etc. Supporting these features will potentially
> require two new communication channels at the kernel level:
> * Control of haptic motor by the host
> * Force sensor data from device to host
>
> This document includes two related proposals:
> 1. HID design proposal, that hardware makers would need to implement
> 2. Kernel design proposal
>
> Objective
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Develop a standard protocol to allow userspace applications to communicat=
e with
> haptic touchpads, and minimize duplicated code and effort.
>
> Requirements:
> 1. Support UI-initiated haptic feedback.
> 2. Allow userspace to control when button press and button release haptic
>    effects are triggered. (Useful when detecting a false click, changing =
force
>    thresholds, or sending context-dependent effects).
> 3. Reveal force sensor readings to userspace applications.
> 4. Only allow OS-controlled haptic feedback for those systems which suppo=
rt it.
>
> Proposal
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> In order to minimize duplicated effort, we propose standardized haptic to=
uchpad
> support in the linux kernel.
>
> HID API
> -------
>
> Modes
> .....
>
> The haptic touchpad should be able to operate under two different modes.
>
> 1. Device-controlled mode
>
> The haptic touchpad should start up in "device-controlled mode"
> (HID_HAPTIC_MODE_DEVICE), meaning it acts as a normal touchpad. This mean=
s it
> should perform the press and release haptic feedback autonomously at pred=
efined
> force thresholds, and send the appropriate BTN_* events.
>
> 2. Host-controlled mode
>
> Once the touchpad has been confirmed as supporting haptics (described in =
more
> detail in the the "Click and release control" section below), the device =
should
> enter "host-controlled mode" (HID_HAPTIC_MODE_HOST). In this mode userspa=
ce
> should take control. From here, userspace will take control over
> press/release haptic feedback, relying on the effects sent by the kernel.
>
> Multitouch
> ..........
>
> The HID API for multitouch reports should follow the Microsoft precision
> touchpad spec [1], with the following changes:
> * A tip pressure field [2] should be used to report the force. The physic=
al unit
>   Type (Newtons or grams), exponent, and limits should be reported in the
>   report descriptor for the force field.
> * The device will always report the button state according to its predefi=
ned
>   force thresholds, even when not in device-controlled mode.
> * The device must expose a "simple haptic controller" logical collection
>   alongside the touchpad collection.
>
> Haptic control
> ..............
>
> The HID protocol described in HUTRR63[3] must be used.
>
> The following waveforms should be supported:
>
> | WAVEFORMNONE             | Implicit waveforms required by protocol     =
      |
> | WAVEFORMSTOP             |                                             =
      |
> | ------------------------ | --------------------------------------------=
----- |
> | WAVEFORMPRESS            | To be used to simulate button press. In devi=
ce-   |
> |                          | controlled mode, it will also be used to sim=
ulate |
> |                          | button release.                             =
      |
> | ------------------------ | --------------------------------------------=
----- |
> | WAVEFORMRELEASE          | To be used to simulate button release.      =
      |
>
> All waveforms will have an associated duration; continuous waveforms will=
 be
> ignored by the kernel.
>
> Triggers & Mode switching
> .........................
>
> The =E2=80=9Cauto trigger waveform=E2=80=9D should be set to WAVEFORM_PRE=
SS by default, and the
> button from the touchpad collection should be set as the =E2=80=9Cauto tr=
igger
> associated control=E2=80=9D.
>
> The kernel can trigger the different modes in the following ways:
> * Device-controlled mode can be enabled by setting the =E2=80=9Cauto trig=
ger waveform=E2=80=9D to
>   WAVEFORM_PRESS.
> * Host-controlled mode can be enabled by setting the "auto trigger wavefo=
rm" to
>   WAVEFORM_STOP.
>
> The device must also support manual triggering. If intensity modification=
 for
> waveforms is supported by the device, the intensity control should be inc=
luded
> in the manual trigger output report. This allows modification of the inte=
nsity
> on a per-waveform basis. Retriggering does not need to be supported by th=
e
> device.
>
> Userspace API
> -------------
>
> Multitouch protocol
> ...................
>
> ABS_MT_PRESSURE will be used to report force. The resolution of ABS_MT_PR=
ESSURE
> should also be defined and reported in force units of grams or Newtons.
> ABS_PRESSURE should be reported as the total force applied to the touchpa=
d.
> When the kernel is in host-controlled mode, it should always forward the =
button
> press and release events to userspace.
>
> Use Force Feedback protocol to request pre-defined effects
> ..........................................................
>
> The force feedback protocol [4] should be used to control predefined effe=
cts.
>
> Typical use of the force feedback protocol requires loading effects to th=
e
> driver by describing the output waveform, and then requesting those effec=
ts
> using an ID provided by the driver. However, for haptic touchpads we do n=
ot want
> to describe the output waveform explicitly, but use a set of predefined e=
ffects,
> which are identified by HID usage.
>
> The force feedback protocol will need to be extended to allow requests fo=
r HID
> haptic effects. This requires a new feedback effect type:
>
> /**
>  * struct ff_haptic_effect
>  * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
>  * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defin=
ed
>  * range
>  * @vendor_id: the vendor waveform page if hid_usage is in the vendor-def=
ined
>  * range
>  * @intensity: strength of the effect
>  * @repeat_count: number of times to retrigger effect
>  * @retrigger_period: time before effect is retriggered (in ms)
>  */
> struct ff_haptic_effect {
>         __u16 hid_usage;
>         __u16 vendor_id;
>         __u8  vendor_waveform_page;
>         __s16 intensity;
>         __u16 repeat_count;
>         __u16 retrigger_period;
> }
>
> Since the standard waveform id namespace does not overlap with the vendor
> waveform id namespace, the vendor id and page can be ignored for standard
> waveforms.
>
> Click and release control
> .........................
>
> Haptic functionality shall be gated behind the HID_MULTITOUCH_HAPTIC kern=
el
> configuration option, and this kernel configuration option should only be
> enabled if userspace will support haptic capabilities. Haptic functionali=
ty will
> only be initialized and used if HID_MULTITOUCH_HAPTIC is enabled, and if =
the
> following conditions have been met:
> * ABS_MT_PRESSURE is defined and reporting force units of Newtons or gram=
s.
> * The device supports haptic effects according to the hid protocol define=
d in
>   HUTRR63 [3].
> These checks will happen when the driver probes and initializes the multi=
touch
> device.
>
> In the case when the kernel configuration option has been set and the dev=
ice
> reports pressure and haptic effects as defined above, the kernel will ini=
tialize
> the haptic device and configure the haptic driver to signal that the touc=
hpad is
> haptic-compatible. To signal to userspace that the touchpad is haptic-com=
patible
> the kernel will mark INPUT_PROP_HAPTIC_TOUCHPAD.
>
> With userspace willing and able to take control, the kernel will signal t=
o the
> device to exit device-controlled mode once a WAVEFORMPRESS or WAVEFORMREL=
EASE
> event is uploaded. From here, userspace will take control over press/rele=
ase
> haptic feedback, relying on the effects sent by the kernel.
>
> In all other cases, the driver will take no action to enable haptic
> functionality.
>
> Summary of normal use-case
> 1. The kernel waits for userspace to upload WAVEFORMPRESS or
>    WAVEFORMRELEASE.
> 2. Userspace determines when a click has been performed based on its own
>    criteria and tells the touchpad to perform a haptic effect.
> 3. When userspace erases the WAVEFORMPRESS or WAVEFORMRELEASE effect, sig=
nal the
>    device to return to device-controlled mode.
>
> [0]: https://www.spinics.net/lists/linux-input/msg60938.html
> [1]: https://learn.microsoft.com/en-us/windows-hardware/design/component-=
guidelines/touchpad-devices
> [2]: Usage ID 0x30 of HID usage table 0x0D. See chapter 16:
>      https://www.usb.org/sites/default/files/documents/hut1_12v2.pdf
> [3]: https://www.usb.org/sites/default/files/hutrr63b_-_haptics_page_redl=
ine_0.pdf
> [4]: https://www.kernel.org/doc/html/v4.20/input/ff.html
>
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
> Changes in v3:
> - Change CONFIG_HID_HAPTIC from bool to tristate
> - Fix devm_kzalloc calls in hid-multitouch.c to use correct device
> - Minor comment cleanup + grammar fix
> - Link to v2: https://lore.kernel.org/r/20250818-support-forcepads-v2-0-c=
a2546e319d5@google.com
>
> Changes in v2:
> - Rename FF_HID and ff_hid_effect to FF_HAPTIC and ff_haptic_effect
> - Add more detail to CONFIG_HID_HAPTIC config option description
> - Remove CONFIG_MULTITOUCH_HAPTIC config option
> - Utilize devm api in hid-multitouch haptic functions
> - Link to v1: https://lore.kernel.org/all/20250714-support-forcepads-v1-0=
-71c7c05748c9@google.com
>
> ---
> Angela Czubak (11):
>       HID: add haptics page defines
>       Input: add FF_HAPTIC effect type
>       Input: add INPUT_PROP_HAPTIC_TOUCHPAD
>       HID: haptic: introduce hid_haptic_device
>       HID: input: allow mapping of haptic output
>       HID: haptic: initialize haptic device
>       HID: input: calculate resolution for pressure
>       HID: haptic: add functions handling events
>       Input: MT - add INPUT_MT_TOTAL_FORCE flags
>       HID: haptic: add hid_haptic_switch_mode
>       HID: multitouch: add haptic multitouch support
>
>  Documentation/input/event-codes.rst    |  14 +
>  drivers/hid/Kconfig                    |  11 +
>  drivers/hid/Makefile                   |   1 +
>  drivers/hid/hid-haptic.c               | 580 +++++++++++++++++++++++++++=
++++++
>  drivers/hid/hid-haptic.h               | 127 ++++++++
>  drivers/hid/hid-input.c                |  18 +-
>  drivers/hid/hid-multitouch.c           |  47 +++
>  drivers/input/input-mt.c               |  14 +-
>  include/linux/hid.h                    |  29 ++
>  include/linux/input/mt.h               |   1 +
>  include/uapi/linux/input-event-codes.h |   1 +
>  include/uapi/linux/input.h             |  22 +-
>  12 files changed, 858 insertions(+), 7 deletions(-)
> ---
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> change-id: 20250625-support-forcepads-0b4f74fd3d0a
>
> Best regards,
> --
> Jonathan Denose <jdenose@google.com>
>
Hi all,

Please let me know if there is anything else needed from me.

Thanks!
--=20
Jonathan

