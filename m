Return-Path: <linux-input+bounces-14730-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B040B57DB1
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 15:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D7704C139B
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 13:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34FA31A57E;
	Mon, 15 Sep 2025 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/nlIZIQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95661319861;
	Mon, 15 Sep 2025 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943714; cv=none; b=XuCvSwdvzWzKNNdMRTjhQpj0s7pftsF5EqHPyED1dGRTuln9JytzfSZv77w1tkAfd0jPPyokNXLjbbbKHmC1d3k6Akon+WN7HNkRLV/dH6VYinwbDIaZnAuTLf9k0D40AtSNsCV4JxZOwCiM3tNHV5Ys7zB6n04czTx6vaUdtgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943714; c=relaxed/simple;
	bh=/FBsuX29rP3B1mQGOZwFM/E0aCWgQ6T7919UXwVwHPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLXteMf58RbhjlhZYFRIRk0/YwIKsqoFeMS6nUQh6Enb/xGwO+ELhkwBIBFDZXbcaUFY3pjZPUzbr6TzyznIF34qnTeMSiL4IjyMzvGK9a0GSfhEpBoRSo6tsKca5kKbRlZQYTjtjzsNieBtwmbYoJ4S7SHID1Rdnblmu1DHXGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/nlIZIQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E3AC4CEF1;
	Mon, 15 Sep 2025 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757943714;
	bh=/FBsuX29rP3B1mQGOZwFM/E0aCWgQ6T7919UXwVwHPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/nlIZIQDuYDFgQDDeyp0LiE7e5HYlXzcaOrEUteISbpIvcr72Heu2O4S5UHlvBRJ
	 V94bkH/QUQIpMQu8OLVoMJiaB65aRr0okbIoAGq3zuSID37oUy1ZuEC0HDGRD9NC3n
	 Of6oq6m7p4/KUykxuOEc32u71EMtHKF7QmUhTWjgSQ2WeCRizi0VgCNqklhAjgFBDk
	 PKhgRk77hG88jStKJe2jmv3dcu+NP0DEAzITkh+yEXuM22zXCib44rVq0D9SkHd8DS
	 yVuyJjaiC+T8sQsmH8aeLG0ZGsgiJTSgfWQgxwIcG3YEFj7SZLXOX3eVsIb+F+zSYF
	 BdjjmKGPDbovA==
Date: Mon, 15 Sep 2025 15:41:49 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 00/11] HID: Implement haptic touchpad support
Message-ID: <or4jrgyufc7zleigrgik2xblyi7tm2wmq47wqs46mo7y4b4wqn@74mvzg3v5v6i>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>

On Aug 18 2025, Jonathan Denose wrote:
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

Applied to hid/hid.git (for-6.18/haptic), thanks!

[01/11] HID: add haptics page defines
        https://git.kernel.org/hid/hid/c/5e0ae59159e3
[02/11] Input: add FF_HAPTIC effect type
        https://git.kernel.org/hid/hid/c/08a72a220e96
[03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
        https://git.kernel.org/hid/hid/c/7075ae4ac9db
[04/11] HID: haptic: introduce hid_haptic_device
        https://git.kernel.org/hid/hid/c/b44779d44f71
[05/11] HID: input: allow mapping of haptic output
        https://git.kernel.org/hid/hid/c/7a56e7b211e5
[06/11] HID: haptic: initialize haptic device
        https://git.kernel.org/hid/hid/c/344ff3584957
[07/11] HID: input: calculate resolution for pressure
        https://git.kernel.org/hid/hid/c/7657bf0b7cfb
[08/11] HID: haptic: add functions handling events
        https://git.kernel.org/hid/hid/c/a77efca3aa85
[09/11] Input: MT - add INPUT_MT_TOTAL_FORCE flags
        https://git.kernel.org/hid/hid/c/4e584ac73788
[10/11] HID: haptic: add hid_haptic_switch_mode
        https://git.kernel.org/hid/hid/c/ff66b8eebbab
[11/11] HID: multitouch: add haptic multitouch support
        https://git.kernel.org/hid/hid/c/8d0bf7908b5a

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


> Thank you,
> 
> Jonathan Denose
> Chromium OS Team
> 
> Background
> ==========
> 
> There are multiple independent projects to develop a touchpad with force sensors
> and haptic actuators, instead of a traditional button.  These haptic touchpads
> have several advantages and potential uses; they allow clicking across the
> entire touchpad surface, adjusting the force requirement for clicks, haptic
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
> ==========
> 
> Develop a standard protocol to allow userspace applications to communicate with
> haptic touchpads, and minimize duplicated code and effort.
> 
> Requirements:
> 1. Support UI-initiated haptic feedback.
> 2. Allow userspace to control when button press and button release haptic
>    effects are triggered. (Useful when detecting a false click, changing force
>    thresholds, or sending context-dependent effects).
> 3. Reveal force sensor readings to userspace applications.
> 4. Only allow OS-controlled haptic feedback for those systems which support it.
> 
> Proposal
> ========
> 
> In order to minimize duplicated effort, we propose standardized haptic touchpad
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
> (HID_HAPTIC_MODE_DEVICE), meaning it acts as a normal touchpad. This means it
> should perform the press and release haptic feedback autonomously at predefined
> force thresholds, and send the appropriate BTN_* events.
> 
> 2. Host-controlled mode
> 
> Once the touchpad has been confirmed as supporting haptics (described in more
> detail in the the "Click and release control" section below), the device should
> enter "host-controlled mode" (HID_HAPTIC_MODE_HOST). In this mode userspace
> should take control. From here, userspace will take control over
> press/release haptic feedback, relying on the effects sent by the kernel.
> 
> Multitouch
> ..........
> 
> The HID API for multitouch reports should follow the Microsoft precision
> touchpad spec [1], with the following changes:
> * A tip pressure field [2] should be used to report the force. The physical unit
>   Type (Newtons or grams), exponent, and limits should be reported in the
>   report descriptor for the force field.
> * The device will always report the button state according to its predefined
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
> | WAVEFORMNONE             | Implicit waveforms required by protocol           |
> | WAVEFORMSTOP             |                                                   |
> | ------------------------ | ------------------------------------------------- |
> | WAVEFORMPRESS            | To be used to simulate button press. In device-   |
> |                          | controlled mode, it will also be used to simulate |
> |                          | button release.                                   |
> | ------------------------ | ------------------------------------------------- |
> | WAVEFORMRELEASE          | To be used to simulate button release.            |
> 
> All waveforms will have an associated duration; continuous waveforms will be
> ignored by the kernel.
> 
> Triggers & Mode switching
> .........................
> 
> The “auto trigger waveform” should be set to WAVEFORM_PRESS by default, and the
> button from the touchpad collection should be set as the “auto trigger
> associated control”.
> 
> The kernel can trigger the different modes in the following ways:
> * Device-controlled mode can be enabled by setting the “auto trigger waveform” to
>   WAVEFORM_PRESS.
> * Host-controlled mode can be enabled by setting the "auto trigger waveform" to
>   WAVEFORM_STOP.
> 
> The device must also support manual triggering. If intensity modification for
> waveforms is supported by the device, the intensity control should be included
> in the manual trigger output report. This allows modification of the intensity
> on a per-waveform basis. Retriggering does not need to be supported by the
> device.
> 
> Userspace API
> -------------
> 
> Multitouch protocol
> ...................
> 
> ABS_MT_PRESSURE will be used to report force. The resolution of ABS_MT_PRESSURE
> should also be defined and reported in force units of grams or Newtons.
> ABS_PRESSURE should be reported as the total force applied to the touchpad.
> When the kernel is in host-controlled mode, it should always forward the button
> press and release events to userspace.
> 
> Use Force Feedback protocol to request pre-defined effects
> ..........................................................
> 
> The force feedback protocol [4] should be used to control predefined effects.
> 
> Typical use of the force feedback protocol requires loading effects to the
> driver by describing the output waveform, and then requesting those effects
> using an ID provided by the driver. However, for haptic touchpads we do not want
> to describe the output waveform explicitly, but use a set of predefined effects,
> which are identified by HID usage.
> 
> The force feedback protocol will need to be extended to allow requests for HID
> haptic effects. This requires a new feedback effect type:
> 
> /**
>  * struct ff_haptic_effect
>  * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
>  * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defined
>  * range
>  * @vendor_id: the vendor waveform page if hid_usage is in the vendor-defined
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
> Haptic functionality shall be gated behind the HID_MULTITOUCH_HAPTIC kernel
> configuration option, and this kernel configuration option should only be
> enabled if userspace will support haptic capabilities. Haptic functionality will
> only be initialized and used if HID_MULTITOUCH_HAPTIC is enabled, and if the
> following conditions have been met:
> * ABS_MT_PRESSURE is defined and reporting force units of Newtons or grams.
> * The device supports haptic effects according to the hid protocol defined in
>   HUTRR63 [3].
> These checks will happen when the driver probes and initializes the multitouch
> device.
> 
> In the case when the kernel configuration option has been set and the device
> reports pressure and haptic effects as defined above, the kernel will initialize
> the haptic device and configure the haptic driver to signal that the touchpad is
> haptic-compatible. To signal to userspace that the touchpad is haptic-compatible
> the kernel will mark INPUT_PROP_HAPTIC_TOUCHPAD.
> 
> With userspace willing and able to take control, the kernel will signal to the
> device to exit device-controlled mode once a WAVEFORMPRESS or WAVEFORMRELEASE
> event is uploaded. From here, userspace will take control over press/release
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
> 3. When userspace erases the WAVEFORMPRESS or WAVEFORMRELEASE effect, signal the
>    device to return to device-controlled mode.
> 
> [0]: https://www.spinics.net/lists/linux-input/msg60938.html
> [1]: https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/touchpad-devices
> [2]: Usage ID 0x30 of HID usage table 0x0D. See chapter 16:
>      https://www.usb.org/sites/default/files/documents/hut1_12v2.pdf
> [3]: https://www.usb.org/sites/default/files/hutrr63b_-_haptics_page_redline_0.pdf
> [4]: https://www.kernel.org/doc/html/v4.20/input/ff.html
> 
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
> Changes in v3:
> - Change CONFIG_HID_HAPTIC from bool to tristate
> - Fix devm_kzalloc calls in hid-multitouch.c to use correct device
> - Minor comment cleanup + grammar fix
> - Link to v2: https://lore.kernel.org/r/20250818-support-forcepads-v2-0-ca2546e319d5@google.com
> 
> Changes in v2:
> - Rename FF_HID and ff_hid_effect to FF_HAPTIC and ff_haptic_effect
> - Add more detail to CONFIG_HID_HAPTIC config option description
> - Remove CONFIG_MULTITOUCH_HAPTIC config option
> - Utilize devm api in hid-multitouch haptic functions
> - Link to v1: https://lore.kernel.org/all/20250714-support-forcepads-v1-0-71c7c05748c9@google.com
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
>  drivers/hid/hid-haptic.c               | 580 +++++++++++++++++++++++++++++++++
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

