Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1762475C
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 07:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfEUFMO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 01:12:14 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46151 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfEUFMO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 01:12:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id y11so8388262pfm.13;
        Mon, 20 May 2019 22:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gx1SGYrwI5mUah9I2zR6Xi9lfYNImzIgSdYOU50e3g0=;
        b=X8hqHhpVX91ECKMpYxn9UyAxoKe6DubrkYuZHBUt7IDGEMweYJdYDuVB8iXkSYNi6o
         S2qAuCC2UhKAX62G+6IjbpFhchp82cVvNyiWhHswcjnM06t2c5TfU3LWP7mvZACw/NuD
         MhVH2nImlw2wdu4RlmBfX16PXvQCaI561tJpnRSIqrwDjocXsXo6BqBnPnn+EEaDLbCh
         5WU9A1fDIG9yGcXgy1Wm2ooGX8aoTZQIJcUaZ0CiYzriyzC90Nd0qUXps6X8e3elp1Yo
         UAxJuDKI8e1AXd3sfbLwYyi9SNPBR0Z+7VYqXQ3lGcjn/GOQpOpjsRWUDoJU5SzHTRwu
         SViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gx1SGYrwI5mUah9I2zR6Xi9lfYNImzIgSdYOU50e3g0=;
        b=n8tRbNouSnHU/+ll0dhvAW/wHLOx74bjg8C+8pMQi5exyH7LvaaElf3aFKvFLBSD8H
         RrEC9qGa3X/FDuLcnfYis0FSupzLxZOaKTTq9lKEKxpTYW4RdmWipAt6fnJKZKrfdy5I
         S3w39CnasTguE7/3vSvMMWpAcb3o8+8c8Y9a8k3kV67QC2SMf+5SRYDBUTYW32Jp3JlM
         CNW6vQWrl4xLZa5FBegdHaAB78xZTPyR2rH0hR+ut8FQ/VHs2cV3Mn9U5k6/uWyKzqEe
         7XdLdTYpzR0XF8VHIIiasZjnsc8/epQjwy17ZKE+gRpEiw4Dvj6mRgqhQJRHt6vH8ZJ0
         xKHQ==
X-Gm-Message-State: APjAAAXJAKHo/rv4tZk5tVylsl0CBAXVNqhOH74ujH7dOAKLWmnSRfGa
        CkAvAN+u/0mNov9pFqu0ZOw=
X-Google-Smtp-Source: APXvYqy8qZ7QGjsCRN/daY3QWR7dhQEfZRv/GlKgGzo/A+tGnJz0D77W13N04M7ertbBlK0xOUeMSg==
X-Received: by 2002:aa7:80d9:: with SMTP id a25mr25762332pfn.50.1558415533314;
        Mon, 20 May 2019 22:12:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s66sm22056701pfb.37.2019.05.20.22.12.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 22:12:12 -0700 (PDT)
Date:   Mon, 20 May 2019 22:12:10 -0700
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
Subject: Re: [PATCH] input: keyboard: imx: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20190521051210.GE183429@dtor-ws>
References: <1554096209-17870-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554096209-17870-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 01, 2019 at 05:28:12AM +0000, Anson Huang wrote:
> Use the new helper devm_platform_ioremap_resource() which wraps the
> platform_get_resource() and devm_ioremap_resource() together, to
> simplify the code.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/imx_keypad.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
> index 539cb67..cf08f4a 100644
> --- a/drivers/input/keyboard/imx_keypad.c
> +++ b/drivers/input/keyboard/imx_keypad.c
> @@ -422,7 +422,6 @@ static int imx_keypad_probe(struct platform_device *pdev)
>  			dev_get_platdata(&pdev->dev);
>  	struct imx_keypad *keypad;
>  	struct input_dev *input_dev;
> -	struct resource *res;
>  	int irq, error, i, row, col;
>  
>  	if (!keymap_data && !pdev->dev.of_node) {
> @@ -455,8 +454,7 @@ static int imx_keypad_probe(struct platform_device *pdev)
>  	timer_setup(&keypad->check_matrix_timer,
>  		    imx_keypad_check_for_events, 0);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
> +	keypad->mmio_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(keypad->mmio_base))
>  		return PTR_ERR(keypad->mmio_base);
>  
> -- 
> 2.7.4
> 

-- 
Dmitry
