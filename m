Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891F02555F6
	for <lists+linux-input@lfdr.de>; Fri, 28 Aug 2020 10:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgH1IIZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Aug 2020 04:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727911AbgH1IIS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Aug 2020 04:08:18 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43879C061264;
        Fri, 28 Aug 2020 01:08:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f26so311532ljc.8;
        Fri, 28 Aug 2020 01:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g96tIDvgXJwPKOOA7+dvNjyN4dZbplzDaIkRNTr7fA8=;
        b=OIyLwi3Vr5KWpQPEDlhBsXpg/0S4rnyQymPOqu1yKAIwoMPbUTHVXdAMh+1nVxeqw+
         +RXtkoQIUQWC+DpfY+fW4qXGBgOfXzpjrJBQ7mZTtsK9+i7uPSYwwFDafP+zgFt6BkH4
         AHSV2gmRA55eQ6IPxvdYIWrkB4dVDk0dY6OqRRifGMNsd0gXZk5MyMgVxL7/jHa9Be0A
         ZsAq0kTkAk3NDfQOFaG2E7cbKz2+pGobSGLJCEQleR8L6AQQ4NyYArQh/XfvkLd9EwOE
         7euZli3irUtQnZ3yaWVy0UVHWWdFs/lQ2YilW0VaFnAp7yRJQC9d+c+g9hCkCTKnDJ41
         n8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g96tIDvgXJwPKOOA7+dvNjyN4dZbplzDaIkRNTr7fA8=;
        b=F0WBz9mWx7y+yloysECzd/IvZ4TAvvmAktEpOhjsm4+cdJADtYaWX2nApWRU4SxjIG
         YqCSQMm8clt0FzF7/xUdMrMvwUFFNw+oqfl7huVV7b3dlPegvufxZWfndvCK/wV3Bqy4
         g0i4VILL3qt4YP54z9Kfu1GDRQtL5ugCaDkbPmaUJFTQMyHa6L+MazVcaDQRKZ3MlwAM
         XH4FykBA0QJNg5sBh6wJckoGh/28z0hAXp586ADNFp6hEGbNp6WaLJK2PlPJTHJ2jOqs
         3STmhW9HzhMs8+m+CSY+AFC0f4ATduWsbHejZUewFsrtQkjlwKH+XhtmepFnVIXGIZIJ
         deKQ==
X-Gm-Message-State: AOAM532QJXnt0yOICzDX/Bl0HrIJnOnZpSPGZa9Uh35jYq1462Ku94uo
        DOO9fY/1UcT2sfXOAFIjV/k=
X-Google-Smtp-Source: ABdhPJyu8QkdtOQ5d0gDqWk3Z8P06H3SGbpZ1bKzRyPqQwAQ2k0JdyGShskPUlc7V9A+tZXc+qDtEw==
X-Received: by 2002:a2e:b0db:: with SMTP id g27mr339392ljl.69.1598602095628;
        Fri, 28 Aug 2020 01:08:15 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id a4sm124716lfr.2.2020.08.28.01.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 01:08:15 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] Input: atmel_mxt_ts - allow specification of
 firmware file name
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200821075410.8250-1-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <081a63b6-b34e-1e52-50ac-b44255c8ed40@gmail.com>
Date:   Fri, 28 Aug 2020 11:08:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821075410.8250-1-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

21.08.2020 10:54, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> On platforms which have multiple device instances using this driver, the
> firmware may be different on each device. This patch makes the user give
> the name of the firmware file when flashing.
> 
> If user specified firmware file can't be found, then driver will try to
> flash default firmware "maxtouch.fw".
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Benson Leung <bleung@chromium.org>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit 76ebb7cee971cb42dfb0a3a9224403b8b09abcf1)
> [gdavis: Forward port and fix conflicts.]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> [jiada: change to flash default firmware file, when user specified firmware can't be found]
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 33 +++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index a2189739e30f..a20bc1bf8d52 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -34,6 +34,7 @@
>  #define MXT_FW_NAME		"maxtouch.fw"
>  #define MXT_CFG_NAME		"maxtouch.cfg"
>  #define MXT_CFG_MAGIC		"OBP_RAW V1"
> +#define MAX_FILENAME_SIZE	64
>  
>  /* Registers */
>  #define MXT_OBJECT_START	0x07
> @@ -308,6 +309,7 @@ struct mxt_data {
>  	struct t7_config t7_cfg;
>  	struct mxt_dbg dbg;
>  	struct gpio_desc *reset_gpio;
> +	char fw_name[MAX_FILENAME_SIZE];
>  
>  	/* Cached parameters from object table */
>  	u16 T5_address;
> @@ -2887,6 +2889,26 @@ static int mxt_load_fw(struct device *dev, const char *fn)
>  	return ret;
>  }
>  
> +static int mxt_update_file_name(struct device *dev, char *file_name,
> +				const char *buf, size_t count)
> +{
> +	size_t len = count;
> +
> +	/* Echo into the sysfs entry may append newline at the end of buf */
> +	if (buf[count - 1] == '\n')
> +		len = count - 1;
> +
> +	/* Simple sanity check */
> +	if (len > MAX_FILENAME_SIZE - 1) {
> +		dev_warn(dev, "File name too long\n");
> +		return -EINVAL;
> +	}
> +
> +	strscpy(file_name, buf, len + 1);
> +
> +	return 0;
> +}
> +
>  static ssize_t mxt_update_fw_store(struct device *dev,
>  					struct device_attribute *attr,
>  					const char *buf, size_t count)
> @@ -2894,7 +2916,16 @@ static ssize_t mxt_update_fw_store(struct device *dev,
>  	struct mxt_data *data = dev_get_drvdata(dev);
>  	int error;
>  
> -	error = mxt_load_fw(dev, MXT_FW_NAME);
> +	error = mxt_update_file_name(dev, data->fw_name, buf, count);
> +	if (error)
> +		return error;
> +
> +	error = mxt_load_fw(dev, data->fw_name);
> +	if (error) {
> +		dev_warn(dev, "try %s instead\n", MXT_FW_NAME);

Hello, Jiada!

Will this message be printed even if fw_name is an empty string or
whatever string that is already used by existing userspace for writing
to update_fw?

Maybe it actually should be better to add a new device attribute that
will take the fw_name? Then the old attribute will continue to work like
it worked before.

> +		error = mxt_load_fw(dev, MXT_FW_NAME);
> +	}
> +
>  	if (error) {
>  		dev_err(dev, "The firmware update failed(%d)\n", error);
>  		count = error;
> 

