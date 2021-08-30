Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098383FBDA8
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 22:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbhH3U4K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 16:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhH3U4K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 16:56:10 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EACEC061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 13:55:16 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so841464pjx.5
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KEfSYSriWU280gHTq5ynCZog4SrZQQnc7f0B8c3ZvTY=;
        b=g3lXwM97Jf71RKbBz+2V/VWMz6T7S7U5AMYcZzExBO6Tyke0TS1a9SCWXts1Qio/68
         rTxn8aBkRMqsBX298Wl6h8c7VwmfokyRqmS010S+Okp3jPuLGD9Mqm8wBCVYyt3g9EOb
         C1avXh61jFhgsf+zRktvvuRxxXOFS+rsgT7LnWzzBNmvviDpqmAlAS+JtnRB6PQ5A/4J
         BypG16il6f+iX90+/+1FlmSoMin919Mh3ecqmyWfeS8LIJzpjNeKs41EQaUEeZ7MLc/l
         /Lhqvqapt623Ou8NZu8xAnHAcAVcUf+ffUZCoOeYUFs++/I5d5UnNwCYf0N360+9lDvs
         XXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KEfSYSriWU280gHTq5ynCZog4SrZQQnc7f0B8c3ZvTY=;
        b=UVVPvjxkdVT/De5U7yRVLISLt0bfhhj1aGRhC5ykHcItIP5Sp4y04G9a/xGpjVq7KJ
         gs9RodxyxImmKSyEpKU97NiROKBRz0UAa+79P+wyTTAc2Fjgmd7wvhwiNQwW0pq6km63
         5HWPrZpY2hfvplqXmJfxYFGuLh82nx9cK0XY8CEhsHN27YmqLVCQaav+x+1Od1jHjb+C
         mSqJbZ1ds63NosmnDqPMwXQZkj+91JL0sTdB83HqY0pN/0iRJgMVAEqTTwogJhGegf9c
         6946rn5tMHtrPE5Niti8D3r9pSCATP6gJeV/yWiMHdG1/faQIUmF8s7AFS88BEPqnriN
         z1jA==
X-Gm-Message-State: AOAM531Xv+QC6eXmcTqdjgKnT2ymkIXopiWoCI8oKikGx+XA/VlQoDNP
        Q6oVLTRwoy8aO07iOvPtFOU=
X-Google-Smtp-Source: ABdhPJxpZLVRV1xxxSvfHDneoErs4qDpv1nRwbo1y1fCnOdYHDR84na+XLGNe403bnrLE9bNP1YCOg==
X-Received: by 2002:a17:902:f541:b0:138:e3e0:a5f8 with SMTP id h1-20020a170902f54100b00138e3e0a5f8mr1359886plf.60.1630356915536;
        Mon, 30 Aug 2021 13:55:15 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id c21sm10304906pfd.200.2021.08.30.13.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:55:14 -0700 (PDT)
Date:   Mon, 30 Aug 2021 13:55:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2 1/3] Input: ili210x - use resolution from ili251x
 firmware
Message-ID: <YS1FsJROzDkm/0Ky@google.com>
References: <20210827211258.318618-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827211258.318618-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Fri, Aug 27, 2021 at 11:12:56PM +0200, Marek Vasut wrote:
> The ili251x firmware protocol permits readout of panel resolution,
> implement this, but make it possible to override this value using
> DT bindings. This way, older DTs which contain touchscreen-size-x
> and touchscreen-size-y properties will behave just like before and
> new DTs may avoid specifying these for ILI251x.
> 
> Note that the command format is different on other controllers, so
> this functionality is isolated to ILI251x.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>
> ---
> V2: New patch
> ---
>  drivers/input/touchscreen/ili210x.c | 31 +++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 30576a5f2f04..c46553ecabe6 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -323,6 +323,34 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int ili251x_firmware_update_resolution(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	u16 resx, resy;
> +	u8 rs[10];
> +	int ret;
> +
> +	/* The firmware update blob might have changed the resolution. */
> +	ret = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
> +	if (ret)
> +		return ret;
> +
> +	resx = (rs[1] << 8U) | rs[0];
> +	resy = (rs[3] << 8U) | rs[2];

Why do we need the 'U' specifier here? Actually, let's use
le16_to_cpup() or get_unaligned_le16().

> +
> +	/* The value reported by the firmware is invalid. */
> +	if (!resx || resx == 0xffff || !resy || resy == 0xfff)

Not 0xffff for resy?

> +		return -EINVAL;
> +
> +	priv->input->absinfo[ABS_X].maximum = resx - 1;
> +	priv->input->absinfo[ABS_Y].maximum = resy - 1;
> +	priv->input->absinfo[ABS_MT_POSITION_X].maximum = resx - 1;
> +	priv->input->absinfo[ABS_MT_POSITION_Y].maximum = resy - 1;

There is

	input_set_abs_max(priv->input, ABS_X, resx - 1);

> +
> +	return 0;
> +}
> +
>  static ssize_t ili210x_calibrate(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
> @@ -449,6 +477,9 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
>  	if (priv->chip->has_pressure_reg)
>  		input_set_abs_params(input, ABS_MT_PRESSURE, 0, 0xa, 0, 0);
> +	/* ILI251x does report valid resolution information, try it. */
> +	if (priv->chip == &ili251x_chip)
> +		ili251x_firmware_update_resolution(dev);

Would prefer a flag in chip features vs matching on chip.

>  	touchscreen_parse_properties(input, true, &priv->prop);
>  
>  	error = input_mt_init_slots(input, priv->chip->max_touches,
> -- 
> 2.32.0
> 

Thanks.

-- 
Dmitry
