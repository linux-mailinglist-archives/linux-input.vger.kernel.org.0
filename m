Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B773D442B
	for <lists+linux-input@lfdr.de>; Sat, 24 Jul 2021 03:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbhGXAcg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 20:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbhGXAcf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 20:32:35 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65730C061575;
        Fri, 23 Jul 2021 18:13:07 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id l19so4686628pjz.0;
        Fri, 23 Jul 2021 18:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UxGyBTIHhwTyGgmF4lVTY6KQSyR2h+ZEVbUZC6/uyQ0=;
        b=uchks1WB7cp4XDeGULk8Yv9tpLHvmqUNNJUdM5+D4GcptaqwzpaKUr5YsbigXQA2Bv
         5PEtUDCTwZk5siIX7PjbsuQUYFSt1YdV2irpQbTYzZkSuV3rgX9DGdJMY7jUeHRfnNAl
         5iLIgClCbGoYP8XC34FJP6rVS1adQt8A2HZLsPjnFOyhijQ9m5v4FCVE+fNznXQ+qzDZ
         2VpPPYn1D+h4of/wqVaxMx/61opV7L5ylc5u8ShD5K6OcTUGWj361Hwc9Spyhpyl0P2x
         gs7L0a4q2Tya2zS4pN1HIbPWtRgV2H9z2/GTha/zv4u5ZWwpcQ0reEQeiVbFu5w5rNYA
         Ez0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UxGyBTIHhwTyGgmF4lVTY6KQSyR2h+ZEVbUZC6/uyQ0=;
        b=cKi2Z9KUJe0ShxIK6m+kaD9IqJcDTS8nHTCOjmMBE9WpKF5M/6BepPRi9354HnsN91
         EUMpf+YKU1HxlWRX0P8T/xgdeQin37q+HqSebHNUNt/GJJOpzPVRLrsQIFqA8Jr35x8Y
         f6JauDUKSf0v4q0Li9qngSfTx7F8aKTGTtezgV8SpuPIMdH6wewvcqxKy7EvX52mfmSB
         bMAwBGIO7oIDZ+dDVOES/U1zBDejM+cbIVSa1K2Obz2xiWJh3SLIibaQWePiw+Y7KVx0
         1tP6UktxMTDyJaS5cQyaMt8YEby3eYzXN4qGLlvUy/fpyaHGoq4jh8wKkj/OIJyXLPuT
         A8mA==
X-Gm-Message-State: AOAM533lpVW18jEK4xOmSWQEbeSqDTyv+94dkgQu0MxtZdej0Tn7FHSs
        6BM0pGuvkbkpl/4v+9b5WOQ=
X-Google-Smtp-Source: ABdhPJzgVvJ1mZkT0E1XqWNnB53pR7Yp/6Sd41wzNVZrs8+2LyH6ZcV4Az1nQu02sSMg0ztTNSWyow==
X-Received: by 2002:aa7:824a:0:b029:2ec:89ee:e798 with SMTP id e10-20020aa7824a0000b02902ec89eee798mr6931561pfn.12.1627089186554;
        Fri, 23 Jul 2021 18:13:06 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:55b1:90d5:6a79:755f])
        by smtp.gmail.com with ESMTPSA id v27sm36404110pfi.166.2021.07.23.18.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 18:13:05 -0700 (PDT)
Date:   Fri, 23 Jul 2021 18:13:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: zinitix - Handle proper supply names
Message-ID: <YPtpHg2aoGlULuQQ@google.com>
References: <20210625113435.2539282-1-linus.walleij@linaro.org>
 <20210625113435.2539282-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625113435.2539282-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Fri, Jun 25, 2021 at 01:34:35PM +0200, Linus Walleij wrote:
> The supply names of the Zinitix touchscreen were a bit confused, the new
> bindings rectifies this.
> 
> To deal with old and new devicetrees, first check if we have "vddo" and in
> case that exists assume the old supply names. Else go and look for the new
> ones.
> 
> We cannot just get the regulators since we would get an OK and a dummy
> regulator: we need to check explicitly for the old supply name.
> 
> Use struct device *dev as a local variable instead of the I2C client since
> the device is what we are actually obtaining the resources from.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Michael Srba <Michael.Srba@seznam.cz>
> Cc: phone-devel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Mark: please check that I'm doing this check the right way, I assume
> that since we get regulator dummies this is the way I need to check
> for the old regulator name but maybe there are better ways.
> ---
>  drivers/input/touchscreen/zinitix.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index b8d901099378..7001307382f0 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -252,16 +252,28 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
>  
>  static int zinitix_init_regulators(struct bt541_ts_data *bt541)
>  {
> -	struct i2c_client *client = bt541->client;
> +	struct device *dev = &bt541->client->dev;
>  	int error;
>  
> -	bt541->supplies[0].supply = "vdd";
> -	bt541->supplies[1].supply = "vddo";
> -	error = devm_regulator_bulk_get(&client->dev,
> +	/*
> +	 * Some older device trees have erroneous names for the regulators,
> +	 * so check if "vddo" is present and in that case use these names
> +	 * and warn. Else use the proper supply names on the component.
> +	 */
> +	if (IS_ENABLED(CONFIG_OF) &&

Why is this check needed? The of_property_*() are stubbed out properly I
believe. We might need to check that dev->of_node is not NULL, although
I think of_* API handles this properly.

> +	    of_property_read_bool(dev->of_node, "vddo-supply")) {

If we go with this I do not like using of_property_read_bool() as this
is not a boolean property, but rather of_find_property().

However maybe we should use regulator_get_optional() which will not give
a dummy regulator? Still quite awkward, a dedicated API to see if a
regulator is defined would be nice.

> +		bt541->supplies[0].supply = "vdd";
> +		bt541->supplies[1].supply = "vddo";
> +	} else {
> +		/* Else use the proper supply names */
> +		bt541->supplies[0].supply = "vcca";
> +		bt541->supplies[1].supply = "vdd";
> +	}
> +	error = devm_regulator_bulk_get(dev,
>  					ARRAY_SIZE(bt541->supplies),
>  					bt541->supplies);
>  	if (error < 0) {
> -		dev_err(&client->dev, "Failed to get regulators: %d\n", error);
> +		dev_err(dev, "Failed to get regulators: %d\n", error);
>  		return error;
>  	}
>  
> -- 
> 2.31.1
> 

Thanks.

-- 
Dmitry
