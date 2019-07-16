Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8B566AC40
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 17:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388052AbfGPPwx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 11:52:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55009 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfGPPww (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 11:52:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so19164625wme.4;
        Tue, 16 Jul 2019 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KgPq1Y45u0p9wed/Wg/waGFNH5L702AbMVBrL7KzcPU=;
        b=Z7pkK765Zn3xjefuZ7pgTeYENNCYSMAabAPWwLZ/dn37kHH8LdN1OWDYihTkW+ru6k
         HpENNSGabWoO6W2Isat6nBUFhRjRuDcwHzJkX0L88Mz2KgtqbP5XPvLl/k3TR7KknLF2
         Nv1dPrIagf4X4a8YNMOaemtqa13XR80tQhgb+xIZBXPnB3ZEjcsuHPC6J7UvgHNGxd40
         WYTPi60YS+EHrhAO1Vg6kt8zL22dLpAlOF9ZczoB+BuZ/ZNn5x9i7vL3OS00ipCsGwPZ
         1HMxJbxxhaxZEmb0jpUZCFEe5OwJXo67R4yN0vyw2QWUjskd/bbjRNnJpyNfPHH+4m3p
         v6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KgPq1Y45u0p9wed/Wg/waGFNH5L702AbMVBrL7KzcPU=;
        b=FHFX6gU+p3aTrXxPO7Iej92NA00ktH4HmXKte3VAlO/LOm6y43KBj8LXRVk0KT+64K
         5xDfeiFje4jwA8moaeacQq0GVKhgpirwOPycu3XS2C110zWFguAylyQN+LU8/k42XxfD
         W5ZwHDVLmhAOUHhcLhHfUtPXOGDaSCXqE6rORKSGIYlbxS2YEsTtlUUy/zzHmO6VCcGA
         4xQdS7bkvxms0Bqh4yddhGdAEA4zw8Z2joPDmySkrz6e8DNcCgBdH0Gt5qGip4nO7D7b
         uOj41mvz/eqAAX+Fa+LochmC+Ky8lXGn6j8+csCpgUUybPNRP6SNScEmUldmXHyIXNOY
         +UrA==
X-Gm-Message-State: APjAAAVh9xqyKS3ZVIx6up+YLEgPqOXielsMPorfbu6CtdLat/CGLgI1
        Wad6BQ8IesMeSyjlR7mAsJw=
X-Google-Smtp-Source: APXvYqz32CNFi7crLTkjdi8KT0WaPTxeo9ZQ5iiJbrq/kL+Cd9Ro6t0aItj9Mx+0+2J4kgCuDhGIzA==
X-Received: by 2002:a1c:5f55:: with SMTP id t82mr30891336wmb.111.1563292370333;
        Tue, 16 Jul 2019 08:52:50 -0700 (PDT)
Received: from localhost (smbhubinfra01.hotspot.hub-one.net. [213.174.99.146])
        by smtp.gmail.com with ESMTPSA id y12sm18114094wrm.79.2019.07.16.08.52.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:52:49 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:34:54 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mukesh Ojha <mojha@codeaurora.org>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] Input: ts4800-ts: Use
 devm_platform_ioremap_resource()
Message-ID: <20190716073454.GD1182@penguin>
References: <1554362243-2888-1-git-send-email-mojha@codeaurora.org>
 <1554362243-2888-6-git-send-email-mojha@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554362243-2888-6-git-send-email-mojha@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 04, 2019 at 12:47:23PM +0530, Mukesh Ojha wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> Signed-off-by: Mukesh Ojha <mojha@codeaurora.org>

Applied, thank you.

> ---
>  drivers/input/touchscreen/ts4800-ts.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ts4800-ts.c b/drivers/input/touchscreen/ts4800-ts.c
> index fed73ee..5b4f536 100644
> --- a/drivers/input/touchscreen/ts4800-ts.c
> +++ b/drivers/input/touchscreen/ts4800-ts.c
> @@ -148,7 +148,6 @@ static int ts4800_ts_probe(struct platform_device *pdev)
>  {
>  	struct input_polled_dev *poll_dev;
>  	struct ts4800_ts *ts;
> -	struct resource *res;
>  	int error;
>  
>  	ts = devm_kzalloc(&pdev->dev, sizeof(*ts), GFP_KERNEL);
> @@ -159,8 +158,7 @@ static int ts4800_ts_probe(struct platform_device *pdev)
>  	if (error)
>  		return error;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ts->base = devm_ioremap_resource(&pdev->dev, res);
> +	ts->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ts->base))
>  		return PTR_ERR(ts->base);
>  
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
> Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
> 

-- 
Dmitry
