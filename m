Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5BFC6AC42
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 17:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfGPPw5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 11:52:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43262 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388056AbfGPPwy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 11:52:54 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so21500375wru.10;
        Tue, 16 Jul 2019 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g4/LnDdA+06sof/xLsQmMbQHRCzvaeIzQEgPXpxIcrY=;
        b=DNEhFa5155bma4gi9Edf1Yj6PaP8/rc64s5VvCx5Add/DmSL9t9o9qxi6Y4JeFZycp
         aF0srA3QYWm0c187KyWift4NAb9VVcocltiiVaybGE6yT6+Uh2KwzdetEmAlNAGcIsSa
         HLVvDuMiQGQ1io8snnkxyqVGXyDT0n2jIU48TMij3UY0BVBCeKeR88VzjZtNmuXcZCuN
         OsHX/vh5B1MmMZ5R6CGo2DqUcXWAy3KHcJSFNod4qJDcm7vKsVnrnybw/8XVRr6j6w9z
         E+bei9n1sGX1uBiSCOGt1d9UoYxEJehyloJHixgirg97AfKq9xh04y3eIWFrOi6UsNph
         6HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g4/LnDdA+06sof/xLsQmMbQHRCzvaeIzQEgPXpxIcrY=;
        b=VprHQDcVA6dFalxsr4YAcsZ1iLVZ4EpO6TS+gqRigLM3IAR9fD9QfjrVMnGeZ+qQvL
         HTZa3KNZ2Wu7OQVfVfT2N2/pCefxm/PlQco+jy/OJx4VXk6QTwe9dW7TfjdLTuE2X8/f
         FmYXqMjXWJo7bcaLdovveSzhPLsjdAVB3xSQYKjhgz99KTSZWb9aaYypmg5ij7xmtAg7
         J0lj4znDllWpne+AyK6sPrxR/9RzWwW2Jc7nJBpp9k+YO0ZCJzAjnGy+l5fzOgBtFGI3
         Ip6tVGFqqK6FI0iji/0U3SEEiYLyKsSU45rq0gvdMZAypgjJJeFXrKWyjC7rp3MXvEXy
         ozBQ==
X-Gm-Message-State: APjAAAU586kP4anrKu7RW8Y8L7Di5+EbKXsFEwPb8gJa5oAAeXFel+O1
        SbvanLBKYqPz19dBC8Ej4mY=
X-Google-Smtp-Source: APXvYqz9reS0wYGZ0qWcAIyFS+EYd27c7NNOotzJmQRly+vqVmbCg6t6xud29k42XqvOCXkjL+vVJA==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr38084747wro.33.1563292372646;
        Tue, 16 Jul 2019 08:52:52 -0700 (PDT)
Received: from localhost (smbhubinfra01.hotspot.hub-one.net. [213.174.99.146])
        by smtp.gmail.com with ESMTPSA id 5sm19746642wmg.42.2019.07.16.08.52.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:52:51 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:39:35 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mukesh Ojha <mojha@codeaurora.org>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] Input: s3c2410_ts: Use
 devm_platform_ioremap_resource()
Message-ID: <20190716073935.GE1182@penguin>
References: <1554362243-2888-1-git-send-email-mojha@codeaurora.org>
 <1554362243-2888-4-git-send-email-mojha@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554362243-2888-4-git-send-email-mojha@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mukesh,

On Thu, Apr 04, 2019 at 12:47:21PM +0530, Mukesh Ojha wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> Signed-off-by: Mukesh Ojha <mojha@codeaurora.org>
> ---
>  drivers/input/touchscreen/s3c2410_ts.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
> index 1173890..e11cdae 100644
> --- a/drivers/input/touchscreen/s3c2410_ts.c
> +++ b/drivers/input/touchscreen/s3c2410_ts.c
> @@ -242,7 +242,6 @@ static int s3c2410ts_probe(struct platform_device *pdev)
>  	struct s3c2410_ts_mach_info *info;
>  	struct device *dev = &pdev->dev;
>  	struct input_dev *input_dev;
> -	struct resource *res;
>  	int ret = -EINVAL;
>  
>  	/* Initialise input stuff */
> @@ -277,14 +276,7 @@ static int s3c2410ts_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "no resource for registers\n");
> -		ret = -ENOENT;
> -		goto err_clk;
> -	}
> -
> -	ts.io = ioremap(res->start, resource_size(res));
> +	ts.io = devm_platform_ioremap_resource(pdev, 0);

This is not an equivalent transformation: the original code (rightly or
wrongly) did not request the memory regions described by 'res' while new
variant does.

Also you can't simply slap a single devm resource in a driver that does
not use managed resources as it messes up the release order.

-- 
Dmitry
