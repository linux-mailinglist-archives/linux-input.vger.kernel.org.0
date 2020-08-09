Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0392B23FFF1
	for <lists+linux-input@lfdr.de>; Sun,  9 Aug 2020 22:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgHIULU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Aug 2020 16:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgHIULT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Aug 2020 16:11:19 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3CBC061756;
        Sun,  9 Aug 2020 13:11:19 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h19so7371113ljg.13;
        Sun, 09 Aug 2020 13:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qdk2RBcRV1AcLrtgQBGgSeMKBvtdSYjO6UI780gQr+w=;
        b=AAAEv1KOWusJ2rNlPGig+v0GdI8PRyDWXlkfaSLvJ1RPKgQtlHCl7FIYXgzqwmyta8
         Egbm3kYi8GbJcm7ZVMry3S1INt64hjASDbhDd2LRnJEK4jWwBPusmrusdfvNWzUxIY6s
         UuY48kya9wsv4te86eZc/Oeqmzbi+mP8JCO7reRobtMKZ3sNMPlglOLmZ6ZLFWLj1nJ3
         z8LB/VtDPtQ9GtVkOXZlRxZYzSXNBHjzizj/KLCNwA9L7ec9E39jzYEB08WAyJmgO6ez
         GIyw4fVGIlmNK4MyoXjpy9WF8yK/r4eIfo29JNiAL4VW0HAzOxGq/AuUOIyLdzkgdYvF
         r9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qdk2RBcRV1AcLrtgQBGgSeMKBvtdSYjO6UI780gQr+w=;
        b=gJl/nD/yI+y1QH4pfCpo4albtzU1vrp0cU4oKReNQdQ2TBu+RxsUEA8Djo4QSNT8Hd
         m6XpPq8jSgQ52ZKvLkj5yDX4wdXs+1kTXT9hqPPXMcKk0x2Adyt4S8/Wt7gkndQah9pf
         qwoBNJZCpU1Y/Xw6IRc2dUDVrR03N5MgOXYfGFcZ1lA+pIKLvxRpLnFBtR6qx6dhGZWq
         XB1dxOF2G6ptHUg0RZSm40URS+fYfNaH4LGZVo8K/BWfcCvtvQy8MUUtcXlUgBRAXOI4
         +N7FfRBuLRqPJibtox3bVN+1zLGCVbkxxrG8Szlw7718ku0kgBpv698j1k5ER9ybPan3
         TXHA==
X-Gm-Message-State: AOAM533kFNfqbDLg5396qoh9TELY1/+9VSHTPWYa6ZhD0MMx4qrLyjhJ
        4Fta32w6UnvgjvWM+S0HXQs=
X-Google-Smtp-Source: ABdhPJybImQmxU+VCQfBpswnANI58xc5V4jCtffX6NDNng0/VTF8Tf5MqD1sKz5cljSbi76v9MWfpw==
X-Received: by 2002:a05:651c:3cc:: with SMTP id f12mr9836366ljp.335.1597003877497;
        Sun, 09 Aug 2020 13:11:17 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id t27sm8157962ljd.101.2020.08.09.13.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2020 13:11:16 -0700 (PDT)
Subject: Re: [PATCH 1/1] Input: atmel_mxt_ts - allow specification of firmware
 file name
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200731075714.10608-1-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e5da9e03-8156-39f6-c78b-0226c95690c6@gmail.com>
Date:   Sun, 9 Aug 2020 23:11:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731075714.10608-1-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

31.07.2020 10:57, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> On platforms which have multiple device instances using this driver, the
> firmware may be different on each device. This patch makes the user give
> the name of the firmware file when flashing.
> 
> This also prevents accidental triggering of the firmware load process.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Benson Leung <bleung@chromium.org>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit 76ebb7cee971cb42dfb0a3a9224403b8b09abcf1)
> [gdavis: Forward port and fix conflicts.]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 42 ++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index a2189739e30f..024dee7a3571 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -30,8 +30,6 @@
>  #include <media/videobuf2-v4l2.h>
>  #include <media/videobuf2-vmalloc.h>
>  
> -/* Firmware files */
> -#define MXT_FW_NAME		"maxtouch.fw"
>  #define MXT_CFG_NAME		"maxtouch.cfg"
>  #define MXT_CFG_MAGIC		"OBP_RAW V1"
>  
> @@ -308,6 +306,7 @@ struct mxt_data {
>  	struct t7_config t7_cfg;
>  	struct mxt_dbg dbg;
>  	struct gpio_desc *reset_gpio;
> +	char *fw_name;

Hello, Jiada!

Have you decided to abandon the patch which allowed to specify firmware
name in a device tree?

>  	/* Cached parameters from object table */
>  	u16 T5_address;
> @@ -2766,7 +2765,7 @@ static int mxt_check_firmware_format(struct device *dev,
>  	return -EINVAL;
>  }
>  
> -static int mxt_load_fw(struct device *dev, const char *fn)
> +static int mxt_load_fw(struct device *dev)
>  {
>  	struct mxt_data *data = dev_get_drvdata(dev);
>  	const struct firmware *fw = NULL;
> @@ -2776,9 +2775,9 @@ static int mxt_load_fw(struct device *dev, const char *fn)
>  	unsigned int frame = 0;
>  	int ret;
>  
> -	ret = request_firmware(&fw, fn, dev);
> +	ret = request_firmware(&fw, data->fw_name, dev);
>  	if (ret) {
> -		dev_err(dev, "Unable to open firmware %s\n", fn);
> +		dev_err(dev, "Unable to open firmware %s\n", data->fw_name);
>  		return ret;
>  	}
>  
> @@ -2887,6 +2886,33 @@ static int mxt_load_fw(struct device *dev, const char *fn)
>  	return ret;
>  }
>  
> +static int mxt_update_file_name(struct device *dev, char **file_name,
> +				const char *buf, size_t count)
> +{
> +	char *file_name_tmp;
> +
> +	/* Simple sanity check */
> +	if (count > 64) {
> +		dev_warn(dev, "File name too long\n");
> +		return -EINVAL;
> +	}
> +
> +	file_name_tmp = krealloc(*file_name, count + 1, GFP_KERNEL);
> +	if (!file_name_tmp)
> +		return -ENOMEM;

The allocated string is never release, this is not good.

Wouldn't it be nicer to make data->fw_name a fixed-size string?

> +	*file_name = file_name_tmp;
> +	memcpy(*file_name, buf, count);
> +
> +	/* Echo into the sysfs entry may append newline at the end of buf */
> +	if (buf[count - 1] == '\n')
> +		(*file_name)[count - 1] = '\0';
> +	else
> +		(*file_name)[count] = '\0';

What about to use strscpy?

> +	return 0;
> +}
> +
>  static ssize_t mxt_update_fw_store(struct device *dev,
>  					struct device_attribute *attr,
>  					const char *buf, size_t count)
> @@ -2894,7 +2920,11 @@ static ssize_t mxt_update_fw_store(struct device *dev,
>  	struct mxt_data *data = dev_get_drvdata(dev);
>  	int error;
>  
> -	error = mxt_load_fw(dev, MXT_FW_NAME);
> +	error = mxt_update_file_name(dev, &data->fw_name, buf, count);
> +	if (error)
> +		return error;

This change breaks old behavior, I'm not sure that it's acceptable. The
default name should remain to be "maxtouch.fw", IMO.

> +	error = mxt_load_fw(dev);
>  	if (error) {
>  		dev_err(dev, "The firmware update failed(%d)\n", error);
>  		count = error;
> 

