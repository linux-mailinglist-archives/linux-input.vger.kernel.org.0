Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 240AE99E6C
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 20:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733185AbfHVSGJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 14:06:09 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38222 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbfHVSGI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 14:06:08 -0400
Received: by mail-pg1-f194.google.com with SMTP id e11so4111003pga.5
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 11:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6lk0qSSOHhjcgXYTwhIVbuu3WcvFJyn31pv+cPi0Xx8=;
        b=sm/FIGN95dKwUiCz0eZW7sxXCQmerTYj2hJuJG/7NEMEdSbKEuYGP3yfEfImx6CrrU
         Van4L4XMwJvb/VUl+kf4EuNtPL1whZwaGvAGDJjYgeiK0CoSwn8lpkjC3zdYC/yetskM
         H4Utgc2Whe77tD03faYZUrIya+S7DpDbaSMWfm63vMRZHf88hFVr2EZWBumGnjLSwJR2
         2AhDpRq2j8VXt/v6PyVwihdaOYpwdpXuuT93UMUMQDKDOVh2FS2lQvg7KNP3TYqglo+d
         acxYm+bdyvAR/Ryugp1fdYuX99gHKM98HZV+2ALenu5HOs2MVz730ZTSJUowpOxl2VEV
         VmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6lk0qSSOHhjcgXYTwhIVbuu3WcvFJyn31pv+cPi0Xx8=;
        b=JqNJ/KEYj2UdovcNrGW2DEt5JTn9D3zxXMF4aOepuwdIk1mQ1ZfshjBB76S1OKhS0j
         trN/cEgDGtcg77JRmDbSci9LG6JQ3UvydeIgMbQf+TSRM6DiXQ8Wheo12hVSGECsoA32
         By3GqiqKheSbfqH6m9IMlUB385dugQGefqt+x28+Jwb6lA8DvN/EGSCEOf8sX4HcDpcX
         3DyHgs1IXMjgLTFNKrFueWXiq/CgG273q+CvedWCiw/jNbJKEEwcN3BMa7Cymj2CIiml
         MCI520yj3xijbH5AUkuAxWugxjNeiADgLAUNJvnVBNuXemYip3qHWE25LgeUKFP5aPSm
         odTg==
X-Gm-Message-State: APjAAAWwBDOjTF4gmZ77yL1BwB/m/t/hX6ucZsNELGRU1+m3mPm68K6K
        U30myW7emJSjgbGTTALy59k=
X-Google-Smtp-Source: APXvYqyOZ/V6uPHI68WnEDLEt1/AVzGHTJAmA/gtrvrz1YTRcRmegLUU0+0zqE2DQt8VZmenTQOOiw==
X-Received: by 2002:a62:4e09:: with SMTP id c9mr521025pfb.130.1566497167779;
        Thu, 22 Aug 2019 11:06:07 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g19sm72997pfk.0.2019.08.22.11.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 11:06:06 -0700 (PDT)
Date:   Thu, 22 Aug 2019 11:06:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Input: Add event-codes for macro keys found on
 various keyboards
Message-ID: <20190822180604.GG76194@dtor-ws>
References: <20190821205937.4929-1-hdegoede@redhat.com>
 <20190821205937.4929-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821205937.4929-2-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Wed, Aug 21, 2019 at 10:59:31PM +0200, Hans de Goede wrote:
> Various keyboards have macro keys, which are intended to have user
> programmable actions / key-sequences bound to them. In some cases these
> macro keys are actually programmable in hardware, but more often they
> basically are just extra keys and the playback of the key-sequence is done
> by software running on the host.
> 
> One example of keyboards with macro-keys are various "internet" / "office"
> keyboards have a set of so-called "Smart Keys", typically a set of 4 keys
> labeled "[A]" - "[D]".
> 
> Another example are gaming keyboards, such as the Logitech G15 Gaming
> keyboard, which has 18 "G"aming keys labeled "G1" to G18", 3 keys to select
> macro presets labeled "M1" - "M3" and a key to start recording a macro
> called "MR" note that even though there us a record key everything is
> handled in sw on the host.
> 
> Besides macro keys the G15 (and other gaming keyboards) also has a buildin
> LCD panel where the contents are controlled by the host. There are 5 keys
> directly below the LCD intended for controlling a menu shown on the LCD.
> 
> The Microsoft SideWinder X6 keyboard is another gaming keyboard example,
> this keyboard has 30 "S"idewinder keys and a key to cycle through
> macro-presets.
> 
> After discussion between various involved userspace people we've come to
> the conclusion that since these are all really just extra keys we should
> simply treat them as such and give them their own event-codes, see:
> https://github.com/libratbag/libratbag/issues/172
> 
> This commit adds the following new KEY_ defines for this:
> 
> KEY_LCD_MENU1 - KEY_LCD_MENU5, KEY_MACRO_RECORD, KEY_MACRO_PRESET_CYCLE,
> KEY_MACRO_PRESET1 - KEY_MACRO_PRESET3, KEY_MACRO1 - KEY_MACRO30.
> 
> The defines leave room for adding some more LCD-menu, preset or macro keys,
> the maximum values above are based on the maximum values to support all
> currently known internet, office and gaming keyboards.

I must say that I am not too hot on having these in the keys space,
with the exception of KEY_MACRO_RECORD_* as we were trying to allow
userspace consumers to know what keys are supposed to mean, instead of
just blanked "programmable" keys. Still, we have the BTN_TRIGGER_HAPPY.

I guess as long as we do not try to use the new range for keys that have
a defined meaning but lack their own button code it is OK.

> 
> BugLink: https://github.com/libratbag/libratbag/issues/172
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  include/uapi/linux/input-event-codes.h | 54 ++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 85387c76c24f..80df3a6d6bcb 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -650,6 +650,60 @@
>  #define KEY_DATA			0x277
>  #define KEY_ONSCREEN_KEYBOARD		0x278
>  
> +/*
> + * Some keyboards have a buildin LCD panel where the contents are controlled
> + * by the host. Often these have a number of keys directly below the LCD
> + * intended for controlling a menu shown on the LCD. These keys often don't
> + * have any labelling so we just name them KEY_LCD_MENU#
> + */
> +#define KEY_LCD_MENU1			0x280

KEY_KBD_LCD_MENUn to show that it is supposed to control the LCD *on*
the keyboard?

I also wonder if we could move it down by 16 to start with 0x290? This
will give us more buffer for new keycodes.

Thanks.

-- 
Dmitry
