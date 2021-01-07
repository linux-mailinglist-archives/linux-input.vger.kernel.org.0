Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040892EE822
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbhAGWHn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbhAGWHm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:07:42 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363C1C0612F4;
        Thu,  7 Jan 2021 14:07:02 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id o17so18283723lfg.4;
        Thu, 07 Jan 2021 14:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x0u8HAywMTIZHLAk6gCOMzis2S7YjfHM2qyipJvElg4=;
        b=BjAFMhfJtEzx8E8SPIiom6TC9QWp4QrJ2tIdXclg4KatIn3SzE9ja/r9LdNJFml+BO
         es/eThkuRZx1tyxGVqhvWmb6s2QLr8q0tgKQVvdnCyloup3kaNic3tBnmjKWqjEwland
         v3F4Er8NkQXnCYByvY/PjCIYLjK+cJf2v8yCOJJANX+I1W3wcaOXgSJ64n4zAI5OX/p8
         2nRTrvXh3gENDWalA/DxTPIfVEvneu5NjcvjHHem+8XpP2TYPqYt1upjfARw3HiFy0tV
         WtI0sdZ6as8Ldg6g8SVfr1NYnSuOH6pbj76zY8Szr6jfqwjOuacqZBnXpC8vdgqyGggh
         /TAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x0u8HAywMTIZHLAk6gCOMzis2S7YjfHM2qyipJvElg4=;
        b=YvrB5drmuFsKagzXA7P2vUfDOhKLGzM3xwDILassWwDnFF86YD6AzZBMQVSKXLvjvi
         njTRoBmvVBhlDlvwCaa6vTlSfOVzHPjRXDrOP+Q7T8YHNA06xPwWAGngmaHNdJNnpOEO
         FnUeQHLD148dLCms/+qCJ59FpWuwtyWgTY9/kLzCcFeWvPsTnwnGwfiAr9BiayI3q7OO
         a43DiG8LgkICMWDiOhXEGZHrUybtsQQIZS7CGkUeKikqKds6XLJbgdGVCFLuRHKlSfJe
         7y/VRggAB6ivbrklUnTz5I0p04xBvlzZaxOXKZJS23Njd2I78Pq3oy8I9jhc5mVG8RKS
         5OgA==
X-Gm-Message-State: AOAM533TBi277MivWY140o55wOOdVg+hVCRlAcWwC3/K8bT3G6k3toN5
        XWaTT+rptb0HRQD2XyyjjX58Ui+YV3U=
X-Google-Smtp-Source: ABdhPJyu7b+p5/ILfwUcKBfY1ZPU5VvCcWvCQNkHZFe8fEiMpHsILI5C52Kfph8V8SAwfLHoHct1gg==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr220034ljk.150.1610057220416;
        Thu, 07 Jan 2021 14:07:00 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id c14sm1429632lfd.186.2021.01.07.14.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 14:06:59 -0800 (PST)
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9Mf5G6yvIEAoh2C@google.com> <20201211160917.GA23095@qmqm.qmqm.pl>
 <3d872d19-a0b2-ed83-4b08-5c9a4755c2fe@gmail.com>
 <20201211170401.GA31605@qmqm.qmqm.pl> <X9O/F0M4rU6cBdRi@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <79cf6571-4239-e98e-6001-70a4bf8b0fe5@gmail.com>
Date:   Fri, 8 Jan 2021 01:06:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X9O/F0M4rU6cBdRi@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2020 21:48, Dmitry Torokhov пишет:
> On Fri, Dec 11, 2020 at 06:04:01PM +0100, Michał Mirosław wrote:
>> On Fri, Dec 11, 2020 at 07:39:33PM +0300, Dmitry Osipenko wrote:
>>> 11.12.2020 19:09, Michał Mirosław пишет:
>>>> On Thu, Dec 10, 2020 at 11:29:40PM -0800, Dmitry Torokhov wrote:
>>>>> Hi Michał,
>>>>> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
>>>>>> @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>>>>>>  			}
>>>>>>  
>>>>>>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
>>>>>> -			if (report_len != PACKET_SIZE) {
>>>>>> +			if (report_len != PACKET_SIZE &&
>>>>>> +			    report_len != PACKET_SIZE_OLD) {
>>>>>>  				dev_err(&client->dev,
>>>>>> -					"mismatching report length: %*ph\n",
>>>>>> +					"unsupported report length: %*ph\n",
>>>>>>  					HEADER_SIZE, ts->buf);
>>>>> Do I understand this correctly that the old packets are only observed on
>>>>> EKTF3624? If so can we expand the check so that we only accept packets
>>>>> with "old" size when we know we are dealing with this device?
>>>>
>>>> We only have EKTF3624 and can't be sure there are no other chips needing this.
>>>
>>> In practice this older packet format should be seen only on 3624, but
>>> nevertheless we could make it more explicit by adding the extra chip_id
>>> checks.
>>>
>>> It won't be difficult to change it in the future if will be needed.
>>>
>>> I think the main point that Dmitry Torokhov conveys here is that we
>>> should minimize the possible impact on the current EKT3500 code since we
>>> don't have definitive answers regarding the firmware differences among
>>> the hardware variants.
>>
>> The only possible impact here is that older firmware instead of breaking
>> would suddenly work. Maybe we can accept such a risk?
> 
> These are not controllers we'll randomly find in devices: Windows boxes
> use I2C HID, Chrome devices use "new" firmware, so that leaves random
> ARM where someone needs to consciously add proper compatible before the
> driver will engage with the controller.
> 
> I would prefer we were conservative and not accept potentially invalid
> data.
> 
> Thanks.
> 

Michał, will you be able to make v9 with all the review comments addressed?
