Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3339B723D11
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 11:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237406AbjFFJVC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 05:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237361AbjFFJU7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 05:20:59 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8A418E
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 02:20:34 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9745c5fed21so709102366b.3
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686043231; x=1688635231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ODPjFeDq340WLi5UOARvLF+Rx0ZDRYbK48jcAr9eoRY=;
        b=hK8ukrBgSpwneongCkdsRkZM/4+lNppKrRSz6ALvnsStN1XiXeA9JcpLPMU59R4ay+
         CWnvrOZHhRP8gHweEW05vqBVbp8RA6PSeB9l4UG+m2xRm/vo+JVRdK+nD0uZmhQR0yrF
         EBsNTLRlizZYRgXD2a9RHqlJ5O7gCCGh8U5DS6bR1JhYFUt5KSYdlO6YVBeRscKeW132
         APX3CLd/xXLuzuTx2wve+pGZ5c6D83l0/6hg3upSsCc3F2Ry3hO3k35VcgkXoWQQQlBE
         r/Hy5SLRG46DLVVGJqBFy8p/llFxWjHxk8RE4eU4v0//bsCLpfZZ+IOLu9Kc3egOPJDT
         TUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686043231; x=1688635231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODPjFeDq340WLi5UOARvLF+Rx0ZDRYbK48jcAr9eoRY=;
        b=mH6SE+ETGG0iudbYi62cUBJiSH15pnVsu6xJbLEin4c2mpiSjJwfZX1Jt44gIjMI/F
         +Tc+wFvzMBDv5SQWNrz8ux3YJvC/Ib+dx6LXF1GqoTayLurxy35QMwkkrcqLZ7bTdQqq
         B2XYRzb8cVR2uqn6StAKE9eEsWwR5mGNEisf/0TlreJaNB1d9WfGkjZ4uw4DmQVDRF6c
         956AreZH0iAryFVvNf1W9oVE3zVRIC9z0Gb82tvzFdQ+laA4hNwh4p0/5jOFIWGltzQn
         0Ny04yPKlkn5Czkw9t/U5FXWd6caEAk3TSNt6vXyPPKrkc5ZrxMKoiQlCuvboOJu3ZBn
         NAdA==
X-Gm-Message-State: AC+VfDybR4gVE7MgoLGdhY5sOaISkxQI6uxTPcWS1mD9inUW4CuvD4Ah
        c2aun1/MkCdpcMz/6FQU6Ppa4SYOwA0p/vg0ptE=
X-Google-Smtp-Source: ACHHUZ6mmI64XB23ONgjEKq3PuZChu7I56K0PZdkcnE7vFSLSs7f1aDCQztlPrs4sBBkPz9t6Nc5mw==
X-Received: by 2002:a17:907:2da9:b0:966:5730:c3fe with SMTP id gt41-20020a1709072da900b009665730c3femr2037539ejc.52.1686043231193;
        Tue, 06 Jun 2023 02:20:31 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:802c:7f03:2fe0:bd27:d746])
        by smtp.gmail.com with ESMTPSA id g19-20020a170906869300b0097461a7ebdcsm5293720ejx.82.2023.06.06.02.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:20:30 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:20:30 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] Input: tps65219-pwrbutton - Use regmap_set_bits()
Message-ID: <20230606092030.d7gvg3vdurlyeii6@blmsp>
References: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
 <20230605161458.117361-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605161458.117361-2-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 05, 2023 at 06:14:58PM +0200, Uwe Kleine-König wrote:
> regmap_set_bits() is equivalent to regmap_update_bits() if mask == val.
> The probe function uses regmap_clear_bits() to enable irqs, so
> symmetrically make use of regmap_set_bits() to disable them. There is no
> semantic difference.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

> ---
>  drivers/input/misc/tps65219-pwrbutton.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/misc/tps65219-pwrbutton.c b/drivers/input/misc/tps65219-pwrbutton.c
> index b2d9e5d2bcfd..eeb9f2334ab4 100644
> --- a/drivers/input/misc/tps65219-pwrbutton.c
> +++ b/drivers/input/misc/tps65219-pwrbutton.c
> @@ -123,9 +123,8 @@ static void tps65219_pb_remove(struct platform_device *pdev)
>  	int ret;
>  
>  	/* Disable interrupt for the pushbutton */
> -	ret = regmap_update_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
> -				 TPS65219_REG_MASK_INT_FOR_PB_MASK,
> -				 TPS65219_REG_MASK_INT_FOR_PB_MASK);
> +	ret = regmap_set_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
> +			      TPS65219_REG_MASK_INT_FOR_PB_MASK);
>  	if (ret)
>  		dev_warn(&pdev->dev, "Failed to disable irq (%pe)\n", ERR_PTR(ret));
>  }
> -- 
> 2.39.2
> 
