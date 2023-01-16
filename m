Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FC266C273
	for <lists+linux-input@lfdr.de>; Mon, 16 Jan 2023 15:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjAPOoF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 09:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbjAPOn1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 09:43:27 -0500
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785C734548
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 06:21:03 -0800 (PST)
Date:   Mon, 16 Jan 2023 14:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1673878861; x=1674138061;
        bh=Sfy0m7zMzls91IWFR2crDfn3FuzrRA5EIx9SdCXE8qk=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=nR7HwKon03AN1Ca0UeujedWFB5XTj6dK2271ihHkLFPF79PbR4MjoEkwFlR/z3aka
         IEokS6xKGuO7Ofw5m4MjVOLONxAk6KAhuYS7CbZd2FBsvcZAhlJnENoyoxRhBYHBlc
         2YzFEv7c0dhakqPZgPigfmWQnqH3QbrmAoJeu0bo=
To:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH 04/16] Input: s6sy761 - switch to SYSTEM_SLEEP_/RUNTIME_PM_OPS() and pm_ptr()
Message-ID: <3c6c160f-4f35-859d-9f06-92477174cbb4@connolly.tech>
In-Reply-To: <20230114171620.42891-5-jic23@kernel.org>
References: <20230114171620.42891-1-jic23@kernel.org> <20230114171620.42891-5-jic23@kernel.org>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 14/01/2023 17:16, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated as
> they require explicit protection against unused function warnings.
> The new combination of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/
> RUNTIME_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Tested-by: Caleb Connolly <caleb@connolly.tech> # oneplus-guacamole
> Cc: Caleb Connolly <caleb@connolly.tech>
> Cc: Andi Shyti <andi@etezian.org>
> ---
>  drivers/input/touchscreen/s6sy761.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscr=
een/s6sy761.c
> index cc417c03aaca..371cf4848ad5 100644
> --- a/drivers/input/touchscreen/s6sy761.c
> +++ b/drivers/input/touchscreen/s6sy761.c
> @@ -479,7 +479,7 @@ static void s6sy761_remove(struct i2c_client *client)
>  =09pm_runtime_disable(&client->dev);
>  }
>
> -static int __maybe_unused s6sy761_runtime_suspend(struct device *dev)
> +static int s6sy761_runtime_suspend(struct device *dev)
>  {
>  =09struct s6sy761_data *sdata =3D dev_get_drvdata(dev);
>
> @@ -487,7 +487,7 @@ static int __maybe_unused s6sy761_runtime_suspend(str=
uct device *dev)
>  =09=09=09=09S6SY761_APPLICATION_MODE, S6SY761_APP_SLEEP);
>  }
>
> -static int __maybe_unused s6sy761_runtime_resume(struct device *dev)
> +static int s6sy761_runtime_resume(struct device *dev)
>  {
>  =09struct s6sy761_data *sdata =3D dev_get_drvdata(dev);
>
> @@ -495,7 +495,7 @@ static int __maybe_unused s6sy761_runtime_resume(stru=
ct device *dev)
>  =09=09=09=09S6SY761_APPLICATION_MODE, S6SY761_APP_NORMAL);
>  }
>
> -static int __maybe_unused s6sy761_suspend(struct device *dev)
> +static int s6sy761_suspend(struct device *dev)
>  {
>  =09struct s6sy761_data *sdata =3D dev_get_drvdata(dev);
>
> @@ -504,7 +504,7 @@ static int __maybe_unused s6sy761_suspend(struct devi=
ce *dev)
>  =09return 0;
>  }
>
> -static int __maybe_unused s6sy761_resume(struct device *dev)
> +static int s6sy761_resume(struct device *dev)
>  {
>  =09struct s6sy761_data *sdata =3D dev_get_drvdata(dev);
>
> @@ -514,9 +514,8 @@ static int __maybe_unused s6sy761_resume(struct devic=
e *dev)
>  }
>
>  static const struct dev_pm_ops s6sy761_pm_ops =3D {
> -=09SET_SYSTEM_SLEEP_PM_OPS(s6sy761_suspend, s6sy761_resume)
> -=09SET_RUNTIME_PM_OPS(s6sy761_runtime_suspend,
> -=09=09=09=09s6sy761_runtime_resume, NULL)
> +=09SYSTEM_SLEEP_PM_OPS(s6sy761_suspend, s6sy761_resume)
> +=09RUNTIME_PM_OPS(s6sy761_runtime_suspend, s6sy761_runtime_resume, NULL)
>  };
>
>  #ifdef CONFIG_OF
> @@ -537,7 +536,7 @@ static struct i2c_driver s6sy761_driver =3D {
>  =09.driver =3D {
>  =09=09.name =3D S6SY761_DEV_NAME,
>  =09=09.of_match_table =3D of_match_ptr(s6sy761_of_match),
> -=09=09.pm =3D &s6sy761_pm_ops,
> +=09=09.pm =3D pm_ptr(&s6sy761_pm_ops),
>  =09},
>  =09.probe_new =3D s6sy761_probe,
>  =09.remove =3D s6sy761_remove,
> --
> 2.39.0
>

--
Kind Regards,
Caleb

