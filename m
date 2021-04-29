Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119CF36ECAB
	for <lists+linux-input@lfdr.de>; Thu, 29 Apr 2021 16:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240646AbhD2Otr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 10:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240635AbhD2Otq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 10:49:46 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32422C06138B
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 07:48:58 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id z6so5952225wrm.4
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=vngK38/uzYnT4W+jr6IRjRIJAM+iJCix31NgQ9EuLvg=;
        b=YTSzJGcJHQgMlVXHNlXeaegByzcdO/Ixq9cwa3gZIFs3WIVEICy7i6oaNv6IY9heK7
         3c+2qFCcvore/t6PybqZ371mANjlIO6Gow70D+otyIZbAmzdIs25wLSskUQbnAeN6e/F
         Ka3IZAu9ACMS2YqTyCoGjzJdaTJLf6Bh5Q3u0ojWvmh3ox6/A/oHVkgYkmtR5Uk5ykVn
         9MciTdw6XCQoZaeHTMxi/igOej912jK01qR+4ZtYYNTFHrluX9deMM+JEN8vmzveHWyr
         iUd6sEyPOAhufRaw9anUNU86N5EcjVMvyafncjUCAGlePRQXghhvzVcsKb39+t+pipJY
         iuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=vngK38/uzYnT4W+jr6IRjRIJAM+iJCix31NgQ9EuLvg=;
        b=bRqGXiqAaFUspKtww5Hn1SVWipvhTtmx+5a4tuiA43UDqhP9+N8efQGXyFK2TzEOVR
         +pi+Sy3SzbuQD3dRfxm1usnZh0ckyWzkeHo4WUvpiCYMgVym/1gGIXfnAjETnc23Yk/z
         bT6XRsuWZ9M0/MP7k6NPzOOnLps8r5xlVxNt/EBZVyPxSochBKsGHRYTBzdQLnOrvzhh
         L1CNA/IADoTvXErb/nvk3+9purNLVuOys8uKkdh8wLU8TpQQz5Khunfj/JyYHMsEzvsP
         /HuH+YPB1c4g5A+ZRHieZtMS4+Bpvtkm3KzaEr5gVLjzo1mHIbfbMSePxVNpc8vNwOt4
         yC/Q==
X-Gm-Message-State: AOAM532aRb/wAEadsoZSEzLxIyMGCcO47kuGfOxrITgzdU+tlrtc+eEt
        3mi5yn0p/Jnb2D9uZwJbhh/ebedF+VQ4GA==
X-Google-Smtp-Source: ABdhPJzRr1ptHoMK+F/hhQ1TsfC2223uBRcGsPIsIY79GHjAwVNUN4USMf1S/BuOGfztjsVVwGhQrA==
X-Received: by 2002:a5d:6da8:: with SMTP id u8mr218171wrs.48.1619707736884;
        Thu, 29 Apr 2021 07:48:56 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:f37e:9091:b397:6f48])
        by smtp.gmail.com with ESMTPSA id r2sm4995675wrt.79.2021.04.29.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 07:48:56 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>, fparent@baylibre.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] Input: mtk-pmic-keys - check for NULL on
 of_match_device()
In-Reply-To: <875z05y4a2.fsf@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
 <20210428164219.1115537-2-mkorpershoek@baylibre.com>
 <YIm9Bb3eBjYwY53R@google.com> <875z05y4a2.fsf@baylibre.com>
Date:   Thu, 29 Apr 2021 16:48:55 +0200
Message-ID: <87wnslw3hk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Mattijs Korpershoek <mkorpershoek@baylibre.com> writes:

> Hi Dmitry,
>
> Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:
>
>> Hi Mattijs,
>>
>> On Wed, Apr 28, 2021 at 06:42:13PM +0200, Mattijs Korpershoek wrote:
>>> mtk-pmic-keys being a child device of mt6397, it will always get probed
>>> when mt6397_probe() is called.
>>> 
>>> This also happens when we have no device tree node matching
>>> mediatek,mt6397-keys.
>>
>> It sounds for me that creating a platform device instance in case where
>> we know need OF node, but do not have one, is wasteful. Can
>> mt6397-core.c and/or MFD core be adjusted to not do that.
>
> You are right. Maybe I can fix MFD core instead. I will look into it.
>
> Thanks for your review.
>>
>>> 
>>> In that case, the mfd core warns us:
>>> 
>>>   [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]
>>> 
>>> Check return value from call to of_match_device()
>>> in order to prevent a NULL pointer dereference.
>>> 
>>> In case of NULL print error message and return -ENODEV
>>> 
>>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>>> ---
>>>  drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>> 
>>> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
>>> index 62391d6c7da6..12c449eed026 100644
>>> --- a/drivers/input/keyboard/mtk-pmic-keys.c
>>> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
>>> @@ -247,6 +247,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>>>  	const struct of_device_id *of_id =
>>>  		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
>>>  
>>> +	if (!of_id)
>>> +		return -ENODEV;
>>> +
>>
>> So if we make MFD/6396 core smarter we would not be needing this. I
>> guess there is still a possibility of someone stuffing "mtk-pmic-keys"
>> into "driver_override" attribute of a random platform device but I
>> wonder if we really need to take care of such scenarios...
It turns out it was possible to make 6397-core smarter.
I've submitted [1] to replace this patch.

Thanks again for your suggestion. Please let me know if I should add
your Suggested-by: in [1].

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210429143811.2030717-1-mkorpershoek@baylibre.com/ instead
>>
>>>  	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
>>>  	if (!keys)
>>>  		return -ENOMEM;
>>> -- 
>>> 2.27.0
>>> 
>>
>> Thanks.
>>
>> -- 
>> Dmitry
