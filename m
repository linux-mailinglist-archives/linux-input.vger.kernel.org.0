Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87792C003B
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgKWGqu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKWGqt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:46:49 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53BBC0613CF
        for <linux-input@vger.kernel.org>; Sun, 22 Nov 2020 22:46:49 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id e8so2090351pfh.2
        for <linux-input@vger.kernel.org>; Sun, 22 Nov 2020 22:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4peVuDYxewYHsWOLhO96CAz9PT+PBwqyzdf8BkfOSrQ=;
        b=PeTKdGEtT7cw8cPSG0jEKBR8BRICm0ddlk3suOLuklQq6nJXWjlDurMI2AFx4a/n2P
         aylCmRZS2ETkJ0jJwUCGdX+d1kxtc/ZCMQdkoAi/qb+nyVKugLdtv8eoREuKiFXIuaQd
         xAyeOVEDw1UJBx5lv0MzrGEjEHnBoAZExUWPxpAmtXgQCAAum1eKWF7Tv7aqhJgs2kTX
         +VpAWPFl3LpzUqo7IRzZncuTMkGFzy+M8+K+r3zJuEQBbUm06bEfs8X+790sGpyw07Ir
         efQBCYcxMX9eaK8CA5bN+rWLWIBh/klpMdLs1BTcVGIzWxWSb64BtkzK8TB+U4YqDXmd
         tORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4peVuDYxewYHsWOLhO96CAz9PT+PBwqyzdf8BkfOSrQ=;
        b=gTnOyfcxTn7VRnmpmjHewCtvDpImD7Mw3KyC2js40QwXOavjMMOSxvIRVg304de/a8
         RRtiuqVHkpqAC9s/76zJrLceSJTnETye+u7YBRd3z58xrrTaYZkwBDYNtEO1VcHPZc3X
         tynFG5ckbNl6p3JPPIFVOGkWEMNGWJAqNpWevnJSEyjuhhvWKd51er+vwb77Ob6cAMwo
         N5mcVKAGKinA6mOgBORVDgfVMytcM/sNg1vyaW3i+uvl4EZBUjwT2SYVvwIl/STHPWq/
         bJ+zmh82x1uKaT+xOCBC7VvfpMBaCoVhb7Pgp4foWVlZQ0S9eHocOIRRDgf7HycXS4/U
         qaRg==
X-Gm-Message-State: AOAM532lI/hSEeqwAGsAi0tK0FmDyGwkkWPNjTSiBsfNznT8eDCzHPUH
        hs+cqiOL7i06KtLGvnGkmCW1BekIzD0=
X-Google-Smtp-Source: ABdhPJxl+ibNoJKvdBrwPAnoofFTHtlErsmuY2o4+ycS5Koy0XYM+jImwdBwNQujgzF+Qs14Y1R/DQ==
X-Received: by 2002:a62:3381:0:b029:196:31a5:c2d4 with SMTP id z123-20020a6233810000b029019631a5c2d4mr23916082pfz.29.1606114009185;
        Sun, 22 Nov 2020 22:46:49 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id e6sm10807306pfn.190.2020.11.22.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:46:48 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:46:46 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: omap-keypad: Fix error goto and handling in
 omap4_keypad_probe
Message-ID: <20201123064646.GY2034289@dtor-ws>
References: <20201120133918.2559681-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120133918.2559681-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Nov 20, 2020 at 09:39:18PM +0800, Zhang Qilong wrote:
> @@ -269,41 +298,32 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  		goto err_release_mem;
>  	}
>  
> +	pm_runtime_enable(&pdev->dev);
>  
>  	/*
>  	 * Enable clocks for the keypad module so that we can read
>  	 * revision register.
>  	 */
> -	pm_runtime_enable(&pdev->dev);
>  	error = pm_runtime_get_sync(&pdev->dev);
>  	if (error) {
> +		pm_runtime_put_noidle(&pdev->dev);
>  		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
> -		goto err_unmap;
> -	}
> -	rev = __raw_readl(keypad_data->base + OMAP4_KBD_REVISION);
> -	rev &= 0x03 << 30;
> -	rev >>= 30;
> -	switch (rev) {
> -	case KBD_REVISION_OMAP4:
> -		keypad_data->reg_offset = 0x00;
> -		keypad_data->irqreg_offset = 0x00;
> -		break;
> -	case KBD_REVISION_OMAP5:
> -		keypad_data->reg_offset = 0x10;
> -		keypad_data->irqreg_offset = 0x0c;
> -		break;
> -	default:
> -		dev_err(&pdev->dev,
> -			"Keypad reports unsupported revision %d", rev);
> -		error = -EINVAL;
> -		goto err_pm_put_sync;
> +		goto err_pm_disable;
> +	} else {
> +		error = omap4_keypad_check_revision(&pdev->dev,
> +						    keypad_data);
> +		if (!error) {
> +			/* Ensure device does not raise interrupts */
> +			omap4_keypad_stop(keypad_data);
> +		}
> +		pm_runtime_put_sync(&pdev->dev);
>  	}
>  

So here there I mean to have

	if (error)
		goto err_pm_disable;

I added it (and removed "goto" from the branch above) and applied, thank
you.

-- 
Dmitry
