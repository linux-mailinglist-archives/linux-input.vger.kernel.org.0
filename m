Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9AF2C7B0C
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 20:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgK2TuC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Nov 2020 14:50:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgK2TuB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Nov 2020 14:50:01 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8793C0613CF;
        Sun, 29 Nov 2020 11:49:21 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id l17so8714581pgk.1;
        Sun, 29 Nov 2020 11:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I3KveSvae9r2Mljk9CE74sucWwHOgjMQdiykVHcGb+k=;
        b=k/NQNLrvCzRF3uUQg5uQrZgJnVjM97Ze/YdIkrWztTigS5yalzaOVfgfpOv7kmAAgi
         CTouRapTJWY2yuKr5v2Sb1JEofdCgQCflJM7yQ0ogudoTqIU08Oumb8/TT4Yv9tS2UTz
         lemJfrc/dM+5seBxS4b7Bm4BRJXAxNhs90QU1mLFAeg/enkuY/pRdkw375iNyPXZbvIP
         WL8faAUbwUC5wvOJwnq1PDjX0vAk9GU+HWyB5EzgoqoQce6KMl0IE2TB9kfH+QRcTB4k
         TMacG9ZCTKSPM6PsI0dz6vwcOMfkOyevshiZx7yfG3f+qQ6c7I3xzpAAuSkUo8pc7xaj
         jjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I3KveSvae9r2Mljk9CE74sucWwHOgjMQdiykVHcGb+k=;
        b=DfG62ppNYS3jQkHllzodqqJnAL28ZQvsASfHTXZBD5vn93Ly6cjRbbdL13oT0V8L9+
         4kVd/6mrVsM257RQx5GIMI2LAIeLSXCFLXCMdnd6RLhzjqOCvUB1p8cr+yG7Jsinzhtr
         HEbNFMVXT0HMQ2n1/d1EOZO1LlWGQDahs1+yH0l+/SSIaE/8CS1OZImS/ti3RR7AC5XA
         zR/MuzzA5xszduuG3B1amoX9lzcrtmAsvn69AsQHY4o0/IWvwq8I2NJ3uyShPkYdaN82
         a+vlJ+nNpZkcNJF0XO2id1mZUQdPf+M3PPve69jER+nH+QEtTEGe/7fiWjJBomIyVmpx
         C1yg==
X-Gm-Message-State: AOAM5311m1LyvCi4WDslrTSMtHM9/3jf1uO7psVha8yu42HELgAAYP1P
        ssVjemcDLnwigZpR5F//jQIxuLBHNzM=
X-Google-Smtp-Source: ABdhPJz8E9vT9STIVYy33P5qD/nWgPymc0zVaWRM+vWOhQUGYMdkS78S+GcMGrfqwZYJET2oXQl9hA==
X-Received: by 2002:a17:90a:5d0e:: with SMTP id s14mr22547724pji.53.1606679361234;
        Sun, 29 Nov 2020 11:49:21 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a2sm14360876pfo.117.2020.11.29.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 11:49:20 -0800 (PST)
Date:   Sun, 29 Nov 2020 11:49:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     rydberg@euromail.se, tj@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: Fix a ref counting issue
Message-ID: <20201129194918.GL2034289@dtor-ws>
References: <20201129084516.1456099-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201129084516.1456099-1-christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Christophe,

On Sun, Nov 29, 2020 at 09:45:16AM +0100, Christophe JAILLET wrote:
> In case of a managed resource, 'devm_input_device_release()' already has a
> 'input_put_device(dev)' call.
> 
> Avoid a double reference decrement by explicitly calling
> 'input_put_device()' only on non-managed input device.

This patch is incorrect, as devres_destroy() that is used in
input_free_device(), unlike devres_releasde(), does not actually call
the "release" function. It simply destroys the devres object, but does
not clear associated resources.

> 
> Fixes: 2be975c6d920 ("Input: introduce managed input devices (add devres support)")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is completely speculative and compile tested only.
> ---
>  drivers/input/input.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 3cfd2c18eebd..c09c9f020667 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -1920,7 +1920,8 @@ void input_free_device(struct input_dev *dev)
>  						devm_input_device_release,
>  						devm_input_device_match,
>  						dev));
> -		input_put_device(dev);
> +		else
> +			input_put_device(dev);
>  	}
>  }
>  EXPORT_SYMBOL(input_free_device);
> -- 
> 2.27.0
> 

Thanks.

-- 
Dmitry
