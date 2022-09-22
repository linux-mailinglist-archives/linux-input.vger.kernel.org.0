Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D125F5E5DD9
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 10:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbiIVIql (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 04:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiIVIqU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 04:46:20 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C351AD0787
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:46:11 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id h130-20020a1c2188000000b003b4cadadce7so855260wmh.3
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=IqZEPUYAc6yhYWluzhh1Q6ZJtHM0YiVcWrrl0ode9l8=;
        b=MIqmBeHM8SCssyUpCcvRABgh+ehp74QbY9tBm2SX5+nDSbu9vhPWoDWLdGOc/Vg5pC
         4WImVmMib2UdTirssCURUSwIU4LljMc43ny6z0H5dBtcuS12QcjAIFM4wZU2u4Kzl5f7
         lbLCbMQBMRKA/UsJfCNZQTxHGnxFGV/HKoYa8u8HLI9fbSwsAW2qFhwJbGIzgyzLLyOr
         UJt0q7VCNBVQRDOXaH7s2//SppI4YClzmNg6zcV6c7A96t2r8VuJaccRlGuT6bEwEeAZ
         XE4pt+bCUz3BoXJwLttgXr3lYH4ugWSO+CQHJK5wbehKGdNTF+W5esQyd5/fZk7SlYf4
         4IUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=IqZEPUYAc6yhYWluzhh1Q6ZJtHM0YiVcWrrl0ode9l8=;
        b=WVcfrpbe1jZUMEYWDE9WnpMcrc3VtmEBXO2WVfb/SWQMbeK/j/ESMm1CoXYzOUi7sX
         ncKhJkoaqEa4qllhKVmHZDYGDDUlT/ZfELHZYXDghV7p+1ku+ccSbuqhRerZPfQeELx2
         SGWxxPamTrcT1U87XZ9GfhRBTeS4mVsfQQ178d1zI0mTyIU2PdhppXqtpG6EdhCVM/f8
         RIAjZ14WwpWKH1ycOpYtToK6xL9VSV+vNb0fLVcdC/XJYXwM102ontowbyUXd4iABZVq
         RP9yrZ6eEhxXy4hahV0Dhv9OaWGG7wBQ3KIuTaOgPs2HVRYbTFuBHnO8yRzoqx5fe3Cj
         1s7g==
X-Gm-Message-State: ACrzQf3bh1UKDIUKnKMbYkUwK5TpQBU6+2huXJq75w0p7C+Q+Qhn1GlM
        Z3xEV+TEf64tcs1BKk5ej7gwNw==
X-Google-Smtp-Source: AMsMyM59PH4ClTm88zgCVfG24c5EIrh7K+oFzJ/IPmiKxAVdQUYq6nC8FRS5/jjN2MSiuX5QwAeUhw==
X-Received: by 2002:a05:600c:3555:b0:3b4:c0fd:918e with SMTP id i21-20020a05600c355500b003b4c0fd918emr1472531wmq.61.1663836369479;
        Thu, 22 Sep 2022 01:46:09 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id j3-20020a05600c300300b003b4868eb6bbsm5962778wmh.23.2022.09.22.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:46:09 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
Subject: Re: [PATCH -next 1/4] Input: adc-joystick - Switch to use
 dev_err_probe() helper
In-Reply-To: <20220920153055.3465115-1-yangyingliang@huawei.com>
References: <20220920153055.3465115-1-yangyingliang@huawei.com>
Date:   Thu, 22 Sep 2022 10:46:08 +0200
Message-ID: <877d1vhk4v.fsf@baylibre.com>
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
>  drivers/input/joystick/adc-joystick.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
> index c0deff5d4282..3590d845e381 100644
> --- a/drivers/input/joystick/adc-joystick.c
> +++ b/drivers/input/joystick/adc-joystick.c
> @@ -201,12 +201,9 @@ static int adc_joystick_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	joy->chans = devm_iio_channel_get_all(dev);
> -	if (IS_ERR(joy->chans)) {
> -		error = PTR_ERR(joy->chans);
> -		if (error != -EPROBE_DEFER)
> -			dev_err(dev, "Unable to get IIO channels");
> -		return error;
> -	}
> +	if (IS_ERR(joy->chans))
> +		return dev_err_probe(dev, PTR_ERR(joy->chans),
> +				     "Unable to get IIO channels\n");

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

>  
>  	error = device_property_read_u32(dev, "poll-interval", &poll_interval);
>  	if (error) {
> -- 
> 2.25.1
