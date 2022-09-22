Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777425E5DF0
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 10:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbiIVIvb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 04:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiIVIv3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 04:51:29 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC56B07F6
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:51:28 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id cc5so14377184wrb.6
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=xDpNZT/3AAtJ5lj2u72zerW55G9Zhd70oL/dt9jPzEY=;
        b=O19bdtJ5rCKOTMwlUvGQ2EvEGqCcnfOV+j+yhz28NihyDpo6xXYnCqsZ61sl+7pe9X
         YTw1UO1nk3jXUUs9GPGmmbcs82s4ridY//YeKr3/Adsm0Ln61HS+flObthsw2bfD2HOm
         04dHNphw/yPSQ8/RlnwfEiH7epCU1lxm50Oivvff8hlxS5J0joXMfbuB1rpiP7HKypod
         PR/Y6EBAdTuSJNAsYIiHYGS2f/rQj5SyeqJfVS5PedrroZrEAo5zLHmyA06xe/sfBDm8
         mZW778qm+9X/Ry0aExjCfm5fV0+Jv+ueUSiJ5kSaotn6ioPaWcEBPXOUPsxbbg33xSNE
         BbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=xDpNZT/3AAtJ5lj2u72zerW55G9Zhd70oL/dt9jPzEY=;
        b=n+PORbQNsNOF0cDO/1DBAo+9KZjSJoMBUDbaDK+2wPDAySNINiJoNOoGKM5DQnYJI6
         EuPO6FOpAhItyyBh58cn5zbDvw5zohhMz4MWPV/K3ZbS2jWxZN7UG5jShdBZ7JqNRizt
         1IzBM0RSxrutO0MZjPtqx327NntUUAhesh5l9xK5Bg2iXjSSmFhnfbwLHtfNVww5sWCc
         S28PMAx6n+9B+4Czn4/LzicoLa42ys5zWDmpXcXCVjYs7wZtsKKVfGaGTVZiKdbgtsUg
         y5GpI4FnvrI79EvO72E35kKHYE/xxNypEBZtE3+tmbDU+i+jJ9x+ouH9p1JG1gQ/a4mP
         I1Tw==
X-Gm-Message-State: ACrzQf3SbI/+b4+EHzJL5dF+JqI2xn3gz6+yYl4fvRxd+OMLDUeHSedf
        ZBHlL0gGAC4j59kycaWCqVn8YA==
X-Google-Smtp-Source: AMsMyM4Ojk8eF9aP7xgO8XGTySbcJRsxR1Jbi/kz5aIl1Pe/sZzSs61HURKnyl6zbZxdLiCvzZ+t1g==
X-Received: by 2002:adf:e60d:0:b0:22b:3a47:8dfa with SMTP id p13-20020adfe60d000000b0022b3a478dfamr73865wrm.638.1663836687418;
        Thu, 22 Sep 2022 01:51:27 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c4ece00b003b477532e66sm9368556wmq.2.2022.09.22.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:51:26 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, yangyingliang@huawei.com
Subject: Re: [PATCH -next 1/5] Input: da7280 - Switch to use dev_err_probe()
 helper
In-Reply-To: <20220920153656.3486879-1-yangyingliang@huawei.com>
References: <20220920153656.3486879-1-yangyingliang@huawei.com>
Date:   Thu, 22 Sep 2022 10:51:25 +0200
Message-ID: <87v8pfg5bm.fsf@baylibre.com>
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

Thank you for your series,

On Tue, Sep 20, 2022 at 23:36, Yang Yingliang <yangyingliang@huawei.com> wrote:

> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/input/misc/da7280.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
> index b08610d6e575..b1ca4fd94e9e 100644
> --- a/drivers/input/misc/da7280.c
> +++ b/drivers/input/misc/da7280.c
> @@ -1166,12 +1166,9 @@ static int da7280_probe(struct i2c_client *client,
>  	if (haptics->const_op_mode == DA7280_PWM_MODE) {
>  		haptics->pwm_dev = devm_pwm_get(dev, NULL);
>  		error = PTR_ERR_OR_ZERO(haptics->pwm_dev);
> -		if (error) {
> -			if (error != -EPROBE_DEFER)
> -				dev_err(dev, "Unable to request PWM: %d\n",
> -					error);
> -			return error;
> -		}
> +		if (error)
> +			return dev_err_probe(dev, error,
> +					     "Unable to request PWM\n");

For the whole series:

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
>  		/* Sync up PWM state and ensure it is off. */
>  		pwm_init_state(haptics->pwm_dev, &state);
> -- 
> 2.25.1
