Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328C840236A
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 08:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhIGG0W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 02:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbhIGG0V (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 02:26:21 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57BCC061575;
        Mon,  6 Sep 2021 23:25:15 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id q39so11481147oiw.12;
        Mon, 06 Sep 2021 23:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/UBwOofpA8/+kaEKqbvd66qjIBGqrp+k0ILuSWWmLkY=;
        b=Aicscqd2RmIeSemDcchk6eENStnpmmIgSts+GSaLDww4QSqaznLHcLynW1fkrvWYKW
         fPsHjz8g+91mJE/RtcokXSBi3GqvXN+N5fxeCQjmUiLeNMsy5ejHGb/OSeCWhdDX5N3/
         1slDbycMzOGKGRYGaVqcxOpzmDOnV6d6heKXXFoorghGO/sL2FdXrBPVDq56Bh4/QOeg
         AaJb9YDAptuYmB0yMxrA6OhRNCPbdkvmrDd8ylI11AO6KCRpJm2ew3l2H7HUogTMLdKy
         /JAmLFv5ZyhQSv4H3IeOM5Ev/rDmAFzU7wuIESHi3AxMtYSxPAIWTXaYE2ksQRN+jjTH
         GluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/UBwOofpA8/+kaEKqbvd66qjIBGqrp+k0ILuSWWmLkY=;
        b=Esp3x1Rswji9CXsheDqDBOBh6YJgzIGBS8UABKk8uz+qunpteCQLCHdhsdEyuzb4sq
         Pu3oRVmYMhbTMUB2CSFEN7JCt4ufogUfVpS6kfYp4lQNkNwlbbtgyZ5d39Vv8SF/7aIi
         ry7t5tPbZgypEjVjtP9TRbVbNVkFku8ujH+hhjAc0Pq0baBPCPvXDjaGtuSkbWaw4ak9
         7e1vh/0V+l8lRvIdm7tziAt1wk5JAI58Au6tTqigdv4HdamwEt/ihtM2SGO7PC8Sd696
         U3knf1I9rAZuMCZOvx69hqtmF5F4Y0nMgI03lZ2Q9D6A2gP5l2wHLQNAG67vpBfjxpGk
         jeYA==
X-Gm-Message-State: AOAM533V20EjPrK3OhcpNzZh4FCBLmi3kpqo5Aw279hGQIw5402xGbSR
        BJ1AiyyGEuUglcWpE6oGxl8XRuxvgaQ=
X-Google-Smtp-Source: ABdhPJyWqIcc5acgKMcSg7x3Y362n/t0MsRUmGHjl6aqCyUD6jb1pdWhTO/Ec2cxb8w2Kzxu6C0xBA==
X-Received: by 2002:a05:6808:46:: with SMTP id v6mr1729056oic.61.1630995914864;
        Mon, 06 Sep 2021 23:25:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v10sm2268838otp.25.2021.09.06.23.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 23:25:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907050606.2142634-1-linux@roeck-us.net>
 <YTb/t2Qn0BklAlpk@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Input: analog: Always use ktime functions
Message-ID: <7d5c1a12-19e8-d29f-76f3-88d6bc0acce0@roeck-us.net>
Date:   Mon, 6 Sep 2021 23:25:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTb/t2Qn0BklAlpk@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/6/21 10:59 PM, Dmitry Torokhov wrote:
> Hi Guenter,
> 
> On Mon, Sep 06, 2021 at 10:06:06PM -0700, Guenter Roeck wrote:
>> m68k, mips, s390, and sparc allmodconfig images fail to build with the
>> following error.
>>
>> drivers/input/joystick/analog.c:160:2: error:
>> 	#warning Precise timer not defined for this architecture.
>>
>> Remove architecture specific time handling code and always use ktime
>> functions to determine time deltas. Also remove the now useless use_ktime
>> kernel parameter.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/input/joystick/analog.c | 74 ++-------------------------------
>>   1 file changed, 3 insertions(+), 71 deletions(-)
>>
>> diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
>> index f798922a4598..4702982182fa 100644
>> --- a/drivers/input/joystick/analog.c
>> +++ b/drivers/input/joystick/analog.c
>> @@ -28,10 +28,6 @@ MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
>>   MODULE_DESCRIPTION(DRIVER_DESC);
>>   MODULE_LICENSE("GPL");
>>   
>> -static bool use_ktime = true;
>> -module_param(use_ktime, bool, 0400);
>> -MODULE_PARM_DESC(use_ktime, "Use ktime for measuring I/O speed");
>> -
>>   /*
>>    * Option parsing.
>>    */
>> @@ -119,64 +115,14 @@ struct analog_port {
>>   	int axtime;
>>   };
>>   
>> -/*
>> - * Time macros.
>> - */
>> -
>> -#ifdef __i386__
>> -
>> -#include <linux/i8253.h>
>> -
>> -#define GET_TIME(x)	do { if (boot_cpu_has(X86_FEATURE_TSC)) x = (unsigned int)rdtsc(); else x = get_time_pit(); } while (0)
>> -#define DELTA(x,y)	(boot_cpu_has(X86_FEATURE_TSC) ? ((y) - (x)) : ((x) - (y) + ((x) < (y) ? PIT_TICK_RATE / HZ : 0)))
>> -#define TIME_NAME	(boot_cpu_has(X86_FEATURE_TSC)?"TSC":"PIT")
>> -static unsigned int get_time_pit(void)
>> -{
>> -        unsigned long flags;
>> -        unsigned int count;
>> -
>> -        raw_spin_lock_irqsave(&i8253_lock, flags);
>> -        outb_p(0x00, 0x43);
>> -        count = inb_p(0x40);
>> -        count |= inb_p(0x40) << 8;
>> -        raw_spin_unlock_irqrestore(&i8253_lock, flags);
>> -
>> -        return count;
>> -}
>> -#elif defined(__x86_64__)
>> -#define GET_TIME(x)	do { x = (unsigned int)rdtsc(); } while (0)
>> -#define DELTA(x,y)	((y)-(x))
>> -#define TIME_NAME	"TSC"
>> -#elif defined(__alpha__) || defined(CONFIG_ARM) || defined(CONFIG_ARM64) || defined(CONFIG_PPC) || defined(CONFIG_RISCV)
>> -#define GET_TIME(x)	do { x = get_cycles(); } while (0)
>> -#define DELTA(x,y)	((y)-(x))
>> -#define TIME_NAME	"get_cycles"
>> -#else
>> -#define FAKE_TIME
>> -static unsigned long analog_faketime = 0;
>> -#define GET_TIME(x)     do { x = analog_faketime++; } while(0)
>> -#define DELTA(x,y)	((y)-(x))
>> -#define TIME_NAME	"Unreliable"
>> -#warning Precise timer not defined for this architecture.
>> -#endif
>> -
>>   static inline u64 get_time(void)
>>   {
>> -	if (use_ktime) {
>> -		return ktime_get_ns();
>> -	} else {
>> -		unsigned int x;
>> -		GET_TIME(x);
>> -		return x;
>> -	}
>> +	return ktime_get_ns();
>>   }
>>   
>>   static inline unsigned int delta(u64 x, u64 y)
>>   {
>> -	if (use_ktime)
>> -		return y - x;
>> -	else
>> -		return DELTA((unsigned int)x, (unsigned int)y);
>> +	return y - x;
> 
> I wonder if we should get rid of these wrappers and use ktime_t and
> ktime_get(), ktime_sub(), etc directly.
> 

Will do.

>>   }
>>   
>>   /*
>> @@ -378,21 +324,7 @@ static void analog_calibrate_timer(struct analog_port *port)
>>   	u64 t1, t2, t3;
>>   	unsigned long flags;
>>   
>> -	if (use_ktime) {
>> -		port->speed = 1000000;
>> -	} else {
>> -		local_irq_save(flags);
>> -		t1 = get_time();
>> -#ifdef FAKE_TIME
>> -		analog_faketime += 830;
>> -#endif
>> -		mdelay(1);
>> -		t2 = get_time();
>> -		t3 = get_time();
>> -		local_irq_restore(flags);
>> -
>> -		port->speed = delta(t1, t2) - delta(t2, t3);
>> -	}
>> +	port->speed = 1000000;
> 
> It seems we could get rid of port->speed.
> 

Sure. I'll just use NSEC_PER_MSEC directly.

Thanks,
Guenter
