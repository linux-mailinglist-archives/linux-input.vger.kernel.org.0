Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D293D16011A
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgBOXaP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:30:15 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37413 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOXaP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:30:15 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so6912848pfn.4;
        Sat, 15 Feb 2020 15:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1sKOMRPObfR2xQm2scpkMxZpLRKv7uX2cnDzDTR91ng=;
        b=jQlOHMK80wziZ3tdSv5Ms+X4D8GXqgxSVp918tdGJaHOK+M+AlyL4NRat7PwbqV81E
         4BjuApgTtg9BWwCuaGQ/ygO+aPR1sTyhIMe65rI9pAiA/AOPoPyizNvd3Ej+5600bz3r
         IrKemH/w7UD/GFQMtOGuez+FUBB1M5GkcUkg0U0iOM6TBb93NAnjNMi59Pa5hxOLVmSk
         aeLLhAZn/KWy8TJyO9vj+pFpZJmjDTWPvwnmrfbj1k1BvG1ElYlbyFQujkrJ2XtIdm3D
         HruWzHP1e0mRuYMMrk0hgoIPziVmBABSQv27ldbAaWBKcHTwd9o2sFVK7B/FSaJJcLv2
         z1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1sKOMRPObfR2xQm2scpkMxZpLRKv7uX2cnDzDTR91ng=;
        b=BuhCqmvdX+lPeuh3n2xcOg5pXBi90oYSj0bsfi0oP0efEamoKeXmI1UAG1u/vawWM8
         Kdf9fOf92Kaqh2xgSQY1DM/voQ7vxdWcPa79ZjqZkSDhrzAlLX/AmdLmH+1T2FTeWTIY
         xrLs9bXUYXNT20cpucAx6MwOAN8Ub0VbZ+SCmELozjYPWr8gXGVxExk7E2mwRbshFJ9S
         IN4PoARheF+NDMDsK1Q8JyTBSuHWErijlEJbgdh6KnqCt7JB5paNfuiL7BwUCktKLJ0j
         KEIPBn3P0cuWJG9Ebl6cVAB3sg8QRXO6JzI2MwDtPpzY62hecqANUCgDDS+3mTLdcfmE
         T3EQ==
X-Gm-Message-State: APjAAAWqGxJuiBR+a8c9Yp9P+vvMwfbY6IGHZ9RHNq1U8qWUya+ddLOw
        2hDW02JtnuvIGdlRvbS4YHDmP5f9
X-Google-Smtp-Source: APXvYqyg8EzkdxwXN8nBGQAl0mtxZwyhctz+eg87xkgmqHqmyDd+Y0UalfT5CI9M3Vx41tMDmhBjVA==
X-Received: by 2002:a62:fc93:: with SMTP id e141mr9777593pfh.262.1581809414805;
        Sat, 15 Feb 2020 15:30:14 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f9sm11553299pfd.141.2020.02.15.15.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:30:14 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:30:12 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gpio_keys_polled - replace zero-length array with
 flexible-array member
Message-ID: <20200215233012.GF183709@dtor-ws>
References: <20200214171907.GA26588@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214171907.GA26588@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 14, 2020 at 11:19:07AM -0600, Gustavo A. R. Silva wrote:
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
>  drivers/input/keyboard/gpio_keys_polled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index 6eb0a2f3f9de..c3937d2fc744 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -38,7 +38,7 @@ struct gpio_keys_polled_dev {
>  	const struct gpio_keys_platform_data *pdata;
>  	unsigned long rel_axis_seen[BITS_TO_LONGS(REL_CNT)];
>  	unsigned long abs_axis_seen[BITS_TO_LONGS(ABS_CNT)];
> -	struct gpio_keys_button_data data[0];
> +	struct gpio_keys_button_data data[];
>  };
>  
>  static void gpio_keys_button_event(struct input_dev *input,
> -- 
> 2.25.0
> 

-- 
Dmitry
