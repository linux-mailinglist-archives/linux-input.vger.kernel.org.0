Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E50A22CC
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 19:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfH2Rvz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 13:51:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37733 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbfH2Rvz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 13:51:55 -0400
Received: by mail-pf1-f195.google.com with SMTP id y9so2569314pfl.4
        for <linux-input@vger.kernel.org>; Thu, 29 Aug 2019 10:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w74muhylpb4bCn9N8JPZh3jDySq+/28eLbX5YEogDP4=;
        b=iRewSbLBu5mSjs7Cal4vb0R9kJjlu6X6HGj/mR5+ZyC9K2vX0KTX/WGNVrodJiDGAh
         y0T0bD999hk4rppWWUaT82KHLFOOhL9pjWSyFdvO/5shKKKiMJGT9USxlDq5X3iFI+db
         O4/XvZHfwxXwUvRn1W3Oj85Y3W4BO1E0g5OWinvuBpA1VxSpHSVvb7emGxdBaReDiANL
         QBNlhXClQq+GT/hMxXYbF2HEcn3e/Ish254ba6soZfbKmmV+n4agm2p1s74z+g1OcvTi
         0GWAyFZDWc4nlGULFHAu/26z0J99PgvDG+m35cIal7HQ0FvDoXzSZxVe1wYmz3+rivMz
         4kWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w74muhylpb4bCn9N8JPZh3jDySq+/28eLbX5YEogDP4=;
        b=aqbPnJXEENpmEoG1JLKtvrzI5fUacjLGhOP2+hc7k35+6vHG9hmPApZ8uxjnEA7/Ae
         RYBM3/KK8gYXeeYA9rN8YfV65MNcxuOeUTUpCad3gVZJ5oJVkclA+wwadQfYGYQQEZc2
         WZ1pCmJWSJZaLOTS96YAjBLU7Oml6oJgi0H2/8eYkSjRC7tTm1fOTeQo4L20eGRxc3yI
         YWU0x71dHS6Pt8rhsUFLb0PkE7+Qrnc6YjHjWXyQoQUrHFnKjZkrAuQ32xlY6MYuwvmA
         Zm0VCXkpwsE2bqQ9VaBl67CeQmuh0oES1qWi2Og/1k4o9UEcPcBYhi33bdE2paDkBtwY
         Uohg==
X-Gm-Message-State: APjAAAW7PTYHVxu0VlVfxtugp3quSIMAhn/HruACiI22RjSDOhlPqj5Z
        95ToSYouTkI4MR0jXTVd6bk=
X-Google-Smtp-Source: APXvYqwME5HRr6rm8XO9doLnk2GsjtFjPQQVaDud9q5gy/hDBkszrveJ1YFVLS0Ica0C4E49z3zq4g==
X-Received: by 2002:a65:5cca:: with SMTP id b10mr9672110pgt.365.1567101114250;
        Thu, 29 Aug 2019 10:51:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e13sm7844430pfl.130.2019.08.29.10.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 10:51:53 -0700 (PDT)
Date:   Thu, 29 Aug 2019 10:51:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/7] Input: Add event-codes for macro keys found on
 various keyboards
Message-ID: <20190829175151.GB187474@dtor-ws>
References: <20190828124130.26752-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828124130.26752-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 28, 2019 at 02:41:24PM +0200, Hans de Goede wrote:
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
> KEY_MACRO1 - KEY_MACRO30. KEY_MACRO_RECORD_START/-STOP,
> KEY_MACRO_PRESET_CYCLE, KEY_MACRO_PRESET1 - KEY_MACRO_PRESET3,
> KEY_KBD_LCD_MENU1 - KEY_KBD_LCD_MENU5.
> 
> The defines leave room for adding some more LCD-menu, preset or macro keys,
> the maximum values above are based on the maximum values to support all
> currently known internet, office and gaming keyboards.
> 
> BugLink: https://github.com/libratbag/libratbag/issues/172
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
> Changes in v3:
> - Add a big comment explaining why we need the KEY_MACRO# coded and that
>   they MUST NOT be used for keys which have a defined meaning
> - Start the codes at 0x290 instead of 0x280 to leave some extra space
>   for adding new codes after KEY_ONSCREEN_KEYBOARD (0x278)
> - s/KEY_LCD_MENU/KEY_KBD_LCD_MENU/
> ---
>  include/uapi/linux/input-event-codes.h | 75 ++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 85387c76c24f..00aebeaae090 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -650,6 +650,81 @@
>  #define KEY_DATA			0x277
>  #define KEY_ONSCREEN_KEYBOARD		0x278
>  
> +/*
> + * Some keyboards have keys which do not have a defined meaning, these keys
> + * are intended to be programmed / bound to macros by the user. For most
> + * keyboards with these macro-keys the key-sequence to inject, or action to
> + * take, is all handled by software on the host side. So from the kernel's
> + * point of view these are just normal keys.
> + *
> + * The KEY_MACRO# codes below are intended for such keys, which may be labeled
> + * e.g. G1-G18, or S1 - S30. The KEY_MACRO# codes MUST NOT be used for keys
> + * where the marking on the key does indicate a defined meaning / purpose.
> + *
> + * The KEY_MACRO# codes MUST also NOT be used as fallback for when no existing
> + * KEY_FOO define matches the marking / purpose. In this case a new KEY_FOO
> + * define MUST be added.
> + */
> +#define KEY_MACRO1			0x290
> +#define KEY_MACRO2			0x291
> +#define KEY_MACRO3			0x292
> +#define KEY_MACRO4			0x293
> +#define KEY_MACRO5			0x294
> +#define KEY_MACRO6			0x295
> +#define KEY_MACRO7			0x296
> +#define KEY_MACRO8			0x297
> +#define KEY_MACRO9			0x298
> +#define KEY_MACRO10			0x299
> +#define KEY_MACRO11			0x29a
> +#define KEY_MACRO12			0x29b
> +#define KEY_MACRO13			0x29c
> +#define KEY_MACRO14			0x29d
> +#define KEY_MACRO15			0x29e
> +#define KEY_MACRO16			0x29f
> +#define KEY_MACRO17			0x2a0
> +#define KEY_MACRO18			0x2a1
> +#define KEY_MACRO19			0x2a2
> +#define KEY_MACRO20			0x2a3
> +#define KEY_MACRO21			0x2a4
> +#define KEY_MACRO22			0x2a5
> +#define KEY_MACRO23			0x2a6
> +#define KEY_MACRO24			0x2a7
> +#define KEY_MACRO25			0x2a8
> +#define KEY_MACRO26			0x2a9
> +#define KEY_MACRO27			0x2aa
> +#define KEY_MACRO28			0x2ab
> +#define KEY_MACRO29			0x2ac
> +#define KEY_MACRO30			0x2ad
> +
> +/*
> + * Some keyboards with the macro-keys described above have some extra keys
> + * for controlling the host-side software responsible for the macro handling:
> + * -A macro recording start/stop key. Note that not all keyboards which emit
> + *  KEY_MACRO_RECORD_START will also emit KEY_MACRO_RECORD_STOP if
> + *  KEY_MACRO_RECORD_STOP is not advertised, then KEY_MACRO_RECORD_START
> + *  should be interpreted as a recording start/stop toggle;
> + * -Keys for switching between different macro (pre)sets, either a key for
> + *  cycling through the configured presets or keys to directly select a preset.
> + */
> +#define KEY_MACRO_RECORD_START		0x2b0
> +#define KEY_MACRO_RECORD_STOP		0x2b1
> +#define KEY_MACRO_PRESET_CYCLE		0x2b2
> +#define KEY_MACRO_PRESET1		0x2b3
> +#define KEY_MACRO_PRESET2		0x2b4
> +#define KEY_MACRO_PRESET3		0x2b5
> +
> +/*
> + * Some keyboards have a buildin LCD panel where the contents are controlled
> + * by the host. Often these have a number of keys directly below the LCD
> + * intended for controlling a menu shown on the LCD. These keys often don't
> + * have any labeling so we just name them KEY_KBD_LCD_MENU#
> + */
> +#define KEY_KBD_LCD_MENU1		0x2b8
> +#define KEY_KBD_LCD_MENU2		0x2b9
> +#define KEY_KBD_LCD_MENU3		0x2ba
> +#define KEY_KBD_LCD_MENU4		0x2bb
> +#define KEY_KBD_LCD_MENU5		0x2bc
> +
>  #define BTN_TRIGGER_HAPPY		0x2c0
>  #define BTN_TRIGGER_HAPPY1		0x2c0
>  #define BTN_TRIGGER_HAPPY2		0x2c1
> -- 
> 2.23.0
> 

-- 
Dmitry
