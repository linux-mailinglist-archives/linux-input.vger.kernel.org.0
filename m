Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5528416011C
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2020 00:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgBOXaW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Feb 2020 18:30:22 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45383 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOXaW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Feb 2020 18:30:22 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so6893905pfg.12;
        Sat, 15 Feb 2020 15:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=91pCYAHi6fo9tzkGPZKqMgAVSr+r1d8/AdSiKc1bZTE=;
        b=Uz82U+SjZGYAPMTCpN189+sckEJlK3UsaNFy2SW6zj68Gl5UASjo/3ttEGxZbRuOG9
         RYwzE3PaD8ansUFvZmx6LfIVEojLjcd/bdr5LUjINs0nZQYuzxKtWiNRovou2XKCfMER
         5HXYSxhJlXk1IqRhmj+2GzuQ2+Jkb4XjnFWldpGMvP4iTuF2uITKzKNadEYa7rtb82hI
         yR9sZrNBM6no6sjjLbjWppvXdZltQlcURGCu4hafgfp9UNKn36sVbwqz335sq7u9TIrT
         kQfG+5TalmUwn+FF6sdKWKlSLJY1NzaOwGpuJ223DemuI6ol9wfMD7MvOM9n2xohHpsA
         S6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=91pCYAHi6fo9tzkGPZKqMgAVSr+r1d8/AdSiKc1bZTE=;
        b=VNCBfB8SOWBCTi4HUg8mx4KcszzUAM5PDESYbaPS4NcdvAg82Yl5vU+AkHqdolheu6
         6C17qCFES6SnrCmabK8Rr9WowvmOPQYpYIPCAW1Gk50wetrBEaoxOy1uDIuAbd1PqP24
         x+kB37AbGsgktIXWgZ418ZoohtwvbngFT4Hawm1nISbZNMnYzyiZp+YO5CPRCykfs+sc
         USEFsDd+D2erD668aj8MkfwDZblB001/QywZ0qazgRNxkHb3ODJUxslOO31madUtl9pB
         EjjCbGFNXt7jvdcckfyRG/WCH5Llw7iA9qrb46F/KN8KoW4lQ0YgkPGIqdTx8Eo38Zid
         e7Qg==
X-Gm-Message-State: APjAAAXWWL9zwMUKZ7/wNs/X8Uh8FskMm/0HlVWFXzdB/bk0cLp6uNzU
        M6FJRR0M49dQin5iE3JwXtw=
X-Google-Smtp-Source: APXvYqwia53Js2u+nacU3OromeC/Zr9fRkBv7q0jQo3XZJXJN05RqLfFh7Y8sQSmCMG9Q7AnqIweeg==
X-Received: by 2002:a63:ec0c:: with SMTP id j12mr10260811pgh.78.1581809421668;
        Sat, 15 Feb 2020 15:30:21 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u12sm11192837pfm.165.2020.02.15.15.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 15:30:21 -0800 (PST)
Date:   Sat, 15 Feb 2020 15:30:19 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: tca6416-keypad - replace zero-length array with
 flexible-array member
Message-ID: <20200215233019.GG183709@dtor-ws>
References: <20200214172022.GA27490@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214172022.GA27490@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 14, 2020 at 11:20:22AM -0600, Gustavo A. R. Silva wrote:
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
>  drivers/input/keyboard/tca6416-keypad.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
> index 2a14769de637..21758767ccf0 100644
> --- a/drivers/input/keyboard/tca6416-keypad.c
> +++ b/drivers/input/keyboard/tca6416-keypad.c
> @@ -33,7 +33,7 @@ MODULE_DEVICE_TABLE(i2c, tca6416_id);
>  
>  struct tca6416_drv_data {
>  	struct input_dev *input;
> -	struct tca6416_button data[0];
> +	struct tca6416_button data[];
>  };
>  
>  struct tca6416_keypad_chip {
> @@ -48,7 +48,7 @@ struct tca6416_keypad_chip {
>  	int irqnum;
>  	u16 pinmask;
>  	bool use_polling;
> -	struct tca6416_button buttons[0];
> +	struct tca6416_button buttons[];
>  };
>  
>  static int tca6416_write_reg(struct tca6416_keypad_chip *chip, int reg, u16 val)
> -- 
> 2.25.0
> 

-- 
Dmitry
