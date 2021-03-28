Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D0334BAED
	for <lists+linux-input@lfdr.de>; Sun, 28 Mar 2021 06:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhC1EoP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Mar 2021 00:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhC1EoN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Mar 2021 00:44:13 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5074FC061762;
        Sat, 27 Mar 2021 21:44:12 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f10so7268847pgl.9;
        Sat, 27 Mar 2021 21:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YyUcINWM0TObjk2siXAf/6ABze4wrk4Frd1z8525Vm0=;
        b=DWD6nzZ5iT1sy0wkq/AuSeqdGwXvi+gmi8Lpn7dg2Q8YvtxbIinenJJlxZ/G5q71vi
         jGJx0ZZ7TdQC+XIU7dc2hpenPUjokO6UyeQj2iXVp3QJHeCfqLjj9aMQ9DeRdz2NrKTt
         T7/cy383ZHHg6JHB2nhltgwJnBqBHQGHIQvdYI6WdLP7ggzsdCq2oh1NqIk54lIO4FmB
         +grbEvCUAAW1DbFk2+AFGJmVxaWY7/SH9pMPKwC0nVQJVdH/iS5BMsDVvNOGXZ3qxD/5
         QNfeIvk+g4ofdLSzmWESJIty5MFREWDnwYCUItpmbfFYsPHijgRmsVQitdoldi9Myy7g
         du/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YyUcINWM0TObjk2siXAf/6ABze4wrk4Frd1z8525Vm0=;
        b=c0QspQR3AtmR85LHfkjHoLPCIToyMnbvKKenoN0Lf1RzKCPCee5OBucoqUYr+Av8Ov
         CeGzUx5lSVm5wc/48A5OPRg+MPuj90XVw66tlAr/DhCgi5BDUP5JMSIyer0xq68k6Jsl
         ckL/69EpQYct6VL59EpWUSRr8SoVssd7YXV/jk2WKE7ylqYtu/6cRLgv9espXXAzY72F
         Em7tRw1tE4iHoTb90Po73ydafvTyvSLO3qJBivgFNATwxoaeplzsZoTL+RaZsfm74rOi
         N+Tv2cgfJgUT8NE1u2ZqoJL6Apzw5Wxz5susCK0MRg+xeNdBve53A42acfM+4GRU0Jtp
         2RaA==
X-Gm-Message-State: AOAM533UpIiA8myeoiDJ+s7oo9rww/P6JCW/sjnhTzk/hDjaPGkbZ5q0
        i7ABOzMdNqj4nNrte7A52tlKk/yqmPI=
X-Google-Smtp-Source: ABdhPJwnPYPVLUfPSZGxMeu/QSCqwaMQq1KRJulRJZzoLwdW6+bjGcOz73jGacqL2RbPr/T2u/dIcg==
X-Received: by 2002:a65:538f:: with SMTP id x15mr19144989pgq.429.1616906651839;
        Sat, 27 Mar 2021 21:44:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:583b:ffbb:e0ea:e126])
        by smtp.gmail.com with ESMTPSA id fa21sm12252916pjb.41.2021.03.27.21.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 21:44:10 -0700 (PDT)
Date:   Sat, 27 Mar 2021 21:44:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-input@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: elants_i2c - fix division by zero if firmware
 reports zero phys size
Message-ID: <YGAJmGqNitQ9XwVl@google.com>
References: <20210302100824.3423-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302100824.3423-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Tue, Mar 02, 2021 at 01:08:24PM +0300, Dmitry Osipenko wrote:
> Touchscreen firmware of ASUS Transformer TF700T reports zeros for the phys
> size. Hence check whether the size is zero and don't set the resolution in
> this case.
> 
> Reported-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Please note that ASUS TF700T isn't yet supported by upstream kernel,
> hence this is not a critical fix.
> 
>  drivers/input/touchscreen/elants_i2c.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 4c2b579f6c8b..a2e1cc4192b0 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1441,14 +1441,16 @@ static int elants_i2c_probe(struct i2c_client *client,
>  
>  	touchscreen_parse_properties(ts->input, true, &ts->prop);
>  
> -	if (ts->chip_id == EKTF3624) {
> +	if (ts->chip_id == EKTF3624 && ts->phy_x && ts->phy_y) {
>  		/* calculate resolution from size */
>  		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, ts->phy_x);
>  		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, ts->phy_y);
>  	}
>  
> -	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> -	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> +	if (ts->x_res > 0)
> +		input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);

There is absolutely no difference between setting respluton to 0 vs not
setting it at all, so I dropped the conditionals and applied.

> +	if (ts->y_res > 0)
> +		input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
>  	if (ts->major_res > 0)

We could drop this condition as well.

>  		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->major_res);
>  
> -- 
> 2.29.2
> 

Thanks.

-- 
Dmitry
