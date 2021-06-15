Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3EF3A86F1
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 18:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhFOQ5t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 12:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFOQ5t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 12:57:49 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BA7C061574;
        Tue, 15 Jun 2021 09:55:44 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g24so2837pji.4;
        Tue, 15 Jun 2021 09:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6cywzrtxF0WoS/TsTMjJVX6mN6n2DyrDVFTqSDjlabI=;
        b=RsGRtTv7lk16CJn72Vtd/rg3VR6kcIy3bg1xWznNey3sK1oHA+TO28eHK8Xjy8rXBK
         vqMv3f1uNIH69dOvSyWpsNOjDYsyxcDUmkmW4+21QbyzhD4fAVdP3nBI8f16RS/9NSMc
         oGDcJGfjSMu7rbpKrTb+GUe5WZh1DO+3aMVst5dma3EQkWvH2xW1h2T7a9tiGmJRTx/A
         Ibk2ivGAE6/X9PMzfPu+e+ay+dgTZ+gHOCpAYyLkXHjeQ5YdRWjdQb7Ab/DxUeuyHGxC
         yjRdB9KV+PQmXzKpWd7L+x6m012PflvfJgb6t7DjWpS8dlkQD1ppUmNYcOZ7C6zHtQUe
         LdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6cywzrtxF0WoS/TsTMjJVX6mN6n2DyrDVFTqSDjlabI=;
        b=dHmobvTDe/7NORQBzriOa99q+N+w8cYQJ0qQ16iYEhf2LajTaY0Ks8y1aaHAtG9Tma
         SS6ES0fmJ2AO3hrqEcYe24odfNGmIu5ucvuHnqllBeJ114O2FqGjZlmSkZU6GlXMxJ7L
         CidQziJ1ED55H+mxloVl9AaR1RFVuHx7utymt/Qkpe9QBfZ8OsEL8TNKVFVBPZqiukCL
         /mveZT6H8GSdb3+lnHdmJb+/VMh9nzr+ulnqkHUNgJjVYiTO9SjxY0v5jK9z25UYGX1u
         P+nRSJ1vy7f9rXLM2sIbsz4tr0jv4WAUI+nCPOB+P7hOkdPAORfWZsFQQgcVb9GrDbek
         l61g==
X-Gm-Message-State: AOAM531HEFwuJAVhP4Bq6g+oy30eoemyWzKuaqZFMhdTyoa3aZiVyGT5
        x6tVz4B4L4NduKCEFO2HqiVfBLax8Hg=
X-Google-Smtp-Source: ABdhPJxYBdu1stVVzBtq3ZF/NpgCCqC2WRzTqVIYhz6Su4DYWxEgSsfWZfetgssnpPZqihRmLnHQUw==
X-Received: by 2002:a17:90a:de16:: with SMTP id m22mr5747131pjv.60.1623776143758;
        Tue, 15 Jun 2021 09:55:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2a26:15ba:dc71:c4ba])
        by smtp.gmail.com with ESMTPSA id s13sm16318287pjm.34.2021.06.15.09.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:55:42 -0700 (PDT)
Date:   Tue, 15 Jun 2021 09:55:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v6 3/9] Input: wacom_i2c - Add device tree support to
 wacom_i2c
Message-ID: <YMjbi2sz/y0RFG3z@google.com>
References: <20210615103014.798-1-alistair@alistair23.me>
 <20210615103014.798-4-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615103014.798-4-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 15, 2021 at 08:30:08PM +1000, Alistair Francis wrote:
> Allow the wacom-i2c device to be exposed via device tree.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 22826c387da5..6053595f2b30 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <asm/unaligned.h>
>  
>  #define WACOM_CMD_QUERY0	0x04
> @@ -241,10 +242,17 @@ static const struct i2c_device_id wacom_i2c_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
>  
> +static const struct of_device_id wacom_i2c_of_match_table[] = {
> +	{ .compatible = "wacom,i2c-30" },

What is this compatible?

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
> +
>  static struct i2c_driver wacom_i2c_driver = {
>  	.driver	= {
>  		.name	= "wacom_i2c",
>  		.pm	= &wacom_i2c_pm,
> +		.of_match_table = wacom_i2c_of_match_table,
>  	},
>  
>  	.probe		= wacom_i2c_probe,
> -- 
> 2.31.1
> 

-- 
Dmitry
