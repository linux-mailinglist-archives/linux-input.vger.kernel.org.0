Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F752FC64E
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 02:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbhATBPT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 20:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730172AbhATBPK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 20:15:10 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72110C0613D6
        for <linux-input@vger.kernel.org>; Tue, 19 Jan 2021 17:14:08 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id y12so1101699pji.1
        for <linux-input@vger.kernel.org>; Tue, 19 Jan 2021 17:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=acY9ZLeBwuJ5n85Gq8inXcRYo3lIoo/fRx+0Q27Seo8=;
        b=RyzLRdvuJLqh1+s1HZJinjMLA9Y/6g5Ymi2PM8s738Zqnjm/SsXgvpJfEqqtuuSwb/
         7Mevs12bIaFoGiW6VkNh9U17kN3jMwLCTEYx0nSbGr99tK7UBPRldAgAxJMmniM9Sj76
         QwKut9SiUh1PrfOBS3Zkt8sbievZTB0C47cI7JYml+2BwnHx0nVT14C/mf0hcwfkr0k9
         AUcgtcY/4U02vUjBbbOl1WAI0YEDOc/WVZrcS7Yop7WghMUj/78GdV/LjHHfuw+8dYIe
         HC7f+9Nz94x3vdIikZ3CUH1F4/EA8OM4YErluNdUJmVj8WEU94sM4E27WdEwO+BinDaE
         dtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=acY9ZLeBwuJ5n85Gq8inXcRYo3lIoo/fRx+0Q27Seo8=;
        b=ZsHG5emjA+XAdfzZHWFy7vF4kyN6HKZOUfXAAG5BVdTLXdqK0fct2Ul+nGs559TTxP
         DrPrc+YoNMXlWdb+zolFFISQmgXIClyfcpe3PZN/Masy6tPOO26DTWiw3kbZJDSM0sUt
         NJhran4pRs88jh8pav3g2Bfb5qcHL1vozfaNfLbkxWNHTGripqnMBGKUYN66m3j5nQ8U
         MBkibUtZa8DMV5PqlsAW78uzeqMNgnuScWvQ7jRWpLPfYcMUysbOeRzA1/FnJ2sK/V5e
         VaL7nNnB2JAv7mdBaTjCOUzjgUYtz98D/gGOCMRlJtkuJTYZOMELj0ZH+WUkv+4xtqNK
         7n0w==
X-Gm-Message-State: AOAM531bkqypSmMGimjsAUFW0iCiciSrsEIDHh3NiadxNO1pko6A0+7f
        Wkc6dcPleiz59gx0Ar/9GzI=
X-Google-Smtp-Source: ABdhPJw0cDDKGjm7xLkgPPoyJZyZmhlUvV0LUKNF/d+8AyWVaFKAftiGBpQxnMtTbCOpe57Op90zaw==
X-Received: by 2002:a17:902:8306:b029:da:d7f0:9e16 with SMTP id bd6-20020a1709028306b02900dad7f09e16mr7332033plb.53.1611105247930;
        Tue, 19 Jan 2021 17:14:07 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m11sm163508pjz.44.2021.01.19.17.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:14:06 -0800 (PST)
Date:   Tue, 19 Jan 2021 17:14:04 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     jzp0409 <jzp0409@163.com>
Cc:     linux-input@vger.kernel.org, jiangzhipeng <jiangzhipeng@yulong.com>
Subject: Re: [PATCH] Input: ft5x06 - of_device_id using CONFIG_OF
Message-ID: <YAeD3LyTyR4T7Qxz@google.com>
References: <20210120005301.2158-1-jzp0409@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120005301.2158-1-jzp0409@163.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 20, 2021 at 08:53:01AM +0800, jzp0409 wrote:
> From: jiangzhipeng <jiangzhipeng@yulong.com>
> 
> ft5x06 use of_device_id,Use CONFIG_OF include

This will not compile with !C0NFIG_OF.

> 
> Signed-off-by: jiangzhipeng <jiangzhipeng@yulong.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 2eefbc2..c69fde0 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1371,6 +1371,7 @@ static SIMPLE_DEV_PM_OPS(edt_ft5x06_ts_pm_ops,
>  };
>  MODULE_DEVICE_TABLE(i2c, edt_ft5x06_ts_id);
>  
> +#ifdef CONFIG_OF
>  static const struct of_device_id edt_ft5x06_of_match[] = {
>  	{ .compatible = "edt,edt-ft5206", .data = &edt_ft5x06_data },
>  	{ .compatible = "edt,edt-ft5306", .data = &edt_ft5x06_data },
> @@ -1382,6 +1383,7 @@ static SIMPLE_DEV_PM_OPS(edt_ft5x06_ts_pm_ops,
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, edt_ft5x06_of_match);
> +#endif
>  
>  static struct i2c_driver edt_ft5x06_ts_driver = {
>  	.driver = {
> -- 
> 1.9.1
> 
> 

Thanks.

-- 
Dmitry
