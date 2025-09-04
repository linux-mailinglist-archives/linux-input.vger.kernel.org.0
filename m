Return-Path: <linux-input+bounces-14473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2008BB437DD
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 12:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7681B22E09
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 10:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536C32EC08B;
	Thu,  4 Sep 2025 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdmcYFwk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C42D839E;
	Thu,  4 Sep 2025 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980161; cv=none; b=G9mnQtahx0PW86MRYcbRQQulrKCPJJJFTqE0mM11N0cGjNC9lATDSJHyWUQz/x7iLBqqnh5GuhIL22ZMUzZ9KHdf6gy2IvYc56ThdsuoY6HX0Dob+Y3r0KA1kde30oCJnYJzhJ5KPsvO+4mfmHNPWdCsgY1wK3+S3WZrdcJpnyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980161; c=relaxed/simple;
	bh=G9oD2Jar+WBoNITD/6b8bDhkhI4zfLlgPeYmXoXP9PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWZxbPO6CyA7zAis1Gc46vjmwVCoOR0ni2C71+UTPTn1wGM1N348DAa7P85LyVY9SgR7PAUkiLedVNrRc36D9rlbmkpcC0I4yT6LhgaQn87+tOSYDa+pPOZW6ae3AyIinc1A0DV15Gq9cHhvY4hDRAs/XbThazLxFqksGX0FTj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdmcYFwk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F9DC4CEF0;
	Thu,  4 Sep 2025 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756980160;
	bh=G9oD2Jar+WBoNITD/6b8bDhkhI4zfLlgPeYmXoXP9PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdmcYFwkE7qw/EzVrYKlGzBUCbDRPeWVbHjSXhQfHXv021S4sW/xLPj/kH9giDCxp
	 jeaKMKR2bDFrUduPep1e+YhWdsS115Fo1bUtmPAv2my6vC3JiArHmc8HQUl1OaXZre
	 7X0gj1r5aKoXh/xmKjDOBLb0YpzvFI0KUf4464DKAKFh3HvPKYtjsdzxdeDG4rgqAM
	 wB0kM0Dur57kZCyZ4tEGRmljxlm3YWQFmV2/iagbMNABQ0JFZKuzAx6xKsTG8mXXv3
	 gMHoDFuWlyQzx/HdAhKhPDiHm5WXiCCkh4/DBuODPQOFHIDiXK505msl4YIfmTTu2H
	 3LJrE1DZGnowg==
Date: Thu, 4 Sep 2025 12:02:35 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 00/11] HID: Implement haptic touchpad support
Message-ID: <vyhhm3x6nfdfw6gbgluq3sjr6bzamhear7nec6xdi5wfxq7wcz@cx2egj4yr5sp>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <CAMCVhVOUn-un9N_Bv00RVJ7kAw1O+AHgAHOzSGM6UuMBZVdtYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVOUn-un9N_Bv00RVJ7kAw1O+AHgAHOzSGM6UuMBZVdtYw@mail.gmail.com>

On Sep 02 2025, Jonathan Denose wrote:
> On Mon, Aug 18, 2025 at 6:10 PM Jonathan Denose <jdenose@google.com> wrote:
> >
> > Hello,
> >
> > This is an updated implementation of the interface for controlling haptic
> > touchpads.
> >
> > Below is an updated design proposal for the userspace and HID interfaces,
> > modified from what one of my colleagues submitted in 2019 [0].
> >
> > We would appreciate any feedback you might have.
> >
> > Thank you,
> >
> > Jonathan Denose
> > Chromium OS Team
> >
> > Background
> > ==========
> >
> > There are multiple independent projects to develop a touchpad with force sensors
> > and haptic actuators, instead of a traditional button.  These haptic touchpads
> > have several advantages and potential uses; they allow clicking across the
> > entire touchpad surface, adjusting the force requirement for clicks, haptic
> > feedback initiated by UI, etc. Supporting these features will potentially
> > require two new communication channels at the kernel level:
> > * Control of haptic motor by the host
> > * Force sensor data from device to host
> >
> > This document includes two related proposals:
> > 1. HID design proposal, that hardware makers would need to implement
> > 2. Kernel design proposal
> >
> > Objective
> > ==========
> >
> > Develop a standard protocol to allow userspace applications to communicate with
> > haptic touchpads, and minimize duplicated code and effort.
> >
> > Requirements:
> > 1. Support UI-initiated haptic feedback.
> > 2. Allow userspace to control when button press and button release haptic
> >    effects are triggered. (Useful when detecting a false click, changing force
> >    thresholds, or sending context-dependent effects).
> > 3. Reveal force sensor readings to userspace applications.
> > 4. Only allow OS-controlled haptic feedback for those systems which support it.
> >
> > Proposal
> > ========
> >
> > In order to minimize duplicated effort, we propose standardized haptic touchpad
> > support in the linux kernel.
> >
> > HID API
> > -------
> >
> > Modes
> > .....
> >
> > The haptic touchpad should be able to operate under two different modes.
> >
> > 1. Device-controlled mode
> >
> > The haptic touchpad should start up in "device-controlled mode"
> > (HID_HAPTIC_MODE_DEVICE), meaning it acts as a normal touchpad. This means it
> > should perform the press and release haptic feedback autonomously at predefined
> > force thresholds, and send the appropriate BTN_* events.
> >
> > 2. Host-controlled mode
> >
> > Once the touchpad has been confirmed as supporting haptics (described in more
> > detail in the the "Click and release control" section below), the device should
> > enter "host-controlled mode" (HID_HAPTIC_MODE_HOST). In this mode userspace
> > should take control. From here, userspace will take control over
> > press/release haptic feedback, relying on the effects sent by the kernel.
> >
> > Multitouch
> > ..........
> >
> > The HID API for multitouch reports should follow the Microsoft precision
> > touchpad spec [1], with the following changes:
> > * A tip pressure field [2] should be used to report the force. The physical unit
> >   Type (Newtons or grams), exponent, and limits should be reported in the
> >   report descriptor for the force field.
> > * The device will always report the button state according to its predefined
> >   force thresholds, even when not in device-controlled mode.
> > * The device must expose a "simple haptic controller" logical collection
> >   alongside the touchpad collection.
> >
> > Haptic control
> > ..............
> >
> > The HID protocol described in HUTRR63[3] must be used.
> >
> > The following waveforms should be supported:
> >
> > | WAVEFORMNONE             | Implicit waveforms required by protocol           |
> > | WAVEFORMSTOP             |                                                   |
> > | ------------------------ | ------------------------------------------------- |
> > | WAVEFORMPRESS            | To be used to simulate button press. In device-   |
> > |                          | controlled mode, it will also be used to simulate |
> > |                          | button release.                                   |
> > | ------------------------ | ------------------------------------------------- |
> > | WAVEFORMRELEASE          | To be used to simulate button release.            |
> >
> > All waveforms will have an associated duration; continuous waveforms will be
> > ignored by the kernel.
> >
> > Triggers & Mode switching
> > .........................
> >
> > The “auto trigger waveform” should be set to WAVEFORM_PRESS by default, and the
> > button from the touchpad collection should be set as the “auto trigger
> > associated control”.
> >
> > The kernel can trigger the different modes in the following ways:
> > * Device-controlled mode can be enabled by setting the “auto trigger waveform” to
> >   WAVEFORM_PRESS.
> > * Host-controlled mode can be enabled by setting the "auto trigger waveform" to
> >   WAVEFORM_STOP.
> >
> > The device must also support manual triggering. If intensity modification for
> > waveforms is supported by the device, the intensity control should be included
> > in the manual trigger output report. This allows modification of the intensity
> > on a per-waveform basis. Retriggering does not need to be supported by the
> > device.
> >
> > Userspace API
> > -------------
> >
> > Multitouch protocol
> > ...................
> >
> > ABS_MT_PRESSURE will be used to report force. The resolution of ABS_MT_PRESSURE
> > should also be defined and reported in force units of grams or Newtons.
> > ABS_PRESSURE should be reported as the total force applied to the touchpad.
> > When the kernel is in host-controlled mode, it should always forward the button
> > press and release events to userspace.
> >
> > Use Force Feedback protocol to request pre-defined effects
> > ..........................................................
> >
> > The force feedback protocol [4] should be used to control predefined effects.
> >
> > Typical use of the force feedback protocol requires loading effects to the
> > driver by describing the output waveform, and then requesting those effects
> > using an ID provided by the driver. However, for haptic touchpads we do not want
> > to describe the output waveform explicitly, but use a set of predefined effects,
> > which are identified by HID usage.
> >
> > The force feedback protocol will need to be extended to allow requests for HID
> > haptic effects. This requires a new feedback effect type:
> >
> > /**
> >  * struct ff_haptic_effect
> >  * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
> >  * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defined
> >  * range
> >  * @vendor_id: the vendor waveform page if hid_usage is in the vendor-defined
> >  * range
> >  * @intensity: strength of the effect
> >  * @repeat_count: number of times to retrigger effect
> >  * @retrigger_period: time before effect is retriggered (in ms)
> >  */
> > struct ff_haptic_effect {
> >         __u16 hid_usage;
> >         __u16 vendor_id;
> >         __u8  vendor_waveform_page;
> >         __s16 intensity;
> >         __u16 repeat_count;
> >         __u16 retrigger_period;
> > }
> >
> > Since the standard waveform id namespace does not overlap with the vendor
> > waveform id namespace, the vendor id and page can be ignored for standard
> > waveforms.
> >
> > Click and release control
> > .........................
> >
> > Haptic functionality shall be gated behind the HID_MULTITOUCH_HAPTIC kernel
> > configuration option, and this kernel configuration option should only be
> > enabled if userspace will support haptic capabilities. Haptic functionality will
> > only be initialized and used if HID_MULTITOUCH_HAPTIC is enabled, and if the
> > following conditions have been met:
> > * ABS_MT_PRESSURE is defined and reporting force units of Newtons or grams.
> > * The device supports haptic effects according to the hid protocol defined in
> >   HUTRR63 [3].
> > These checks will happen when the driver probes and initializes the multitouch
> > device.
> >
> > In the case when the kernel configuration option has been set and the device
> > reports pressure and haptic effects as defined above, the kernel will initialize
> > the haptic device and configure the haptic driver to signal that the touchpad is
> > haptic-compatible. To signal to userspace that the touchpad is haptic-compatible
> > the kernel will mark INPUT_PROP_HAPTIC_TOUCHPAD.
> >
> > With userspace willing and able to take control, the kernel will signal to the
> > device to exit device-controlled mode once a WAVEFORMPRESS or WAVEFORMRELEASE
> > event is uploaded. From here, userspace will take control over press/release
> > haptic feedback, relying on the effects sent by the kernel.
> >
> > In all other cases, the driver will take no action to enable haptic
> > functionality.
> >
> > Summary of normal use-case
> > 1. The kernel waits for userspace to upload WAVEFORMPRESS or
> >    WAVEFORMRELEASE.
> > 2. Userspace determines when a click has been performed based on its own
> >    criteria and tells the touchpad to perform a haptic effect.
> > 3. When userspace erases the WAVEFORMPRESS or WAVEFORMRELEASE effect, signal the
> >    device to return to device-controlled mode.
> >
> > [0]: https://www.spinics.net/lists/linux-input/msg60938.html
> > [1]: https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/touchpad-devices
> > [2]: Usage ID 0x30 of HID usage table 0x0D. See chapter 16:
> >      https://www.usb.org/sites/default/files/documents/hut1_12v2.pdf
> > [3]: https://www.usb.org/sites/default/files/hutrr63b_-_haptics_page_redline_0.pdf
> > [4]: https://www.kernel.org/doc/html/v4.20/input/ff.html
> >
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > ---
> > Changes in v3:
> > - Change CONFIG_HID_HAPTIC from bool to tristate
> > - Fix devm_kzalloc calls in hid-multitouch.c to use correct device
> > - Minor comment cleanup + grammar fix
> > - Link to v2: https://lore.kernel.org/r/20250818-support-forcepads-v2-0-ca2546e319d5@google.com
> >
> > Changes in v2:
> > - Rename FF_HID and ff_hid_effect to FF_HAPTIC and ff_haptic_effect
> > - Add more detail to CONFIG_HID_HAPTIC config option description
> > - Remove CONFIG_MULTITOUCH_HAPTIC config option
> > - Utilize devm api in hid-multitouch haptic functions
> > - Link to v1: https://lore.kernel.org/all/20250714-support-forcepads-v1-0-71c7c05748c9@google.com
> >
> > ---
> > Angela Czubak (11):
> >       HID: add haptics page defines
> >       Input: add FF_HAPTIC effect type
> >       Input: add INPUT_PROP_HAPTIC_TOUCHPAD
> >       HID: haptic: introduce hid_haptic_device
> >       HID: input: allow mapping of haptic output
> >       HID: haptic: initialize haptic device
> >       HID: input: calculate resolution for pressure
> >       HID: haptic: add functions handling events
> >       Input: MT - add INPUT_MT_TOTAL_FORCE flags
> >       HID: haptic: add hid_haptic_switch_mode
> >       HID: multitouch: add haptic multitouch support
> >
> >  Documentation/input/event-codes.rst    |  14 +
> >  drivers/hid/Kconfig                    |  11 +
> >  drivers/hid/Makefile                   |   1 +
> >  drivers/hid/hid-haptic.c               | 580 +++++++++++++++++++++++++++++++++
> >  drivers/hid/hid-haptic.h               | 127 ++++++++
> >  drivers/hid/hid-input.c                |  18 +-
> >  drivers/hid/hid-multitouch.c           |  47 +++
> >  drivers/input/input-mt.c               |  14 +-
> >  include/linux/hid.h                    |  29 ++
> >  include/linux/input/mt.h               |   1 +
> >  include/uapi/linux/input-event-codes.h |   1 +
> >  include/uapi/linux/input.h             |  22 +-
> >  12 files changed, 858 insertions(+), 7 deletions(-)
> > ---
> > base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> > change-id: 20250625-support-forcepads-0b4f74fd3d0a
> >
> > Best regards,
> > --
> > Jonathan Denose <jdenose@google.com>
> >
> Hi all,
> 
> Please let me know if there is anything else needed from me.
> 

Dmitry, I've just re-reviewed and tested this series. I'm fine with it.
Can you give us your ack on the input bits?

Cheers,
Benjamin

