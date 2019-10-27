Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04E09E64C9
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2019 19:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfJ0SPp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Oct 2019 14:15:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36194 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbfJ0SPo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Oct 2019 14:15:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id 23so4944003pgk.3
        for <linux-input@vger.kernel.org>; Sun, 27 Oct 2019 11:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WWdOnyu0XWMvrgObzprV2jQRW+mK3wb38+x6OX9tOUU=;
        b=mcAAIdIS0FijAt6egYqXtEoMEuYQQzE1blwhcpWdc4ptcudDx4orU7JQs6yssROEbC
         TAIwRzkycBBVrRJPIb5qPkhgvJ8j+nvGq6xMELFyMs5V7BwGjiZCwFDcP5C2HpD7DfWW
         zBV4R/EHHyKDWO7LuSUj8hbO69AIntQ8mCS4IexKInPzRQCT1U96GM0/mxMeGNn3qi4V
         5URaAnqnEgZzjPhinIAI5AaH2NbZGMSyX0IlUVymFyOtiS206ZzZMYWub4L9xScSWber
         CAoVonathJmjYwdDuw7vKXT86ncffAK9LXodT/r7TWm4yWPZ/dtD5+dTc0fn/QvvgwWU
         XOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WWdOnyu0XWMvrgObzprV2jQRW+mK3wb38+x6OX9tOUU=;
        b=ACVOkqPtj0viFLypyEFOMvNRlxzQh3B33ZEQWBMEa5g0MOBhNxabxayr1E3C46Cj/2
         ruSVBBnLyt3t63fZb8f7/xow/uVYQVQ9iSx+omXS6gkwcEMHl0VY015QtRF2Lb+FTGwF
         dyP0sQFzMXF+h+YdGRJJCO1lIhznN9Bx53r6Ch1sfEeTZkjmXqjKDc8exAsEkn+zVjUv
         m9Jxjk39MBxHxgf2bgdi9jgP/2Feub+xhqcE0YEy+I6s2XMbVB3tfyLKU6bB20R8Nt7S
         VGFiMRvym1wVBAZizwcYn+/x8ELVe8cbUmtvOtI4BKgJuljDx3cW33vzl0zIRPRSeNWq
         kspg==
X-Gm-Message-State: APjAAAVtNLPzMUbkYwqV5vdHHrY4ILQLz3jLBkSMte4xXnSX5dUIElWr
        KJIr+mz5DFYL9+mnXGjLzCQ=
X-Google-Smtp-Source: APXvYqwpGAHcX8eeGIu62DhJjYRBQDDzaxjosFyGH5lmKkBDBZc847+fhwgbniWO3/4ma27Canr0AA==
X-Received: by 2002:a62:8705:: with SMTP id i5mr166356pfe.238.1572200143813;
        Sun, 27 Oct 2019 11:15:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x139sm8888131pgx.92.2019.10.27.11.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 11:15:42 -0700 (PDT)
Date:   Sun, 27 Oct 2019 11:15:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: colibri-vf50-ts - remove unneeded gpio.h
 header file
Message-ID: <20191027181540.GD163068@dtor-ws>
References: <20191026185958.24158-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191026185958.24158-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 26, 2019 at 03:59:56PM -0300, Fabio Estevam wrote:
> The touchscreen device is a GPIO consumer, not a GPIO controller,
> so there is no need to include <linux/gpio.h>.
> 
> Remove the unneeded header file.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/colibri-vf50-ts.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/colibri-vf50-ts.c b/drivers/input/touchscreen/colibri-vf50-ts.c
> index 0e40897949bb..aa829725ded7 100644
> --- a/drivers/input/touchscreen/colibri-vf50-ts.c
> +++ b/drivers/input/touchscreen/colibri-vf50-ts.c
> @@ -9,7 +9,6 @@
>  
>  #include <linux/delay.h>
>  #include <linux/err.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/iio/consumer.h>
>  #include <linux/iio/types.h>
> -- 
> 2.17.1
> 

-- 
Dmitry
