Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01657A8943
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 18:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbjITQHk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 12:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234696AbjITQHj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 12:07:39 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEE0C9
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 09:07:33 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9adc75f6f09so784201066b.0
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695226051; x=1695830851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q835YQDxM8a/Ydr2pG5h6K5+mFIlQ7bWDlpZnNz4kb4=;
        b=WVRpIR4GGzq7fJcg9hAWtCh/KwVi3S2YnBbaNmiMjsWk8HYtHmK9kfGHheaAtTvddi
         AO5qIe31JCyA4NO/aayriec0luTbAEomihuQAhTwwfd71bnb9evVIASJmOapc4E/FH7D
         B+5lt13zKeuerUyCL6Ey+Q3vgv/gd1qMVHuYbw0kRZEjOqihdLauQAW11yKEdK5avLyv
         mKGC5uDEXCjgg6qNK0FcRFDuIzQ2qdL9WE82ygkHKxrYh7nfK7Ugho8YISD34QhZaFU3
         6pNJMrAOqSXSHbPsaYBWodKhc89b8cC/t+XYLiei7NFONGsp/F5+M/IIMzn3e2K6DNsD
         //TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695226051; x=1695830851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q835YQDxM8a/Ydr2pG5h6K5+mFIlQ7bWDlpZnNz4kb4=;
        b=Xl9Kxwc5hvcdRjbbqQs0koP4cSH7rFwKsY4AuQIqS2siph+/6NlN/sr5t+JtWSIRYw
         IUF+bG2IfCqi1P5j8uVtwBsWtVYS/lK1kKcJDc5LsuBwnwIwEZsSJvte5vzlDnaMPVI0
         lomXgn+Gme+NN0VHh6gbFo7MpBJBUdkaI75VNH4sYeuUkFaVav5v95nk4E5h3oLcvSL/
         AkNDHIyY887cOS5nCKAAIEHBGL1spvb0Spoi26Xn5Edqbws+XS/OWIyoPCw6QYQsOwH/
         Cgx0cfPX5YtbcFnRAma1W6yTtLm1fq4CWG0VaKMyeD05Q6VUFT+i4J4yVbL9oiFzuq0P
         860Q==
X-Gm-Message-State: AOJu0YzExvrTsa/qLW8nF0Ae2yVRdCMm5n0jZ1Fc4NIjVMESPyjsWTuW
        o2FaB5rialOiYeM5l2xwkss=
X-Google-Smtp-Source: AGHT+IF+rmJKa4uB821gWE6ZlcCqFgyUhV7B2Ym02NESinzdpuwM0CQ3PlLZxaP3wSctTJ6kAsqMhg==
X-Received: by 2002:a17:907:b609:b0:9ae:61d:4248 with SMTP id vl9-20020a170907b60900b009ae061d4248mr2345778ejc.48.1695226051345;
        Wed, 20 Sep 2023 09:07:31 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id y15-20020a1709060a8f00b0099cb1a2cab0sm9464544ejf.28.2023.09.20.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 09:07:31 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 42/52] input: sun4i-ps2 - Convert to platform remove callback
 returning void
Date:   Wed, 20 Sep 2023 18:07:30 +0200
Message-ID: <3766083.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20230920125829.1478827-43-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-43-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dne sreda, 20. september 2023 ob 14:58:19 CEST je Uwe Kleine-K=F6nig napisa=
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
>  drivers/input/serio/sun4i-ps2.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/serio/sun4i-ps2.c
> b/drivers/input/serio/sun4i-ps2.c index eb262640192e..aec66d9f5176 100644
> --- a/drivers/input/serio/sun4i-ps2.c
> +++ b/drivers/input/serio/sun4i-ps2.c
> @@ -297,7 +297,7 @@ static int sun4i_ps2_probe(struct platform_device *pd=
ev)
> return error;
>  }
>=20
> -static int sun4i_ps2_remove(struct platform_device *pdev)
> +static void sun4i_ps2_remove(struct platform_device *pdev)
>  {
>  	struct sun4i_ps2data *drvdata =3D platform_get_drvdata(pdev);
>=20
> @@ -311,8 +311,6 @@ static int sun4i_ps2_remove(struct platform_device
> *pdev) iounmap(drvdata->reg_base);
>=20
>  	kfree(drvdata);
> -
> -	return 0;
>  }
>=20
>  static const struct of_device_id sun4i_ps2_match[] =3D {
> @@ -324,7 +322,7 @@ MODULE_DEVICE_TABLE(of, sun4i_ps2_match);
>=20
>  static struct platform_driver sun4i_ps2_driver =3D {
>  	.probe		=3D sun4i_ps2_probe,
> -	.remove		=3D sun4i_ps2_remove,
> +	.remove_new	=3D sun4i_ps2_remove,
>  	.driver =3D {
>  		.name =3D DRIVER_NAME,
>  		.of_match_table =3D sun4i_ps2_match,




