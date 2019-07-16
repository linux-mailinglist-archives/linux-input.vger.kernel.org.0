Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB5D76AC3D
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 17:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388006AbfGPPwv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 11:52:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37803 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387419AbfGPPwt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 11:52:49 -0400
Received: by mail-wm1-f66.google.com with SMTP id f17so19206036wme.2;
        Tue, 16 Jul 2019 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JHEJAcHpxpqB/5WwCVp7qv0sj+5JXZzrvNuF6df3GOM=;
        b=ryj1mNYfTGZoWWwcTcXw/EOHE4YvwjuhI8m8R3lIwQPFl3Xkn2yivg9ZDbpwWTVgco
         oKO5nPBPttR30M0505XzZygey9PRJ5IVnbW3ajsZnzZvi/Rz055QaWaE0X1h+iVtj3Nm
         H1JO2fj7rE39WJNMyVOLELFTofA8DRCaVSgjyz3ssxx+Spev0nJa1nPdKNAAR+5lGOuX
         kiuH0Y3HaxxfLzvJ1uBjSuCm3LFaCR4DlaVw5PqRHkQwCRXpAPbqraCjub9/I0DutHV4
         CYcpIWj3wxV9eFmnXBgKsz401uR3M/H5MA4E84tJCMM3LhYJAn+/gBmLrtlYZrtVeCKP
         CUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JHEJAcHpxpqB/5WwCVp7qv0sj+5JXZzrvNuF6df3GOM=;
        b=VHtvrPktXCxeYNTXl5+hyT94+uWG6IdvLMj0yZhbYjPptADfJrlUQqcYXoW9rXuwvL
         uQKL3wT2mkP3lxKc65Zn6nWB5ZQKjn7RqhbndqG1DpFjECGEMLZ95iL+t3Avj/jONTup
         39Eu0rg4kC6bdj+LlpsZUbGYWKt6R/IYxqw+I52rFyHeWmqI59UTexYhBZh3lNnyUk/l
         MqCTrv85obsIvIKVtv1UZD67gODPkVryXdIY5vY239VWQzP+KyN4WxaNCdW3qKL/NJs8
         vQtQZVtywtCpAr1mejBAabtS69CSa6e1APJHwooPwBbPut6Cr3Cbxr5lswwVdC5OAdiU
         scdg==
X-Gm-Message-State: APjAAAWxCRgaQpbdg/KjxeNJkrTqGudVCGFsYmW/eqr6rpcaJdPkqNcq
        sdzhSoBO/u3l6L6RY8xHkG8=
X-Google-Smtp-Source: APXvYqyErcXiLrrh4SRjL3HTBO2DkdGSpCuxmTLN02YykIsCihI8eV96X3gn+bCTQy26xG6LJJAuqg==
X-Received: by 2002:a05:600c:20d:: with SMTP id 13mr31417888wmi.141.1563292367161;
        Tue, 16 Jul 2019 08:52:47 -0700 (PDT)
Received: from localhost (smbhubinfra01.hotspot.hub-one.net. [213.174.99.146])
        by smtp.gmail.com with ESMTPSA id o20sm48698020wrh.8.2019.07.16.08.52.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:52:46 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:32:13 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mukesh Ojha <mojha@codeaurora.org>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] Input: mxs-lradc-ts.c: Use
 devm_platform_ioremap_resource()
Message-ID: <20190716073213.GB1182@penguin>
References: <1554362243-2888-1-git-send-email-mojha@codeaurora.org>
 <1554362243-2888-3-git-send-email-mojha@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554362243-2888-3-git-send-email-mojha@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 04, 2019 at 12:47:20PM +0530, Mukesh Ojha wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> Signed-off-by: Mukesh Ojha <mojha@codeaurora.org>
> ---
>  drivers/input/touchscreen/mxs-lradc-ts.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/mxs-lradc-ts.c b/drivers/input/touchscreen/mxs-lradc-ts.c
> index c850b51..af047fa 100644
> --- a/drivers/input/touchscreen/mxs-lradc-ts.c
> +++ b/drivers/input/touchscreen/mxs-lradc-ts.c
> @@ -615,7 +615,6 @@ static int mxs_lradc_ts_probe(struct platform_device *pdev)
>  	struct device_node *node = dev->parent->of_node;
>  	struct mxs_lradc *lradc = dev_get_drvdata(dev->parent);
>  	struct mxs_lradc_ts *ts;
> -	struct resource *iores;
>  	int ret, irq, virq, i;
>  	u32 ts_wires = 0, adapt;
>  
> @@ -629,10 +628,7 @@ static int mxs_lradc_ts_probe(struct platform_device *pdev)
>  	ts->dev = dev;
>  	spin_lock_init(&ts->lock);
>  
> -	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!iores)
> -		return -EINVAL;
> -	ts->base = devm_ioremap(dev, iores->start, resource_size(iores));
> +	ts->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (!ts->base)
>  		return -ENOMEM;

This driver did not implement error handling properly (should have used
IS_ERR()/PTR_ERR()), I adjusted and applied.

Thanks.

-- 
Dmitry
