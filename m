Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE10255643
	for <lists+linux-input@lfdr.de>; Fri, 28 Aug 2020 10:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgH1ITz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Aug 2020 04:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgH1ITw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Aug 2020 04:19:52 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2D3C061264;
        Fri, 28 Aug 2020 01:19:52 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y2so371934ljc.1;
        Fri, 28 Aug 2020 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=emgRC1O/XN0oKlbZwUrLkuHyx1g+CfGZ4VZjo4v2TFA=;
        b=a6JKM/XmL6dUFdomj9HWPyx+/NYG5Kv95t0T/VyRByN0rjTLkCnaICTaipLziHlU0M
         PUD+nYM3vIfGxUu6NSKbl/edJRMCWvlAIYLBAmYGhipTS64wK0bJiotq+uXf/2oYgbC+
         HHnyDCCeiUPDviJBfdYGWYx1QnKJ0lrgnw06L/NOjqSCmbJrBzFz3Kuxogfwq00aQKcR
         6HVjK8stQUZussRhe859K0Vns9cS7XKYs4fH/kXEHZc28G2GECrLIiAMBHt8soZFDmCv
         g/4n0l4CFxzqZ+aardNjeNjF6utmkrfs4p8rK6tUNaEPME8NzDLMNPnMPMH/5MAxixmn
         0ttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=emgRC1O/XN0oKlbZwUrLkuHyx1g+CfGZ4VZjo4v2TFA=;
        b=EX7XTQn5+P9fNHlA26MFte3YfmKRERVWiKJmWDM6+uHnSO1YtfwhUqoHJY5KyyXT86
         lNKTgdMNWBbZbnoZ+EcEpyCFm3TRejmhdWaV/0m8F2+g0lV5FJGyhHQ+Opsv/Q0qb3h5
         UMM7dcCmixUQic3CPn+l6Hk9Rb6KXQoBkBYhTZmQ9NWJb0grMeYOQVUVeN1m4y/DbAot
         6kNlLKbyQYj84lnXtxnsexjyA+Rr43pPbimM9+Q6sb6ssxPO39tFXwZ8p3+tOsBrh6Cd
         R+XI8HDK9Sc4zDW7jL6WAV/11FC8AwK9ULEdp8HW8RiBCt68aD36mkhEqCZGS81oQXgm
         34Ig==
X-Gm-Message-State: AOAM533fD3yVYA6/dMfdy6ponoXjndWSun1NzvLk+EUZKjH16HoFxeFu
        +M/Yiu5QmC/QF7SIj2Je/vE=
X-Google-Smtp-Source: ABdhPJxBUb9N2Xb7+glQjbEtPMZvmtyLEX7hqiRDBygO++6TxNhy0tIcsWdaBlkP0J5pHn8Y1YNl2Q==
X-Received: by 2002:a05:651c:23a:: with SMTP id z26mr323559ljn.257.1598602790712;
        Fri, 28 Aug 2020 01:19:50 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id a2sm56719ljp.26.2020.08.28.01.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 01:19:50 -0700 (PDT)
Subject: Re: [PATCH 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200821082254.16661-1-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <64c77ff9-6d20-abcf-f549-7d5c85fba28d@gmail.com>
Date:   Fri, 28 Aug 2020 11:19:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821082254.16661-1-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

21.08.2020 11:22, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> when they are in a sleep state. It must be retried after a delay for the
> chip to wake up.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit 63fd7a2cd03c3a572a5db39c52f4856819e1835d)
> [gdavis: Forward port and fix conflicts.]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 45 ++++++++++++++++--------
>  1 file changed, 30 insertions(+), 15 deletions(-)

Hello, Jiada!

I tested this patch on Acer A500 that has mXT1386 controller which
requires the I2C retrying and everything working good, no problems
spotted! Touchscreen doesn't work without this patch!

Tested-by: Dmitry Osipenko <digetx@gmail.com>

I have one minor comment, please see it below!

> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index a2189739e30f..e93eda1f3d59 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -196,6 +196,7 @@ enum t100_type {
>  #define MXT_CRC_TIMEOUT		1000	/* msec */
>  #define MXT_FW_RESET_TIME	3000	/* msec */
>  #define MXT_FW_CHG_TIMEOUT	300	/* msec */
> +#define MXT_WAKEUP_TIME		25	/* msec */
>  
>  /* Command to unlock bootloader */
>  #define MXT_UNLOCK_CMD_MSB	0xaa
> @@ -626,6 +627,7 @@ static int __mxt_read_reg(struct i2c_client *client,
>  	struct i2c_msg xfer[2];
>  	u8 buf[2];
>  	int ret;
> +	bool retry = false;
>  
>  	buf[0] = reg & 0xff;
>  	buf[1] = (reg >> 8) & 0xff;
> @@ -642,17 +644,22 @@ static int __mxt_read_reg(struct i2c_client *client,
>  	xfer[1].len = len;
>  	xfer[1].buf = val;
>  
> -	ret = i2c_transfer(client->adapter, xfer, 2);
> -	if (ret == 2) {
> -		ret = 0;
> -	} else {
> -		if (ret >= 0)
> -			ret = -EIO;
> -		dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
> -			__func__, ret);
> +retry_read:
> +	ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> +	if (ret != ARRAY_SIZE(xfer)) {

Is it really possible to get a positive ret != 2 from i2c_transfer()?

Maybe it's better to keep the old code behaviour by returning the "ret"
value directly if it's not equal to ARRAY_SIZE(xfer)?
