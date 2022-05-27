Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2A8A5358E0
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 07:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiE0FrO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 01:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238942AbiE0FrK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 01:47:10 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B25B481
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:47:08 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h186so3093772pgc.3
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EgSAMfv1NlWqsn61u1PLKsvhNZM8le/HwcZbB4aHaZ4=;
        b=NY7Nug1xuEXcn7EItcrCUEh52v3/QFmiQ0c8o6VDGKfxIIBpqF5H+Ug99Wlxun2K3x
         NdklDCReDrK+eyrtUaZ3KHTI7LPLGVOFwwUCbkgRMFvWdnRSAWgMXTya51XPSeCB3feS
         jfnQw3Sw4ZCZzHVDEll60EoYrx+/YuMPS1gWQgtOvL9pPRRdmctlYQP2wrUhpwr9+KJF
         b/SABoSY3XuPf51a/nriEDj7uUpH0Y+Xj1nU/M0c4TmUlqzAJGMlfRusXq0xnJyL5Av4
         d76ZRPo5nMPeQpO6LKsdyQrhrjlSeRMwiWEKzY22CI99ra0FyYx6Qjt8oKaRISE4u3fc
         RNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EgSAMfv1NlWqsn61u1PLKsvhNZM8le/HwcZbB4aHaZ4=;
        b=zuW1EgqFrC4Ft6ltS+n31WPmGW4GUFhNkti5OTvKW9vcxhNhgSalMKs4PPqzEgG57J
         g3DnXXhL0gEfLkvhLD0NkT1Picn78e+xuVAtwrWQmGpQTUgaMWhL7RUJQiAk1+399h/N
         eI/0R7p/Zhy+dmaNd0fSdNzMbEBkE8i1vEQpLjjK7mpZYN/IuDCsPCDMpphimMN/xfEl
         LY0Gd3oLasGXraE/LPWSlXagCDDaj5raiHFrZrgrF2Y5Z4O2wnduk5fr9nnBWZrDA249
         yJFRo3MNsNTTMBhH0OUjwqCLxW9+5muI3c7nsjudbf3kQyVB+qtsn9SCoQZETSynVsMs
         0DBg==
X-Gm-Message-State: AOAM5318O6r4WL5sBRZhSIWkYCqOQhnDfPHGUhM4xzwqVyyTtXvJeQMa
        SD5WKadi91NVIhfLvjZIi3Q=
X-Google-Smtp-Source: ABdhPJx1nAqwAkAyqlAY5ypNBLnM1dj+YvpqUGS6i6c+ZQOvwvv9N/3U9q0mcpmqbHhHuesjqGfBJw==
X-Received: by 2002:a63:9a11:0:b0:3a3:3a8a:1006 with SMTP id o17-20020a639a11000000b003a33a8a1006mr36124108pge.116.1653630428224;
        Thu, 26 May 2022 22:47:08 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3206:ea0b:ce53:ea86])
        by smtp.gmail.com with ESMTPSA id a185-20020a6390c2000000b003db8bc8db64sm2557773pge.35.2022.05.26.22.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:47:07 -0700 (PDT)
Date:   Thu, 26 May 2022 22:47:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH 4/5] Input: zinitix - Read and cache device version
 numbers
Message-ID: <YpBl2GV1unXpQrO8@google.com>
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
 <20220410120059.2583849-4-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410120059.2583849-4-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 10, 2022 at 02:00:58PM +0200, Linus Walleij wrote:
>  static int zinitix_init_touch(struct bt541_ts_data *bt541)
>  {
>  	struct i2c_client *client = bt541->client;
>  	int i;
>  	int error;
> +	static bool read_static = false;

This needs to be per-device state.

>  
>  	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
>  	if (error) {
> @@ -203,6 +222,24 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
>  		return error;
>  	}
>  
> +	/*
> +	 * Read and cache the chip revision and firmware version the first time
> +	 * we get here.
> +	 */
> +	if (!read_static) {
> +		bt541->chip_revision = zinitix_get_u16_reg(bt541,
> +					ZINITIX_CHIP_REVISION);
> +		bt541->firmware_version = zinitix_get_u16_reg(bt541,
> +					ZINITIX_FIRMWARE_VERSION);
> +		bt541->regdata_version = zinitix_get_u16_reg(bt541,
> +					ZINITIX_DATA_VERSION_REG);
> +		dev_info(bt541->dev,
> +			 "chip revision %04x firmware version %04x regdata version %04x\n",
> +			 bt541->chip_revision, bt541->firmware_version,
> +			 bt541->regdata_version);

Is this only for bringup efforts?

> +		read_static = true;
> +	}
> +
>  	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, 0x0);
>  	if (error) {
>  		dev_err(bt541->dev,
> -- 
> 2.35.1
> 

Thanks.

-- 
Dmitry
