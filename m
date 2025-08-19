Return-Path: <linux-input+bounces-14139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 975E0B2BF59
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 12:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B939683750
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 10:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693FD322DD2;
	Tue, 19 Aug 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHgBq52R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9D322DA8;
	Tue, 19 Aug 2025 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600574; cv=none; b=RdAMU64So104Th9eOZR1LqAUiL76J9h86D/Ab6jx8D0GrO7StPeIE9gbsk1lDekQmamLJng+YO/3ZPuLhvLpWoL4D6B4wTYTv1fz7gAvCgOAunB4GDWf4JCU9E3EHL3RSB1pNH0qNSs5I3rSn6XGpevqo9/8K6nvDnul9GyD0O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600574; c=relaxed/simple;
	bh=T46Uasl3VJxlxNo80o6ebc2zTu4vKF2/PblcoHDVwMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DH5j6O3t0NPL5m9KnZn4tN/2g8AU/UF5My2bjkCsNOxYY6hYfL3jU3nOB0zv+0Z5MSqCR7lIWqwdNY2+88MVYUchJd0VQBXVUh6eaA2VX/yhDFKltz4nvGzDMH6ZTxrfSXW8ajMdgrig2DkKC1aLWtWW2wdkGwiYP+xrzQpwJos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHgBq52R; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f917a67aso36166621fa.2;
        Tue, 19 Aug 2025 03:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755600571; x=1756205371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFwb/+jLeeSbD9h5yPm11+tckUwhb16fMa7VyrdJU0I=;
        b=fHgBq52RVixQKR979q4CiRWdBqgsd+eZXQ8L5GghKCIAzrPg8lIDf/2Yf4Y/X/DcpO
         KJeNhD6GZd712lzFg8QeJ74bE0y44zQNZwZcR0E7zMjlHrOzjWH0WUp5bKmAL6Gf4yAJ
         YBKQ4uivGWqWqnWyKJYAdG66ovrCmgJWZXE+VeigM3MJIx1ws1OY2Rjs/xd2jQRGMKSI
         +544ApdQzAroK3FN6YDt1yzINQGYCIN3FnBnxJXj277bNmk4RRwa5qGxcFxfbt/WHkSb
         pQs3+9jYEIQ8s8mZ/pQSJLS1Ckn9t0XIGq4tWVrSw7lZSL8ABAUDxU3tuiLYsLmtZYAL
         YbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755600571; x=1756205371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFwb/+jLeeSbD9h5yPm11+tckUwhb16fMa7VyrdJU0I=;
        b=hcU82bzIkIMyhiO/VSMxRVNJmZqPOoVpb4wapuK8v7JQgmtqHVN4NFy4A9o5lNzN9+
         JT0LJGqu/mNiqWI84fwinyAV3kXedoQ+kTCm9zxyaPDbEOdl63+NLHtwuvosSC7MOLqu
         702W2KR3qGs5up0kw21IC5lm6Qc00AGYBExTYlpZOFU6k1bpYTEwBHxB6Jbm0tZI09f9
         EbusBHLRysfyw2y5RHcnnZQuKFVQJT4VJRTxJNI4dOlxHOsYl5CAC3mCH05/0jJ7Gx10
         f9BjlOU4e6jfVjaa2Y/JMA3X9hnsyaxqL+JoK0MQxdiuz8m9OAnyWUnb1GiEaj7pp2hE
         4g/g==
X-Forwarded-Encrypted: i=1; AJvYcCURHCTjkkmHvdo3QAAR1ZPGAt3zmIONCCd1++7BJGRwWKwc//8hMFny4X4GEX4ZiYTwsujLWPjBWZhrhJpG@vger.kernel.org, AJvYcCXdJ1xV9UERW8U/zY/T1Jo64RW5u6nqenAVIMW+LT+wveOKpVbc1PZp5ND8KGkIglfjKkHnRvD7sDY7dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ChRdE4h7G7xOVbSoZ9TpRS5BionbVM1olkryUcxDD2s1NuGF
	af9lHSRW2OOxPUljdv6j7b/EUbPFjF/KT5Qhj2MLivxc8LFfxxD4D+UljRZHSw==
X-Gm-Gg: ASbGnctu/tVN13mG8HD/aBC/05RQUnC669efmJBvmuAQiXKzjilgBkIxsa/Ec/dG3gP
	qTqmXesOQiu21UexLn1CDkBMgTk0neAzyjEkuOLisdfPMW/ZdARVLtwzcKudVaO8FgFliXQm/la
	JjWR4QZbXprZ0yGA1CSjBhkw9IlOZ/sPX8AKCOwZDvmaa5twz9GrlvXF6FIvHO//pI024x9eVdS
	Ny51iQyw444TwPsXv847eqktp0447n/DbMnYwmVGbNhEltIGDXjCGWTHyo56KRz84ywYQzYh/pk
	sR6N9Qd+D9MS4zjguKdrVdRD5Vdi7OTc6Lp6QsWesvXyPY7S1/d+jhFLwCzYgyxYKL0PbyKEbAI
	/AjpajNWQot5DOSmS5U7cXx58NxB7OvuhR0cZ7xxRdU8bXZ4TPVXb7k0WQshq5OIcTfjZIB3d/A
	8qMCGXGeK3giz8GA==
X-Google-Smtp-Source: AGHT+IEE9uI9oRakvbKoErlaTNhTyDks/tkNbha7u1DuZeou8B233lBPS+GsL3pl26sLMSBYHs3N5g==
X-Received: by 2002:a2e:b8c5:0:b0:332:1c24:d32c with SMTP id 38308e7fff4ca-335307040c0mr6685241fa.28.1755600570451;
        Tue, 19 Aug 2025 03:49:30 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a60542csm21597251fa.40.2025.08.19.03.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:49:29 -0700 (PDT)
Message-ID: <60a311ca-1642-48f0-8b73-267c0ba58bc4@gmail.com>
Date: Tue, 19 Aug 2025 13:49:28 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mfd: rohm-bd71828: Use software nodes for gpio-keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
 <20250817224731.1911207-2-dmitry.torokhov@gmail.com>
 <0adb5e0a-ea37-4bd5-87ff-654b770261f2@gmail.com>
 <a3fb7466-6774-4ae6-9e67-d35247ffa765@gmail.com>
 <jnf7z5hlljmoxw6ud3vuz4jaohh2ewjnpparh2dpbhef7ea7vp@up74k2viwhad>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <jnf7z5hlljmoxw6ud3vuz4jaohh2ewjnpparh2dpbhef7ea7vp@up74k2viwhad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/08/2025 20:11, Dmitry Torokhov wrote:
> On Mon, Aug 18, 2025 at 09:56:07AM +0300, Matti Vaittinen wrote:
>> On 18/08/2025 09:54, Matti Vaittinen wrote:
>>> On 18/08/2025 01:47, Dmitry Torokhov wrote:
>>>> Refactor the rohm-bd71828 MFD driver to use software nodes for
>>>> instantiating the gpio-keys child device, replacing the old
>>>> platform_data mechanism.
>>>
>>> Thanks for doing this Dmitry! I believe I didn't understand how
>>> providing the IRQs via swnode works... :)
>>>
>>> If I visit the ROHM office this week, then I will try to test this using
>>> the PMIC HW. (Next week I'll be in ELCE, and after it I have probably
>>> already forgotten this...)
>>>
>>>> The power key's properties are now defined using software nodes and
>>>> property entries. The IRQ is passed as a resource attached to the
>>>> platform device.
>>>>
>>>> This will allow dropping support for using platform data for configuring
>>>> gpio-keys in the future.
>>>>
>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>> ---
>>>>    drivers/mfd/rohm-bd71828.c | 81 +++++++++++++++++++++++++++-----------
>>>>    1 file changed, 58 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
>>>> index a14b7aa69c3c..c29dde9996b7 100644
>>>> --- a/drivers/mfd/rohm-bd71828.c
>>>> +++ b/drivers/mfd/rohm-bd71828.c
>>>> @@ -4,7 +4,6 @@
>>>
>>> // ...snip
>>>
>>>> +static int bd71828_reg_cnt;
>>>> +
>>>> +static int bd71828_i2c_register_swnodes(void)
>>>> +{
>>>> +    int error;
>>>> +
>>>> +    if (bd71828_reg_cnt == 0) {
>>>
>>> Isn't this check racy...
>>>
>>>> +        error = software_node_register_node_group(bd71828_swnodes);
>>>> +        if (error)
>>>> +            return error;
>>>> +    }
>>>> +
>>>> +    bd71828_reg_cnt++;
>>>
>>> ... with this...
>>>
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void bd71828_i2c_unregister_swnodes(void *dummy)
>>>> +{
>>>> +    if (bd71828_reg_cnt != 0) {
>>>
>>> ...this...
>>>
>>>> +        software_node_unregister_node_group(bd71828_swnodes);
>>>> +        bd71828_reg_cnt--;
>>>
>>> ...and this? Perhaps add a mutex or use atomics?
>>>
>>> Also, shouldn't the software_node_unregister_node_group() be only called
>>> for the last instance to exit (Eg, "if (bd71828_reg_cnt == 0)" instead
>>> of the "if (bd71828_reg_cnt != 0) {")?
>>
>> Oh. Probably "if (bd71828_reg_cnt == 1)".
> 
> You are right, I am not sure what I was thinking when I wrote this.
> 
> I actually doubt that sharing of nodes between devices would work well.
> But I believe these devices are singletons, it should not be possible to
> have several of them in a single system, right?

I can't say for sure. I have seen more and more setups where more than 
one PMIC is used to power-up a system. Thus I nowadays try to use 
solutions which don't limit the amount of instances.

The BD718[37,47,50] regulator driver seems to be written in a way it 
doesn't properly support multiple driver instances. (It uses global 
data, with a comment that if multiple instances need to be supported the 
data should be copied):
https://elixir.bootlin.com/linux/v6.11-rc2/source/drivers/regulator/bd718x7-regulator.c#L1558

For BD71828 and BD71815 I don't see existing limitations on how many 
instances there can be...

...except that I do :)

The current MFD driver uses single static global for the gpio_keys 
platform data. I assume that wouldn't be race-free if we had multiple 
instances.

So, I am unsure what to say. I know that for example the BD9680x PMIC 
series is intended to be used with multi-PMIC configurations, and I 
believe these setups are getting more common. Hence I would like to see 
the bd718XX code to work on multi-PMIC systems too, so the gpio_keys 
swnode example could be copied over to new PMICs ;)

But yeah, I am not insisting on it. The existing solution does not 
support multiple instances, so if you think it gets too cumbersome to 
add such support, then I am happy with supporting just one chip/system.

> So maybe the best way is
> to simply instantiate them in probe and bail out if they are already
> registered.

Well, I wouldn't say best (as explained above), but yes, sufficient for 
these PMICs AFAICS.

Thanks for doing this!

Yours,
	-- Matti

