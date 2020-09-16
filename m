Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3096826BB3D
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 06:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgIPEHj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 00:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgIPEHi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 00:07:38 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109C4C06174A;
        Tue, 15 Sep 2020 21:07:38 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fa1so891677pjb.0;
        Tue, 15 Sep 2020 21:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mNu54DYFhA1U04jXVoZJoF27VkO3xGAxffpdhSnSGxg=;
        b=r09nh/EPRmmtUNJHLiIDQ+LBq7h/j1aghUXAIBTI+gYxKX0ePjqiLnePnUNhfVaV1T
         M6ZItIHKVyIAdRGZOLMuqiYH5VExdKOLqqrfZItQCv0GUknxi61tsvEZeNHwUSfZyymz
         p+zX6AWhrhiXqgAu7xL5uA0VUyR3+XOlTtTn9s/VO7xQNKjq+bq4YIuhcdA/E4TwGbzd
         D8S+MaLUf295B/PH6YtBfhxToHlXoZ/4iesdlcJdfDDOe3ERnGwXZccwOQzfXM/cS43A
         8RTJ/rjr2hGLahJj9mHq6NHx5r4VDWPwmmp2ed/aA+PcuDLaQv8B8HkQ+Im1p4YmipcP
         JWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mNu54DYFhA1U04jXVoZJoF27VkO3xGAxffpdhSnSGxg=;
        b=c8tvSIsoJWLahGelaBeXtH5h9ejPcG9SspS0Rkwj5Gcl1rA0YeNJbYflDKN2dYOFuw
         k8V3CXZqq/iDx8WIi/hurI/wLn/nuwyFob3X0bK30yi0+9wtcBErOni8NoeFWRGJm/UJ
         8lc82vkNpIV65GqPJH6ukV68nx9apsKo3G5cE7eojZsdmtcWWUikQgBCE0iChn8tjHLI
         f4971nDtxC3SvV6q2NTGfzLgwzgc0Ff3LIo41zIvgqdbM6fy7rfxH+UaphLemBA4o4/O
         xKKzbLrq9ngXYGa5bFNrcCGqRQc2dX2Jlx9L3QmVU7psSOXpPBUBbmmBniPLSIbUYrNs
         HUww==
X-Gm-Message-State: AOAM530hApt/dSONqtL3sXOWhzjLKkbew0mZUPW0lmj4dqUge2BzTTKY
        RAXz4nwTIiWp+fC900JLZl4=
X-Google-Smtp-Source: ABdhPJw7U+MXpka7fTTJXAI746sOr2NQedRr6Xe7aZDTeFM8F2bNvqu8aTNq4dOiq6Oj7UH+enTjdw==
X-Received: by 2002:a17:902:b591:b029:d1:e598:740a with SMTP id a17-20020a170902b591b02900d1e598740amr4638292pls.61.1600229257531;
        Tue, 15 Sep 2020 21:07:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n127sm14644222pfn.155.2020.09.15.21.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 21:07:36 -0700 (PDT)
Date:   Tue, 15 Sep 2020 21:07:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] Input: da9034-ts - simplify the return expression
 of da9034_touch_probe()
Message-ID: <20200916040734.GI1681290@dtor-ws>
References: <20200915032626.1772465-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915032626.1772465-1-liushixin2@huawei.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 15, 2020 at 11:26:26AM +0800, Liu Shixin wrote:
> Simplify the return expression.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/input/touchscreen/da9034-ts.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/da9034-ts.c b/drivers/input/touchscreen/da9034-ts.c
> index 2943f6a58388..dfb2604381d2 100644
> --- a/drivers/input/touchscreen/da9034-ts.c
> +++ b/drivers/input/touchscreen/da9034-ts.c
> @@ -298,7 +298,6 @@ static int da9034_touch_probe(struct platform_device *pdev)
>  	struct da9034_touch_pdata *pdata = dev_get_platdata(&pdev->dev);
>  	struct da9034_touch *touch;
>  	struct input_dev *input_dev;
> -	int error;
>  
>  	touch = devm_kzalloc(&pdev->dev, sizeof(struct da9034_touch),
>  			     GFP_KERNEL);
> @@ -344,11 +343,7 @@ static int da9034_touch_probe(struct platform_device *pdev)
>  	touch->input_dev = input_dev;
>  	input_set_drvdata(input_dev, touch);
>  
> -	error = input_register_device(input_dev);
> -	if (error)
> -		return error;
> -
> -	return 0;
> +	return input_register_device(input_dev);

Thank you for the patch, but I prefer explicit returns on errors when
there are multiple failure points in a function, as that allows
extending the function more easily.

Thanks.

-- 
Dmitry
