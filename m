Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD8024765
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 07:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfEUFND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 01:13:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41491 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfEUFNC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 01:13:02 -0400
Received: by mail-pg1-f194.google.com with SMTP id z3so7931140pgp.8;
        Mon, 20 May 2019 22:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KAB9o9XbO2dEKEPGZm81AqLjqGSvYkvcgsj2QybWv7g=;
        b=Qxs4+yxX0aU1YO8P4wah4CVDUe6g4GlvnquXlHWXovOugNiUrwiu2zJ9Fmu3e25/hK
         5jEOLc/bSkDsO8cce3GwOKXUzCAEHrxKWgeBbzegW7hqQyqAIC6Qcbb4knv+J9nayLYH
         R5LhRwNke0nyAY8RI1KZgPUuJ9He54TEqelTWo2jzaKzLnXpde2+xwzifkob9CzaHc7G
         npys+K2PEpmmQNIl06S86FOk1xhbTkzLIwQCsGaYtCk9NdLF95UKvQZ+eHZNOtdvIqar
         mAyANeBBOA9LXy/pIAEsYo5T/h2gAfDBbkfevPTPtmfxXvOuv4JfR5Y+O2b9F8EFDoOa
         xOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KAB9o9XbO2dEKEPGZm81AqLjqGSvYkvcgsj2QybWv7g=;
        b=gCOjKPUafkl2DPdbDlJS2fEGE9qOHIwG0f5kwhf5oaQCUo4JlS90iRS1DrU1o3xn+q
         ZvWdu0d6Y2wQwCo7mVGkVBIPkOEPQjV34uYwDBB1QCK5+LqpE4GSby7Z1EFHvUfi29hO
         Q6WF1y+bsyBjpBbYrRfkfcspi9W+31XfHj/5Wcq63w9nYWg+vHC+4Zeuhs+WNJauOyhk
         5hNQOV/tG0fesqwFxvuPpntazsRl5hSkknZ0SKmmE84fl880yDzxGCWY/CX6+pfYn2Nn
         lDJ45S7fEZ+Z+4nTLjbuDDfjCz4f1eY7j4+oziZfOtgj3vqHxPEF8ZmKhYq5RkAyf3WM
         cVUQ==
X-Gm-Message-State: APjAAAVrBRjAEe4gPCO5aSKX/sgKDsVpKJeQezQXeCC4Q0BvBkwiLwbc
        oRPeYifizl03QJcxH2rM9Qk=
X-Google-Smtp-Source: APXvYqzW9mIERiYyDXIieMEXITq6MNtJd+g8DMbTmXNK7qyLbq5vimxsdHJv5wCyuC47d1PQuVSGTQ==
X-Received: by 2002:a63:9d83:: with SMTP id i125mr73946177pgd.229.1558415582198;
        Mon, 20 May 2019 22:13:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r11sm22483769pgb.31.2019.05.20.22.13.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 22:13:01 -0700 (PDT)
Date:   Mon, 20 May 2019 22:13:00 -0700
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] input: imx6ul_tsc: use devm_platform_ioremap_resource()
 to simplify code
Message-ID: <20190521051300.GF183429@dtor-ws>
References: <1554095712-15413-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554095712-15413-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 01, 2019 at 05:19:55AM +0000, Anson Huang wrote:
> Use the new helper devm_platform_ioremap_resource() which wraps the
> platform_get_resource() and devm_ioremap_resource() together, to
> simplify the code.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/imx6ul_tsc.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
> index c10fc59..e04eecd 100644
> --- a/drivers/input/touchscreen/imx6ul_tsc.c
> +++ b/drivers/input/touchscreen/imx6ul_tsc.c
> @@ -364,8 +364,6 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct imx6ul_tsc *tsc;
>  	struct input_dev *input_dev;
> -	struct resource *tsc_mem;
> -	struct resource *adc_mem;
>  	int err;
>  	int tsc_irq;
>  	int adc_irq;
> @@ -403,16 +401,14 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	tsc_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	tsc->tsc_regs = devm_ioremap_resource(&pdev->dev, tsc_mem);
> +	tsc->tsc_regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(tsc->tsc_regs)) {
>  		err = PTR_ERR(tsc->tsc_regs);
>  		dev_err(&pdev->dev, "failed to remap tsc memory: %d\n", err);
>  		return err;
>  	}
>  
> -	adc_mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	tsc->adc_regs = devm_ioremap_resource(&pdev->dev, adc_mem);
> +	tsc->adc_regs = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(tsc->adc_regs)) {
>  		err = PTR_ERR(tsc->adc_regs);
>  		dev_err(&pdev->dev, "failed to remap adc memory: %d\n", err);
> -- 
> 2.7.4
> 

-- 
Dmitry
