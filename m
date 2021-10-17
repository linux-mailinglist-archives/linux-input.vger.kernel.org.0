Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B614306EC
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 07:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244903AbhJQFZ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 01:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241437AbhJQFZ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 01:25:58 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225E3C061765
        for <linux-input@vger.kernel.org>; Sat, 16 Oct 2021 22:23:49 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id v8so7931668pfu.11
        for <linux-input@vger.kernel.org>; Sat, 16 Oct 2021 22:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Ehk2/kkpEySkFUgCqEr3cq/TJpeR5PkZbDcKmA3rhU=;
        b=AVIUXYZ/OP/23lqaJThO+1lQMckI7HylfMezWf69nx1wY24aa0W7dfz4lHrsytTT8u
         JhlFWfhs8ToFwUuGqBEQGyT2jDkr+gZXH7JGAQG2aM/gGNnVGclIvuuBKvg9kPZfkiCo
         ssfYLyWh0myHAciANaKD2O7FwXhhJurqb/y8Fy+1/FZWvBjL9zsMKFjwPMezygUOqfzb
         NvxTqxKYMihB0B2vWRnB2IoM8m6DzyWfbLKRoPbVrjvlkfo+Vho+S+S/DwWT6wLPxvgf
         QZa3FjSpM1FUoQKV66yTpj62ADqtcjCwapDFvLzhP9m1Um1wko3Rn5r6l7hvHkelNx76
         iHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Ehk2/kkpEySkFUgCqEr3cq/TJpeR5PkZbDcKmA3rhU=;
        b=686fGwC9Oe7uT2Z7MJIGdmcOhBuu1J7Ma2ZX1kE8DMc4x/KdluLa/LQkDFVzjH6dVU
         siIIKlh7UX6p6TaRLzDZDknABoEOIQ0wGDyQSWLa3x1BSwk1en1uaeMaYkG0v1efpFxH
         RWiQBaPFb61oLS8JnqHWKZ7bDLlJjmomtMDrG8LqdcHKlSLZ+C+7Y7K8jFt3XYEoD6yV
         /nVwZbhJmEb2mvgL77SXxsThJwWgeDVqrxVrrLwwmzK1wfvs4E3rDKqrN9ZHKHQk/8/9
         1kw02phMF14Wza57l5WwSHjt6BTf8yu66uuvbZ46HB5bwG95TuyE3Zj2lDmlO3Nr7ntJ
         BgCw==
X-Gm-Message-State: AOAM530aZsw3iRhn0X4S12JwagXBEdZ2CF4gma1A0yuQ19ZV2iRml2Mk
        0apWgJW3uAj6yG7taZFhfE+4aVcNebM=
X-Google-Smtp-Source: ABdhPJwc9AQ05xOKDX95gDJzy9U/ZJ+D9owwyTpf762RIaRhdNxGvEthMoU/Jr7BKQVDVN9RCpkVKQ==
X-Received: by 2002:a62:7b90:0:b0:44d:fa6:325 with SMTP id w138-20020a627b90000000b0044d0fa60325mr21291972pfc.1.1634448227094;
        Sat, 16 Oct 2021 22:23:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:e49a:151f:b7d7:af9a])
        by smtp.gmail.com with ESMTPSA id t125sm9185613pfc.119.2021.10.16.22.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 22:23:46 -0700 (PDT)
Date:   Sat, 16 Oct 2021 22:23:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v3 1/3] Input: ili210x - use resolution from ili251x
 firmware
Message-ID: <YWuzX43d2m7cKO6E@google.com>
References: <20210831202506.181927-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831202506.181927-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Tue, Aug 31, 2021 at 10:25:04PM +0200, Marek Vasut wrote:
> +static int ili251x_firmware_update_resolution(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	__le16 resx, resy;

These are normal variables, so I changed it to u16, otherwise sparse is
rightfully unhappy.

> +	u8 rs[10];
> +	int error;
> +
> +	/* The firmware update blob might have changed the resolution. */
> +	error = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
> +	if (error)
> +		return error;
> +
> +	resx = le16_to_cpup((__le16 *)rs);
> +	resy = le16_to_cpup((__le16 *)(rs + 2));
> +
> +	/* The value reported by the firmware is invalid. */
> +	if (!resx || resx == 0xffff || !resy || resy == 0xffff)
> +		return -EINVAL;
> +
> +	input_abs_set_max(priv->input, ABS_X, resx - 1);
> +	input_abs_set_max(priv->input, ABS_Y, resy - 1);
> +	input_abs_set_max(priv->input, ABS_MT_POSITION_X, resx - 1);
> +	input_abs_set_max(priv->input, ABS_MT_POSITION_Y, resy - 1);
> +
> +	return 0;
> +}
> +
> +static int ili251x_firmware_update_cached_state(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	int ret;

Changed this to "error" and applied, thank you.

-- 
Dmitry
