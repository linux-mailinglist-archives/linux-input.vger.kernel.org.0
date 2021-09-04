Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69943400A00
	for <lists+linux-input@lfdr.de>; Sat,  4 Sep 2021 08:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhIDGSK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 02:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhIDGSJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Sep 2021 02:18:09 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CDDC061575;
        Fri,  3 Sep 2021 23:17:09 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id j1so931553pjv.3;
        Fri, 03 Sep 2021 23:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tithbOm7YscXy/gZn9AVeTZ2bG9k6omF0DRVUunXSRI=;
        b=HImas5uSnrZK8YnQ7y6zFKUraqZVxNcjGaCjkEK7LVL2OXlWOIr6ekwdUNW0Y/skEg
         DGTk+bmiCLrTZ+CzgIdGS7nEnKoAKD7LLpbWM2+0C9TZ6V3f9G+MM0vKDmjxm3MKvgS/
         QU3Ocv/5K1xOuJFwV5clQMLWhFCu1OVb6U7yuXXMQXbgJZ7540+AJIldnS7aMKcFkmxz
         QSmuF+XTzSKMxhe8TIAmAarg44ErhlYhTNH0+XQC/qjmpcSda9T42v+Ns9dkQ1wy9ZHr
         vQZNsyPYQNCgWKJcXBfONSP8zODniQGdBuuuPJHmpOg9wCi/zuDF3Sx4a4bno5Tke3ME
         f0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tithbOm7YscXy/gZn9AVeTZ2bG9k6omF0DRVUunXSRI=;
        b=Pa9wAkOJs6k0MJfFsVbGEp53nA0SQ5evMJ6eLZwj/VyJzD9zv0uWkP+BnlVTLv+dVU
         ECvy+IV0MOEnKMrkg5th26dnH7P/Uc2OFLmkOUwUZk7RaOoBvPVmWMTbKRb94yliOgDh
         cZgW1TIht0UJ3IWY1ABBPebr2EpX0p5iM6tIVpZH8jliqwpdc1apGjV3Z+XYCLysrWBk
         PQtxRSnIGSL2gE8SICV/2fszILNviXKpha+3LW0rJcNPPJG20bxdsb23Q/D6UAM+uIAc
         QBmMRgiSAOLryGZ4mgCW/FAFZfYACVuSHNiUX5OjbH5EPlYpyRfK+bAnN4rkZA/dN9Zp
         aejg==
X-Gm-Message-State: AOAM533PdZjE92BOguFBS2fnnLtXfrXwixC8Ng8y8Dlf54ukxKFAuynz
        GGBDt71v4NtlnUyfFllWYtE=
X-Google-Smtp-Source: ABdhPJzhnytFijAFcNN9xytNcnT0QdJNHgyIOj3LMBvvl2GqjTogehRTgK1N6azG4TPZpDY3WdH4Tg==
X-Received: by 2002:a17:902:d892:b0:138:abfd:ec7d with SMTP id b18-20020a170902d89200b00138abfdec7dmr2172244plz.15.1630736228430;
        Fri, 03 Sep 2021 23:17:08 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:44a5:4d4e:ed46:daa])
        by smtp.gmail.com with ESMTPSA id k12sm1048847pjg.6.2021.09.03.23.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 23:17:07 -0700 (PDT)
Date:   Fri, 3 Sep 2021 23:17:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc:     hansemro@outlook.com, marex@denx.de, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: ili210x - Set the device name according to the
 device model
Message-ID: <YTMPYJK44lujITCk@google.com>
References: <20210903165448.26545-1-rpimentel.silva@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903165448.26545-1-rpimentel.silva@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rogerio,

On Fri, Sep 03, 2021 at 01:54:48PM -0300, Rogerio Pimentel wrote:
> Adding the device model into the device name is useful when
> applications need to set different parameters according to the
> touchscreen being used, e.g. X11 calibration points.

Typically model would go into input->id.product and optionally
input->id.version.

> 
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> ---
> 
> Changes since v1: Get the device ID from touchscreen controller
> instead of driver's device list.
> 
>  drivers/input/touchscreen/ili210x.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 199cf3daec10..7a897a03ed70 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -19,10 +19,14 @@
>  #define ILI251X_DATA_SIZE1	31
>  #define ILI251X_DATA_SIZE2	20
>  
> +#define ILI_NAME_LEN		27
> +#define ILITEK_TS_NAME "Ilitek ILI%x%x Touchscreen"
> +
>  /* Touchscreen commands */
>  #define REG_TOUCHDATA		0x10
>  #define REG_PANEL_INFO		0x20
>  #define REG_CALIBRATE		0xcc
> +#define REG_TS_MODEL		0x61
>  
>  struct ili2xxx_chip {
>  	int (*read_reg)(struct i2c_client *client, u8 reg,
> @@ -384,6 +388,8 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	struct input_dev *input;
>  	int error;
>  	unsigned int max_xy;
> +	unsigned char buf[2];
> +	char *model_name;
>  
>  	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
>  
> @@ -430,7 +436,10 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	i2c_set_clientdata(client, priv);
>  
>  	/* Setup input device */
> -	input->name = "ILI210x Touchscreen";
> +	input->name = ILITEK_TS_NAME;
> +	model_name = (char *)input->name;

Umm, no. Smashing RO data is not nice.

> +	priv->chip->read_reg(priv->client, REG_TS_MODEL, buf, 2);
> +	snprintf(model_name, ILI_NAME_LEN, input->name, buf[1], buf[0]);
>  	input->id.bustype = BUS_I2C;
>  
>  	/* Multi touch */
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
