Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D027B40232E
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 08:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhIGGAe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 02:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhIGGAb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 02:00:31 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A99FC061757;
        Mon,  6 Sep 2021 22:59:24 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d18so4031912pll.11;
        Mon, 06 Sep 2021 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sGZI/nbcxpuYTCON+TPkkQmLQVTywbfQiE0AmbOZZVg=;
        b=M3whargQUy2BJF3vsi9KIaREuD29+0L1I99LwZdRTecs7k5c5krjgY1pr/uZB6mJeW
         /Tg2tKRTw3TDhgZF/5AqG/jZFMvO2Fw92LbBBxux1DLUnhShGqMlMpTjt7BPOsSDuZo+
         J6E0AGGxdpEwsHdMtBcfuvKNVJOHGEv3PEEaWWei5zoJxHXMrhR5D45xFpYNYCHYatfS
         HaaMf6cfYqnv3c8SSNCwKbLMIpcb3MmSGFm/2R2CWGRuA1FrWzG7UmKV9geDLuG4GM01
         JYZlmkae4zL9ieUvLxY1YZyzJLqp3nNqVClLqyX4hV6nrz7Lx1H+H9+dPUJ6NJCns4VI
         4gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sGZI/nbcxpuYTCON+TPkkQmLQVTywbfQiE0AmbOZZVg=;
        b=OhY65U9lq+byYSZBZhVbEuO3pNLDgSbNuVfKl9ImPQ3mSja3Iw7kXC6x3Gw5Qijl7U
         bdentvo5ZnRvNjYYe7/ROx1rb6BdFs3tfaKqVdS7r3Lixv6Wty+7v5MYzBOY0uJLZOq2
         8DOC2TUN/mv8LEGqeynrwH4hLkO+yLlCgfXDSvjp29JjpStPxBd6aVyAz3ndMAeSyTII
         vr7OZWsnFmqctTedkzG4hsEqOKqVOlqlAyDYTGphU4wwERXzvEEvXvwt1m6iQ1jTG9gu
         p06gnrlZIi6M1PhTdtqbzWQ5h4RZxdBoC89cPyZFGPq8cc4h6hGisANRpIzteAJynuE+
         oDgA==
X-Gm-Message-State: AOAM530GuKgNbqU+Ey5KTTe24l8bZKsxPVw5r3u9L6tx67fuNL073Yrn
        o3CBCRbx3w1RIxvqTdss8kA=
X-Google-Smtp-Source: ABdhPJzdGyjpwU9kID9FPSivgHpz9JCSiDhuoSwVYWjqabj2oQmqJZ0f0zttlGrLP/+EQTQQDZgrJw==
X-Received: by 2002:a17:90b:3608:: with SMTP id ml8mr2862755pjb.124.1630994363544;
        Mon, 06 Sep 2021 22:59:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:668f:8a8e:5bc5:fb2d])
        by smtp.gmail.com with ESMTPSA id x189sm9483158pfc.52.2021.09.06.22.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 22:59:22 -0700 (PDT)
Date:   Mon, 6 Sep 2021 22:59:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: analog: Always use ktime functions
Message-ID: <YTb/t2Qn0BklAlpk@google.com>
References: <20210907050606.2142634-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907050606.2142634-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Guenter,

On Mon, Sep 06, 2021 at 10:06:06PM -0700, Guenter Roeck wrote:
> m68k, mips, s390, and sparc allmodconfig images fail to build with the
> following error.
> 
> drivers/input/joystick/analog.c:160:2: error:
> 	#warning Precise timer not defined for this architecture.
> 
> Remove architecture specific time handling code and always use ktime
> functions to determine time deltas. Also remove the now useless use_ktime
> kernel parameter.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/input/joystick/analog.c | 74 ++-------------------------------
>  1 file changed, 3 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
> index f798922a4598..4702982182fa 100644
> --- a/drivers/input/joystick/analog.c
> +++ b/drivers/input/joystick/analog.c
> @@ -28,10 +28,6 @@ MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
>  MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_LICENSE("GPL");
>  
> -static bool use_ktime = true;
> -module_param(use_ktime, bool, 0400);
> -MODULE_PARM_DESC(use_ktime, "Use ktime for measuring I/O speed");
> -
>  /*
>   * Option parsing.
>   */
> @@ -119,64 +115,14 @@ struct analog_port {
>  	int axtime;
>  };
>  
> -/*
> - * Time macros.
> - */
> -
> -#ifdef __i386__
> -
> -#include <linux/i8253.h>
> -
> -#define GET_TIME(x)	do { if (boot_cpu_has(X86_FEATURE_TSC)) x = (unsigned int)rdtsc(); else x = get_time_pit(); } while (0)
> -#define DELTA(x,y)	(boot_cpu_has(X86_FEATURE_TSC) ? ((y) - (x)) : ((x) - (y) + ((x) < (y) ? PIT_TICK_RATE / HZ : 0)))
> -#define TIME_NAME	(boot_cpu_has(X86_FEATURE_TSC)?"TSC":"PIT")
> -static unsigned int get_time_pit(void)
> -{
> -        unsigned long flags;
> -        unsigned int count;
> -
> -        raw_spin_lock_irqsave(&i8253_lock, flags);
> -        outb_p(0x00, 0x43);
> -        count = inb_p(0x40);
> -        count |= inb_p(0x40) << 8;
> -        raw_spin_unlock_irqrestore(&i8253_lock, flags);
> -
> -        return count;
> -}
> -#elif defined(__x86_64__)
> -#define GET_TIME(x)	do { x = (unsigned int)rdtsc(); } while (0)
> -#define DELTA(x,y)	((y)-(x))
> -#define TIME_NAME	"TSC"
> -#elif defined(__alpha__) || defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_PPC) || defined(CONFIG_RISCV)
> -#define GET_TIME(x)	do { x = get_cycles(); } while (0)
> -#define DELTA(x,y)	((y)-(x))
> -#define TIME_NAME	"get_cycles"
> -#else
> -#define FAKE_TIME
> -static unsigned long analog_faketime = 0;
> -#define GET_TIME(x)     do { x = analog_faketime++; } while(0)
> -#define DELTA(x,y)	((y)-(x))
> -#define TIME_NAME	"Unreliable"
> -#warning Precise timer not defined for this architecture.
> -#endif
> -
>  static inline u64 get_time(void)
>  {
> -	if (use_ktime) {
> -		return ktime_get_ns();
> -	} else {
> -		unsigned int x;
> -		GET_TIME(x);
> -		return x;
> -	}
> +	return ktime_get_ns();
>  }
>  
>  static inline unsigned int delta(u64 x, u64 y)
>  {
> -	if (use_ktime)
> -		return y - x;
> -	else
> -		return DELTA((unsigned int)x, (unsigned int)y);
> +	return y - x;

I wonder if we should get rid of these wrappers and use ktime_t and
ktime_get(), ktime_sub(), etc directly.

>  }
>  
>  /*
> @@ -378,21 +324,7 @@ static void analog_calibrate_timer(struct analog_port *port)
>  	u64 t1, t2, t3;
>  	unsigned long flags;
>  
> -	if (use_ktime) {
> -		port->speed = 1000000;
> -	} else {
> -		local_irq_save(flags);
> -		t1 = get_time();
> -#ifdef FAKE_TIME
> -		analog_faketime += 830;
> -#endif
> -		mdelay(1);
> -		t2 = get_time();
> -		t3 = get_time();
> -		local_irq_restore(flags);
> -
> -		port->speed = delta(t1, t2) - delta(t2, t3);
> -	}
> +	port->speed = 1000000;

It seems we could get rid of port->speed.

Thanks.

-- 
Dmitry
