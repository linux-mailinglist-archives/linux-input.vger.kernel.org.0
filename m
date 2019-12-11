Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5612111B0C7
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 16:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733068AbfLKP0H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 10:26:07 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34136 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732924AbfLKP0H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 10:26:07 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so17042572lfc.1;
        Wed, 11 Dec 2019 07:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UXbv7AZalf0SJthB9VxmQOQHQNQr5NxpvNmi8Mus0cU=;
        b=DAGXRwf7NY3dt7nxqCSZ6a856Lz3XGnVqcq9yPxYkzkNSNs/YT4VHK/A8h1hpbcQcC
         SlxjNIxenKolltunkOAS3xBBU4tnB5vOgy/h1HJuz5j2lGa9HdYtNyleNXBWs8d/BUVP
         uJ11i+JTvE3Imwu6qulmRFQdk4dZDVDbEowWc3riwi/4gSGmuuASd9zKQ1+RqNwqKC8l
         pKDsVvxajmupA7JXYB0wKAtCpCki/lnHxkVT7X4qKqlkwzOp1Z5WyDPF4SIz3NQVRniz
         4YKV5fnuHx9KIpMPvX8JB8Pgu9iY5MYaLSlVIYbsYC9VPjbxqMobUw5CfaNsu0zb1jPd
         G0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UXbv7AZalf0SJthB9VxmQOQHQNQr5NxpvNmi8Mus0cU=;
        b=oeJF9gSncR98Aepw7K51rIh3kqLtxHHlfgVorIuwuTID5sbejOtBZgRAS3Vvj92IPG
         I3ckupn9ys57wbBPtH4OgOo0DFSGGdPoE7uiiIlB+uS03aTuLnfi93FdRch633Pdi6BF
         SYigTRo4VNtQOx4p4wOYSKmjKE1ka+V1O0XVojVrL1Hg/76FiYZm/G5BiHCq2Uu5sFoJ
         vhPQL1gC/Sztktbz2TFmVS8HBbb9fZVvEaY29EHaf5dTpis+igOfZBpMVPRPs5PHSdTq
         ZgyanSxcOYgteBuBFWhv4/2ke4bUUcQyvFMrdcGWd5fdbD1HqEM1vK/A7xXB9M2H5OZp
         v/Sg==
X-Gm-Message-State: APjAAAVaACuXQKraxYwC7OfZ64hhvR3rduAhkVTgBA0aRPLDILiYIdlR
        f04jDltlNqxc1JH0nwETBzZeVfRg
X-Google-Smtp-Source: APXvYqyYm/SNIE22ortuNQPRjduIvM/kAFQbigUzlR+6z5UFuwd16Xk59CtfmpwCARAUWDExiJMeyQ==
X-Received: by 2002:ac2:4199:: with SMTP id z25mr2597142lfh.102.1576077964140;
        Wed, 11 Dec 2019 07:26:04 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t81sm1335053lff.25.2019.12.11.07.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 07:26:03 -0800 (PST)
Subject: Re: [PATCH 3/6] input: elants: support common touchscreen DT
 properties
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <7e650a6ef98e3178d6829c3c2c83f21437070d84.1575936961.git.mirq-linux@rere.qmqm.pl>
 <17bb20b8-a62c-828f-d329-cd3aa89c1c06@gmail.com>
 <20191210023818.GB15246@qmqm.qmqm.pl>
 <2c9cd83c-518f-2f22-c3e7-ac629a181b8d@gmail.com>
 <20191211032813.GA17731@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <21532a63-6706-c082-5ab1-cf083bd3af47@gmail.com>
Date:   Wed, 11 Dec 2019 18:26:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191211032813.GA17731@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2019 06:28, Michał Mirosław пишет:
> On Tue, Dec 10, 2019 at 06:21:02PM +0300, Dmitry Osipenko wrote:
>> 10.12.2019 05:38, Michał Mirosław пишет:
>>> On Tue, Dec 10, 2019 at 04:03:18AM +0300, Dmitry Osipenko wrote:
>>>> 10.12.2019 03:19, Michał Mirosław пишет:
>>>>> Support common DT properties like axis inversions to complement
>>>>> information obtained from device's firmware.a
>>> [...]
>>>>> @@ -1251,13 +1250,15 @@ static int elants_i2c_probe(struct i2c_client *client,
>>>>>  	ts->input->name = "Elan Touchscreen";
>>>>>  	ts->input->id.bustype = BUS_I2C;
>>>>>  
>>>>> +	touchscreen_parse_properties(ts->input, true, &ts->prop);
>>>>
>>>> Shouldn't this function be invoked after setting the max x/y sizes with
>>>> the hardware values? That's what all other drivers do and then you won't
>>>> need to set the ts->prop.max_x/y above in the code.
>>>
>>> This is done later in the series - this patch only adds axis inversion
>>> support and ignores DT-provided sizes.
>>
>> What is the reason of splitting it into two patches?
>>
>> Perhaps I'm still missing something, but why something a bit more simple
>> like this wouldn't yield exactly the same result:
> [...]
> 
> Originally I thought to skip probing the hardware when all info is
> already provided in devicetree. This didn't happen, though. I'll take
> your patch then, with a slight adjustment in "prop"'s position... And
> the rest of them, so as to not duplicate the work. :-)

Okay
