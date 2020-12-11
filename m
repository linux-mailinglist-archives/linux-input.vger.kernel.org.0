Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61462D7B23
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 17:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388456AbgLKQkl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 11:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388177AbgLKQkQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 11:40:16 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D65AC0613CF;
        Fri, 11 Dec 2020 08:39:36 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id a9so14191381lfh.2;
        Fri, 11 Dec 2020 08:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kURQvp2iR25Ml68svxNRaJXyZL2nIIJj6++uLzdZFw4=;
        b=OHTN15aZO/HK+cZ1ZKO+3ijcqOXXNGyGgV9whlB1ch1qnjX2UOEXOfxxmxnTtjA5YE
         vzS8i3DMrCWb8UqEpTQPXZcNLganJlrIlkPLSJM/YcruRJjFkiJFGk8kxEY2xm/gO6hZ
         sVD1FL6NcZir725vDVYo5uWwumKGXRfWfyTzfE8VPc5G26Zlf2+Lxel6AAVMH8i/IE53
         MIcNVL89L4Zdq5SOQTY6r5cCHNLVoX9y0tWY7wu8B2PcDV6qk/zuwS/j/0eH3UBfWtQ0
         LMFun0z11cBEkh4lLXIcsTwkO0OqPuk3Fkd5rjVmAevY1VdnXEp597wQVsYev+bMq3fE
         Cvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kURQvp2iR25Ml68svxNRaJXyZL2nIIJj6++uLzdZFw4=;
        b=a5O+2Ylp52IdC1jqJ6wN3r5dYfFQcC55vZN0ZHMk97OZc2OXj4WcGkLsJPTK/ItAgL
         TbCQiUzLe9Mew+NYCD1SvLmqDg+cDCxE7K9JClp/3+gNrGfa/Ncj1qSidVdz4uOJfAzZ
         mcxQQYEoFUjRdolrYZTNniIRXm8qQPL8pS6m5Kr8GvvOfYE2e4nSN6fRytT22hWRTLL1
         9zQNOEzUGDelh3svioXJoLxKndGJ5JUbWFdApbSRf8r9tHbP6rI4KkE/D7Kdh6eNK9nw
         9N2m3xYnEVCbN4L7ic6yJEYfcq+gRx0j161t+GwPbZ94Z7XZ5bHTOz/4/V20Joi9vb5Z
         rw0Q==
X-Gm-Message-State: AOAM53102BxdjDSGQ2Me79/Hc7z8panC8SLmcU32d3cSzAWdjezRG9f4
        eMDw+xWZQKs39EZ8GPEZvYuoD9vGgdI=
X-Google-Smtp-Source: ABdhPJy8fHoK8/T/0Xdf4x4m5KVAAy4SVzTT+IkyME39dnJOXLdY3G2uVph6MUVObpexnujUYhBLvQ==
X-Received: by 2002:ac2:5cba:: with SMTP id e26mr4687363lfq.4.1607704774462;
        Fri, 11 Dec 2020 08:39:34 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-205.dynamic.spd-mgts.ru. [109.252.193.205])
        by smtp.googlemail.com with ESMTPSA id k11sm703143lji.95.2020.12.11.08.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 08:39:33 -0800 (PST)
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9Mf5G6yvIEAoh2C@google.com> <20201211160917.GA23095@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3d872d19-a0b2-ed83-4b08-5c9a4755c2fe@gmail.com>
Date:   Fri, 11 Dec 2020 19:39:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201211160917.GA23095@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2020 19:09, Michał Mirosław пишет:
> On Thu, Dec 10, 2020 at 11:29:40PM -0800, Dmitry Torokhov wrote:
>> Hi Michał,
>> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
>>> @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
>>>  			}
>>>  
>>>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
>>> -			if (report_len != PACKET_SIZE) {
>>> +			if (report_len != PACKET_SIZE &&
>>> +			    report_len != PACKET_SIZE_OLD) {
>>>  				dev_err(&client->dev,
>>> -					"mismatching report length: %*ph\n",
>>> +					"unsupported report length: %*ph\n",
>>>  					HEADER_SIZE, ts->buf);
>> Do I understand this correctly that the old packets are only observed on
>> EKTF3624? If so can we expand the check so that we only accept packets
>> with "old" size when we know we are dealing with this device?
> 
> We only have EKTF3624 and can't be sure there are no other chips needing this.

In practice this older packet format should be seen only on 3624, but
nevertheless we could make it more explicit by adding the extra chip_id
checks.

It won't be difficult to change it in the future if will be needed.

I think the main point that Dmitry Torokhov conveys here is that we
should minimize the possible impact on the current EKT3500 code since we
don't have definitive answers regarding the firmware differences among
the hardware variants.
