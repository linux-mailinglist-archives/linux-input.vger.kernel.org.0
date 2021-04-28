Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3773736DFED
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 21:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239791AbhD1Tx1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 15:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbhD1Tx1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 15:53:27 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB7DC061573;
        Wed, 28 Apr 2021 12:52:42 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id v191so2695396pfc.8;
        Wed, 28 Apr 2021 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/pKytGN9W8sMrVQvaOgwD5WVJi+L1fCKHCS1G7ffXOI=;
        b=JdOCV6VmnRIbLKx6LWiszLtHYvAkv+YliD1uLto2Y6DskP5feuZ1MAw4DS5RW+HFJ4
         8zokwR1WHii0SuYzgFVWPHNRgWI2AhhKkMrVqbnzSEaj6wOzopLJEtFfaSPgjJw5s+n4
         TqSWWAyy/KhkQhxPCVoRPlPl/7SgukqcyWd29bGs7Xqy+ieZDwu73MCwq3zdFz7Ptv4m
         em525mqmueFIEMONZbRdU4RmW47dKUG3CSlM58KGTgefI2jgeiuNd3EDF9xy+/XBg0Tn
         EHOVhT6zqINh0wW8wIEmpoX7xxxNP5C3fZngAkZfSz5954/GGsLV+kCtrhoV1hk/hYXc
         OM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/pKytGN9W8sMrVQvaOgwD5WVJi+L1fCKHCS1G7ffXOI=;
        b=iRwcq2XtbfZiS7lIwkqlBiDKLOmGbTaAAhss5KVxEQSW2md5Lc8oT+ojJwfezvJpHN
         fHTkqyfptoKajnGPLZF5l2QGnjQYTmtY0ijxYBEZS8nGr9VG50TbIWPk2WzMjGTWxFZV
         Dkgoc3SFMVe4o/DxuMzSlCxfQ+bXzbIQtO/gUEX17B3Z0wsJf1dMDsenURN3TqgYApl7
         kWVRwOrv+1pM0t/dC7DVav2VS2CLsW59QMcw6fnedc5sseSxzPGQwweQRi4ZQm59yCzU
         onH5x6W4y700XjkW3ap90baTrHEpzT3R3d1CBhFvxLXSBOv5h/DsUQ0L9UCRZf0DMMOy
         it6g==
X-Gm-Message-State: AOAM531AIP47i09PUXxB88ftQ4pjPifA1YNGqxcb+ya0vgH5RzFYk4Lp
        MZduznvPasXN+7JHsu3M/Yg=
X-Google-Smtp-Source: ABdhPJyR42PL2NF7XSqxdOxYCe5B8OyzbVldVe5KhSgU38V4lHZ6FgoTjWcNp+kqYN7WP3BqdhkR9w==
X-Received: by 2002:a63:5d18:: with SMTP id r24mr29461665pgb.94.1619639561456;
        Wed, 28 Apr 2021 12:52:41 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:84c0:9bcd:2e20:f79d])
        by smtp.gmail.com with ESMTPSA id 123sm430826pfz.127.2021.04.28.12.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 12:52:40 -0700 (PDT)
Date:   Wed, 28 Apr 2021 12:52:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>, fparent@baylibre.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] Input: mtk-pmic-keys - check for NULL on
 of_match_device()
Message-ID: <YIm9Bb3eBjYwY53R@google.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
 <20210428164219.1115537-2-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428164219.1115537-2-mkorpershoek@baylibre.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mattijs,

On Wed, Apr 28, 2021 at 06:42:13PM +0200, Mattijs Korpershoek wrote:
> mtk-pmic-keys being a child device of mt6397, it will always get probed
> when mt6397_probe() is called.
> 
> This also happens when we have no device tree node matching
> mediatek,mt6397-keys.

It sounds for me that creating a platform device instance in case where
we know need OF node, but do not have one, is wasteful. Can
mt6397-core.c and/or MFD core be adjusted to not do that.

> 
> In that case, the mfd core warns us:
> 
>   [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]
> 
> Check return value from call to of_match_device()
> in order to prevent a NULL pointer dereference.
> 
> In case of NULL print error message and return -ENODEV
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 62391d6c7da6..12c449eed026 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -247,6 +247,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  	const struct of_device_id *of_id =
>  		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
>  
> +	if (!of_id)
> +		return -ENODEV;
> +

So if we make MFD/6396 core smarter we would not be needing this. I
guess there is still a possibility of someone stuffing "mtk-pmic-keys"
into "driver_override" attribute of a random platform device but I
wonder if we really need to take care of such scenarios...

>  	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
>  	if (!keys)
>  		return -ENOMEM;
> -- 
> 2.27.0
> 

Thanks.

-- 
Dmitry
