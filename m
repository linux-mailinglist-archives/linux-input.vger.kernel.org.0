Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083EB3015A6
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 15:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbhAWOIl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 09:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbhAWOIh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 09:08:37 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDA4C0613D6;
        Sat, 23 Jan 2021 06:07:53 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id a25so8712253ljn.0;
        Sat, 23 Jan 2021 06:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LI2hVcEVJK1l9uCzeyjkqP1h/8vAAXInB5SI6rzxlfQ=;
        b=GmCSo731Xgv9wFf9egwK59HBJId9/h3545uMHo85hgK5xcLrSxpclZ0ifIqCT1NhWd
         AJCYR3S8SToVTkHDHfd/vORXQfnCoXRkYpWSXKav3yh2hCO9qFgjRlDC8xH/fM9I+RGg
         74oXQ89ig1ITlMwNeCXDxFetrEuR7OeRaXAYzS3Fs6utXeppAPs8R58S58Ad2FyDG//u
         GOpRjhr+mykcoEcfESW5Q/66WBH8inGgq5v2DExSHumt1oIA838mwmk7JdrRA+m05t8u
         pIVQI/tD4m/nMBPYvK9kX3/al7mERnf+J0za0PDnq2KR2uoOA371KdK+5OGsELfgytjI
         e+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LI2hVcEVJK1l9uCzeyjkqP1h/8vAAXInB5SI6rzxlfQ=;
        b=UQ4/IX2uPOudzVyk3jPy9ia74JuazSV0z9i1f/ZmKIfA2pL1ivCxCXo9W7GJ3SQ6XI
         FASOdd5fphjfDUISETYiU+TpqHOFol5NPY8qKAwiFMPEmW3veBIS/Vi5ZIw3J6KbcPTj
         D3BkhfOiF10whWYroNNLVDfuJ6DPzAEzEbSF7jCFrUT1W2YC5iHIcrlO5M+XQmLue2sz
         UMJrR7s9axDitkG24MRsam1fAqcc9HCUWckxyQNVaOuBJ6Hn/a373xKaE1PeHnN3FC3g
         p5ZblB9XhYtZh2a2ds0yBnuezS5aKVNm11h6Qaico18PjLI01XsWVuJ9FUPfg6Vq+GmM
         2Thw==
X-Gm-Message-State: AOAM532pecQLG9mt7lIOtZQSFzcD3JqEwFaq1XbUO7WXh6HJgTn0LgS3
        /Pt4w+TpkppcH8e7BEADzP+zj6An99Q=
X-Google-Smtp-Source: ABdhPJxtNvLyPlH1qmf57PllEZ1wrMVRxsYGQDA4lvmh0OmMS60Oo0XAs1kv8VhDqrM8pjN/o4aTOA==
X-Received: by 2002:a05:651c:513:: with SMTP id o19mr1095187ljp.68.1611410871766;
        Sat, 23 Jan 2021 06:07:51 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z9sm1196724lfs.183.2021.01.23.06.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jan 2021 06:07:51 -0800 (PST)
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9Mf5G6yvIEAoh2C@google.com> <20201211160917.GA23095@qmqm.qmqm.pl>
 <3d872d19-a0b2-ed83-4b08-5c9a4755c2fe@gmail.com>
 <20201211170401.GA31605@qmqm.qmqm.pl> <X9O/F0M4rU6cBdRi@google.com>
 <79cf6571-4239-e98e-6001-70a4bf8b0fe5@gmail.com>
 <4c443c59-a7f8-bf16-cc0b-0e542c0d127f@gmail.com>
 <20210122223718.GE17048@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1fe4d1e7-e356-efea-c913-7ca24c5f9cff@gmail.com>
Date:   Sat, 23 Jan 2021 17:07:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210122223718.GE17048@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

23.01.2021 01:37, Michał Mirosław пишет:
> On Fri, Jan 22, 2021 at 11:10:52PM +0300, Dmitry Osipenko wrote:
>> 08.01.2021 01:06, Dmitry Osipenko пишет:
>>> 11.12.2020 21:48, Dmitry Torokhov пишет:
>>>> On Fri, Dec 11, 2020 at 06:04:01PM +0100, Michał Mirosław wrote:
>>>>> On Fri, Dec 11, 2020 at 07:39:33PM +0300, Dmitry Osipenko wrote:
>>>>>> 11.12.2020 19:09, Michał Mirosław пишет:
>>>>>>> On Thu, Dec 10, 2020 at 11:29:40PM -0800, Dmitry Torokhov wrote:
>>>>>>>> Hi Michał,
>>>>>>>> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
>>>>>>>>> @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>>>>>>>>>  			}
>>>>>>>>>  
>>>>>>>>>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
>>>>>>>>> -			if (report_len != PACKET_SIZE) {
>>>>>>>>> +			if (report_len != PACKET_SIZE &&
>>>>>>>>> +			    report_len != PACKET_SIZE_OLD) {
>>>>>>>>>  				dev_err(&client->dev,
>>>>>>>>> -					"mismatching report length: %*ph\n",
>>>>>>>>> +					"unsupported report length: %*ph\n",
>>>>>>>>>  					HEADER_SIZE, ts->buf);
>>>>>>>> Do I understand this correctly that the old packets are only observed on
>>>>>>>> EKTF3624? If so can we expand the check so that we only accept packets
>>>>>>>> with "old" size when we know we are dealing with this device?
>>>>>>>
>>>>>>> We only have EKTF3624 and can't be sure there are no other chips needing this.
>>>>>>
>>>>>> In practice this older packet format should be seen only on 3624, but
>>>>>> nevertheless we could make it more explicit by adding the extra chip_id
>>>>>> checks.
>>>>>>
>>>>>> It won't be difficult to change it in the future if will be needed.
>>>>>>
>>>>>> I think the main point that Dmitry Torokhov conveys here is that we
>>>>>> should minimize the possible impact on the current EKT3500 code since we
>>>>>> don't have definitive answers regarding the firmware differences among
>>>>>> the hardware variants.
>>>>>
>>>>> The only possible impact here is that older firmware instead of breaking
>>>>> would suddenly work. Maybe we can accept such a risk?
>>>>
>>>> These are not controllers we'll randomly find in devices: Windows boxes
>>>> use I2C HID, Chrome devices use "new" firmware, so that leaves random
>>>> ARM where someone needs to consciously add proper compatible before the
>>>> driver will engage with the controller.
>>>>
>>>> I would prefer we were conservative and not accept potentially invalid
>>>> data.
>>>>
>>>> Thanks.
>>>>
>>>
>>> Michał, will you be able to make v9 with all the review comments addressed?
>>>
>>
>> I'll make a v9 over this weekend.
>>
>> Michał, please let me know if you already started to work on this or
>> have any objections.
> 
> Hi,
> 
> Sorry for staying quiet so long. I have to revive my Transformer before
> I can test anything, so please go ahead.

No problems, hope it's nothing serious and you'll have some spare time
to revive it soon!
