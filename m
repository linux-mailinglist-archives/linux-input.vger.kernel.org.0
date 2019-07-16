Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED8B6AC3C
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 17:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387781AbfGPPwt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 11:52:49 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55500 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfGPPws (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 11:52:48 -0400
Received: by mail-wm1-f65.google.com with SMTP id a15so19170006wmj.5;
        Tue, 16 Jul 2019 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QZlXIYch//vjsQS5IhxArL7mBgEBULuqsYOVzCul4YQ=;
        b=MMenY9J1ysV9zeyoY7fmHEWxKUgVUIP9S1SDxUuL99M1Gu7B3DyxRGC4BDFLm2OPqh
         XnitNO5zCT4YGt3nCOk4geb5WbERmpzckizcwsFbQ5TVMWYQ4nWD3tTlNjOD4OdDqz95
         xTNBpMhYQjVrHSI86ZS/NGB6BNm/1KvKKfrksCiMQ9SSjVPnkLcicD6wLdc1zfoYKJ3b
         A0XhdPBwjDBQehCwZW7GoA7whBYI0cj/RuDo2QGwlwCwI7wqYZxtPpAad0MZLtVMCNdZ
         C7TlRQhdwLC7do17AOdZHCiTofD11vARY7mOMvd2ElyAyVmIw65Ut+1t3OeZkL7HLJ2Y
         Lraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QZlXIYch//vjsQS5IhxArL7mBgEBULuqsYOVzCul4YQ=;
        b=EtKe55ZWR2sjfrViKfqd/QnVFeKfSTt2SLwp7EGAReyznrsw4ILrijWzR9yK+BpNfh
         urKL54ML44RLlE/BdLrCbKYJgetOPyZWUiJeLRYmTYgwKOiwhq0dVqB89MjOlXONy1BW
         nW9Joh+UAY6mf9MIXXPY1wNH5xb0FcllBwEJjGbOSMJIOLK67lubWu4zHcI036ZpEPmP
         b5nFxLW4etu/U8BYbYFUQA1q/jQhPzuPzSnq/H3E7+xHbgHAnHffbP5wdxXrP3Mt61Dp
         sv/mYiLBz9VPGfqbkKSqze7//u4dKQBWkYiJglUqeo3JdDFcVwaJbIAWsSRefTiafFqv
         /PNQ==
X-Gm-Message-State: APjAAAVfS6P4jK3oAwAXlxG1h7nz0v4eumhG2djdMILa2u/lEApZpX+v
        lAvT2WRq8idhV8TSSf5Zh3Q=
X-Google-Smtp-Source: APXvYqz8TQNkJU4OCFeEtOXMbiP0H9wTNLX33hKfJjGDRodNcdGB2pirJtv7K7oKGPBb/ZVLPzmN1A==
X-Received: by 2002:a1c:9dc5:: with SMTP id g188mr32043583wme.93.1563292365488;
        Tue, 16 Jul 2019 08:52:45 -0700 (PDT)
Received: from localhost (smbhubinfra01.hotspot.hub-one.net. [213.174.99.146])
        by smtp.gmail.com with ESMTPSA id w24sm17520636wmc.30.2019.07.16.08.52.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:52:44 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:30:44 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mukesh Ojha <mojha@codeaurora.org>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] Input: fsl-imx25-tcq: Use
 devm_platform_ioremap_resource()
Message-ID: <20190716073044.GA1182@penguin>
References: <1554362243-2888-1-git-send-email-mojha@codeaurora.org>
 <1554362243-2888-2-git-send-email-mojha@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554362243-2888-2-git-send-email-mojha@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 04, 2019 at 12:47:19PM +0530, Mukesh Ojha wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> Signed-off-by: Mukesh Ojha <mojha@codeaurora.org>

Applied, thank you.

> ---
>  drivers/input/touchscreen/fsl-imx25-tcq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
> index 1d6c8f4..b66df8a 100644
> --- a/drivers/input/touchscreen/fsl-imx25-tcq.c
> +++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
> @@ -503,7 +503,6 @@ static int mx25_tcq_probe(struct platform_device *pdev)
>  	struct input_dev *idev;
>  	struct mx25_tcq_priv *priv;
>  	struct mx25_tsadc *tsadc = dev_get_drvdata(dev->parent);
> -	struct resource *res;
>  	void __iomem *mem;
>  	int error;
>  
> @@ -512,8 +511,7 @@ static int mx25_tcq_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	priv->dev = dev;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mem = devm_ioremap_resource(dev, res);
> +	mem = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mem))
>  		return PTR_ERR(mem);
>  
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
> Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
> 

-- 
Dmitry
