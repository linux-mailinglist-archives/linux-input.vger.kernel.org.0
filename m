Return-Path: <linux-input+bounces-15908-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3373C3BC9A
	for <lists+linux-input@lfdr.de>; Thu, 06 Nov 2025 15:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 959E51889601
	for <lists+linux-input@lfdr.de>; Thu,  6 Nov 2025 14:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671B73446AE;
	Thu,  6 Nov 2025 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPwBi6ya"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC693446A7;
	Thu,  6 Nov 2025 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439583; cv=none; b=hwp+ZU23EHdB/Zi2ma1rcywMH+hNkgqjmeDG6PORYFJKxLb4OTu7o+b2fE0HXD4qUbUKbLE+FUSOfowHGlpNbU9gzh7ki9r9IoRoGwkd/y+aij2icHhKcXcAryzVNLGb81fvR31PsxkAll7FmfXgSCvpsnSUWSBFQF1QlqOHJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439583; c=relaxed/simple;
	bh=psuLYSy93ExVsEVZx3s7XHqMqfF50LLYwIF/M4aB9bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVEHVzhQ68f0NC9EW1PBe0SkSMLtRutHz01Ky1sQLmHmQNzazv04CVmhtrbaFWpqrvsojHDoaF+CuwEfZAgEMAc5DlLh1d6bd9BeIOASPU8EuoRh4eVr4rkFvja7nW40U4l69xseKaPyLfOvmFAEoIEpiv2KipD2xsDtzC8Tzpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPwBi6ya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3719C116C6;
	Thu,  6 Nov 2025 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762439583;
	bh=psuLYSy93ExVsEVZx3s7XHqMqfF50LLYwIF/M4aB9bM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPwBi6ya2cZEaIS63hfi6kMiEU2BIw7Y2NWDAt3CpX5zC4NXXPCYzpbMx6eASXDDS
	 qV92TjfQVydIK6jXGILBibTnUsTW1QFoLRT83vkHlvxgpPOVjJrkWwiS7Qm15A/DZa
	 pZQvfk05wpXYSP3fo1mz/xQDEfrJrIR04FHMeFLjVhHVCOQX+az4hA4pzM03NgGghJ
	 iZ3OhsYWyIlrmGNgqUwGAYWSH9a2hbfJayTtfvnloZVJhDQ/7yeVUi4vNecjvIg6ZU
	 nsawA7KBrftK4zie16lAZw1exIZWWZ07JMbeSysqNwvajBGpEzyyERegApDmvWz0jP
	 rycMAHVd6Rjqg==
Date: Thu, 6 Nov 2025 15:32:56 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to
 INPUT_PROP_PRESSUREPAD
Message-ID: <c7popmowkdilnthufvne4rednntgae2cxqwdvmd3tkfeji24nl@yhpwili7qobt>
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

On Nov 06 2025, Peter Hutterer wrote:
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

Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Unless Jiri has any problem with it, I guess this would be fine going
through your tree Dmitry.

Cheers,
Benjamin


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
> -- 
> 2.51.1
> 

