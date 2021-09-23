Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4280F41579D
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 06:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhIWEkh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 00:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhIWEkh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 00:40:37 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DDFC061574;
        Wed, 22 Sep 2021 21:39:06 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id n18so5024424pgm.12;
        Wed, 22 Sep 2021 21:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kCkDRwUV24O6q9784PYpvoabmYuuEnKSIhX7g/vRBKA=;
        b=G15qTneDgptJZlwqHehbOX7Fsrf1H92nQ6qIRkm9EgfKf7J7JVHIYLpmzDa3Mkxj/J
         5YlBX3BKLobGYclwxw5gyterRL9HImwI7bD0CUbO3LAin0Dl+Sl4nqJ9KvL1BVTujjQi
         +cBbea4g005TsioGeFjCs/o9fwgftM8QQwLANN0lSmQxiqPgE/dRx8PDnCrLtNsk/ygN
         izKN/VrJyWdv3sh30qNzv/hiMQwHmrRftfm2e37iCWVQ0/A2CtRVsM0dpXUHKG0aMcHY
         vTk1AWSAOOSiQUwEnbcGTMeGmfUTEjXWM+BE4j4kdgClxMiIEC1tk7oFhkxiBQV0d2gz
         4F9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kCkDRwUV24O6q9784PYpvoabmYuuEnKSIhX7g/vRBKA=;
        b=MzUSNd3PxM6pH9aA1pzzCFz6DWj1m2ESmik0NQsJiF+KcJzVcU1FQ4MvwWwrzo6MBX
         BsLyVtvEEcHR/QL2dfvjOQ1b86jEltqzMJz+lwuXpGZTwPffaVyMNQ2tZ9LENLi+CrzI
         1MPXG7tR914GlWHkHYkpz02U9l+3GmzeXbgip4GI2SDoFCAHjPQjxCl4A1oSA3+jEz3R
         v2N0nEyvYnj94XXbN7JD2lBwPq7IMoN1F4o1lKdzAIUomGbkTcL/ynz/v8UpEijaqjtM
         Ot99TnLqb8ra8KEjwZQMdSQNj/fMmOaR2dZ9bw7WbPjvUXCA56KqTNWw0QLaJsBbODhB
         YEGQ==
X-Gm-Message-State: AOAM533r7IJKu4kZaAC9rL8N88Txq8PJ2CEtNoh+yJ7scQSFC94yggTB
        DQLtPWA8n7/5kyGvR0n9UV0=
X-Google-Smtp-Source: ABdhPJzEVUlMw04cyrqpJ13SNsKtiI4FCeQ6c6K1XjdAg0Dcz3VPldW5Gn8QXcL/ZuxS/hbFzjoJhg==
X-Received: by 2002:a62:31c5:0:b0:447:b30c:9a79 with SMTP id x188-20020a6231c5000000b00447b30c9a79mr2519415pfx.67.1632371945257;
        Wed, 22 Sep 2021 21:39:05 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f198:36ef:2b9e:5c76])
        by smtp.gmail.com with ESMTPSA id r23sm7395480pjo.3.2021.09.22.21.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 21:39:04 -0700 (PDT)
Date:   Wed, 22 Sep 2021 21:39:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: colibri-vf50-ts - Make use of the helper
 function devm_add_action_or_reset()
Message-ID: <YUwE5d3rf93UbIBj@google.com>
References: <20210922125212.95-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922125212.95-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Cai,

On Wed, Sep 22, 2021 at 08:52:09PM +0800, Cai Huoqing wrote:
> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and if devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/input/touchscreen/colibri-vf50-ts.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/colibri-vf50-ts.c b/drivers/input/touchscreen/colibri-vf50-ts.c
> index aa829725ded7..1a1d8e70ec40 100644
> --- a/drivers/input/touchscreen/colibri-vf50-ts.c
> +++ b/drivers/input/touchscreen/colibri-vf50-ts.c
> @@ -271,9 +271,8 @@ static int vf50_ts_probe(struct platform_device *pdev)
>  	if (IS_ERR(channels))
>  		return PTR_ERR(channels);
>  
> -	error = devm_add_action(dev, vf50_ts_channel_release, channels);
> +	error = devm_add_action_or_reset(dev, vf50_ts_channel_release, channels);

It looks like there is devm_iio_channel_get_all(), we should be using it
instead of installing a custom release action.

>  	if (error) {
> -		iio_channel_release_all(channels);
>  		dev_err(dev, "Failed to register iio channel release action");
>  		return error;
>  	}
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
