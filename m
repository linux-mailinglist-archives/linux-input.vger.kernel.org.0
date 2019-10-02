Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A43C9337
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 23:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJBVBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 17:01:50 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45590 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727624AbfJBVBu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 17:01:50 -0400
Received: by mail-pf1-f194.google.com with SMTP id y72so193012pfb.12;
        Wed, 02 Oct 2019 14:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wPxUiLxqx9+4peiu0BBWY6pSDLUDy+GTCl1RzOj1ZZo=;
        b=U1/KsG22qOJ4+IRwS5htVha7QQEaWsluczAFItvOckXH5f3ozJMP7kaFaJdDvRWyvX
         q7BTCO5ge7m9usR+gKtapGhtxErHe0eMClix5U8K9yxz5XNwK8l6TahoKT+Y0rXlfVYa
         5aQjB5JYbT8tZa7zmLza0lIxIy2nWli6zVC8zd7v1TJU85UIx3gs8aTiYo7yi4dq95ks
         w6RRutoz2o6LvvRwQOmkvq+GUOEazZJ0ccwSw4EMAHV/8Lx5zcQ9bZcWJ/NmwLO5wZcT
         FEXqEJ0Gzn/qW/tT7NoQ8tPdik2jZpP23CRF9ePbmKBfdA9tPtwYYDaRvqA4RPZJYhAK
         EKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wPxUiLxqx9+4peiu0BBWY6pSDLUDy+GTCl1RzOj1ZZo=;
        b=lqXNHNsbRGTFioxDfYp2oK+bKpWYybHm+TcscjuTCRPFGzyL6GD39Jg3n225iSuhUD
         fnpGVPkQ0eHRNR9z3Wm5pKv9C8OvazF39Xs/unObH+TP1VKq+16IMtY5X1TRQ4b/kMF2
         dPE0c8+J1H9uMCiAcYDUKKSfaISFxEeKHl+GrGctD1zrgiNZFNvdnCanSG8GrlxUCsBK
         5bXffB9UBtgagLfFtaGv2dY3ev+GBmHw6QgPVOpY+s6c2g8QbbOTW0jZu9QFBJC7ULFh
         Ninkanj/Rbej+8imZq0nkgwk7hHCaI0Q+36aLOd6R4bmlWKBteMnE+2WwUhN1a25PpYi
         SeEQ==
X-Gm-Message-State: APjAAAVceuFWc+Nh4YYrTbf22G81mB8lWrCZeWng4kchwvyRgVt1gpMk
        GAFB6j4XSLhg2a2YRMSNxmU9wxUs
X-Google-Smtp-Source: APXvYqypiudUsINOKThW87CtWZLzcukmEGd5izzB1J6u9vHaYwqkpTrNL8nbTdYCefPbA0APN9d6pw==
X-Received: by 2002:a17:90a:2e06:: with SMTP id q6mr6400222pjd.139.1570050109303;
        Wed, 02 Oct 2019 14:01:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g5sm271211pgd.82.2019.10.02.14.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 14:01:48 -0700 (PDT)
Date:   Wed, 2 Oct 2019 14:01:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Evan Green <evgreen@chromium.org>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Jongpil Jung <jongpil19.jung@samsung.com>,
        Furquan Shaikh <furquan@chromium.org>,
        Rajat Jain <rajatja@chromium.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3] Input: atmel_mxt_ts - Disable IRQ across suspend
Message-ID: <20191002210146.GB20549@dtor-ws>
References: <20191001181504.207486-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001181504.207486-1-evgreen@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 01, 2019 at 11:15:03AM -0700, Evan Green wrote:
> Across suspend and resume, we are seeing error messages like the following:
> 
> atmel_mxt_ts i2c-PRP0001:00: __mxt_read_reg: i2c transfer failed (-121)
> atmel_mxt_ts i2c-PRP0001:00: Failed to read T44 and T5 (-121)
> 
> This occurs because the driver leaves its IRQ enabled. Upon resume, there
> is an IRQ pending, but the interrupt is serviced before both the driver and
> the underlying I2C bus have been resumed. This causes EREMOTEIO errors.
> 
> Disable the IRQ in suspend, and re-enable it on resume. If there are cases
> where the driver enters suspend with interrupts disabled, that's a bug we
> should fix separately.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>

Applied, thank you.

> ---
> 
> Changes in v3:
>  - Move enable_irq to the beginning of resume (Dmitry)
> 
> Changes in v2:
>  - Enable and disable unconditionally (Dmitry)
> 
>  drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 24c4b691b1c9..1627fcb27f35 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -3155,6 +3155,7 @@ static int __maybe_unused mxt_suspend(struct device *dev)
>  		mxt_stop(data);
>  
>  	mutex_unlock(&input_dev->mutex);
> +	disable_irq(data->irq);
>  
>  	return 0;
>  }
> @@ -3168,6 +3169,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
>  	if (!input_dev)
>  		return 0;
>  
> +	enable_irq(data->irq);
>  	mutex_lock(&input_dev->mutex);
>  
>  	if (input_dev->users)
> -- 
> 2.21.0
> 

-- 
Dmitry
