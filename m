Return-Path: <linux-input+bounces-15795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C2C1E083
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 02:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F15F8188CED5
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 01:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB54287272;
	Thu, 30 Oct 2025 01:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VZnkMGZA"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14758126BF1;
	Thu, 30 Oct 2025 01:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761788135; cv=none; b=aEJMJ0A8geqfMvo2DWyU/3vz0Ec0MopXrt2EJ9FfkegBrbOcrJ0cT7Vkn8xrywRoI4VcNrARS99wjP3C7EE8Ldmk/h0A5eynj1/316YEIkcvEH/2gic50wNxkM7lsNMSgRSbIYUNWA/Kv5/qWj1Klb/sNg4uakWI2YV/c7taVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761788135; c=relaxed/simple;
	bh=3ZvXNTRQF9vLAa2yTsTcBzleKVLlMdappktmXpqMvQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2w4jEzWsiukOH4Gi+Dc0jwAir5cy/IpQaP4Gsin1MWmSQ/Ujfay3yj219apflR/ZoMw33XvvSnY2MVzaIyS2Qs2UAVOBYNOri3r2qk7w4qTvdTmNePZzAAKNPqUyz7iOVlhCdPjYUwXNENGY1nCblDn/+BSbsY4HRt6yvLW30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VZnkMGZA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=I+p3nAqMLI/zIhtuMxwdpUBm1FGCJ5lAvlvbU+1uuPs=; b=VZnkMGZASX46dSzZ4+Aa2XTbnx
	/OWYan8yk1buG1vgVHhr/TWJmxbT9qp2iybS9Py93MXZk8g+sf7wHNytAHoC+4CVR0TZW8NYjzbOZ
	+VsdTTk2BxIgg4fy7F1akRJFj5Kf54X9likzxEizVlq1ihm8bnrHvSc0EMRULPhmvHkidLFcliBHh
	8iuRB1wHwc9XeTrIkRPvTttjg25CdqGAOsVN0A3zRt/usjbfvyrgXEUdTxBd/qy/HF3ONspuN/W8f
	ZNRt7UqVllZz5r6Pua4CpkoP/xVJDWxQVvcYjsgNs4qn8hYYplBUCzvdnIlaWvD/aOtLt993H5vH+
	gnEUqhLg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHZZ-00000003KxJ-20Gu;
	Thu, 30 Oct 2025 01:35:29 +0000
Message-ID: <01992fa4-c982-49e8-9152-e6a716552a3b@infradead.org>
Date: Wed, 29 Oct 2025 18:35:28 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: input: expand INPUT_PROP_HAPTIC_TOUCHPAD
 to all pressure pads
To: Peter Hutterer <peter.hutterer@who-t.net>,
 Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>
References: <20251030011735.GA969565@quokka>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251030011735.GA969565@quokka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/29/25 6:17 PM, Peter Hutterer wrote:
> Definition: "pressure pad" used here as all touchpads that use physical
> pressure to convert to click without physical hinges. Also called haptic
> touchpads in general parlance, Synaptics calls them ForcePads.
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
> have support for userspace-controlled effects. Let's expand that
> definition to include all haptic touchpads (pressure pads) since those
> that do support FF effects can be identified by the presence of the
> FF_HAPTIC bit.
> 
> This means:
> - clickpad: INPUT_PROP_BUTTONPAD
> - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD
> - pressurepad with haptics:
>   INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD + FF_HAPTIC
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> ---
> 
> Original patch series: https://lore.kernel.org/linux-input/20251024033045.GA48918@quokka/T/#m20ec992705f449f9d9758e0080622cfae1c90660
> See my comment there: https://lore.kernel.org/linux-input/20251024033045.GA48918@quokka/T/#u
> 
> My motivation is that we need something to identify pressurepads that
> do not expose actual haptic feedback configuration. Right now we're
> adding quirks for each device in libinput but that doesn't scale and
> HID defines Usage Page 0x0D Usage 0x55 [1] to tell us whether the form
> factor is a pressurepad, we're just not using it (yet).
> 
> I don't think adding a separate INPUT_PROP_PRESSUREPAD is the right
> thing to do - HAPTIC_TOUCHPAD is good enough since presence of the
> FF_HAPTICS bit indicates that it is controllable.
> 
> [1] https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/touchpad-windows-precision-touchpad-collection#device-capabilities-feature-report
> 
> 
>  Documentation/input/event-codes.rst | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git ./Documentation/input/event-codes.rst ../Documentation/input/event-codes.rst
> index 1ead9bb8d9c6..304d11297d3f 100644
> --- a/Documentation/input/event-codes.rst
> +++ b/Documentation/input/event-codes.rst
> @@ -403,16 +403,25 @@ regular directional axes and accelerometer axes on the same event node.
>  INPUT_PROP_HAPTIC_TOUCHPAD
>  --------------------------
>  
> -The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
> -- supports simple haptic auto and manual triggering
> +The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that the device provides
> +simulated haptic feedback (e.g. a vibrator motor situated below the surface)
> +instead of physical haptic feedback (e.g. a hinge). This property is only set
> +if the device:
>  - can differentiate between at least 5 fingers
>  - uses correct resolution for the X/Y (units and value)
> -- reports correct force per touch, and correct units for them (newtons or grams)
>  - follows the MT protocol type B

Looks reasonable to me. But the list above and the one below
are not rendered as lists in html. It would be nice to convert
them to lists.

Tested-by: Randy Dunlap <rdunlap@infradead.org>

>  
> +If the simulated haptic feedback is controllable by userspace the device must:
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

-- 
~Randy

