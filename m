Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44C34478F1
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 04:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhKHDkO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 22:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbhKHDkO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Nov 2021 22:40:14 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F329C061570
        for <linux-input@vger.kernel.org>; Sun,  7 Nov 2021 19:37:30 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id g19so8694192pfb.8
        for <linux-input@vger.kernel.org>; Sun, 07 Nov 2021 19:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q9kn8WR4b/H+pNK4NbvzSY8Nrpy5L2E/D1Q/kjTAK18=;
        b=EN8uAQgZfO9ZXbBnqCQJT/kzPti9jhfCFARoP4NQg2qjAf+GEsCKrPNiaoNtuos+vW
         5+akeuQzgcUmOJF8p9Wi2ARe29GYZpTX9793KmvpzEQtLyt9BEWPyarZINQk4EKtc7Sx
         IXX2ndI8o8z3Xu2kFGsKquq86B3cBLxI1SF5rHwo+m9G3DeD20TnPj8mql/6LEReI6zc
         PlGiNurDC0GFYpSEpDTo+hjS3QdpmPkfxQdjULyXXJiMkG6oEboRlT/jBmb1YNMxiEV6
         EXTNswNuivRvMvLyBHtqP6zw7O8qWZreJnqVzEyNTOh/BEXKOY40VgARchF00yTrNLsw
         Hvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q9kn8WR4b/H+pNK4NbvzSY8Nrpy5L2E/D1Q/kjTAK18=;
        b=uPbb+eWaXVfahbCcPwzg/1smP3g0cqNXk0Xa7qMOWwFCP3ClvWkJb/sF3nV/GWPyqq
         +FJIxdb3JEXe3TblRRnSPCumzy0hmKKrVGgXuLocNroKU5Wls1CJPd7Vb7KUMjoW1fjN
         u4kHiEeRWWCuK9C4kX9wKMCiDtejHBZFtV9KacZzbYJ8WiO4mX5ZTmpTh2CtNWJZznnM
         qdZ5HGpHYDXE4Bj9X9Py2GJGsqUJr0MHizydZ+5+L3Gdy+/B+zA5xvrx32U4UB9mkwEG
         cX6byILAW9jRy4IQp/Pae8e2dDbS/s8B9YHCoc9LhZtWZS3ET4co5BseSK4cNL0ZGXNt
         tGgA==
X-Gm-Message-State: AOAM530l9eN5UPzlUwhvAM97/OmRHeHgPk5xeIYEQBobEpptuAmxu42Q
        yplMmPePz2FCQYZwYryQv+iKDSWDsgY=
X-Google-Smtp-Source: ABdhPJzGv0oIA/Yzx3cSTu6Dl0V0HuyZofBeG3hPMwys1LKQmcirEpW1uQeNioHRk+nLz9fDFdMJkA==
X-Received: by 2002:aa7:9d81:0:b0:49f:e072:bfc7 with SMTP id f1-20020aa79d81000000b0049fe072bfc7mr722876pfq.48.1636342649793;
        Sun, 07 Nov 2021 19:37:29 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e1e:62c7:99fb:927c])
        by smtp.gmail.com with ESMTPSA id w1sm9668674pgb.50.2021.11.07.19.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 19:37:28 -0800 (PST)
Date:   Sun, 7 Nov 2021 19:37:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH] Input: ili210x - Improve polled sample spacing
Message-ID: <YYibdjD35P2RklGh@google.com>
References: <20211108005216.480525-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108005216.480525-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Mon, Nov 08, 2021 at 01:52:16AM +0100, Marek Vasut wrote:
> Currently the ili210x driver implements a threaded interrupt handler which
> starts upon edge on the interrupt line, and then polls the touch controller
> for samples. Every time a sample is obtained from the controller, the thread
> function checks whether further polling is required, and if so, waits fixed
> amount of time before polling for next sample.
> 
> The delay between consecutive samples can thus vary greatly, because the
> I2C transfer required to retrieve the sample from the controller takes
> different amount of time on different platforms. Furthermore, different
> models of the touch controllers supported by this driver require different
> delays during retrieval of samples too.
> 
> Instead of waiting fixed amount of time before polling for next sample,
> determine how much time passed since the beginning of sampling cycle and
> then wait only the remaining amount of time within the sampling cycle.
> This makes the driver deliver samples with equal spacing between them.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>
> ---
>  drivers/input/touchscreen/ili210x.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index a3b71a9511eb3..b2d9fe1e1c707 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -328,10 +328,13 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>  	const struct ili2xxx_chip *chip = priv->chip;
>  	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
>  	bool keep_polling;
> +	ktime_t time_next;
> +	s64 time_delta;
>  	bool touch;
>  	int error;
>  
>  	do {
> +		time_next = ktime_add_ms(ktime_get(), ILI2XXX_POLL_PERIOD);
>  		error = chip->get_touch_data(client, touchdata);
>  		if (error) {
>  			dev_err(&client->dev,
> @@ -341,8 +344,11 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>  
>  		touch = ili210x_report_events(priv, touchdata);
>  		keep_polling = chip->continue_polling(touchdata, touch);
> -		if (keep_polling)
> -			msleep(ILI2XXX_POLL_PERIOD);
> +		if (keep_polling) {
> +			time_delta = ktime_us_delta(time_next, ktime_get());

Do we really need to use exact time, or ktime_get_coarse() is good
enough, as it is cheaper?

> +			if (time_delta > 0)
> +				usleep_range(time_delta, time_delta + 1000);
> +		}
>  	} while (!priv->stop && keep_polling);
>  
>  	return IRQ_HANDLED;
> -- 
> 2.33.0
> 

Thanks.

-- 
Dmitry
