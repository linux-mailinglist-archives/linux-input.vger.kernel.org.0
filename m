Return-Path: <linux-input+bounces-16590-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C5CBF2C4
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 18:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1085D30DC7F9
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 17:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFF333A6FC;
	Mon, 15 Dec 2025 16:51:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF6A33A6FA;
	Mon, 15 Dec 2025 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765817487; cv=none; b=exFQRGVbXTjY8zkcniJxYeB+pMnAdhztk0EhCzhe9mPf62LnzhMbsFfjLlX5XOU29FWyPqwgq4t7kG6wRgUC8h7Y3hiYWjkDFMsOYSJVPh4HvBBDylGmVXaBQUIviqSRH5WhjTmzD8ginaRHTDo/HecBdmD9FDWFzZ561e48VKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765817487; c=relaxed/simple;
	bh=zGoXv335IRjCfuXFYOFLi+dXqHBGdP8pX5L8Tlf/UUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNJU+QnUduiOhKo9r/2iugIqpKaBGcw5FNCfSFIvvFvF9HXgPPkmlOOKZxaE/ml4nDHjgygce1qu70VvpX3NEONKpDFV+C1bISQAdj7s9jKME43gR2sgb931tsuWVqf3TCpMXj20tA4pFLnEgn49ujKvW8YeZLORtq92bX5mf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id DCB7A72C8CC;
	Mon, 15 Dec 2025 19:51:22 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id CF9637CCB3A; Mon, 15 Dec 2025 18:51:22 +0200 (IST)
Date: Mon, 15 Dec 2025 18:51:22 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to
 INPUT_PROP_PRESSUREPAD
Message-ID: <20251215165122.GB32290@strace.io>
References: <20251030011735.GA969565@quokka>
 <20251106114534.GA405512@tassie>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106114534.GA405512@tassie>

Hi,

On Thu, Nov 06, 2025 at 09:45:34PM +1000, Peter Hutterer wrote:
> And expand it to encompass all pressure pads.
> 
> Definition: "pressure pad" as used here as includes all touchpads that
> use physical pressure to convert to click, without physical hinges. Also
> called haptic touchpads in general parlance, Synaptics calls them
> ForcePads.
> 
> Most (all?) pressure pads are currently advertised as
> INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> commit 20ccc8dd38a3 ("Documentation: input: define
> ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> provide this information.
> 
> In userspace it's thus impossible to determine whether a device is a
> true pressure pad (pressure equals pressure) or a normal clickpad with
> (pressure equals finger size).
> 
> Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> have support for userspace-controlled effects. Let's expand and rename
> that definition to include all pressure pad touchpads since those that
> do support FF effects can be identified by the presence of the
> FF_HAPTIC bit.
> 
> This means:
> - clickpad: INPUT_PROP_BUTTONPAD
> - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD
> - pressurepad with configurable haptics:
>   INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD + FF_HAPTIC
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> ---
> ftr, I picked PRESSUREPAD over Dmitry's PRESSURE_TOUCHPAD suggestion
> because it matches better with the existing BUTTONPAD.
> 
> Changes to v1: extra empty lines to render the lists as lists
> Changes to v2: rename to PRESSUREPAD and rename it in the instances
>   where it's used in the code
> 
> v1: https://lore.kernel.org/linux-input/20251030011735.GA969565@quokka/T/#u
> v2: https://lore.kernel.org/linux-input/20251030011735.GA969565@quokka/T/#m9504de27b02d00a55d540fd9fec9aed3edd0133c
> 
>  Documentation/input/event-codes.rst    | 25 ++++++++++++++++++-------
>  drivers/hid/hid-haptic.c               |  2 +-
>  include/uapi/linux/input-event-codes.h |  2 +-
>  3 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> index 1ead9bb8d9c6..4424cbff251f 100644
> --- a/Documentation/input/event-codes.rst
> +++ b/Documentation/input/event-codes.rst
> @@ -400,19 +400,30 @@ can report through the rotational axes (absolute and/or relative rx, ry, rz).
>  All other axes retain their meaning. A device must not mix
>  regular directional axes and accelerometer axes on the same event node.
>  
> -INPUT_PROP_HAPTIC_TOUCHPAD
> ---------------------------
> +INPUT_PROP_PRESSUREPAD
> +----------------------
> +
> +The INPUT_PROP_PRESSUREPAD property indicates that the device provides
> +simulated haptic feedback (e.g. a vibrator motor situated below the surface)
> +instead of physical haptic feedback (e.g. a hinge). This property is only set
> +if the device:
>  
> -The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
> -- supports simple haptic auto and manual triggering
>  - can differentiate between at least 5 fingers
>  - uses correct resolution for the X/Y (units and value)
> -- reports correct force per touch, and correct units for them (newtons or grams)
>  - follows the MT protocol type B
>  
> +If the simulated haptic feedback is controllable by userspace the device must:
> +
> +- support simple haptic auto and manual triggering, and
> +- report correct force per touch, and correct units for them (newtons or grams), and
> +- provide the EV_FF FF_HAPTIC force feedback effect.
> +
>  Summing up, such devices follow the MS spec for input devices in
> -Win8 and Win8.1, and in addition support the Simple haptic controller HID table,
> -and report correct units for the pressure.
> +Win8 and Win8.1, and in addition may support the Simple haptic controller HID
> +table, and report correct units for the pressure.
> +
> +Where applicable, this property is set in addition to INPUT_PROP_BUTTONPAD, it
> +does not replace that property.
>  
>  Guidelines
>  ==========
> diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
> index aa090684c1f2..fc8a9997f815 100644
> --- a/drivers/hid/hid-haptic.c
> +++ b/drivers/hid/hid-haptic.c
> @@ -86,7 +86,7 @@ int hid_haptic_input_configured(struct hid_device *hdev,
>  	if (hi->application == HID_DG_TOUCHPAD) {
>  		if (haptic->auto_trigger_report &&
>  		    haptic->manual_trigger_report) {
> -			__set_bit(INPUT_PROP_HAPTIC_TOUCHPAD, hi->input->propbit);
> +			__set_bit(INPUT_PROP_PRESSUREPAD, hi->input->propbit);
>  			return 1;
>  		}
>  		return 0;
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 8ba48590bd2c..d21172c6a266 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -27,7 +27,7 @@
>  #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
>  #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
>  #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
> -#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
> +#define INPUT_PROP_PRESSUREPAD		0x07	/* pressure triggers clicks */
>  
>  #define INPUT_PROP_MAX			0x1f
>  #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)

When you rename UAPI constants, please don't forget to retain old names,
otherwise there is a high chance you'll break userspace.
This time you've broken the build of strace.


-- 
ldv

