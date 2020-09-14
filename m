Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14A6268FDB
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 17:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgINP05 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 11:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgINP0f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 11:26:35 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F922C061788;
        Mon, 14 Sep 2020 08:26:28 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so13897293lfr.4;
        Mon, 14 Sep 2020 08:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VTPsLW0+iZl+i1mp/rzyEpz05jiz9NlTzkY82SUke6I=;
        b=Bc4H4IN163/VqP3IR0+XQoY77UvNMwR3H4gdXPUTefa4oZ2ALD3VRwXfxTpn64AiBB
         00U8431esUNOE6sWmyDVS9Ur66r9kj7aLx7zL9z1maTm5FouMFnyU5sM6CuW7yLKZtmV
         vn1rXutOZ+iM7e5t3AX+l1McxD57m5V+J4VNhhbeL+gI9H/C34HA9LrRKAw3a7khq75x
         JVincmGoevQImC3c2zGS/SHYeHmVQp7H/TnTrt1kFAKsdhRhZbXXwHuNGvH71u3NB+KX
         D3gRrUbiSKGCw6dslTmut+Zz2R9hvERGIhMuM/s73f4Qwpo7C48cFwKYTkwvEs7Wn1Cl
         ON1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VTPsLW0+iZl+i1mp/rzyEpz05jiz9NlTzkY82SUke6I=;
        b=M4hgHWYFM89L86V8KTDNCw5ONjrSfxX1BF+7RzxmpZSGJQFxtYDvs936bqpXUICMus
         4kFfQ0NnN2tNPpMXyZCM38wd7ArpoKq2QQznmfFAnrDwuQOaO1qyl1egVhzHogbkb5pz
         /8y804AnKWuSCN2Mw1bIzaYo2GoHtP87ZhJmWMqWizI8yu45PdhAHISCe1MVx/EoUB9o
         6akWtdDKsVp1AUB30+geS0dPqKvA3HJMTKz/CEhdSPt+43fF2prgMhDk/DKpF/VaUA0n
         AUoiaPu2Ztv18wDrlJx+4p/hRVuHgI2WDedh0sq3/LLNqTlK+JynlTW4xB0bKu6PISgE
         1fsQ==
X-Gm-Message-State: AOAM533ENB1/MOLEh1JdX4uaKPUr6IvO2Q3kokVHkKWPRqC33SST1uxr
        vHEXvZ+xfQ8vo1KzXsJVvtc=
X-Google-Smtp-Source: ABdhPJzVTQ/QrzbOX/Qk7OQuyVj/r7/vkJQLRUbCZlGbJxq3UgxnVdinFjXQMeNxAWeXe4GUJjHF4Q==
X-Received: by 2002:a19:b97:: with SMTP id 145mr4883827lfl.269.1600097186798;
        Mon, 14 Sep 2020 08:26:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id z7sm3423208lfb.221.2020.09.14.08.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 08:26:26 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew_Gabbasov@mentor.com
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <CAHp75Vc5YCb-6oRRfVOE5bL_Dmzy0LwDpetxqD-G+E9M=EwA=w@mail.gmail.com>
 <bd668b99-5b14-f54d-101d-7d56e0c8c4c0@gmail.com>
 <CAHp75VdTv-uCQue3VU=czZJd4iTG+XBVe2kFtnP+fZ1XQuFbzA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <137be969-f99a-66e0-ebe4-b86f4be2b5d3@gmail.com>
Date:   Mon, 14 Sep 2020 18:26:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdTv-uCQue3VU=czZJd4iTG+XBVe2kFtnP+fZ1XQuFbzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

14.09.2020 16:49, Andy Shevchenko пишет:
> On Sun, Sep 13, 2020 at 3:57 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 13.09.2020 11:43, Andy Shevchenko пишет:
>>> ...
>>>
>>>> +       bool retried = false;
>>
>>> I thought Dmitry wants that to be retry
>>
>> In the comment to v2 you suggested to negate the condition,
> 
> Where? I just checked a few messages before and I found that I asked
> the same question: why is negative conditional used instead of
> positive.

I'm reading this as imperative "make it positive", and thus, assumed
that you asked to do so because the "retry" implies a positive
condition, while "retried" implies the negative.

If you've added "Could you please explain why", then I'd read it as a
question.

>> hence I
>> thought it's YOU who wants it to be retried.
> 
> I see. Let's see how it goes with positive conditionals first.
> 
> 
>> The "retried" is a very common form among kernel drivers, so it's good
>> to me.
>>
>>>>         u8 buf[2];
>>>>         int ret;
>>>
>>>> -       ret = i2c_transfer(client->adapter, xfer, 2);
>>>> -       if (ret == 2) {
>>>> -               ret = 0;
>>>> -       } else {
>>>> -               if (ret >= 0)
>>>> -                       ret = -EIO;
>>>> +retry_read:
>>>
>>>> +       ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
>>>> +       if (ret != ARRAY_SIZE(xfer)) {
>> ...> Also why switch from positive to negative conditional?
>>
>> This will make code less readable because of the goto, and thus, there
>> will be two branches for handling of the returned value instead of one +
>> goto. Hence this part is good to me as-is.
> 
> But it's not the purpose of this patch, right?
> Style changes should be really separated from the fix.

This should be up to a particular maintainer to decide. Usually nobody
requires patches to be overly pedantic, this may turn away contributors
because it feels like an unnecessary bikeshedding. It's more preferred
to accept patch as-is if it does right thing and then maintainer could
modify the patch, making cosmetic changes.

> And since it's a fix it should have a Fixes tag.

It shouldn't be a fix, but a new feature because apparently the 1386
controller wasn't ever intended to be properly supported before this patch.
