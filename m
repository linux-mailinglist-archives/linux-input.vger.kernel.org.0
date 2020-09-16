Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC98626B92B
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 03:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgIPBBp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 21:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgIPBBo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 21:01:44 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AECC06174A;
        Tue, 15 Sep 2020 18:01:44 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l71so436095pge.4;
        Tue, 15 Sep 2020 18:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DycTmxSFFnDVXWFUqr21zhna4kBRrUqR0acmd5MtpdQ=;
        b=GxnJyXiq4QG+ghyb61K6sKuh3mV+hxrs8JA7BWsf3+9XItarPjm0OW4IccPj9xtF2N
         sxJS+xiFJ9u6MWEmxHVmvqJsqhPr1GSJZXvwaxBofSrMHZMSp8n80MHY5dd8L024tesz
         wUcLR9bBtLq7lNQBylSiR0dfbAhTerBafpMmDsvX2OEkyD6P5Y8S+d16gujIjplpEbxp
         LZPBXvTbjQIJ7sFyQDXn4FPIQsm5sSMHF29Umvlvfw/+sw0RVQE5UFZIMiD97nhRnBDX
         8kK7fd55zieoLW37kygtOLJaarl1NlBhH2whlPDhid36Zh7U2i/XGMxQTMF+WNFWnseY
         OFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DycTmxSFFnDVXWFUqr21zhna4kBRrUqR0acmd5MtpdQ=;
        b=iBIScWG/V4l65UmSapv2ntsls0bruD9+MezQhDqT1PQqqnyOJu80wESueCtgFZmQ3U
         ulwdF4osU27LUbIjRxpUnB5XwV9VHUggUooLxLKJqcs1b61qsTkZka0FgecXdl4b6lHc
         6kDl5gDuaq09iLf/bl4GjjSfuvOjc4ZGvKSpEpfDDOlCgXtrCNcCQOy2UgKGsTAkWG4f
         ttYdjg7KwpnheHXJYY0vRIp7QLP73FAnwYc6CdaikV+afu6NLOI7081WD5UVm8uIVYtq
         nh3jZycnOz3MVF9yZaDKSweoX+gO13MViQaTHH/Z4zjJ8QQSpS3+KAWwqrXy00m7TYAD
         czrg==
X-Gm-Message-State: AOAM530VCU0FaNMlotmHmdJS7oMdu/bC2DvfbVuL5yxzUZ1Wq3yOEy4b
        EgETy1iV3No6n9/vVw1w1X8=
X-Google-Smtp-Source: ABdhPJwnm/FnXuLqgQyD1LM4EpxtcV+dBr1YFz0ubNGr228NPkWg4tawBz7y5hafZWeyOVS5fwQPdw==
X-Received: by 2002:aa7:9491:0:b029:142:2501:34dd with SMTP id z17-20020aa794910000b0290142250134ddmr4273238pfk.54.1600218103467;
        Tue, 15 Sep 2020 18:01:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id y203sm14338924pfb.58.2020.09.15.18.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 18:01:42 -0700 (PDT)
Date:   Tue, 15 Sep 2020 18:01:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] Input: sun4i-ps2 - Fix handling of
 platform_get_irq() error
Message-ID: <20200916010140.GG1681290@dtor-ws>
References: <20200828145744.3636-1-krzk@kernel.org>
 <20200828145744.3636-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828145744.3636-4-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 28, 2020 at 04:57:44PM +0200, Krzysztof Kozlowski wrote:
> platform_get_irq() returns -ERRNO on error.  In such case comparison
> to 0 would pass the check.
> 
> Fixes: e443631d20f5 ("Input: serio - add support for Alwinner A10/A20 PS/2 controller")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. None
> ---
>  drivers/input/serio/sun4i-ps2.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/serio/sun4i-ps2.c b/drivers/input/serio/sun4i-ps2.c
> index a681a2c04e39..7da1ea8741fc 100644
> --- a/drivers/input/serio/sun4i-ps2.c
> +++ b/drivers/input/serio/sun4i-ps2.c
> @@ -265,9 +265,8 @@ static int sun4i_ps2_probe(struct platform_device *pdev)
>  
>  	/* Get IRQ for the device */
>  	irq = platform_get_irq(pdev, 0);
> -	if (!irq) {
> -		dev_err(dev, "no IRQ found\n");
> -		error = -ENXIO;
> +	if (irq < 0) {

"irq" is unsigned here, so this will not work. I'll change it to use
drvdat->irq which happens to be signed, and drop "irq" variable.

> +		error = irq;
>  		goto err_disable_clk;
>  	}
>  
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
