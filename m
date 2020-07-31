Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7EF5233F25
	for <lists+linux-input@lfdr.de>; Fri, 31 Jul 2020 08:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731369AbgGaGdw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jul 2020 02:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731224AbgGaGdu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jul 2020 02:33:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB57C061574;
        Thu, 30 Jul 2020 23:33:50 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g19so3915766plq.0;
        Thu, 30 Jul 2020 23:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=op5l2j5rc7o4Xm8sFAm36s/drYMlkll647GzSNq9+Wg=;
        b=CkDQGJy/D0h/9KDQglrJfp0B/+Wu6hKiYA9C1JKhIaOOiLnpYpH2yxNdBNfcNGR8+i
         NWBiskD6Ku2TpCy1HpWuW+zu2XR2/7czScvdg43S1FTdhQe6IytL904tBPrkrcmdG8se
         Q6kPUI+T1Tgtplv0UCO3NA5dmvB3Z/OeKZj16ItpwRBFOUTbPGFqcCodw4TLpFOkOyEQ
         1mgQ+S4mvuRSCenkspWBdKqWtPQA8E5kSfqvol0BgOAwO/Rgm9RiHg+z33gjMC8izW0m
         BhtBH1He9GV3h/42/FKG3fm4Ydo2aQ3XMAStPJfdPbZK5DKjkd8JrLWuBaslnuszpEyL
         YxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=op5l2j5rc7o4Xm8sFAm36s/drYMlkll647GzSNq9+Wg=;
        b=i7uEE1BsQh02eH4rSlhouILo24ybPjH7vyRpP3bAqqswFvlsJUN6n5xMW8OLGYfw6O
         eK7kfmxRGnpV8vsWUAkqq6WfDBwxA4m2TvLbvsD+wVXgo3vQlQDHNsLh1I96YCIPb5CZ
         C7TI/vA2JnvwdFX3boNvcDx+uNJGKKvNsFreN/QBkphHTpAhZnWIB10GKcAujv3rv0HV
         YM+KryrN0OJurjZuKlYSUZiExuq0LAb0HMCp2x8ifvG3rlUHZBTl3wrT1p0Lkmt9ToZP
         wDXHI7vs4n5O0U/4QT9+Kf/xKO87w5NZmrzPjEPVVa+I7MOakDW2QCOUqmw/WYbXKz+k
         VrlA==
X-Gm-Message-State: AOAM533Ly6BeDZ/vvNWey6IuFvvRe0rcZcetQfqrxOCaEMcyJhau6ho2
        RNAxXqfA4uinxfXDwr4O3DnJO7xwM6T15g==
X-Google-Smtp-Source: ABdhPJz7MXlSkiSQzOo8pWyXg/3v/XP8Scd3QLkrSHF/vpw6YDBXH+66IzxEdbroQphuKyd0PxdYSg==
X-Received: by 2002:a17:90a:7c04:: with SMTP id v4mr2830748pjf.191.1596177229303;
        Thu, 30 Jul 2020 23:33:49 -0700 (PDT)
Received: from ?IPv6:2604:4080:1012:8d30:d41e:852f:649b:7856? ([2604:4080:1012:8d30:d41e:852f:649b:7856])
        by smtp.gmail.com with ESMTPSA id h23sm8628034pfo.166.2020.07.30.23.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 23:33:48 -0700 (PDT)
Subject: Re: [PATCH] Input: xpad: Spelling fixes for "Xbox", improve and
 proofread the listed xpad device names
To:     Ismael Ferreras Morezuelas <swyterzone@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <e864b39b-27e0-c6f2-76e8-db465916f310@gmail.com>
From:   Cameron Gutman <aicommander@gmail.com>
Message-ID: <60d8977a-159f-f2c5-e0c1-7691fb5b2571@gmail.com>
Date:   Thu, 30 Jul 2020 23:33:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e864b39b-27e0-c6f2-76e8-db465916f310@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/30/20 12:06 PM, Ismael Ferreras Morezuelas wrote:
> The Linux kernel is notorious for misspelling X-Box, X-box, XBox or XBOX;
> the official spelling is actually just Xbox. Plain and simple.
> 
> After doing that I took the opportunity to review a bit the actual
> xpad gamepad name list to make it more factual and accurate.
> 
> Seems like a worthy enhancement. This commit covers:
> 
>  * Plain typos. (e.g. Mad Cats -> Mad Catz, SoulCaliber -> Soulcalibur)
>  * Wrong or missing parts. (e.g. PS2 -> PS/2, v2 -> S)
>  * Missing manufacturer. (i.e. only the marketing name)
>  * Appending of Xbox / Xbox 360 / Xbox One when needed.
>  * Normalization, use a common case scheme.
> 
> Tried to respect the existing notes and regional classification.
> 
> I mainly sourced the model names from the official driver packages;
> cross-checking against retailers, official websites and other resources.
> 
> The side effect is that this master list is reused in many other places,
> like Steam and SDL2 itself, so it's important to get them right:
> 
> https://support.steampowered.com/kb_article.php?ref=5199-TOKV-4426
> 
> While doing my research I also noticed that the 1532:0037 VID/PID seems to
> be used by the DeathAdder 2013, so that Razer Sabertooth instance looks
> wrong and very suspect to me, I created a separate patch for that.

The above sentence probably doesn't belong in the commit message.

> 
> No functional changes intended.
> 
> Signed-off-by: Ismael Ferreras Morezuelas <swyterzone@gmail.com>
> ---
>  Documentation/input/gamepad.rst |   2 +-
>  drivers/input/joystick/Kconfig  |  14 +-
>  drivers/input/joystick/xpad.c   | 306 ++++++++++++++++----------------
>  3 files changed, 161 insertions(+), 161 deletions(-)
> 
> diff --git a/Documentation/input/gamepad.rst b/Documentation/input/gamepad.rst
> index 4d5e7fb80a84..968e07056552 100644
> --- a/Documentation/input/gamepad.rst
> +++ b/Documentation/input/gamepad.rst
> @@ -184,7 +184,7 @@ Gamepads report the following events:
>  
>    Many pads also have a third button which is branded or has a special symbol
>    and meaning. Such buttons are mapped as BTN_MODE. Examples are the Nintendo
> -  "HOME" button, the XBox "X"-button or Sony "PS" button.
> +  "HOME" button, the Xbox "X" button or the Sony PlayStation "PS" button.
>  
>  - Rumble:
>  
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index eb031b7a4866..45d220fd583c 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -280,33 +280,33 @@ config JOYSTICK_JOYDUMP
>  	  module will be called joydump.
>  
>  config JOYSTICK_XPAD
> -	tristate "X-Box gamepad support"
> +	tristate "Xbox gamepad support"
>  	depends on USB_ARCH_HAS_HCD
>  	select USB
>  	help
> -	  Say Y here if you want to use the X-Box pad with your computer.
> +	  Say Y here if you want to use Xbox pads with your computer.
>  	  Make sure to say Y to "Joystick support" (CONFIG_INPUT_JOYDEV)
>  	  and/or "Event interface support" (CONFIG_INPUT_EVDEV) as well.
>  
> -	  For information about how to connect the X-Box pad to USB, see
> +	  For information about how to connect the Xbox pad to USB, see
>  	  <file:Documentation/input/devices/xpad.rst>.
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called xpad.
>  
>  config JOYSTICK_XPAD_FF
> -	bool "X-Box gamepad rumble support"
> +	bool "Xbox gamepad rumble support"
>  	depends on JOYSTICK_XPAD && INPUT
>  	select INPUT_FF_MEMLESS
>  	help
> -	  Say Y here if you want to take advantage of xbox 360 rumble features.
> +	  Say Y here if you want to take advantage of Xbox 360 rumble features.
>  
>  config JOYSTICK_XPAD_LEDS
> -	bool "LED Support for Xbox360 controller 'BigX' LED"
> +	bool "LED Support for the Xbox 360 controller Guide button"
>  	depends on JOYSTICK_XPAD && (LEDS_CLASS=y || LEDS_CLASS=JOYSTICK_XPAD)
>  	help
>  	  This option enables support for the LED which surrounds the Big X on
> -	  XBox 360 controller.
> +	  Xbox 360 controllers.
>  
>  config JOYSTICK_WALKERA0701
>  	tristate "Walkera WK-0701 RC transmitter"
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index c77cdb3b62b5..814ca8d7978f 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * X-Box gamepad driver
> + * Xbox gamepad driver
>   *
>   * Copyright (c) 2002 Marko Friedemann <mfr@bmx-chemnitz.de>
>   *               2004 Oliver Schwartz <Oliver.Schwartz@gmx.de>,
> @@ -23,7 +23,7 @@
>   *  - ITO Takayuki for providing essential xpad information on his website
>   *  - Vojtech Pavlik     - iforce driver / input subsystem
>   *  - Greg Kroah-Hartman - usb-skeleton driver
> - *  - XBOX Linux project - extra USB id's
> + *  - Xbox Linux project - extra USB ids
>   *  - Pekka Pöyry (quantus) - Xbox One controller reverse engineering
>   *
>   * TODO:
> @@ -52,7 +52,7 @@
>   * 2002-07-17 - 0.0.5 : simplified d-pad handling
>   *
>   * 2004-10-02 - 0.0.6 : DDR pad support
> - *  - borrowed from the XBOX linux kernel
> + *  - borrowed from the Xbox Linux kernel
>   *  - USB id's for commonly used dance pads are present
>   *  - dance pads will map D-PAD to buttons, not axes
>   *  - pass the module paramater 'dpad_to_buttons' to force

The docs and comment changes look fine to me.

> @@ -111,40 +111,40 @@ static const struct xpad_device {
>  	u8 mapping;
>  	u8 xtype;
>  } xpad_device[] = {
> -	{ 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
> -	{ 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
> -	{ 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
> -	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
> +	{ 0x0079, 0x18d4, "GPD Win 2 Xbox Controller", 0, XTYPE_XBOX360 },
> +	{ 0x044f, 0x0f00, "Thrustmaster Steering Wheel for Xbox", 0, XTYPE_XBOX },
> +	{ 0x044f, 0x0f03, "Thrustmaster Steering Wheel for Xbox", 0, XTYPE_XBOX },
> +	{ 0x044f, 0x0f07, "Thrustmaster Controller for Xbox", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
> -	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
> -	{ 0x045e, 0x0285, "Microsoft X-Box pad (Japan)", 0, XTYPE_XBOX },
> +	{ 0x045e, 0x0202, "Microsoft Xbox Controller (US)", 0, XTYPE_XBOX },
> +	{ 0x045e, 0x0285, "Microsoft Xbox Controller S (Japan)", 0, XTYPE_XBOX },
>  	{ 0x045e, 0x0287, "Microsoft Xbox Controller S", 0, XTYPE_XBOX },
> -	{ 0x045e, 0x0288, "Microsoft Xbox Controller S v2", 0, XTYPE_XBOX },
> -	{ 0x045e, 0x0289, "Microsoft X-Box pad v2 (US)", 0, XTYPE_XBOX },
> -	{ 0x045e, 0x028e, "Microsoft X-Box 360 pad", 0, XTYPE_XBOX360 },
> -	{ 0x045e, 0x028f, "Microsoft X-Box 360 pad v2", 0, XTYPE_XBOX360 },

I'm somewhat concerned about the possibility of breaking userspace by changing
names. Some programs' gamepad mappings may be dependent on matching the device
names, rather than the VID+PID.

For example, Android did not expose the VID and PID for input devices until
Android 4.4. The device name was the only available attribute for matching
gamepads from Android 2.3 to 4.3. While these ancient Android version will
almost certainly never run a kernel with this patch, I worry about the
possibility of apps that haven't moved to VID+PID matching (and not just for
Android; I don't know if other libraries or frameworks have/had similar
limitations).

Perhaps my concerns are overblown, but If we aren't worried about changing
names, I'd really prefer to just drop the hardcoded names entirely and use the
manufacturer and product strings provided in the USB string descriptors. The
device list would turn into a quirk list where only device entries with a
special mapping flag like MAP_DPAD_TO_BUTTONS or MAP_TRIGGERS_TO_BUTTONS would
remain, and the device name strings would just become comments on each quirk
entry.

Thoughts?




Regards,
Cameron

