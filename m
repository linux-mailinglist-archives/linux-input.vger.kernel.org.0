Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5278576187
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 11:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfGZJIq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 05:08:46 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41208 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfGZJIq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 05:08:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so14127783pgg.8;
        Fri, 26 Jul 2019 02:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qZ3ZKSgzGFIWHktn9t7jIbU1W6udKcTTMQPoVRz+KVo=;
        b=ClS+8s1Cz7EcO2ub0XocOevCDQKxWYdq0ffymaP7Idft193I1SQDTjCqYCrSYBttsX
         uKu0lXaiRoHgZD9Rsm2Qm94g1C1WpvIILQxqpbOq0hBaZ9rdo6IMc9vxsKrLZjkpr2TD
         4ZpIhgGolpTBchOhFNV8/WvHdn1J474k5+0fy+kGOjKVwPa0bI6OmD+QLl3qBrQm47tX
         oEvlGSibvVJkAKc6fxPw/AWh0Jm/7/9zMEKM6ZZc95a1eQ0NWAZNANAy653R6Yob5WW7
         W53rKIDmKAOHwtQGCEa3HwAnHtt8Cqj3ef14mxLzjqsGGbR1GdJpGx+/w+s0EUBtC9Pv
         ND4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qZ3ZKSgzGFIWHktn9t7jIbU1W6udKcTTMQPoVRz+KVo=;
        b=uNomoiN3xn0eYVyP72PmZyYUmD9H2FWQI1UUTAuOcXhhwRDR6drVW0lCP164/DVkqA
         BBx4BKI/63peITO3V9GT5yBOcxSe/Ymvd8qPo3XJS1zRQlnT83zo1dg3666rB3Mdu5GH
         /8wNd+tjQaTpr5vGIkCJSR37FnH7Kcv6UMNhEP0TFC5xG+DwOL7jFo1ySdtqRbsYmLxH
         mh4bYfvQ5WimEbU3tLlSJQZPzeQZ2/IXIOy3m4whObxNlAFfy3zOje8fqHLngSVvCm3l
         7KB0pLQrtiHEhws9AtdlcX2so+eluKsCqp0q7G/w1oxleRKA4s6dycFMf9J/ElJ7PMbY
         3nvw==
X-Gm-Message-State: APjAAAVvqJwMRp+wXeD7aZE4caWqPUodvKgKZJrA5ofJR/c9hkHeW8Lm
        9IBTL70Ao09HimigZY2NlHfxeejJoZ0=
X-Google-Smtp-Source: APXvYqxLxzzjxa5LRT4/eu5YLMxw4OF8Vnun/M9e4pupJJcFwtKj/4Ask1Z/Z0HAcDPyv07OiglrwQ==
X-Received: by 2002:aa7:8b11:: with SMTP id f17mr21220225pfd.19.1564132125476;
        Fri, 26 Jul 2019 02:08:45 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
        by smtp.gmail.com with ESMTPSA id b190sm42665669pga.37.2019.07.26.02.08.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 02:08:45 -0700 (PDT)
Subject: Re: [PATCH] input: touchscreen: wm97xx-core: Fix possible
 null-pointer dereferences in wm97xx_ts_input_open()
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        tglx@linutronix.de, allison@lohutok.net, rdunlap@infradead.org,
        patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190726084816.8487-1-baijiaju1990@gmail.com>
 <20190726090626.GA54126@ediswmail.ad.cirrus.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <8abe9ecd-d6b4-1892-e496-edeeb62199c4@gmail.com>
Date:   Fri, 26 Jul 2019 17:08:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190726090626.GA54126@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 2019/7/26 17:06, Charles Keepax wrote:
> On Fri, Jul 26, 2019 at 04:48:16PM +0800, Jia-Ju Bai wrote:
>> In wm97xx_ts_input_open(), there is an if statement on line 507 to check
>> whether wm->mach_ops is NULL:
>>      if (wm->mach_ops && wm->mach_ops->acc_enabled)
>>
>> When wm->mach_ops is NULL, it is used on line 521:
>>      wm97xx_init_pen_irq(wm);
>>          BUG_ON(!wm->mach_ops->irq_enable);
>>          BUG_ON(!wm->mach_ops->irq_gpio);
>>          wm97xx_reg_write(..., reg & ~(wm->mach_ops->irq_gpio))
>>
>> Thus, possible null-pointer dereferences may occur.
>>
>> To fix these bugs, wm->mach_ops is checked before calling
>> wm97xx_init_pen_irq().
>>
>> These bugs found by a static analysis tool STCheck written by us.
>>
>> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
>> ---
>>   drivers/input/touchscreen/wm97xx-core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
>> index 0a174bd82915..f7bd0726a577 100644
>> --- a/drivers/input/touchscreen/wm97xx-core.c
>> +++ b/drivers/input/touchscreen/wm97xx-core.c
>> @@ -517,7 +517,7 @@ static int wm97xx_ts_input_open(struct input_dev *idev)
>>   	wm->ts_reader_interval = wm->ts_reader_min_interval;
>>   
>>   	wm->pen_is_down = 0;
>> -	if (wm->pen_irq)
>> +	if (wm->pen_irq && wm->mach_ops)
>>   		wm97xx_init_pen_irq(wm);
>>   	else
>>   		dev_err(wm->dev, "No IRQ specified\n");
> This doesn't quite feel like the right fix as it would print an
> error message saying "No IRQ specified", in the case the IRQ is
> specified but the mach_ops have not been set.
>
> I would suggest either extending the existing BUG_ON or adding a
> new check in wm97xx_init_pen_irq.

Thanks for the advice.
I will send a v2 patch of adding a new check in wm97xx_init_pen_irq().


Best wishes,
Jia-Ju Bai

