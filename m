Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641D6300EF1
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 22:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbhAVVbd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 16:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730927AbhAVULk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 15:11:40 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E946C0613D6;
        Fri, 22 Jan 2021 12:10:55 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id f2so2728858ljp.11;
        Fri, 22 Jan 2021 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H7imHW7ls0O6umvDHx3mET/iy1PE5HlnkDqE6ANlsPA=;
        b=ECOw6hZIYZnDs0rEP4IM6c/ILK1/8l0BBW/ZHkrvMubErCav0MVAxi5gfd9cwVWLKD
         ji0DfnTIadSCPsTKRUFo5i7RbCD1T3WNVc5oo+Q+zW8motUL+ZyLMKyZDXb5Lpcs0gOX
         azppcnKBBhAnkvh5IHaaHmLc4OkR2pz6WPzatuQTUqGtRYZTw9wVMwI7QR5HKu0PQHPt
         5mnW8thGaZ6kgKZkx1lcJQiWO6GzLuaxl0J31FDRRJHCigRZtKvEMXLmdOqCCvqKoUOr
         0/7TiQPHrJ4MimlGhDfHW7hcAXnPMQl6+eWWxqj0h3Hf9nc5ZpanBf72LT8+t6PNrbwF
         QeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H7imHW7ls0O6umvDHx3mET/iy1PE5HlnkDqE6ANlsPA=;
        b=i5imoKEXYuOxv5vVEo8yCdhoMcaXYqwYdeGPesm3kpMxtU0VcOAy08X88n7qdx2osW
         bdokT5Lvvv1XGihYDi0xlUEPVolCJQYJL+EWVqmQM/OYOH00SlomkUzEXV9odO3VzH8k
         HmG497cq99DDkIR3WPRSi9/9EFX75qk4uDbcDQqshUf6iQRaIbzYHtFRDnUvzYgeTSAF
         xcdDa/Akw1SESM+WHVxYoSVdBOC9JRYW0iT61XE7RZ0HnjxIH5R7BYjL/V3Q+vD0RxXU
         lPFGE8BRDDtESxKpBBUsjy/vT37ioz7/9b6w8wruBZAtDwrhKstpiyGtbTQPnrfj6OGt
         lXsA==
X-Gm-Message-State: AOAM530yUe+YuhSwroJJyP/H37/OenOB3Xzr29JYGMJV8VkO4kNA+OTU
        41xfUyMBblueHmsu7zl5kNJYZt6Zmtw=
X-Google-Smtp-Source: ABdhPJxrQfPl5kGQcVPYDqQYsoo7AzOmo2HkO/jneNbHTZLmuy/W6q7urd/ZOwFnhyJMS2Z1Ey8QJg==
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr1285932ljk.385.1611346253526;
        Fri, 22 Jan 2021 12:10:53 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id y23sm995881lfy.158.2021.01.22.12.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 12:10:52 -0800 (PST)
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9Mf5G6yvIEAoh2C@google.com> <20201211160917.GA23095@qmqm.qmqm.pl>
 <3d872d19-a0b2-ed83-4b08-5c9a4755c2fe@gmail.com>
 <20201211170401.GA31605@qmqm.qmqm.pl> <X9O/F0M4rU6cBdRi@google.com>
 <79cf6571-4239-e98e-6001-70a4bf8b0fe5@gmail.com>
Message-ID: <4c443c59-a7f8-bf16-cc0b-0e542c0d127f@gmail.com>
Date:   Fri, 22 Jan 2021 23:10:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <79cf6571-4239-e98e-6001-70a4bf8b0fe5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

08.01.2021 01:06, Dmitry Osipenko пишет:
> 11.12.2020 21:48, Dmitry Torokhov пишет:
>> On Fri, Dec 11, 2020 at 06:04:01PM +0100, Michał Mirosław wrote:
>>> On Fri, Dec 11, 2020 at 07:39:33PM +0300, Dmitry Osipenko wrote:
>>>> 11.12.2020 19:09, Michał Mirosław пишет:
>>>>> On Thu, Dec 10, 2020 at 11:29:40PM -0800, Dmitry Torokhov wrote:
>>>>>> Hi Michał,
>>>>>> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
>>>>>>> @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>>>>>>>  			}
>>>>>>>  
>>>>>>>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
>>>>>>> -			if (report_len != PACKET_SIZE) {
>>>>>>> +			if (report_len != PACKET_SIZE &&
>>>>>>> +			    report_len != PACKET_SIZE_OLD) {
>>>>>>>  				dev_err(&client->dev,
>>>>>>> -					"mismatching report length: %*ph\n",
>>>>>>> +					"unsupported report length: %*ph\n",
>>>>>>>  					HEADER_SIZE, ts->buf);
>>>>>> Do I understand this correctly that the old packets are only observed on
>>>>>> EKTF3624? If so can we expand the check so that we only accept packets
>>>>>> with "old" size when we know we are dealing with this device?
>>>>>
>>>>> We only have EKTF3624 and can't be sure there are no other chips needing this.
>>>>
>>>> In practice this older packet format should be seen only on 3624, but
>>>> nevertheless we could make it more explicit by adding the extra chip_id
>>>> checks.
>>>>
>>>> It won't be difficult to change it in the future if will be needed.
>>>>
>>>> I think the main point that Dmitry Torokhov conveys here is that we
>>>> should minimize the possible impact on the current EKT3500 code since we
>>>> don't have definitive answers regarding the firmware differences among
>>>> the hardware variants.
>>>
>>> The only possible impact here is that older firmware instead of breaking
>>> would suddenly work. Maybe we can accept such a risk?
>>
>> These are not controllers we'll randomly find in devices: Windows boxes
>> use I2C HID, Chrome devices use "new" firmware, so that leaves random
>> ARM where someone needs to consciously add proper compatible before the
>> driver will engage with the controller.
>>
>> I would prefer we were conservative and not accept potentially invalid
>> data.
>>
>> Thanks.
>>
> 
> Michał, will you be able to make v9 with all the review comments addressed?
> 

I'll make a v9 over this weekend.

Michał, please let me know if you already started to work on this or
have any objections.
