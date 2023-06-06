Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA975723D0D
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 11:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbjFFJUi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 05:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237412AbjFFJUa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 05:20:30 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA961706
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 02:20:15 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so14280164a12.1
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 02:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686043196; x=1688635196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uXYgWUR2dEOECLvxjPjKv+ycdYkc7X8gpEzBU4O6yyo=;
        b=5oqVS/EF6p5ZhIwgLjpBA27VX/qo08gU5RGdrNiVI3JiID5XaFwzocOMSvtmcTYVSC
         0FefRCPpBJUOfy//klMGN6LT9VAg5QWEyMmUzM45S4AXdpSdYm2O5lOaN5dtX6I+FU8r
         LFCxZCoqAlDizPJpVJyZogor4ZeGI2yN/YFbjR0W/Bjw7emqZtQbmbz9/vw5sxAMZs1M
         /BlIYZv3N2DOgLxj4XRdmR95COngD1YDivRY91pgD2f2W4naHvN6XJK27Z0spcjrDyYC
         cfm1vopdWgJAAJZBKM+XGEDcHluU8k1KcFK7PXDYXOxTtFkRF7OCZaSqmG6ZUWpWqGDD
         2a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043196; x=1688635196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXYgWUR2dEOECLvxjPjKv+ycdYkc7X8gpEzBU4O6yyo=;
        b=MIpRGzWtmAsLuqjMCOcWEZ46rsu9qdwx+igiKwQOuERLlrbtmXmxHsW7Kw2eG9jaB7
         51YrbrCmEyCJV/K8lvVJWeUPoYocQh0NG23IvzF3v51Wk1V8jLg9zmYlhLMyOmV75B1y
         zQoNvcCFWUp8Ts0L6J0Qt04eMZlXawoRYWRg56WvCZ+MxETtvABZNrzfsY55htNbnR57
         r0uEqDXm0HF3SHiYnR85ec0dPd6PP4dGMIM6IAIODVla8dd3Ro9YS2XNTFsBAFTtwTZ+
         Sf0pmkco9y8YcBwU4QyEmF6UrmLs0EFyAQFvVNCy5pLiTA8c+M9+yFi6LZk8m1GcaHKD
         NWCQ==
X-Gm-Message-State: AC+VfDxtFWztlxdlm1FSkA4QCgtLbMRMT9Uus6OhXIrwMIDROkBMihFb
        zgG/BhscHHcRgzIkEAIFubBgHQ==
X-Google-Smtp-Source: ACHHUZ5/WK6kumQ7s0K5BJlh1GfzhQgVrONWmZbzphrlOD9lhGXbs71qvKjwF1Hk7R7dqcMlR1M30w==
X-Received: by 2002:aa7:da41:0:b0:514:a669:d064 with SMTP id w1-20020aa7da41000000b00514a669d064mr1763666eds.16.1686043195690;
        Tue, 06 Jun 2023 02:19:55 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:802c:7f03:2fe0:bd27:d746])
        by smtp.gmail.com with ESMTPSA id n26-20020aa7db5a000000b005149e012658sm4810978edt.34.2023.06.06.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:19:55 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:19:54 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] Input: tps65219-pwrbutton - Convert to .remove_new()
Message-ID: <20230606091954.pm7mxrkwvnmeocqb@blmsp>
References: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Uwe,

On Mon, Jun 05, 2023 at 06:14:57PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning).
> 
> To improve here there is a quest to make the remove callback return void.
> In the first step of this quest all drivers are converted to .remove_new()
> which already returns void. Eventually after all drivers are converted,
> .remove_new() is renamed to .remove().
> 
> Before this driver might have returned an error. In this case emit a
> warning that tells more about the problem than the generic warning by
> the core, and instead of making the remove callback return zero
> unconditionally, convert to .remove_new() which is equivalent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Thanks,
Markus

> ---
>  drivers/input/misc/tps65219-pwrbutton.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/misc/tps65219-pwrbutton.c b/drivers/input/misc/tps65219-pwrbutton.c
> index 245134bdb59e..b2d9e5d2bcfd 100644
> --- a/drivers/input/misc/tps65219-pwrbutton.c
> +++ b/drivers/input/misc/tps65219-pwrbutton.c
> @@ -117,14 +117,17 @@ static int tps65219_pb_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int tps65219_pb_remove(struct platform_device *pdev)
> +static void tps65219_pb_remove(struct platform_device *pdev)
>  {
>  	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
> +	int ret;
>  
>  	/* Disable interrupt for the pushbutton */
> -	return regmap_update_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
> -				  TPS65219_REG_MASK_INT_FOR_PB_MASK,
> -				  TPS65219_REG_MASK_INT_FOR_PB_MASK);
> +	ret = regmap_update_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
> +				 TPS65219_REG_MASK_INT_FOR_PB_MASK,
> +				 TPS65219_REG_MASK_INT_FOR_PB_MASK);
> +	if (ret)
> +		dev_warn(&pdev->dev, "Failed to disable irq (%pe)\n", ERR_PTR(ret));
>  }
>  
>  static const struct platform_device_id tps65219_pwrbtn_id_table[] = {
> @@ -135,7 +138,7 @@ MODULE_DEVICE_TABLE(platform, tps65219_pwrbtn_id_table);
>  
>  static struct platform_driver tps65219_pb_driver = {
>  	.probe = tps65219_pb_probe,
> -	.remove = tps65219_pb_remove,
> +	.remove_new = tps65219_pb_remove,
>  	.driver = {
>  		.name = "tps65219_pwrbutton",
>  	},
> 
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> -- 
> 2.39.2
> 
