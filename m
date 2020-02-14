Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01D1A15CF46
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 01:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgBNA50 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 19:57:26 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35984 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727604AbgBNA50 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 19:57:26 -0500
Received: by mail-pf1-f194.google.com with SMTP id 185so3979937pfv.3;
        Thu, 13 Feb 2020 16:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JAqZbTX+OtdulbheUXuHYFQl0hEVGoo3ACHp8Q/hPeA=;
        b=uGe7Fcdjkg3zIei0ClxKotI4LDVzol4kfxdS+WPLa3mBouL0JNlAw6FHxndygGTX9h
         doRAdWFHr/37SmQPyiy/X8INnYl8pguaAYioEE2lqkjy9Tqf9G0F7itZ8BlcKmAiJ18U
         y+PloCGn9A3taQf2Cdn6f8uavQIfXHIDFj0E9JDuqR0wqa3REmsLCkygu9r7jaX5vHpp
         d/6MekCESUEGOBwCQVs8rwWPcA4NLUfW1N7sXefXgU8g/2QB8GaLizzCvmn68giP6hVa
         7Gpq+4TLtE7O/RYO8+uWzRzFdxMdExcfJMXR8Fp7lq9nOahVDyyR2s6dTXyMV4oNZ0KD
         oGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JAqZbTX+OtdulbheUXuHYFQl0hEVGoo3ACHp8Q/hPeA=;
        b=tjz4cQ+VclSHLvuMU/C/WxIoHKu1uCnNved/MA8erH7Vf0ccvLFbHlKGt+V3wI69Sn
         C2OePJtdeSb/+ryxpT8QKP1ZtMB6qlqnL2FLP8l6NkcHa0A7pCaujN1QT8wUr173Y5aR
         4M7joqPZx9sP/7OhGLkJ64CUgjPzBBXDuAvjbjfOrYv7WKO8/elxHE84MCPkiq28dwr3
         49weDbOpQhuAup5rYSxrBtmyoPXG6LGYFTVOwUWBS076X7pnXDMNtfYUqdbf6ZExMWv2
         egirNspgPHcpHG8URhU9waKvhdJ/KQmBxoNqpv4ewybItIYvuaeCyLix72DvhtKddF4v
         MR3g==
X-Gm-Message-State: APjAAAXgjG8RsPHF6c4D89JQ2AxWrLEkkFM3E8T5rH+HtDtxTNjn6AWo
        O3d83WlXY22NLW/b1esZ6Qw=
X-Google-Smtp-Source: APXvYqxAiCZZ5WoG8ltU5w+vYRkIsIdMawV63Zsidu+ITKvOpMplQF3KpLbpRbJtpJiuObE2RETLJA==
X-Received: by 2002:a62:17c3:: with SMTP id 186mr644924pfx.158.1581641845610;
        Thu, 13 Feb 2020 16:57:25 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x143sm4628732pgx.54.2020.02.13.16.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 16:57:25 -0800 (PST)
Date:   Thu, 13 Feb 2020 16:57:23 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gpio_keys - replace zero-length array with
 flexible-array member
Message-ID: <20200214005723.GB183709@dtor-ws>
References: <20200213002600.GA31916@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213002600.GA31916@embeddedor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 12, 2020 at 06:26:00PM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/gpio_keys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index 1f56d53454b2..53c9ff338dea 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -55,7 +55,7 @@ struct gpio_keys_drvdata {
>  	struct input_dev *input;
>  	struct mutex disable_lock;
>  	unsigned short *keymap;
> -	struct gpio_button_data data[0];
> +	struct gpio_button_data data[];
>  };
>  
>  /*
> -- 
> 2.23.0
> 

-- 
Dmitry
