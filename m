Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E999430F69
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 06:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhJRE72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 00:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhJRE71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 00:59:27 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36572C06161C
        for <linux-input@vger.kernel.org>; Sun, 17 Oct 2021 21:57:17 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id j190so8078551pgd.0
        for <linux-input@vger.kernel.org>; Sun, 17 Oct 2021 21:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+n6+wnuYQ3mWr2qPYDFF0l0DFYQ7MwKVg5yeHkQpbf0=;
        b=gSk6ReTJlzKP+IczYW4Q0RGY6I9iT7oJu5o1XzSpCPStoukpj5M+0wclxl8/46g9JL
         CZtLnkaNh8tQl85ZZRMPM5Fqr7wvteTop7BhFUcR77sj5MvQKe1CET8GfT57ZJ12+p+F
         gAM2MjGUWQF0vB5wPt3uwUMZfCx6RXcMWy6Tzzc6tty2XFfdUgUhsHRvZ5F//EbEqF8f
         Sdr2WbEMLPC8HG8K9B3JeFff/fioxTVTknc+JsNwiCFfCstAOEQ0yp2MNpbFj7EJNCEi
         x1Rn9wGU5m0RDkI078ZauiqQbnkkRyzvml/Eo3ASAKSbJ4OZZk3dtRHOFMlRRUUwKf+L
         9Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+n6+wnuYQ3mWr2qPYDFF0l0DFYQ7MwKVg5yeHkQpbf0=;
        b=DR4Fmgk0jLDOQjnGeUuScMVJJpJQUG2BaOeeARx3QcAFlSuAxYqyTHF31+58Uv97aX
         nNmJNbftJuxjST1Xybmx6/h2fE/CPkIRbqfUTqIGZN/xZtd3fj0ZkA5SNeL2/gxI85uI
         9xtiJBVBM4K+cl8T/reWQJdocJgIUmlObeeCUpybPRmu7oug3+6PHfz4ncDI+4wbzbN5
         wyNE+ImJYz5v8qih/RNPuf0qtVYC2H64h7HXaUvzAKyxMOec1vJnxy87obAlYJXxZ5Tg
         aaHB94AhXqhvTU2v+Mag5lxg4I9QxsqCgFIFRBYLFarL9fJ4EPubzu9gBaRapKsYpiE3
         kkdw==
X-Gm-Message-State: AOAM531yu03CWnBOWYw+XfDcZ0amMoyVCJ7JpRSsL4uDEnkfIeLY7Cs4
        9E0i3AzhapcsXfHB8JGY000=
X-Google-Smtp-Source: ABdhPJxuF9um5GAlz7VVC3qCaBltH5IY7wA805TUYw0LvlGJjRKfatc9cnpCVjq7HN0RAJYWpf1p9A==
X-Received: by 2002:a05:6a00:1346:b0:44d:242a:8151 with SMTP id k6-20020a056a00134600b0044d242a8151mr26374917pfu.62.1634533036625;
        Sun, 17 Oct 2021 21:57:16 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7649:ee4:7a4f:e362])
        by smtp.gmail.com with ESMTPSA id l207sm11698537pfd.199.2021.10.17.21.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 21:57:15 -0700 (PDT)
Date:   Sun, 17 Oct 2021 21:57:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH] Input: ili210x - Make ili251x_firmware_to_buffer more
 generic
Message-ID: <YWz+qVvfeENpX8uF@google.com>
References: <20211017172435.47812-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017172435.47812-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Oct 17, 2021 at 07:24:35PM +0200, Marek Vasut wrote:
> Wrap request_ihex_firmware() and release_firmware() into function
> ili251x_firmware_to_buffer(), since the ihex firmware is only used
> within that function and it is not required outside of it.
> 
> This requires passing the firmware filename, but instead of adding yet
> another parameter, add the firmware filename into struct ili2xxx_chip,
> so other chips with different firmware filenames can also be updated
> when their update support is in place. Rename the firmware parsing
> function to ili210x_firmware_to_buffer as well.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>
> ---
>  drivers/input/touchscreen/ili210x.c | 39 ++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 867c13d3cb17..a6b647100250 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -49,6 +49,7 @@ struct ili2xxx_chip {
>  				 unsigned int *x, unsigned int *y,
>  				 unsigned int *z);
>  	bool (*continue_polling)(const u8 *data, bool touch);
> +	char *firmware_filename;
>  	unsigned int max_touches;
>  	unsigned int resolution;
>  	bool has_calibrate_reg;
> @@ -288,6 +289,7 @@ static const struct ili2xxx_chip ili251x_chip = {
>  	.get_touch_data		= ili251x_read_touch_data,
>  	.parse_touch_data	= ili251x_touchdata_to_coords,
>  	.continue_polling	= ili251x_check_continue_polling,
> +	.firmware_filename	= ILI251X_FW_FILENAME,
>  	.max_touches		= 10,
>  	.has_calibrate_reg	= true,
>  	.has_firmware_proto	= true,
> @@ -557,15 +559,25 @@ static ssize_t ili210x_calibrate(struct device *dev,
>  }
>  static DEVICE_ATTR(calibrate, S_IWUSR, NULL, ili210x_calibrate);
>  
> -static int ili251x_firmware_to_buffer(const struct firmware *fw,
> +static int ili210x_firmware_to_buffer(struct device *dev,
>  				      u8 **buf, u16 *ac_end, u16 *df_end)
>  {
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
>  	const struct ihex_binrec *rec;
>  	u32 fw_addr, fw_last_addr = 0;
> +	const struct firmware *fw;
>  	u16 fw_len;
>  	u8 *fw_buf;
>  	int error;
>  
> +	error = request_ihex_firmware(&fw, priv->chip->firmware_filename, dev);
> +	if (error) {
> +		dev_err(dev, "Failed to request firmware %s, error=%d\n",
> +			priv->chip->firmware_filename, error);
> +		return error;
> +	}
> +
>  	/*
>  	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
>  	 * simple -- allocate a 64 kiB buffer, iterate over the ihex blob records
> @@ -573,8 +585,10 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
>  	 * do all operations on this linear buffer.
>  	 */
>  	fw_buf = kzalloc(SZ_64K, GFP_KERNEL);
> -	if (!fw_buf)
> -		return -ENOMEM;
> +	if (!fw_buf) {
> +		error = -ENOMEM;
> +		goto err_mem;
> +	}
>  
>  	rec = (const struct ihex_binrec *)fw->data;
>  	while (rec) {
> @@ -599,10 +613,13 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
>  	/* DF end address is the last address in the firmware blob */
>  	*df_end = fw_addr + fw_len;
>  	*buf = fw_buf;
> +	release_firmware(fw);
>  	return 0;
>  
>  err_big:
>  	kfree(fw_buf);
> +err_mem:
> +	release_firmware(fw);

So with that we are essentially back to the original version where we
have to release firmware in both branches. If we keep loading firmware
in this function, maybe we could do:

	...
out:
	if (retval)
		kfree(fw_buf);
	release_firmware(fw);
	return retval;

?

>  	return error;
>  }
>  
> @@ -759,22 +776,13 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
>  					     const char *buf, size_t count)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> -	const char *fwname = ILI251X_FW_FILENAME;
> -	const struct firmware *fw;
> +	struct ili210x *priv = i2c_get_clientdata(client);
>  	u16 ac_end, df_end;
>  	u8 *fwbuf;
>  	int error;
>  	int i;
>  
> -	error = request_ihex_firmware(&fw, fwname, dev);
> -	if (error) {
> -		dev_err(dev, "Failed to request firmware %s, error=%d\n",
> -			fwname, error);
> -		return error;
> -	}
> -
> -	error = ili251x_firmware_to_buffer(fw, &fwbuf, &ac_end, &df_end);
> -	release_firmware(fw);

You do not like releasing firmware before checking if we could parse it
successfully?

> +	error = ili210x_firmware_to_buffer(dev, &fwbuf, &ac_end, &df_end);
>  	if (error)
>  		return error;
>  

Thanks.

-- 
Dmitry
