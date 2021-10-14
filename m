Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED7442D161
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 06:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbhJNEOx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 00:14:53 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:42966 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhJNEOw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 00:14:52 -0400
Received: by mail-wr1-f45.google.com with SMTP id v17so15073962wrv.9;
        Wed, 13 Oct 2021 21:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jMx2a01CJnC2dNlCakBizaTucZQ/Oc3O2qM3WaZvHKY=;
        b=4hyAHfpfmkZSoBj4y2Tv52Bg/mvH8bn2ysHOgap5xg6cth2bgPaQx45sv3YTupPa9D
         t6GYc3GNY/0t5q8u+WPbp35gCmenq9bBQHOZvwEmMNgVAB6zo7uK1PfirP4tLbyXQZsX
         R9zcAuvwfoZzRs2XX8/7NPSD+QuU6zCrawRWEDuayil6/PQ8CACx55sJsss/BG22AGlX
         e30uN61eFDgf1xY0JUXZU43mNTirwN/7D4O5MXxpxx4sie5PSW/oow/GtCnOgtu5TjEX
         fzAWm2nwdnUuJhFG5GX8Rtty8BAo9q9K4RRFdR9yJpUaEh/Ehah5YwIY8guObub2BK92
         rTDw==
X-Gm-Message-State: AOAM533f1/HQctVRnhljA+VjcD+aCj25yI1Gvm1cOCNudtlgAln1w7xR
        Qwic/YHYZh0RRcYv1dkA6zI=
X-Google-Smtp-Source: ABdhPJymuENDejcusxtC4liA2WrY0K62mnZNMaURgkTdYO+hSDhwoRjY821yL5+Quz8FNGARhtNHng==
X-Received: by 2002:a5d:4882:: with SMTP id g2mr3670285wrq.399.1634184767223;
        Wed, 13 Oct 2021 21:12:47 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id h11sm1174457wrz.5.2021.10.13.21.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 21:12:46 -0700 (PDT)
Message-ID: <9569cb0b-a353-ba75-9152-4abee07c7203@kernel.org>
Date:   Thu, 14 Oct 2021 06:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Content-Language: en-US
To:     lianzhi chang <changlianzhi@uniontech.com>,
        linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, linux-input@vger.kernel.org,
        282827961@qq.com
References: <20211014040508.8367-1-changlianzhi@uniontech.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20211014040508.8367-1-changlianzhi@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

No need to send it 5 times...

On 14. 10. 21, 6:05, lianzhi chang wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.
> 
> Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> ---
>   drivers/input/input.c     |  7 ++++++-
>   drivers/tty/vt/keyboard.c | 22 +++++++++++++++++++++-
>   include/linux/kbd_kern.h  |  2 ++
>   3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index ccaeb2426385..41f6186a9cc4 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -25,6 +25,7 @@
>   #include <linux/rcupdate.h>
>   #include "input-compat.h"
>   #include "input-poller.h"
> +#include <linux/kbd_kern.h>
>   
>   MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
>   MODULE_DESCRIPTION("Input core");
> @@ -472,8 +473,12 @@ void input_inject_event(struct input_handle *handle,
>   
>   		rcu_read_lock();
>   		grab = rcu_dereference(dev->grab);
> -		if (!grab || grab == handle)
> +		if (!grab || grab == handle) {
>   			input_handle_event(dev, type, code, value);
> +
> +			if (type == EV_LED && code < 3)
> +				update_value_ledstate(code, value);
> +		}
>   		rcu_read_unlock();
>   
>   		spin_unlock_irqrestore(&dev->event_lock, flags);
> diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
> index c7fbbcdcc346..005fa5cf2a67 100644
> --- a/drivers/tty/vt/keyboard.c
> +++ b/drivers/tty/vt/keyboard.c
> @@ -1140,6 +1140,23 @@ static unsigned char getledstate(void)
>   	return ledstate & 0xff;
>   }
>   
> +void update_value_ledstate(int flag, int value)
> +{
> +	if (ledstate == -1U)
> +		ledstate = 0;
> +
> +	if (flag == LED_NUML) {
> +		ledstate &= ~(1 << 1);
> +		ledstate |= value << 1;
> +	} else if (flag == LED_CAPSL) {
> +		ledstate &= ~(1 << 2);
> +		ledstate |= value << 2;
> +	} else if (flag == LED_SCROLLL) {
> +		ledstate &= ~(1 << 0);
> +		ledstate |= value << 0;
> +	}
> +}
> +
>   void setledstate(struct kbd_struct *kb, unsigned int led)
>   {
>           unsigned long flags;
> @@ -1249,6 +1266,10 @@ static void kbd_bh(struct tasklet_struct *unused)
>   {
>   	unsigned int leds;
>   	unsigned long flags;
> +	struct kbd_struct *kb = kbd_table + fg_console;
> +
> +	if (kb->kbdmode == VC_OFF)
> +		return;
>   
>   	spin_lock_irqsave(&led_lock, flags);
>   	leds = getleds();
> @@ -1257,7 +1278,6 @@ static void kbd_bh(struct tasklet_struct *unused)
>   
>   	if (leds != ledstate) {
>   		kbd_propagate_led_state(ledstate, leds);
> -		ledstate = leds;
>   	}
>   }
>   
> diff --git a/include/linux/kbd_kern.h b/include/linux/kbd_kern.h
> index c40811d79769..36a3402658e6 100644
> --- a/include/linux/kbd_kern.h
> +++ b/include/linux/kbd_kern.h
> @@ -62,6 +62,8 @@ extern int kbd_init(void);
>   
>   extern void setledstate(struct kbd_struct *kbd, unsigned int led);
>   
> +extern void update_value_ledstate(int flag, int value);
> +
>   extern int do_poke_blanked_console;
>   
>   extern void (*kbd_ledfunc)(unsigned int led);
> 


-- 
js
