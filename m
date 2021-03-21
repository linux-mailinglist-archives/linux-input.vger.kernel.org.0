Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D86B343482
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 21:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhCUUGs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 16:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhCUUGr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 16:06:47 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E648BC061574;
        Sun, 21 Mar 2021 13:06:46 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v2so7269357pgk.11;
        Sun, 21 Mar 2021 13:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bgLat3QwQPXE22lSgKapuRMIQv3ZeL5g0dF3mAIdnRI=;
        b=B3XcgUclaLkzK0LXQgNpeszR5pjA+s085zycj2x3gYErQiomnzZiV86UNgSUzJnvex
         G6N//i5pVQrHFunuIpMQ7brqR3Ba9lD7fgA2cxoYNkOEgkjMSXDIZPskK1K+63/6qaei
         dL2DnGxHuh/LhJS3FprNqfTCQ2eZhPyf1SaqhuI2kRcv7JO9A0LNTfx6VsjU5RGPQXlO
         1EmwxrtvxlJxUnFQV3pRd4reD00SWD9vN3h69oVepSLuRfiRBZJxJlLKG1zSBNSAt5rM
         nu2hwzdWnfoH3oZsSm/jdPb01I6f37lvXmWhHF5PweFnjeuOxG8Oqi77QLzE6uO29BQE
         cPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bgLat3QwQPXE22lSgKapuRMIQv3ZeL5g0dF3mAIdnRI=;
        b=EcECZYPz4jlQKSLOKxgcC+30OzVHr84vE5tVZU7u2J/eJhNYCDE0W/7cfR6Rda2H4O
         G/vLil8ABEfN/1bW+rEZJnPL0d00sN38r8mmHg8nTZ8p/5xn1SeipHK+FqLFh929jpkt
         8PSWr7mwG8TyNCi6FYMg5u5dW2L/2GpGVnHaBsN+O5K32pMKzoNMuGPqM4JCtJh8geP6
         eibYse+VKeq6QgWwlT+qH3MCmXbE8IDGysVqWmZC5gvC5nOsGco0dFVwBE7PAXHoByfF
         vRfrYdI7vMuhFnflfNfmAuB6guTOD8D+KzegOhr31uTJlV8igUZRSmzJUzjjpfKRtxgo
         Rm7g==
X-Gm-Message-State: AOAM533Ecm8sdTKEndOsOXjeYwI8F4Cmr/JP/yfH4MaDRXenJ8TYx2qF
        ay9P3xpafCmK6VFnfE6AB88=
X-Google-Smtp-Source: ABdhPJyiqF0vl+26lOXTpiSDJc8I+xyFBKSSI5l9FEpRhfFDwUqlfc5OJ/G+jNBOB0G8UjUcbWi6cQ==
X-Received: by 2002:a63:2507:: with SMTP id l7mr3633544pgl.198.1616357206297;
        Sun, 21 Mar 2021 13:06:46 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id fh19sm11246900pjb.33.2021.03.21.13.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 13:06:44 -0700 (PDT)
Date:   Sun, 21 Mar 2021 13:06:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v3 3/9] Input: wacom_i2c - Add device tree support to
 wacom_i2c
Message-ID: <YFenUUP5RDRaAzvP@google.com>
References: <20210321141049.148-1-alistair@alistair23.me>
 <20210321141049.148-4-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210321141049.148-4-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Sun, Mar 21, 2021 at 10:10:43AM -0400, Alistair Francis wrote:
> Allow the wacom-i2c device to be exposed via device tree.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 1afc6bde2891..fc0bf583d33b 100644
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
> @@ -262,10 +263,17 @@ static const struct i2c_device_id wacom_i2c_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
>  
> +static const struct of_device_id wacom_i2c_of_match_table[] __maybe_unused = {
> +	{ .compatible = "wacom,generic" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, wacom_i2c_of_match_table);
> +
>  static struct i2c_driver wacom_i2c_driver = {
>  	.driver	= {
>  		.name	= "wacom_i2c",
>  		.pm	= &wacom_i2c_pm,
> +		.of_match_table = of_match_ptr(wacom_i2c_of_match_table),

You need to either guard wacom_i2c_of_match_table by #ifdef CONFIG_OF or
drop of_match_ptr() and assign directly as otherwise you will get
"unused variable" warning.

Thanks.

-- 
Dmitry
