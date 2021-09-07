Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D215240282E
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 14:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242215AbhIGMGT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 08:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbhIGMGT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 08:06:19 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16680C061575;
        Tue,  7 Sep 2021 05:05:13 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id v2so12458813oie.6;
        Tue, 07 Sep 2021 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QgBuTujDSU4XFdDQMYIGcpmGBFpkqNzxrdv4/MCwCOE=;
        b=bIod0gT5i3ZfEjlhLunOZmFQZIvXMJG45ZrrYZ7uZdymqWFDwWIRTATKU8MtMr16OF
         fKSU/0JJdLV6c8zYkVnsAKoC0MMMWISX+6UTkXg78FG6PlbBRCf7Wu6IBofhxkfd+uoT
         arhRccM/GsM+zQEWxLWVTeHylzax5S4Bv1Vi5yrIUhW08dY/4JybL1kjpP9h7W09BHiQ
         tA11LhUSeuI/y1aYm14j4a5+diNhnufd8E2Rv2rx4+qLA0KjU36+RgGpXNJckfmFE9Yp
         niOhICpjrtDw9YIwMoE10LsdYPlttCC84xgMbAjjGFTVXN5KPIRzTor6V6A7MRXznbe8
         9PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QgBuTujDSU4XFdDQMYIGcpmGBFpkqNzxrdv4/MCwCOE=;
        b=Z9Yuv5g/6SJGyldMx5yKs6HVW4DLu7l4GyvH4RgxxhonaRUNuFLVoVj+SAQ/XUYqRI
         sm594PglVlaQXQ3HCXwOu/M2tx9LKrK9hw5FJTv23iBOtML9WVHLeDxN+vkxNrwio0rN
         9ChGqJoeTCsNMT2ycUGbyhb/ShvoUECY8vk1x+ZhcjiX7pW9s+826f6Lq7DIKAw7jKZW
         hXj7t3F+sCDVXjjagp0mo50ifNvRNTyAz/hZa+36vriFvv5nB/pfZEIrlhnaXPWmc8ZG
         s4nJy3XnKVjBHhpJ/I6N1N6P8Jl4rdY8awkU/VRDEdgpyM86K0atT6t7f4pnaonmPDX5
         scdw==
X-Gm-Message-State: AOAM530yyin0P1noCMnVpwRjLJfat7sebAjPw2rtq0rHNt3WDvmogpPU
        sLPSbcRu/6A3HKh1G0cpHxe6cJJhnB8=
X-Google-Smtp-Source: ABdhPJwG5ra9L6Q0CifgD5badOMrjlPShe5dwy2PkHJ5ozyxc/5MD40bV+ZHiBoAGKFaInpMKIB/gg==
X-Received: by 2002:a05:6808:1148:: with SMTP id u8mr2649798oiu.133.1631016312042;
        Tue, 07 Sep 2021 05:05:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j17sm2369114ots.10.2021.09.07.05.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 05:05:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] Input: analog: Always use ktime functions
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210907063335.2837366-1-linux@roeck-us.net>
 <CAMuHMdV_jt4zRQV1WXL8yy-AUNtDvrV5U-TRLcNdvFhTLjfG1A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <fab9f308-6677-5491-f3a7-b0ea1abd34f7@roeck-us.net>
Date:   Tue, 7 Sep 2021 05:05:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV_jt4zRQV1WXL8yy-AUNtDvrV5U-TRLcNdvFhTLjfG1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/7/21 2:40 AM, Geert Uytterhoeven wrote:
> Hi Günter,
> 
> On Tue, Sep 7, 2021 at 8:35 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> m68k, mips, s390, and sparc allmodconfig images fail to build with the
>> following error.
>>
>> drivers/input/joystick/analog.c:160:2: error:
>>          #warning Precise timer not defined for this architecture.
>>
>> Remove architecture specific time handling code and always use ktime
>> functions to determine time deltas. Also remove the now useless use_ktime
>> kernel parameter.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Drop helper functions and use ktime_get() and ktime_sub() directly
>>      Drop 'speed' variable and use NSEC_PER_MSEC directly
>>
>>   drivers/input/joystick/analog.c | 103 ++++----------------------------
>>   1 file changed, 11 insertions(+), 92 deletions(-)
>>
>> diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
>> index f798922a4598..a9ec41f48068 100644
>> --- a/drivers/input/joystick/analog.c
>> +++ b/drivers/input/joystick/analog.c
> 
>> @@ -275,7 +210,7 @@ static int analog_cooked_read(struct analog_port *port)
>>                  this |= data[i];
>>                  for (j = 0; j < 4; j++)
>>                          if (data[i] & (1 << j))
>> -                               port->axes[j] = (delta(start, time[i]) << ANALOG_FUZZ_BITS) / port->loop;
>> +                               port->axes[j] = (ktime_sub(time[i], start) << ANALOG_FUZZ_BITS) / port->loop;
> 
> This is now a 64-by-32 division, triggering undefined references to __udivdi3
> on some 32-bit platforms.
> 

And I was sure I checked for those. Oh well. I'll send v3 later today.

> Assumed deltas are small, the simple solution of truncating to
> 32 bit (like delta() did before):
> 
> -  port->axes[j] = (ktime_sub(time[i], start) << ANALOG_FUZZ_BITS) / port->loop;
> + port->axes[j] = ((u32)ktime_sub(time[i], start) << ANALOG_FUZZ_BITS)
> / port->loop;

Yes, I'll do that.

Thanks,
Guenter
