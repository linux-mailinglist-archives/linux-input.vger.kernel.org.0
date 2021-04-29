Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F8636E511
	for <lists+linux-input@lfdr.de>; Thu, 29 Apr 2021 08:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238991AbhD2Gtn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 02:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238802AbhD2Gtm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 02:49:42 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE6BC06138B
        for <linux-input@vger.kernel.org>; Wed, 28 Apr 2021 23:48:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n2so12417415wrm.0
        for <linux-input@vger.kernel.org>; Wed, 28 Apr 2021 23:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=o3h5EriEjCqQopiIHnHAtghPtkLJbZARkrJvdBbmedE=;
        b=d8dCRC4gjEhWMxE3SYQi+NpLceGRBYrmrFpjvbmsHAWECYSzCFyO0o/bHyEnKk1lfa
         SgH7w9204VdW7XjaaZXmFjJk4bd/euAM+GpLQUin9KJiQSCAbgM4UJHe9Jo1hZvD7Klm
         RJnAWx/25XGVuxr2RREacpJRN432K6oHtarC/d+DneSuNnDp/uVuZ3pX357f0+OOsQK1
         EXtn41+WlXzp6ZWT7FF+1ohfUOnZCL+5eVO6E25kevnK4FdNzf7XMJC3mUnicrdevtOF
         srDScOmKoiKziGoBM/B1eEA8dxqYx1e4pTmZw0J7VPu7zatqfsqnpcXThHz1bwX3Qn1v
         vZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=o3h5EriEjCqQopiIHnHAtghPtkLJbZARkrJvdBbmedE=;
        b=LimTiOP0cNS+4KJsxRzqjAdpzzAzmriaJ/tLuzvfSXeE1OZB4KXMRk85UxT97R2yaT
         N6u9QiGk7VCasmF6APNx8X/66iaBUXgmhWUlqXbn35J1a8VlRbfEcfhtoBFkjlt6Hw4S
         gJPPkT+P9e69T+0CxKP+9Qq/WDuKeeMB5Ij7IpTC7xJrAChnzAOzfy1NasQamA1yG8h2
         FQbLw8MPjyHdgEs43CHSVsjnkAkxc75o0u6S9CJKZrzbvBo7UCwvfkAqx/XD12FlBDjU
         g2PgGqeNJIIZZA+khNUBNPb8Ie5rJYno3E0s+UX3C72GPMr7lLrb3BESrdZKYGQw9gmV
         JJ5Q==
X-Gm-Message-State: AOAM530a2RQ4iZXF+4anDO33L5Xs5t5ULZvMXflEZOUZyM+Wd4rb+eej
        r/jd7eRkoKTPIFUlWwtyAeTafQ==
X-Google-Smtp-Source: ABdhPJyQ18dyuVmmPQJLNTxgisV36R9DWwMSNPYNEPe4j4InyGwlgS2BBW/xtr/CvurtASHAvnQZsQ==
X-Received: by 2002:adf:f74d:: with SMTP id z13mr817646wrp.147.1619678935368;
        Wed, 28 Apr 2021 23:48:55 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:f37e:9091:b397:6f48])
        by smtp.gmail.com with ESMTPSA id z18sm3264416wrh.16.2021.04.28.23.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 23:48:54 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>, fparent@baylibre.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] Input: mtk-pmic-keys - check for NULL on
 of_match_device()
In-Reply-To: <YIm9Bb3eBjYwY53R@google.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
 <20210428164219.1115537-2-mkorpershoek@baylibre.com>
 <YIm9Bb3eBjYwY53R@google.com>
Date:   Thu, 29 Apr 2021 08:48:53 +0200
Message-ID: <875z05y4a2.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:

> Hi Mattijs,
>
> On Wed, Apr 28, 2021 at 06:42:13PM +0200, Mattijs Korpershoek wrote:
>> mtk-pmic-keys being a child device of mt6397, it will always get probed
>> when mt6397_probe() is called.
>> 
>> This also happens when we have no device tree node matching
>> mediatek,mt6397-keys.
>
> It sounds for me that creating a platform device instance in case where
> we know need OF node, but do not have one, is wasteful. Can
> mt6397-core.c and/or MFD core be adjusted to not do that.

You are right. Maybe I can fix MFD core instead. I will look into it.

Thanks for your review.
>
>> 
>> In that case, the mfd core warns us:
>> 
>>   [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]
>> 
>> Check return value from call to of_match_device()
>> in order to prevent a NULL pointer dereference.
>> 
>> In case of NULL print error message and return -ENODEV
>> 
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> ---
>>  drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
>> index 62391d6c7da6..12c449eed026 100644
>> --- a/drivers/input/keyboard/mtk-pmic-keys.c
>> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
>> @@ -247,6 +247,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>>  	const struct of_device_id *of_id =
>>  		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
>>  
>> +	if (!of_id)
>> +		return -ENODEV;
>> +
>
> So if we make MFD/6396 core smarter we would not be needing this. I
> guess there is still a possibility of someone stuffing "mtk-pmic-keys"
> into "driver_override" attribute of a random platform device but I
> wonder if we really need to take care of such scenarios...
>
>>  	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
>>  	if (!keys)
>>  		return -ENOMEM;
>> -- 
>> 2.27.0
>> 
>
> Thanks.
>
> -- 
> Dmitry
