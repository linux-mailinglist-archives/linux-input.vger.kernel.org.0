Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8569C40F3C9
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 10:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245523AbhIQIK3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Sep 2021 04:10:29 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50692
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245497AbhIQIKG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Sep 2021 04:10:06 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DE5EC3F324
        for <linux-input@vger.kernel.org>; Fri, 17 Sep 2021 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631866120;
        bh=JQ215WaV0fJ7lfFcgk3AWKxJPWvRWqz6N9EycVhPbcY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=YVlPQKBnKFhUEF4sl7LxeT2YBhieRjrr3OouZOCqtctZcMPnKCx2UJwjNHKw55sxe
         FaUvRqwphwq/7CV/S8x7nP2r4JoUNHBAhnM0FkgWrdw6S4F5eJip9AvmiX83G0NZQ8
         T1rHGYBdw8wWIgD16Ne872DJieIntayNI/6zyQO0A5uK1OP9WTtQ5GE53zydFIfs2B
         jPVMqa/OyChLLcFH9WMOOhL3V+wH6qKr232dhqwjVqi4k4PLE2vWru+vIQ9FfHOLKR
         Tt3irrR1suD2fjAY0bFvdEGf4Nf0KaCA8L/QKqs3xQ19O1lEDlTc9x7gln+XCzYQNm
         FfJNWWbhuem5w==
Received: by mail-wr1-f71.google.com with SMTP id s13-20020a5d69cd000000b00159d49442cbso3407600wrw.13
        for <linux-input@vger.kernel.org>; Fri, 17 Sep 2021 01:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JQ215WaV0fJ7lfFcgk3AWKxJPWvRWqz6N9EycVhPbcY=;
        b=S/HZFgzwfRGeebANOPkd/+G+U2gTNT+npWZF/jsiNvc62AYOPdAJc77prCuH8/mRoO
         FyotRb4hY0c7s3muiBr2vDBMZGDL+hXKu7nmDvCQ7uidl8Gc1h9RGubcn+VV6ugMOLsX
         zLWBiR8OfCT5zABIggIIPaCTQlKLuKTLc3sca5ml1889j1Qjf0H/xItanNpQdJ7JEqLG
         WctQX9TezL3gwsjr1uE1Qm9UHA9dB6c4NDNWvGXS1Zr8zGdDaVcGfGcVHWgbg+0ywnkY
         QFGSUY477XH0Vs8D/Pa5ix1R0ZCv5Whhg8yxzryKl+I1T3uHA9WVySD6xirsEb6z9UWd
         PpMA==
X-Gm-Message-State: AOAM531ni9SPkyRl/RThsgH8JeA+7Z9JCIF3WW+tq7a8phQ438VI4zQ9
        YfWHMdaC2jzEDEY45Gip5zZ1pPhTX2YCGlerTEERFC/Y1skjcE8TfFmx8zhB6j92JBG6SOEdgwq
        ZarR4gwUEMdwSn+xgyjLfgjATSHGKQhFVnrPDbIbn
X-Received: by 2002:a7b:c194:: with SMTP id y20mr4972408wmi.37.1631866120596;
        Fri, 17 Sep 2021 01:08:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybmvG2ZP2OSs0SKxy2scM8q/zXOVZb7078WFLVPQlesnpGevmBfMU/lFv3k/VB/mjPb4gKRw==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr4972392wmi.37.1631866120465;
        Fri, 17 Sep 2021 01:08:40 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id y6sm5726381wrp.46.2021.09.17.01.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 01:08:40 -0700 (PDT)
Subject: Re: [PATCH] Input: ads7846 - Make use of the helper function
 dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210916153104.13727-1-caihuoqing@baidu.com>
 <922265b2-bed7-8daa-3132-8cfc3b5e50fd@canonical.com>
 <20210917022910.GA17584@LAPTOP-UKSR4ENP.internal.baidu.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <157cce4f-6a8c-bf53-3790-ea43d5662f7f@canonical.com>
Date:   Fri, 17 Sep 2021 10:08:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917022910.GA17584@LAPTOP-UKSR4ENP.internal.baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 17/09/2021 04:29, Cai Huoqing wrote:
> On 16 9月 21 21:34:26, Krzysztof Kozlowski wrote:
>> On 16/09/2021 17:31, Cai Huoqing wrote:
>>> When possible use dev_err_probe help to properly deal with the
>>> PROBE_DEFER error, the benefit is that DEFER issue will be logged
>>> in the devices_deferred debugfs file.
>>> Using dev_err_probe() can reduce code size, and the error value
>>> gets printed.
>>>
>>> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
>>> ---
>>>  drivers/input/touchscreen/ads7846.c | 7 ++-----
>>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> You sent 32 independent patches. Do you expect us to copy-paste similar
>> feedback on each of them? This would not make any sense. Please organize
>> all your submissions in a series with:
>>
>>   git format-patch -32
>>   git send-email ..... 00*
> Ok, I'll try. but there are different owners for touchscreen/xxx,
> is it ok to send them the whole series?

I see the same maintainers:
Dmitry Torokhov + linux-input

HWMON also appears because of usage of hwmon API inside, which might
happen anyway for few other input drivers

Best regards,
Krzysztof
