Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAE95E5DE1
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 10:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiIVIsC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 04:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbiIVIrb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 04:47:31 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3F56AE92
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:47:13 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id l8so6301742wmi.2
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=5fCU5qauLKy8hLvwiGjpFkxgJJQSPHSFqxqmchK7Dg0=;
        b=gKrq6Bu8dk5fjpYqot7TxE+f4q+Onk+AGuJYO5MFXSj4oMg8gHNLPqAb9A1Eq8NF1r
         yE+TcZdu2XlcZ1GEFWp9Wtk5qv35dXpCkXDmsHH9gXCPeKGGLGhYhupEE7KCqkl3vZxE
         YwHX69eYvF3ROW1Yrcr8vLTjP15c2+798Uy8srizJ2fAYRFgLfDN6fuIpdJAj9E9pyxE
         4++XhR3/Uk8J9sD824635Sj8DmS1aV9J9sBWcERI7SoNqooT4SYPb1LiaHXqgX/hyeR3
         ni21dYKYoxTcBOlCRCu86X1DZRYGAdFC8Q+t+90sLE+NkycuoC7vqV2FBO9rQUXKC4zQ
         Eugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=5fCU5qauLKy8hLvwiGjpFkxgJJQSPHSFqxqmchK7Dg0=;
        b=7zA1irPEc4jUqQa2/XD1Bva9+7T8+f8TOxcfLqHvnpeIuI1VrcP1Qrq63Qx3G22eZT
         1lufVMoyr8JXm7XsgRn6tke+X/Mfll7GtvB2MLADpQqYN3PVq94dzhTO75C8QF9p92b5
         bEU4xViQxl/Zvo/S74RGDxKfsACE51bg24cJm/eCvDGDIKFpKtoX2lApkiW+aTiOBtzA
         YSd33kEVrSPwsqxosV5xN/dIV6a/NcBPzWpnoefyUG8vP8AeojEbmV3wTzxPtr2ZeehR
         cPNOG9GGKXCeMxmSNaQdszcU1J9wPgNluQ2snYuKFsDxaRCG0bV4rXGj1RXlPt+fnLyC
         mRJg==
X-Gm-Message-State: ACrzQf07OcjJ3k0FB7EB97z7M9hp+qKPXDQoWhgDyoUOQGS3W629CnLy
        f0eSC4YGPYKbKFHQwgzH7XHK+b+Mr16RCA==
X-Google-Smtp-Source: AMsMyM6oC7Bzf2DloPfoZbL/faBYO8qiMuC3ZWPngzdPyq5WNzU3JU5BvfBrNmRwn3sEouVvVlWUWQ==
X-Received: by 2002:a05:600c:1549:b0:3b4:8fd7:af4 with SMTP id f9-20020a05600c154900b003b48fd70af4mr1482616wmg.100.1663836431412;
        Thu, 22 Sep 2022 01:47:11 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d6d0a000000b002205a5de337sm5026783wrq.102.2022.09.22.01.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:47:10 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
Subject: Re: [PATCH -next 2/4] Input: bcm-keypad - Switch to use
 dev_err_probe() helper
In-Reply-To: <20220920153055.3465115-2-yangyingliang@huawei.com>
References: <20220920153055.3465115-1-yangyingliang@huawei.com>
 <20220920153055.3465115-2-yangyingliang@huawei.com>
Date:   Thu, 22 Sep 2022 10:47:10 +0200
Message-ID: <874jwzhk35.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yang,

Thank you for your patch,

On Tue, Sep 20, 2022 at 23:30, Yang Yingliang <yangyingliang@huawei.com> wrote:

> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/input/keyboard/bcm-keypad.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
> index 56a919ec23b5..bc8bd78d74f5 100644
> --- a/drivers/input/keyboard/bcm-keypad.c
> +++ b/drivers/input/keyboard/bcm-keypad.c
> @@ -368,11 +368,9 @@ static int bcm_kp_probe(struct platform_device *pdev)
>  	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
>  	if (IS_ERR(kp->clk)) {
>  		error = PTR_ERR(kp->clk);
> -		if (error != -ENOENT) {
> -			if (error != -EPROBE_DEFER)
> -				dev_err(&pdev->dev, "Failed to get clock\n");
> -			return error;
> -		}
> +		if (error != -ENOENT)
> +			return dev_err_probe(&pdev->dev, error,
> +					     "Failed to get clock\n");

If we look at the input tree, we can see that there is no occurence of
dev_err_probe():

$ ~/src/linux/drivers/input/ 483fed3b5dc8 grep -rsn dev_err_probe
$ ~/src/linux/drivers/input/ 483fed3b5dc8

The reason for this is that the input maintainer (Dmitry) dislikes
dev_err_probe() as he stated in [1]

So I don't think he will apply this.

Regards,
Mattijs

[1] https://lore.kernel.org/r/YWTpg35wyYS1uoFZ@google.com

>  		dev_dbg(&pdev->dev,
>  			"No clock specified. Assuming it's enabled\n");
>  		kp->clk = NULL;
> -- 
> 2.25.1
