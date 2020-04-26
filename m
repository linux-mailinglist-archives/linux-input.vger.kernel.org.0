Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD07D1B8C88
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 07:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgDZFVN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 01:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgDZFVM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 01:21:12 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C8CC061A0C;
        Sat, 25 Apr 2020 22:21:11 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id f11so9486470ljp.1;
        Sat, 25 Apr 2020 22:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zP7niTtzeJGKIv5s1G7Pa9omvsdhZPwjcaRy9li5ChA=;
        b=HeBXVGsGwmxmfLl4Bllc669KN5N3xeVaFgWVjdPiqYWFa9XrTqBFrkpyk65QKeYjou
         qSwVvgi6xGJzItYagGSNgSYV6l2D8Z8GPlLVYleMwczQtJWa2Q5RSQkaeoiGlWEkpFs8
         gQyRGyl8xIwIV0wnbyrSkPh2pJouGrve0sVXZl6ubAaZODQ1QBYdyotCqTh4iLs2ULNi
         LRx3JUMU31ezN1ToZNBSvuALuPPoDNO40O+Q8/YknxeaAoXtWvpjqWTcPRKzFCTliTTY
         TD7MkBePxVXWbHMlzp5CjHv4EqO/k+JdnCAnQn7llMK89Og6PMWKcT4bSsD7W61dV56r
         hQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zP7niTtzeJGKIv5s1G7Pa9omvsdhZPwjcaRy9li5ChA=;
        b=EEvE25N0ezG0NEuTq+FPZJ+pdkeXUVjtPu9iKw55QbV7KxiYDvJmNPQgV6jzVPnVq/
         4FeLyWFrcgbUgMv5TpwrNpHikZsyFM2TTB3YmkUIU65dMnEkIzRk4t6hmn10f2V2LlLb
         Nqj9JwmqnDSixpNM2nFXxWwWSxb4U0bThESOpgw3qDTd9YRxGyQsCSgiZnr1NvvDMKvK
         in5obPUuX0/R/tA5ZxtSk4wYkmotWnlDGRpq5VChjVelyvZir/6nkYYKI/d5Kasj337X
         +iJJpzyqWSb/Dzt25o3gZtnDpjWjHAf6D2YRkGfUk2c0fIlhfmW0cNkwNlB6oLt+O4QR
         F8aw==
X-Gm-Message-State: AGi0PuY0FWHBCFajtC5D0PzVhPHx0r8T9bQ/CF4oT/oJ/yLLQDdMwANu
        Tf5Cyu8rLt7qYefpwUCNfjtK+87/
X-Google-Smtp-Source: APiQypICQSLBRYsThN7tnhA1wR2mO6hNSAvM7vRQlT0Jl/bWCqRhREBIaEaKVxRedtObPWxZwGvVJQ==
X-Received: by 2002:a2e:8689:: with SMTP id l9mr10699402lji.193.1587878469301;
        Sat, 25 Apr 2020 22:21:09 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id m15sm2216471lji.21.2020.04.25.22.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 22:21:08 -0700 (PDT)
Subject: Re: [PATCH v3 7/9] input: elants: support 0x66 reply opcode for
 reporting touches
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <f442f4e0e79d4acaff8481729bee73d33f77a9ef.1586784389.git.mirq-linux@rere.qmqm.pl>
 <20200426051503.GS125362@dtor-ws>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e3c9bf37-2a47-43f4-bd4b-13724000dbd2@gmail.com>
Date:   Sun, 26 Apr 2020 08:21:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426051503.GS125362@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 08:15, Dmitry Torokhov пишет:
> On Mon, Apr 13, 2020 at 03:32:26PM +0200, Michał Mirosław wrote:
>> From: Dmitry Osipenko <digetx@gmail.com>
>>
>> eKTF3624 touchscreen firmware uses two variants of the reply opcodes for
>> reporting touch events: one is 0x63 (used by older firmware) and other is
>> 0x66 (used by newer firmware). The 0x66 variant is equal to 0x63 of
>> eKTH3500, while 0x63 needs small adjustment of the touch pressure value.
>>
>> Nexus 7 tablet device has eKTF3624 touchscreen and it uses 0x66 opcode for
>> reporting touch events, let's support it now. Other devices, eg. ASUS TF300T,
>> use 0x63.
>>
>> Note: CMD_HEADER_REK is used for replying to calibration requests, it has
>> the same 0x66 opcode number which eKTF3624 uses for reporting touches.
>> The calibration replies are handled separately from the the rest of the
>> commands in the driver by entering into ELAN_WAIT_RECALIBRATION state
>> and thus this change shouldn't change the old behavior.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Tested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> ---
>>  drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
>> index 2b936e920874..9751139e8507 100644
>> --- a/drivers/input/touchscreen/elants_i2c.c
>> +++ b/drivers/input/touchscreen/elants_i2c.c
>> @@ -60,6 +60,15 @@
>>  #define QUEUE_HEADER_NORMAL	0X63
>>  #define QUEUE_HEADER_WAIT	0x64
>>  
>> +/*
>> + * Depending on firmware version, eKTF3624 touchscreens may utilize one of
>> + * these opcodes for the touch events: 0x63 and 0x66. The 0x63 is used by
>> + * older firmware version and differs from 0x66 such that touch pressure
>> + * value needs to be adjusted.
> 
> Who is responsible for the adjustment? Where does it happen?


Please see the patch #2 ("support old touch report format") which adds
support for parsing of the older packet format that requires the
pressure value adjustment.
