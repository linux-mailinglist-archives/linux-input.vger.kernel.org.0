Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF7363A9D9
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 14:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbiK1NoI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 08:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbiK1Nnz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 08:43:55 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBC1186EC
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 05:43:51 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id r66-20020a1c4445000000b003d05a3775d4so2200091wma.3
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 05:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ChUfSWQpkOka3RMz7cPvl08M1UjHNcAjTkOzZNPTkY=;
        b=2MbRZysf3dn8Urie3wAa0AvPIYlTIWpdWJ6UamVEs4LdmH0b4ZJW+nsjnICtyUazbs
         WCplKvHRzDelinWd3fM3TRNRbYkeAipFNDylleHY/a69xENlgIUllMwtjVAB/JH2FCXx
         Udbc3pDIsmF6EARybXvCDuvy8XUy9e9dySnl9bnLwQ7DJclfgb8jLA3BDd620mOiHguV
         9p6kLvjTSVBtOfNSJ6hoM8+IKNFB5hfS+Sp+fv60ncVMyzfrvhCV4qAJMA5SbT3cekuM
         R1F1UpNuuhLC6KNTF5D6omzJpnMUAlvXf7okl+/q7OkMb83CCRb3SWKKbseW1gx7iWK5
         klLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ChUfSWQpkOka3RMz7cPvl08M1UjHNcAjTkOzZNPTkY=;
        b=i2YrIgiU11rg+EHJbHWTza2vQpscsONPEVRtm88Jge5glGn2mL6v6SrjA2S0bAfmTC
         aZYhD8GwCfwDExK27cVc1bQJHQdODVqyuRJOrRHTEjK4q5ifHuOSDARaOb44OgO/u7O0
         UC+/XZvQVh4R48P6bRpdfBmpD+CgfhVt1wSy+8f+4aeybnZxivshZnP375YHHusBcxWX
         19EWx1Y+JX7CO7VwLayg6sewn7KFRScybY9Mcqe9l1EmFEvbN73OkWe+6SNUiaMWiu7W
         uXx/bCcot40codbKv4i3hZjWffkInXqpjZNR2Gq78xP1X37hgIKu0EUKb1z9ZHY00m4L
         ZlNw==
X-Gm-Message-State: ANoB5pnOp6C/6jOGlnfKJZBC0jVnKx9KlVrBFbI4IAH0U5fFpqui+KL4
        XyOO/4HOXgYuoiqw51npl+FwhA==
X-Google-Smtp-Source: AA0mqf7+pGd1Tmh2TNxuXqVhZz2XJErK3tFsf8y8oT9K0s/TgzJMSEVtSTshpM4fupYCXE2i5gSDjQ==
X-Received: by 2002:a05:600c:3514:b0:3cf:e0ef:1f6c with SMTP id h20-20020a05600c351400b003cfe0ef1f6cmr30175183wmq.75.1669643030449;
        Mon, 28 Nov 2022 05:43:50 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003b4c979e6bcsm18187855wma.10.2022.11.28.05.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:43:49 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dan Carpenter <error27@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Dan Carpenter <error27@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: elants_i2c - delete some dead code
In-Reply-To: <Y33BD9xkRC9euIdO@kili>
References: <Y33BD9xkRC9euIdO@kili>
Date:   Mon, 28 Nov 2022 14:43:49 +0100
Message-ID: <87zgcbry7e.fsf@baylibre.com>
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

On Wed, Nov 23, 2022 at 09:43, Dan Carpenter <error27@gmail.com> wrote:

> We shuffled the error handling around so this condition is dead code
> now.  The "error" variable is always zero.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
> No Fixes tag because this does not fix a bug but if we were to assign
> a tag it would be:
>
> Fixes: a85fbd649844 ("Input: elants_i2c - properly handle the reset GPIO when power is off")
>
>  drivers/input/touchscreen/elants_i2c.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index e1308e179dd6..af1dc43e988c 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1353,8 +1353,6 @@ static int elants_i2c_power_on(struct elants_data *ts)
>  	udelay(ELAN_POWERON_DELAY_USEC);
>  
>  	gpiod_set_value_cansleep(ts->reset_gpio, 0);
> -	if (error)
> -		return error;
>  
>  	msleep(ELAN_RESET_DELAY_MSEC);
>  
> -- 
> 2.35.1
