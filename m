Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F052D4E9C
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 00:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729735AbgLIXQj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 18:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729348AbgLIXQj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 18:16:39 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EB0C0613D6
        for <linux-input@vger.kernel.org>; Wed,  9 Dec 2020 15:15:59 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id v29so2348548pgk.12
        for <linux-input@vger.kernel.org>; Wed, 09 Dec 2020 15:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eqFleX3gRcFJOMKkR8Te+Mf6aGTWR0Qq4djNYtrRvKM=;
        b=SR3VBOLze9+8W363k8zVEXuSJIS0nO/5JE1Mmozf8d/1VNL+8cSIXSG0F+lEaVOq73
         axwOQaufPCRymchAYOX89r16v/i6RmMho9SM1oa94N9xo5ZfVU2KQ6fQT/ACCMXPK4kY
         T4O6IpJCe74p6DyS1D0VPg7MJutvqtHkNHLWiM9UCEvIfLDX59PdpVQu6zWfzP6b6/sX
         ogENPhz5Pz3vgC7bE870pv55CRsmVVqkyz91G21HUDtl+BH1+L9hj/bmAZp7d0JE10WB
         Ve72qpknd199mAEDhhoa0UkuX2JhanC8vKBL1PXYTE7BWywRjrGHPg1Cj/faC8/t4/QO
         D6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eqFleX3gRcFJOMKkR8Te+Mf6aGTWR0Qq4djNYtrRvKM=;
        b=suMbRnwI7aivvdn2dvyAUcavdldxkZ+wugoggJZjoi0nr8puuGydpjoKq41+ANKLEb
         xKx7q+KHOlimWuhj3NNZ70w5SqtO7eTlwqujxI9vlXzNI3SR1o6CiwgwYHyzuagQPRt/
         +MajPmyyeUf3DPZ/u1vG0zGLMOojR8IIMsRlnvA+Y90vYhsiqQNUJzXiNZr2wGeUsVLZ
         P5fd39AcdlPFGA/g22I+4gOZ3xWnM0AF40AN1xuX0/Jby9R/uVfUEOBa+gbEHGTiyLmk
         SDUQPtLLyTNAsVSkTgjOhmTwbpykwsPmTQMdY/jUT0w7HIWlIZru7P23TUE7d0iu2yLQ
         iUSg==
X-Gm-Message-State: AOAM533q0UxfR0TaEXaYRO+d1xAii3UOyhYE9P1BiVLcgrj6nmDBIuxU
        2MHkF4VTSz9mDhoaTGHPMpYBuebeZb0=
X-Google-Smtp-Source: ABdhPJyQ/0vIGcPfhmCVPPF+pMvc6jgEsZYPQFE3E5X0+NnVZoD1uX1EMfjk3rq/saGD6tEvFJBPew==
X-Received: by 2002:a17:90a:1bc7:: with SMTP id r7mr4476892pjr.33.1607555758856;
        Wed, 09 Dec 2020 15:15:58 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id y27sm3658373pfr.78.2020.12.09.15.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 15:15:57 -0800 (PST)
Date:   Wed, 9 Dec 2020 15:15:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: edt-ft5x06 - use U16_MAX instead of -1
Message-ID: <X9Faq5tbK4rjCul1@google.com>
References: <20201026174126.19449-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026174126.19449-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andy,

On Mon, Oct 26, 2020 at 07:41:26PM +0200, Andy Shevchenko wrote:
> Explicitly show what the value we supply for the touchscreen resolution
> when it can't be detected. -1 is hard to compare with when unsigned short
> type is in use. The change will help to avoid signed vs. unsigned error
> prone comparisons.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: rebased on top of v5.10-rc1
>  drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 6ff81d48da86..34e9cb9c0691 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -23,6 +23,7 @@
>  #include <linux/input/touchscreen.h>
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
> +#include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/ratelimit.h>
>  #include <linux/regulator/consumer.h>
> @@ -1005,8 +1006,8 @@ edt_ft5x06_ts_get_parameters(struct edt_ft5x06_ts_data *tsdata)
>  		tsdata->num_y = edt_ft5x06_register_read(tsdata,
>  							 reg_addr->reg_num_y);
>  	} else {
> -		tsdata->num_x = -1;
> -		tsdata->num_y = -1;
> +		tsdata->num_x = U16_MAX;
> +		tsdata->num_y = U16_MAX;

Here we do not really do any comparisons, and using -1 to set to
maximum unsigned number is a common pattern...

However I just CCed you on a patch that removes special handling for
number of electrodes on select firmwares, so this patch will no longer
be relevant.

Thanks.

-- 
Dmitry
