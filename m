Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90F6369E876
	for <lists+linux-input@lfdr.de>; Tue, 21 Feb 2023 20:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjBUTkQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Feb 2023 14:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjBUTkL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Feb 2023 14:40:11 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3838F2E0E5
        for <linux-input@vger.kernel.org>; Tue, 21 Feb 2023 11:40:10 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso6330365pjb.3
        for <linux-input@vger.kernel.org>; Tue, 21 Feb 2023 11:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TIDx/zFiqu7Qu//b3mEepiAvenxq5UhI6TDmllBDQfg=;
        b=RZdzmL/9QqK+avXx7ygybI/ca5uDRjfxfjWrTlXugkyOn6Z+rupfDZHloNg35Zo8km
         lA5OZFvj7gpqo2zHQi+IwA5gLXsM/hSACuyMHCp2rH6vd0nF0cqpsBKKDD7Vtnys86Xe
         LytCPzQ4n3ynN3m4eFnAlQoee9H47P38z4eD7x5UX+Mltjek7X22Lduy0j3TK2CrJZyw
         NB1x2TLV3f3P0rmX+Eh39P3gC3RCsoWNHQWzjf2Cml7C7dp4AE36/D/LvZhKDOvTHkB3
         D4a4YzPGarvU4hyQ/lKYy1qgvCyyfpqZiJvvJgvlpGYdQpxsoMm0JY9NEUt3pWRnBiSu
         J2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIDx/zFiqu7Qu//b3mEepiAvenxq5UhI6TDmllBDQfg=;
        b=nm5P6eUSo2or3PD/m4Tnj+b5MGmViXoUg2KM9Zz0jLAUSYR1bmwG/FHgBMYP1pM6+7
         4qPmZ5F/9xFUsWbhp1RofGhYJ5mgRYxAuVmvbdkA7/BHAHhd3jpzhR7aLZZC2yY80Frb
         sMEyN19cDh/jwA3uQndLu9UvzPKCu9RBcNGcvPs9qUPCuIp04SjbJ+s6t7dzXdsUx3MF
         jawCbxRsOSpbndDvfFyZYNPcC57KLVRkZvwPePpd6R9wmxMImPITwW3WKNozXXQxSHa1
         ylUenCOtz9oYglqh0ycaD9LYcTFhl79WWfm7yN2H7kS1gr5ajo8HfBJ6uTQuAQ8UkxJl
         wvpA==
X-Gm-Message-State: AO0yUKVEXJkNOFcY2gQqeJIfBLBudLoVjYsKIZN/K+XUzl/qXC6iO8zP
        VTUWKeIOA8f8pRPGC63dKGA=
X-Google-Smtp-Source: AK7set9O5S1pGNYORegESySUiG25Tqz/E1pTWkh8GLGuVd+EL4MkD1ff0JlBYUXLteYB5MHA638vUA==
X-Received: by 2002:a05:6a21:6da2:b0:cb:7e8b:d5e1 with SMTP id wl34-20020a056a216da200b000cb7e8bd5e1mr4303043pzb.58.1677008409358;
        Tue, 21 Feb 2023 11:40:09 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:30ba:90e9:a2f2:4b50])
        by smtp.gmail.com with ESMTPSA id p25-20020a637f59000000b004eecc3080f8sm2307037pgn.29.2023.02.21.11.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:40:08 -0800 (PST)
Date:   Tue, 21 Feb 2023 11:40:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2] Input: ili210x - Probe even if no resolution
 information
Message-ID: <Y/UeFbZaMtHLuljN@google.com>
References: <20230217025200.203833-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217025200.203833-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Fri, Feb 17, 2023 at 03:52:00AM +0100, Marek Vasut wrote:
> Probe the touch controller driver even if resolution information is not
> available. This can happen e.g. in case the touch controller suffered a
> failed firmware update and is stuck in bootloader mode.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>
> ---
> V2: Add dev_warn() in case resolution is invalid
> ---
>  drivers/input/touchscreen/ili210x.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 4897fafa4204d..d64b6d77d2e08 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -370,22 +370,33 @@ static int ili251x_firmware_update_resolution(struct device *dev)
>  
>  	/* The firmware update blob might have changed the resolution. */
>  	error = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
> -	if (error)
> -		return error;
> +	if (!error) {
> +		resx = le16_to_cpup((__le16 *)rs);
> +		resy = le16_to_cpup((__le16 *)(rs + 2));
>  
> -	resx = le16_to_cpup((__le16 *)rs);
> -	resy = le16_to_cpup((__le16 *)(rs + 2));
> +		/* The value reported by the firmware is invalid. */
> +		if (!resx || resx == 0xffff || !resy || resy == 0xffff)
> +			error = -EINVAL;
> +	}
>  
> -	/* The value reported by the firmware is invalid. */
> -	if (!resx || resx == 0xffff || !resy || resy == 0xffff)
> -		return -EINVAL;
> +	/*
> +	 * In case of error, the firmware might be stuck in bootloader mode,
> +	 * e.g. after a failed firmware update. Set maximum resolution, but
> +	 * do not fail to probe, so the user can re-trigger the firmware
> +	 * update and recover the touch controller.
> +	 */
> +	if (error) {
> +		dev_warn(dev, "Invalid resolution reported by controller.\n");
> +		resx = 16384;
> +		resy = 16384;
> +	}
>  
>  	input_abs_set_max(priv->input, ABS_X, resx - 1);
>  	input_abs_set_max(priv->input, ABS_Y, resy - 1);
>  	input_abs_set_max(priv->input, ABS_MT_POSITION_X, resx - 1);
>  	input_abs_set_max(priv->input, ABS_MT_POSITION_Y, resy - 1);
>  
> -	return 0;
> +	return error;

I think this will make ili251x_firmware_update_cached_state() continue
failing when it reports invalid coordinates. Was this intended?

>  }
>  
>  static ssize_t ili251x_firmware_update_firmware_version(struct device *dev)
> @@ -980,7 +991,6 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>  	if (error) {
>  		dev_err(dev, "Unable to cache firmware information, err: %d\n",
>  			error);
> -		return error;
>  	}
>  	touchscreen_parse_properties(input, true, &priv->prop);
>  
> -- 
> 2.39.1
> 

Thanks.

-- 
Dmitry
