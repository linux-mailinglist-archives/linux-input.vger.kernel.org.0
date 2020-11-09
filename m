Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470262AB119
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgKIGNn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIGNm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:13:42 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760CFC0613CF;
        Sun,  8 Nov 2020 22:13:41 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id v12so7103684pfm.13;
        Sun, 08 Nov 2020 22:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MzKCDAEKZIqBRTPt55oo20sKtE2iHUPEbj3RLswRDDM=;
        b=EhokTEuVOXyDweaN5FZouf/K5DYgtyLdnFPWnTi/pQxY6TvFYeARULF1bd8eIIgUrQ
         m+2I66XdoOlpdxGYSPrFtJTuKmhl6VNb52CXRn49M6ZQgkp+XTQJ7dhuL/9vTDE8FFfO
         qKuShhy//AJ9pL8dmJVJCH88Ddd2MqpbW/EvcSrnM1SN8V/QdUKOWhlr4i9cmGatM+DQ
         vPIeKqFL8d18oAJGWKoqlWQzcEflD+a4QUHgSFOEPLky/GCnIpgqo97zXacvtCcwZVMq
         jHqQ7vW41VCoVBpykCwTMpKDyrvoZlBkeUKUDAm4Fq/6omXMoR0vpSLpowt9dq62f/pb
         KTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MzKCDAEKZIqBRTPt55oo20sKtE2iHUPEbj3RLswRDDM=;
        b=H34FvyCv8D330MpejdrJe5hiIl23t7h/YS/oaB8xd3nExC3NUU8Z+eQimfivVUcMr0
         rzL5BLd9UWTp5AqRNi+IA/DVSw+4n0kl+uYYN/os4QK9l6zPUPc7UAA/dOAd9vqHQQAa
         L2gMcc/HKsEvRa3wtQTXDF5tD4+fsYgq9YuF8WAlbUQiDna1qv9BloN8nybS5uaJC2GH
         Q2b8OU9zHOgxYPIfaPpdbXIlGwSvBSmHB0c3pHoy/G23yOK1nak4kQuPdbzNcbBks28R
         zYcbzpyaNFpy9OR0WzD2xqXuI9aLujfs3CYAgaYa8kAGNTh/WQx5SdikhIA5u9HOkIJ2
         8FdQ==
X-Gm-Message-State: AOAM530y+tS73/Pgmp8qi8ZNIiAa2xw0veUKA2RmzdlfNZV73ZxAh9HT
        8prvtVr6Ay8l3FVnQd+5E18=
X-Google-Smtp-Source: ABdhPJxNnBvPDVA8wFINNNSCR7WlusMdOcIVKKTKfCDcnQASCS8P6Wx872pNvlihKtnJo125j2usDA==
X-Received: by 2002:a63:6547:: with SMTP id z68mr11767273pgb.411.1604902420948;
        Sun, 08 Nov 2020 22:13:40 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id c2sm9530969pfb.196.2020.11.08.22.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:13:40 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:13:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 16/20] input: misc: drv260x: Fix kernel-doc formatting
 and remove one abuse
Message-ID: <20201109061337.GI1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-17-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-17-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:23PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'input_dev' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'client' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'regmap' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'work' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'enable_gpio' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'regulator' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'magnitude' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'mode' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'library' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'rated_voltage' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:194: warning: Function parameter or member 'overdrive_voltage' not described in 'drv260x_data'
>  drivers/input/misc/drv260x.c:244: warning: Function parameter or member 'voltage' not described in 'drv260x_calculate_voltage'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/input/misc/drv260x.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
> index 79d7fa710a714..fabe106d499d4 100644
> --- a/drivers/input/misc/drv260x.c
> +++ b/drivers/input/misc/drv260x.c
> @@ -167,17 +167,17 @@
>  
>  /**
>   * struct drv260x_data -
> - * @input_dev - Pointer to the input device
> - * @client - Pointer to the I2C client
> - * @regmap - Register map of the device
> - * @work - Work item used to off load the enable/disable of the vibration
> - * @enable_gpio - Pointer to the gpio used for enable/disabling
> - * @regulator - Pointer to the regulator for the IC
> - * @magnitude - Magnitude of the vibration event
> - * @mode - The operating mode of the IC (LRA_NO_CAL, ERM or LRA)
> - * @library - The vibration library to be used
> - * @rated_voltage - The rated_voltage of the actuator
> - * @overdriver_voltage - The over drive voltage of the actuator
> + * @input_dev: Pointer to the input device
> + * @client: Pointer to the I2C client
> + * @regmap: Register map of the device
> + * @work: Work item used to off load the enable/disable of the vibration
> + * @enable_gpio: Pointer to the gpio used for enable/disabling
> + * @regulator: Pointer to the regulator for the IC
> + * @magnitude: Magnitude of the vibration event
> + * @mode: The operating mode of the IC (LRA_NO_CAL, ERM or LRA)
> + * @library: The vibration library to be used
> + * @rated_voltage: The rated_voltage of the actuator
> + * @overdriver_voltage: The over drive voltage of the actuator

Applied with this typo fixed as well.

>  **/
>  struct drv260x_data {
>  	struct input_dev *input_dev;
> @@ -234,12 +234,12 @@ static const struct reg_default drv260x_reg_defs[] = {
>  #define DRV260X_DEF_RATED_VOLT		0x90
>  #define DRV260X_DEF_OD_CLAMP_VOLT	0x90
>  
> -/**
> +/*
>   * Rated and Overdriver Voltages:
>   * Calculated using the formula r = v * 255 / 5.6
>   * where r is what will be written to the register
>   * and v is the rated or overdriver voltage of the actuator
> - **/
> + */
>  static int drv260x_calculate_voltage(unsigned int voltage)
>  {
>  	return (voltage * 255 / 5600);
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
