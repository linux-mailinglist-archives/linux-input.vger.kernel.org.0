Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDD5357C6F
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 08:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhDHGUA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 02:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDHGT7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 02:19:59 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA9CC061762;
        Wed,  7 Apr 2021 23:19:48 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y2so481874plg.5;
        Wed, 07 Apr 2021 23:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WFFNFOpwVuH8/pfFMqaU4Cf5qZprikHgWYb4USi58AA=;
        b=FVReBkjifAWSA0xTNCAZWrTpul/QNCp417AZ8fRIG02vf/J5+ubD7WQRjTfwTuwKUL
         VnfI7+MxQH1ItMPbBbIxi9blSCpMDgN77jn45YIGlUcqN5YF3MGu7XluxPty0IyU6H2Y
         giYfW1Vzm2juIQiJbduFn/bC0AczJWWlMA1egMcJzR8bJvTSGPmfyZbEA0iSegyz6Oje
         GwgIESb3xEvC8d8xgHfTUn8RfmvJs7vZAm3paQk8WTh+lMepkI7pWY0hWFBBbv6ZLrgi
         n0A67bJoXRJKruYW4aKwpWLkrjJOwz8Mme5rzXXAbpqKyDqVueOuN1NlQSbdXU8Iuxch
         lL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WFFNFOpwVuH8/pfFMqaU4Cf5qZprikHgWYb4USi58AA=;
        b=UwXWfq1tzaC6H4fJKKHUUZ+4OkCK4Hq7uiNjBi/ytAIlEXoMX4UnIFRwddKEf2WF/o
         3tciEg3mPLhG12SrbuJuV+jODKLvg93XmvCKnfs30iZNQwgLGzbJGArrrPpS7+Iney5s
         xbYeTpbg/hNOOLH1OtyCGYCu8ApLSaVh+CsSUPIH0mzK+VgcahJogZp9r+oBJ2kbS8Ad
         ZZman0vYHm7pii1X+XRuNMqLBHh/NUHg9tZVf3b3axzl8VYs+0Vck/F7c6KiVfC8CZW8
         0eecanSujdf8pV0/YdsGFmMu9SoXcn4GNAcl2Gh2lLu7KMqb+S90oTalMYuxtW6OcGQL
         Ykag==
X-Gm-Message-State: AOAM531/vUjTTmjLdXZrG+a1RosNczOd6jlu4NPD3X8qPM371A7nDo0c
        +XjoIa36V3ZQqvoT5lT6gGQ=
X-Google-Smtp-Source: ABdhPJyKqB6G6yzkYGBbD7nPFnPkxB6wqyM1476hWi48mt6FunuuEts9dzN3/hbZ/gd9lgI0DsfZDA==
X-Received: by 2002:a17:90b:3909:: with SMTP id ob9mr6971096pjb.181.1617862787473;
        Wed, 07 Apr 2021 23:19:47 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:488:412e:a196:e28b])
        by smtp.gmail.com with ESMTPSA id a65sm24128914pfb.116.2021.04.07.23.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 23:19:46 -0700 (PDT)
Date:   Wed, 7 Apr 2021 23:19:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Fuqian Huang <huangfq.daxian@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cyapa - Fix rumtime PM imbalance on error
Message-ID: <YG6ggJyKT/eIlEGk@google.com>
References: <20210407040740.20257-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407040740.20257-1-dinghao.liu@zju.edu.cn>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dinghao,

On Wed, Apr 07, 2021 at 12:07:38PM +0800, Dinghao Liu wrote:
> When mutex_lock_interruptible() fails, a pairing PM usage
> counter decrement is needed to keep the counter balanced.

Thank you for the patch.

> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/input/mouse/cyapa.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
> index 77cc653edca2..e411ab45a218 100644
> --- a/drivers/input/mouse/cyapa.c
> +++ b/drivers/input/mouse/cyapa.c
> @@ -904,8 +904,10 @@ static ssize_t cyapa_update_rt_suspend_scanrate(struct device *dev,
>  	pm_runtime_get_sync(dev);
>  
>  	error = mutex_lock_interruptible(&cyapa->state_sync_lock);
> -	if (error)
> +	if (error) {
> +		pm_runtime_put_noidle(dev);

Why "noidle" and not pm_runtime_put_sync_autosuspend() like we do in
case of normal flow?

>  		return error;
> +	}
>  
>  	cyapa->runtime_suspend_sleep_time = min_t(u16, time, 1000);
>  	cyapa->runtime_suspend_power_mode =
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
