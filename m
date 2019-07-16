Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82E076AC44
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 17:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388088AbfGPPxD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 11:53:03 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42671 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387977AbfGPPwv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 11:52:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id x1so6521723wrr.9;
        Tue, 16 Jul 2019 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JGa70Quc4Z0AaxrkSEcWukKTNPw7McenYMvZ7Zt5G8w=;
        b=D/U++A4qxgifbNPmfVJSPVdStFvp9ZU18JdCHpUB4DdrTH7sdwdpIGKhYvyKaBeu9x
         01cfLCevMxzmf9suwDO5Q3dBokIo/LPQD54PrcJMv4FPY7/e/T8wqgyAkTs1I1KL4M2b
         qzUjNRHaKDrr75nVIBdWN0OHURODgQKpExlEvZ22h8PC8JIsFEYuStp0CahMd0IU/0l/
         bGNRUYlGbo4Zwwy6n/kA0wxJZZ1iUoHa1XtJwU6MmJ4cTiP8sZod1fq3e5WNkOufaF41
         iR0VCe7wITMMSY+f8912BEQvDwB0vMGqzBOd8mjt2brnQ1nFABgs3m9WBvhyV2ntny22
         olTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JGa70Quc4Z0AaxrkSEcWukKTNPw7McenYMvZ7Zt5G8w=;
        b=Ef3S1qlPOmGd5INM3C6htNWnSmy5JzH+5awgbdSNzTN8kYL0h9vqIltOae9b3or/CK
         5I5Ttm8oTFHVlVc405jQRZ9RAlcVcg/rIInniaPk0XmniVYAfBOUI4frg6qtNCyEwtnc
         c9jHjQ6guJ5R/5R4x1ehRzTVgRJCasa8V42AjaOlgc3I+6xFHeOLDVQToqlu5FG5Bqx2
         LXgX1ExUhl0xHEUY54m57ARg4WCftzAereBxceldp+HcaiFixbO6pTeaIT3Sp/5p1vwk
         5wvBZcfIGj7ILctcbrOfdaGdUqFn+s2HGohbvrPe+THydSWCy0LYUCJNqbP+gB4LhLTS
         JEKg==
X-Gm-Message-State: APjAAAWogZ6QW/BAGaeBg4BG51ERSk9khxcfyxXHxtqf7z33RFfPK+OE
        4HORar6zBexwU5kYOBfaoqo=
X-Google-Smtp-Source: APXvYqwIpHD1mj+uv+1VCxPyVxqXCi20ZlED3q8lvK7XmorLtU/ScTf3OZA47jdsYSpuoVcrtJ299g==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr36208049wrv.247.1563292368676;
        Tue, 16 Jul 2019 08:52:48 -0700 (PDT)
Received: from localhost (smbhubinfra01.hotspot.hub-one.net. [213.174.99.146])
        by smtp.gmail.com with ESMTPSA id i12sm12800327wrx.61.2019.07.16.08.52.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:52:48 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:34:25 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mukesh Ojha <mojha@codeaurora.org>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] Input: sun4i-ts: Use devm_platform_ioremap_resource()
Message-ID: <20190716073425.GC1182@penguin>
References: <1554362243-2888-1-git-send-email-mojha@codeaurora.org>
 <1554362243-2888-5-git-send-email-mojha@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554362243-2888-5-git-send-email-mojha@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 04, 2019 at 12:47:22PM +0530, Mukesh Ojha wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> Signed-off-by: Mukesh Ojha <mojha@codeaurora.org>

Applied, thank you.

> ---
>  drivers/input/touchscreen/sun4i-ts.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
> index d2e14d9..bbb0104 100644
> --- a/drivers/input/touchscreen/sun4i-ts.c
> +++ b/drivers/input/touchscreen/sun4i-ts.c
> @@ -309,8 +309,7 @@ static int sun4i_ts_probe(struct platform_device *pdev)
>  		input_set_drvdata(ts->input, ts);
>  	}
>  
> -	ts->base = devm_ioremap_resource(dev,
> -			      platform_get_resource(pdev, IORESOURCE_MEM, 0));
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
