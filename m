Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB705F78BB
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 15:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiJGNQG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 09:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiJGNQF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 09:16:05 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C366BCBFF6
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 06:16:03 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id h189-20020a1c21c6000000b003bd44dc526fso946199wmh.3
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CuebKUt/o5xM09dLmXwbPm4CgIe7jmPFtsjnDvA9tKI=;
        b=i1dwJW1v3nbq8/ZbfaLV/q+zn1sU//XNom3IUeBfzQ47KQrxRVXRWBhf7VhQLzaRqz
         Xa41Ph/vP3D9pyURZCHhBE6X6NL4EUbY1KsWz5Z4BJc+24oonkMrNlHKV4g9bhDliMad
         4iUkum035btQ98tHX/ty/hzGiMALrkMUS2zyFiT3Ac+DPOtqqYyABjo1qr72AO41FWXG
         BVdeKpFykv0hU/1EL0KK3iYvoBLjqkQWFhnPr+3zSUpAyGSkNoxEcjxF28rsXgh1u4y9
         zSJW1sMCM4IuI6SPoQKtKkz2Zi5dlBo0zqAn16djw1RWXomTURPlaZnN3NeK9HCgirlV
         Kwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CuebKUt/o5xM09dLmXwbPm4CgIe7jmPFtsjnDvA9tKI=;
        b=n03KkHDm2Ch+ibUQNZPyDaU/425t9SRa/aWswPIdjXtvj8yqJQ8zFOjHQyYFXERFwQ
         ME5gsUvoV6NMcNWVk5awgTI5v7cUNo9tU8rngj357xEOuTF4i5kLxF5zP0X85XflDe0I
         oPQWvtJHLm8RDlY23XZ130CfYNK0NKsaXw1stzUiwUWUz66QjRrf5xWzWkUbHBbwGfkj
         CorBMY/mr9YT+pX9iU//OFIBRDkiFYx0rvhscWoZ6YhjpRA8AZ1LTjtkgP46vIYbKBr9
         4Ci1wMn4cKYl4SUn10HKU6+Yh2oJ3rgKjx2XM1B3553+WQLsEATSdWCZOSzN2mAY/9tZ
         dHbw==
X-Gm-Message-State: ACrzQf1fJUZvmUNDoZYcqPz6qcEpYT8DeJ+RBBeS64RppUKfbJSJQNwq
        SI5DXOx6LRPIdGI7KIKeALITahs1PD4pUg==
X-Google-Smtp-Source: AMsMyM5WE5gyZlSRRvvTJwc/xJmU91KkhbrBZ4+EaqgS7WNTriOMVwleLdCDeQlKdvk4b7EmjrYegw==
X-Received: by 2002:a1c:288:0:b0:3c3:d770:1756 with SMTP id 130-20020a1c0288000000b003c3d7701756mr587097wmc.134.1665148561936;
        Fri, 07 Oct 2022 06:16:01 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:5f1e:d910:dd1e:5b09])
        by smtp.gmail.com with ESMTPSA id d9-20020adff2c9000000b0021badf3cb26sm2594809wrp.63.2022.10.07.06.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 06:16:01 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: Re: [PATCH v2 7/7] Input: iqs7222 - add support for IQS7222A v1.13+
In-Reply-To: <YyP8Sc6k4lF9e72H@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71> <YyP8Sc6k4lF9e72H@nixie71>
Date:   Fri, 07 Oct 2022 15:16:00 +0200
Message-ID: <87lepr7p0v.fsf@mkorpershoek-xps-13-9370.home>
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

On Thu, Sep 15, 2022 at 23:32, Jeff LaBundy <jeff@labundy.com> wrote:

> IQS7222A revisions 1.13 and later widen the gesture multiplier from
> x4 ms to x16 ms. Add a means to scale the gesture timings specified
> in the device tree based on the revision of the device.
>
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
>  - Rebased to account for changes earlier in series
>
>  drivers/input/misc/iqs7222.c | 111 +++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> index 0a592b90f471..3340de51fb2d 100644
> --- a/drivers/input/misc/iqs7222.c
> +++ b/drivers/input/misc/iqs7222.c
> @@ -86,7 +86,9 @@ enum iqs7222_reg_key_id {
>  	IQS7222_REG_KEY_TOUCH,
>  	IQS7222_REG_KEY_DEBOUNCE,
>  	IQS7222_REG_KEY_TAP,
> +	IQS7222_REG_KEY_TAP_LEGACY,
>  	IQS7222_REG_KEY_AXIAL,
> +	IQS7222_REG_KEY_AXIAL_LEGACY,
>  	IQS7222_REG_KEY_WHEEL,
>  	IQS7222_REG_KEY_NO_WHEEL,
>  	IQS7222_REG_KEY_RESERVED
> @@ -202,10 +204,68 @@ struct iqs7222_dev_desc {
>  	int allow_offset;
>  	int event_offset;
>  	int comms_offset;
> +	bool legacy_gesture;
>  	struct iqs7222_reg_grp_desc reg_grps[IQS7222_NUM_REG_GRPS];
>  };
>  
>  static const struct iqs7222_dev_desc iqs7222_devs[] = {
> +	{
> +		.prod_num = IQS7222_PROD_NUM_A,
> +		.fw_major = 1,
> +		.fw_minor = 13,
> +		.sldr_res = U8_MAX * 16,
> +		.touch_link = 1768,
> +		.allow_offset = 9,
> +		.event_offset = 10,
> +		.comms_offset = 12,
> +		.reg_grps = {
> +			[IQS7222_REG_GRP_STAT] = {
> +				.base = IQS7222_SYS_STATUS,
> +				.num_row = 1,
> +				.num_col = 8,
> +			},
> +			[IQS7222_REG_GRP_CYCLE] = {
> +				.base = 0x8000,
> +				.num_row = 7,
> +				.num_col = 3,
> +			},
> +			[IQS7222_REG_GRP_GLBL] = {
> +				.base = 0x8700,
> +				.num_row = 1,
> +				.num_col = 3,
> +			},
> +			[IQS7222_REG_GRP_BTN] = {
> +				.base = 0x9000,
> +				.num_row = 12,
> +				.num_col = 3,
> +			},
> +			[IQS7222_REG_GRP_CHAN] = {
> +				.base = 0xA000,
> +				.num_row = 12,
> +				.num_col = 6,
> +			},
> +			[IQS7222_REG_GRP_FILT] = {
> +				.base = 0xAC00,
> +				.num_row = 1,
> +				.num_col = 2,
> +			},
> +			[IQS7222_REG_GRP_SLDR] = {
> +				.base = 0xB000,
> +				.num_row = 2,
> +				.num_col = 11,
> +			},
> +			[IQS7222_REG_GRP_GPIO] = {
> +				.base = 0xC000,
> +				.num_row = 1,
> +				.num_col = 3,
> +			},
> +			[IQS7222_REG_GRP_SYS] = {
> +				.base = IQS7222_SYS_SETUP,
> +				.num_row = 1,
> +				.num_col = 13,
> +			},
> +		},
> +	},
>  	{
>  		.prod_num = IQS7222_PROD_NUM_A,
>  		.fw_major = 1,
> @@ -215,6 +275,7 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
>  		.allow_offset = 9,
>  		.event_offset = 10,
>  		.comms_offset = 12,
> +		.legacy_gesture = true,
>  		.reg_grps = {
>  			[IQS7222_REG_GRP_STAT] = {
>  				.base = IQS7222_SYS_STATUS,
> @@ -874,6 +935,16 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
>  		.reg_offset = 9,
>  		.reg_shift = 8,
>  		.reg_width = 8,
> +		.val_pitch = 16,
> +		.label = "maximum gesture time",
> +	},
> +	{
> +		.name = "azoteq,gesture-max-ms",
> +		.reg_grp = IQS7222_REG_GRP_SLDR,
> +		.reg_key = IQS7222_REG_KEY_TAP_LEGACY,
> +		.reg_offset = 9,
> +		.reg_shift = 8,
> +		.reg_width = 8,
>  		.val_pitch = 4,
>  		.label = "maximum gesture time",
>  	},
> @@ -884,6 +955,16 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
>  		.reg_offset = 9,
>  		.reg_shift = 3,
>  		.reg_width = 5,
> +		.val_pitch = 16,
> +		.label = "minimum gesture time",
> +	},
> +	{
> +		.name = "azoteq,gesture-min-ms",
> +		.reg_grp = IQS7222_REG_GRP_SLDR,
> +		.reg_key = IQS7222_REG_KEY_TAP_LEGACY,
> +		.reg_offset = 9,
> +		.reg_shift = 3,
> +		.reg_width = 5,
>  		.val_pitch = 4,
>  		.label = "minimum gesture time",
>  	},
> @@ -897,6 +978,16 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
>  		.val_pitch = 16,
>  		.label = "gesture distance",
>  	},
> +	{
> +		.name = "azoteq,gesture-dist",
> +		.reg_grp = IQS7222_REG_GRP_SLDR,
> +		.reg_key = IQS7222_REG_KEY_AXIAL_LEGACY,
> +		.reg_offset = 10,
> +		.reg_shift = 8,
> +		.reg_width = 8,
> +		.val_pitch = 16,
> +		.label = "gesture distance",
> +	},
>  	{
>  		.name = "azoteq,gesture-max-ms",
>  		.reg_grp = IQS7222_REG_GRP_SLDR,
> @@ -904,6 +995,16 @@ static const struct iqs7222_prop_desc iqs7222_props[] = {
>  		.reg_offset = 10,
>  		.reg_shift = 0,
>  		.reg_width = 8,
> +		.val_pitch = 16,
> +		.label = "maximum gesture time",
> +	},
> +	{
> +		.name = "azoteq,gesture-max-ms",
> +		.reg_grp = IQS7222_REG_GRP_SLDR,
> +		.reg_key = IQS7222_REG_KEY_AXIAL_LEGACY,
> +		.reg_offset = 10,
> +		.reg_shift = 0,
> +		.reg_width = 8,
>  		.val_pitch = 4,
>  		.label = "maximum gesture time",
>  	},
> @@ -2133,8 +2234,18 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  		if (!event_node)
>  			continue;
>  
> +		/*
> +		 * Depending on the device, gestures are either offered using
> +		 * one of two timing resolutions, or are not supported at all.
> +		 */
>  		if (reg_offset)
>  			reg_key = IQS7222_REG_KEY_RESERVED;
> +		else if (dev_desc->legacy_gesture &&
> +			 iqs7222_sl_events[i].reg_key == IQS7222_REG_KEY_TAP)
> +			reg_key = IQS7222_REG_KEY_TAP_LEGACY;
> +		else if (dev_desc->legacy_gesture &&
> +			 iqs7222_sl_events[i].reg_key == IQS7222_REG_KEY_AXIAL)
> +			reg_key = IQS7222_REG_KEY_AXIAL_LEGACY;
>  		else
>  			reg_key = iqs7222_sl_events[i].reg_key;
>  
> -- 
> 2.34.1
