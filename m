Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC9964254C
	for <lists+linux-input@lfdr.de>; Mon,  5 Dec 2022 10:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbiLEJCV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Dec 2022 04:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiLEJBI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Dec 2022 04:01:08 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326EF111C
        for <linux-input@vger.kernel.org>; Mon,  5 Dec 2022 00:59:38 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p27K4-0006mZ-Mc; Mon, 05 Dec 2022 09:59:36 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p27K4-0007vV-D9; Mon, 05 Dec 2022 09:59:36 +0100
Date:   Mon, 5 Dec 2022 09:59:36 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 10/32] Input: qt1050 - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Message-ID: <20221205085936.hmyfznvuapmr5vdz@pengutronix.de>
References: <20221204180841.2211588-1-jic23@kernel.org>
 <20221204180841.2211588-11-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221204180841.2211588-11-jic23@kernel.org>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jonathan,

thanks for the patch.

On 22-12-04, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

> Cc: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/input/keyboard/qt1050.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
> index 403060d05c3b..317fe2b1f827 100644
> --- a/drivers/input/keyboard/qt1050.c
> +++ b/drivers/input/keyboard/qt1050.c
> @@ -547,7 +547,7 @@ static int qt1050_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int __maybe_unused qt1050_suspend(struct device *dev)
> +static int qt1050_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct qt1050_priv *ts = i2c_get_clientdata(client);
> @@ -563,7 +563,7 @@ static int __maybe_unused qt1050_suspend(struct device *dev)
>  			    device_may_wakeup(dev) ? 125 : 0);
>  }
>  
> -static int __maybe_unused qt1050_resume(struct device *dev)
> +static int qt1050_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct qt1050_priv *ts = i2c_get_clientdata(client);
> @@ -574,7 +574,7 @@ static int __maybe_unused qt1050_resume(struct device *dev)
>  	return regmap_write(ts->regmap, QT1050_LPMODE, 2);
>  }
>  
> -static SIMPLE_DEV_PM_OPS(qt1050_pm_ops, qt1050_suspend, qt1050_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(qt1050_pm_ops, qt1050_suspend, qt1050_resume);
>  
>  static const struct of_device_id __maybe_unused qt1050_of_match[] = {
>  	{ .compatible = "microchip,qt1050", },
> @@ -586,7 +586,7 @@ static struct i2c_driver qt1050_driver = {
>  	.driver	= {
>  		.name = "qt1050",
>  		.of_match_table = of_match_ptr(qt1050_of_match),
> -		.pm = &qt1050_pm_ops,
> +		.pm = pm_sleep_ptr(&qt1050_pm_ops),
>  	},
>  	.probe_new = qt1050_probe,
>  };
> -- 
> 2.38.1
> 
> 
