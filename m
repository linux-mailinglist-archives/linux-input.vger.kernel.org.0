Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40ECD65B6F4
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 20:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbjABTaj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 14:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbjABTai (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 14:30:38 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CB45F96
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 11:30:36 -0800 (PST)
Received: from g550jk.localnet (2a02-8388-6582-fe80-0000-0000-0000-0005.cable.dynamic.v6.surfer.at [IPv6:2a02:8388:6582:fe80::5])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 355EACC3F7;
        Mon,  2 Jan 2023 19:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1672687835; bh=hD+hA655NeBEo4dcZwAZoLCg+OqGIP651daKFbGrLik=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=R/0OGkCCBxv+OmXUUS97/uEu9lvBOihIQJWn0ktGWSlvFBdPRh3Lt+fo7D5badbxz
         cysgOk6gNR7jIIP8ZVWTm6TSQ/IgBsIbfQl5G9r03dtmAwydGuNuVpQI2Hdxh6J3F8
         u6fy8Yjlc5sREBKitevpYoq/yc7CNSnAsK92pFTg=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 07/69] Input: gpio-vibra - switch to DEFINE_SIMPLE_DEV_PM_OPS()
 and pm_sleep_ptr()
Date:   Mon, 02 Jan 2023 20:30:33 +0100
Message-ID: <12122463.O9o76ZdvQC@g550jk>
In-Reply-To: <20230102181842.718010-8-jic23@kernel.org>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-8-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FROM_SUSPICIOUS_NTLD,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Montag, 2. J=E4nner 2023 19:17:40 CET Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Luca Weiss <luca@z3ntu.xyz>

Thanks!

> ---
>  drivers/input/misc/gpio-vibra.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/input/misc/gpio-vibra.c
> b/drivers/input/misc/gpio-vibra.c index f79f75595dd7..134a1309ba92 100644
> --- a/drivers/input/misc/gpio-vibra.c
> +++ b/drivers/input/misc/gpio-vibra.c
> @@ -157,7 +157,7 @@ static int gpio_vibrator_probe(struct platform_device
> *pdev) return 0;
>  }
>=20
> -static int __maybe_unused gpio_vibrator_suspend(struct device *dev)
> +static int gpio_vibrator_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct gpio_vibrator *vibrator =3D platform_get_drvdata(pdev);
> @@ -169,7 +169,7 @@ static int __maybe_unused gpio_vibrator_suspend(struct
> device *dev) return 0;
>  }
>=20
> -static int __maybe_unused gpio_vibrator_resume(struct device *dev)
> +static int gpio_vibrator_resume(struct device *dev)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct gpio_vibrator *vibrator =3D platform_get_drvdata(pdev);
> @@ -180,8 +180,8 @@ static int __maybe_unused gpio_vibrator_resume(struct
> device *dev) return 0;
>  }
>=20
> -static SIMPLE_DEV_PM_OPS(gpio_vibrator_pm_ops,
> -			 gpio_vibrator_suspend, gpio_vibrator_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(gpio_vibrator_pm_ops,
> +				gpio_vibrator_suspend,=20
gpio_vibrator_resume);
>=20
>  #ifdef CONFIG_OF
>  static const struct of_device_id gpio_vibra_dt_match_table[] =3D {
> @@ -195,7 +195,7 @@ static struct platform_driver gpio_vibrator_driver =
=3D {
>  	.probe	=3D gpio_vibrator_probe,
>  	.driver	=3D {
>  		.name	=3D "gpio-vibrator",
> -		.pm	=3D &gpio_vibrator_pm_ops,
> +		.pm	=3D pm_sleep_ptr(&gpio_vibrator_pm_ops),
>  		.of_match_table =3D of_match_ptr(gpio_vibra_dt_match_table),
>  	},
>  };




