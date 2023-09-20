Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5E47A8942
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 18:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234081AbjITQHb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 12:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbjITQHa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 12:07:30 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B94B9
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 09:07:23 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52c4d3ff424so8823197a12.0
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695226042; x=1695830842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekSqycYp4RwH4ZHstWy56AGx1vKb/jqJ8VujViJUQjQ=;
        b=fP/qn6174wndE5/8x27hKhMliGvRmPfCmvBag8Wzq/5c64hLRTNwd1m55rlIxNBezQ
         hbbupPloXt53AsXRWeWBNWldzx5JLmnbiXgyGTedLSvuXTc4FJFB3O01NnNp3TdZsM64
         6lTFJOmMXH/nn4XbcTcMA6gdaWlSt7Be51gGpeCUTpckhoFUTaDQ33GN47rgDBlAsdy7
         ScLpXIKjTiDoAgykgAAskahovdlO7zy7bcZaosHH8OyJ+YCqE5bPQc5Q9po0W7tZpyUZ
         PxsO9BvVjP4fXw95gXwZXjxI/xfRhyPjZQQtUCL4opeqk95nKBnBv5UTBLCd8qCw4STG
         F6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695226042; x=1695830842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekSqycYp4RwH4ZHstWy56AGx1vKb/jqJ8VujViJUQjQ=;
        b=AWHv32Un69brQtgoZgET0m3YOTg61ZvlVMkj61/+YcaL52UC8/ID8hRsVRVEo9yLA7
         /KU5LFrWYway+SA3i/y/iuDz4iteK5Mq/7YgJHSvK/xavO+2atmMwEzofEScovFgArYN
         XUA03bpulpbodKUw3FGpG++GRMHF0FRpV0JL50Jd1aAuWgnaMl5TI5ax1uIEL1SWlAsG
         1ZoZl76nWXXbJA42mpmyBy3yg9CE9s+g1qARSnoo80IM3vhKsChwxm0WsU00Tk4akJeW
         4wawlmB98zxRkGQMJzz4ZMWvw2EWW36+GCELdfe9aRizaOV96VjNhPJBmZnGXS3HJb6J
         ZOWA==
X-Gm-Message-State: AOJu0YwX8Rh5fMmW3pg6ezPmRIwQMKLJlQ52nCH43nL3msUb9buv9fRe
        ATIKltFytIDhEfDKG5VJSIGuoPhCZtOgHvLq
X-Google-Smtp-Source: AGHT+IGMv0ZtJsEgJtZM/5dYCyyx1ISAg5ccS+2o7Y0ZtAsAUjUiusDZNZo4TvmOYcyMmJW10Tts6A==
X-Received: by 2002:aa7:c7d6:0:b0:523:3754:a4e1 with SMTP id o22-20020aa7c7d6000000b005233754a4e1mr2372527eds.22.1695226041144;
        Wed, 20 Sep 2023 09:07:21 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id dn22-20020a05640222f600b00532c1dfe8ecsm2415478edb.66.2023.09.20.09.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 09:07:20 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de
Subject: Re: [PATCH 49/52] input: sun4i-ts - Convert to platform remove callback
 returning void
Date:   Wed, 20 Sep 2023 18:07:18 +0200
Message-ID: <22023189.EfDdHjke4D@jernej-laptop>
In-Reply-To: <20230920125829.1478827-50-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-50-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dne sreda, 20. september 2023 ob 14:58:26 CEST je Uwe Kleine-K=F6nig napisa=
l(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/input/touchscreen/sun4i-ts.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/sun4i-ts.c
> b/drivers/input/touchscreen/sun4i-ts.c index bb3c6072fc82..92b2b840b4b7
> 100644
> --- a/drivers/input/touchscreen/sun4i-ts.c
> +++ b/drivers/input/touchscreen/sun4i-ts.c
> @@ -375,7 +375,7 @@ static int sun4i_ts_probe(struct platform_device *pde=
v)
>  	return 0;
>  }
>=20
> -static int sun4i_ts_remove(struct platform_device *pdev)
> +static void sun4i_ts_remove(struct platform_device *pdev)
>  {
>  	struct sun4i_ts_data *ts =3D platform_get_drvdata(pdev);
>=20
> @@ -385,8 +385,6 @@ static int sun4i_ts_remove(struct platform_device *pd=
ev)
>=20
>  	/* Deactivate all IRQs */
>  	writel(0, ts->base + TP_INT_FIFOC);
> -
> -	return 0;
>  }
>=20
>  static const struct of_device_id sun4i_ts_of_match[] =3D {
> @@ -403,7 +401,7 @@ static struct platform_driver sun4i_ts_driver =3D {
>  		.of_match_table =3D sun4i_ts_of_match,
>  	},
>  	.probe	=3D sun4i_ts_probe,
> -	.remove	=3D sun4i_ts_remove,
> +	.remove_new =3D sun4i_ts_remove,
>  };
>=20
>  module_platform_driver(sun4i_ts_driver);




