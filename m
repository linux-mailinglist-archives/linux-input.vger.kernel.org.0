Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83AD0345689
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 04:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhCWD6J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 23:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhCWD5y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 23:57:54 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C14C061574
        for <linux-input@vger.kernel.org>; Mon, 22 Mar 2021 20:57:53 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so503936pjb.0
        for <linux-input@vger.kernel.org>; Mon, 22 Mar 2021 20:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eb0Uqdcis5DrAHEO0wyEVBDrZQnml4qU5kXKL+LDEE8=;
        b=YrfMAqsuFvqtBK73nqFFdINzlDvzJPDv2QZrjTjo58moCwZ6gyOhn7crfFyCVps7wm
         Gfg1nCK9SABcDDsTB3EtUQwqaMzNw3UPW1+UIvn7gLedLJi3kqrdIb78AVOHgo01xyHG
         UfreHKDE1Q0Sb6RqQMrlPxLxAyuHBOK7piI04Q65p8Mmvfj7M9k09LmQqFSuXm2K7RRG
         oL9SpA75NtaulKIcxKW6Bm6N4xIFdSjF2yGYIcGtdDsksxCmPnuAFSBWlSzuqwdXQI5A
         xIFwocg2n1w2RvNhFwue4EpyjvGYK9obsKYssYl3/oTy8+mFIs+/bVT9+JwoRdpHC0/1
         nVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eb0Uqdcis5DrAHEO0wyEVBDrZQnml4qU5kXKL+LDEE8=;
        b=LOgiAIiTMeSu1U38ntyne29g86VlLPJ0SFOCd6w6GdgN+DineNNCKLn3YxKebpkIf2
         if7nVz/oCz2njcDseNK0a7NYFSJE3rj0zcJIvrew8UHQ9xrt7ViQdGV8ZZIPT185pNEm
         BvrvlskE/NEiuPG8kzX2pYrRsZeSU6Ysb18/9qWJlJ+D778vAxcnQXmGhehsAG78nQ+w
         0CdN6a/54STR3Ss4T52ZSu3Loj3Fi1sw8C3JG7GTDx+v26ctC3OesmDnpwfi9qUWvFcK
         JjlW6TLbwrEFISLtFianextlf+Fu8SdEtqcL8W8MH4SLFkrGKV85fTmnygJIOeE3cCn9
         cNIQ==
X-Gm-Message-State: AOAM530jcmXdhRBsFbaueXEEBSyKpsfA2RP0iQjpsyrX+BdIhDxWXLtx
        A8cGf7QvTWL/QPsAXfzFuTM=
X-Google-Smtp-Source: ABdhPJzOnXVZwQo24TdlFoleKHlP6u6ZGnr4CzdwshHRaz0jYr6sxPNtZlEslqjN+wt7K9y65xdXtQ==
X-Received: by 2002:a17:90a:bf0a:: with SMTP id c10mr2293140pjs.195.1616471873401;
        Mon, 22 Mar 2021 20:57:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:499f:7361:582b:fd05])
        by smtp.gmail.com with ESMTPSA id z1sm15037740pfn.127.2021.03.22.20.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 20:57:52 -0700 (PDT)
Date:   Mon, 22 Mar 2021 20:57:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>, linux-input@vger.kernel.org,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH] Input: cyttsp - Verbose error on soft reset
Message-ID: <YFlnPv3m4qfSsU/a@google.com>
References: <20210322221349.1116666-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322221349.1116666-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Mon, Mar 22, 2021 at 11:13:49PM +0100, Linus Walleij wrote:
> The first thing the Cypress driver does when starting
> up is to try a soft reset. This is the first point where
> the driver SPI/I2C communication can fail, so put out some
> nice debug text:
> 
>   cyttsp-spi spi2.0: failed to send soft reset
> 
> Instead of just:
> 
>   cyttsp-spi: probe of spi2.0 failed with error -5
> 
> This is more helpful.
> 
> Cc: Ferruh Yigit <fery@cypress.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/input/touchscreen/cyttsp_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
> index 73c854f35f33..b9772192b5ea 100644
> --- a/drivers/input/touchscreen/cyttsp_core.c
> +++ b/drivers/input/touchscreen/cyttsp_core.c
> @@ -248,12 +248,16 @@ static int cyttsp_soft_reset(struct cyttsp *ts)
>  	enable_irq(ts->irq);
>  
>  	retval = ttsp_send_command(ts, CY_SOFT_RESET_MODE);
> -	if (retval)
> +	if (retval) {
> +		dev_err(ts->dev, "failed to send soft reset\n");
>  		goto out;
> +	}
>  
>  	timeout = wait_for_completion_timeout(&ts->bl_ready,
>  			msecs_to_jiffies(CY_DELAY_DFLT * CY_DELAY_MAX));
>  	retval = timeout ? 0 : -EIO;
> +	if (retval)
> +		dev_err(ts->dev, "timeout waiting for soft reset\n");

I think if we have conditional for the error message then having ternary
above does not make sense. I changed this to:

	if (!wait_for_completion_timeout(&ts->bl_ready,
			msecs_to_jiffies(CY_DELAY_DFLT * CY_DELAY_MAX))) {
		dev_err(ts->dev, "timeout waiting for soft reset\n");
		retval = -EIO;
	}

Thanks.

-- 
Dmitry
