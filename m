Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31B75E5DE7
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 10:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIVItI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 04:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiIVIsv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 04:48:51 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B607AD01E4
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:48:45 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t14so14329883wrx.8
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=m1nrTVk07Pa2xzKs29XmEpQMCTmQaKLzjmIErbIH2uo=;
        b=f0wUileW7OPu2XXhsILu7zjdv4xpIHQjzcGqHfxo333U3NerjI1Z0w8BeWpBIbbgHJ
         ChAjRdNVs2PGNItzc62WUK9rdggZYT44psabdaRCWHi/EiASY/gWseKh57lzweCe3Dam
         s4T5iHn19yW5AHUAExvuF4zKXKFwjK/x4bFliacOW8HICOSK1RSna321KR+G7nHxDupJ
         EZl41bYmNVby2pWqQcZ5u1KWAxw9OJVR1wsx6C9LX2V9qLojCSYsm3j7AAA4bl3GcsYe
         dGWBD1L+RtfmM1+TBKbCFjpL2JM8/ibwZ631Lo71zSzW6SQfdxCXnWKst0jQWMKTEa65
         oSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=m1nrTVk07Pa2xzKs29XmEpQMCTmQaKLzjmIErbIH2uo=;
        b=7LV7Gj+yCFgsjmBvVCQ3zZwo0Mzv0A3wJP5HRJ20Rs04Xx8NjwrHkOUBM2pMy/E18P
         Yq1lqlW+A+Iqgf5HQT1OEee0o8H726ykvuJHPRNC20Ynf15ml48Q4WCdKlNiSYVnrXDI
         hKOsaiAcdf3wCFtR+ssjy7c9BjSxVI/xpgjs9Kteoe/qA4jD1I7rpglTAmBzwdYxKfAj
         jOmVujERSnC2rCMYHDY5X1lGGxzI1DJvBo+wOXqBCMTwzEkQpH+Jj05l6i+UsFUAMVH4
         pae7dJNr+q0PjoRG8ySxKfWczT4f9b45cSzgfCVVJD0nfFJ+Dzkvq6lzCDh1WiLqkDj3
         7W7A==
X-Gm-Message-State: ACrzQf0HbSI8bJl6AAPE5sy1A0824DZlOlujvbudD1zNO1tVA5e5e8KK
        Zh1slMbQpVIVRJOTEOVxYHXK1w==
X-Google-Smtp-Source: AMsMyM7c4TZqAd4vi76COSpQeOdIffEd3vg1QAiQJo5ehCA0l5x+vcgngxdeOE5IwbtTB9f70SFkSQ==
X-Received: by 2002:a05:6000:18aa:b0:22a:b61d:877a with SMTP id b10-20020a05600018aa00b0022ab61d877amr1261681wri.512.1663836524201;
        Thu, 22 Sep 2022 01:48:44 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05600c3d9300b003a83ca67f73sm6141395wmb.3.2022.09.22.01.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:48:43 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
Subject: Re: [PATCH -next 4/4] Input: gpio_keys_polled - Switch to use
 dev_err_probe() helper
In-Reply-To: <20220920153055.3465115-4-yangyingliang@huawei.com>
References: <20220920153055.3465115-1-yangyingliang@huawei.com>
 <20220920153055.3465115-4-yangyingliang@huawei.com>
Date:   Thu, 22 Sep 2022 10:48:43 +0200
Message-ID: <87y1ubg5g4.fsf@baylibre.com>
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
>  drivers/input/keyboard/gpio_keys_polled.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index c3937d2fc744..ba00ecfbd343 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -299,13 +299,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  							     NULL, GPIOD_IN,
>  							     button->desc);
>  			if (IS_ERR(bdata->gpiod)) {
> -				error = PTR_ERR(bdata->gpiod);
> -				if (error != -EPROBE_DEFER)
> -					dev_err(dev,
> -						"failed to get gpio: %d\n",
> -						error);
>  				fwnode_handle_put(child);
> -				return error;
> +				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
> +						     "failed to get gpio\n");

If we look at the input tree, we can see that there is no occurence of
dev_err_probe():

$ ~/src/linux/drivers/input/ 483fed3b5dc8 grep -rsn dev_err_probe
$ ~/src/linux/drivers/input/ 483fed3b5dc8

The reason for this is that the input maintainer (Dmitry) dislikes
dev_err_probe() as he stated in [1]

So I don't think he will apply this.

Regards,
Mattijs

>  			}
>  		} else if (gpio_is_valid(button->gpio)) {
>  			/*
> -- 
> 2.25.1
