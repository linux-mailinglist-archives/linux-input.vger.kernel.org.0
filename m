Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A73626B8FC
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 02:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgIPAyL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 20:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgIPAyD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 20:54:03 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5377C06174A;
        Tue, 15 Sep 2020 17:54:02 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u9so2242765plk.4;
        Tue, 15 Sep 2020 17:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UAVBoDevT9l3v6Yq4HsTsFUpmF8NbevOuwC5bYWFSWQ=;
        b=dGUV5VEWPWhr5mJT3YsFt0mypb70SiBUfT6WRyUlMnHR6QFR6KbB9Zw8l6LmrwqTHX
         OjLN1WQ8SVaWNfEBXKyEUOp0bDsvmhadnkpiL/u3CtHzYTjpNedISDfC0dD5U0kukwLG
         w9ZGsc3TTGs4xAHyM514WU5A9wxTgvHzb+/9eTQqo4KPsyvZlBP5z6bmvpKXAJWt3KTH
         BDuzxsqeGIWqlrmBFFcgtjFqA4XnOELFCGASG/mBZZP5ftQLpj/XhO+L/fcTEihSMpcl
         7pyq3XfpF5BaK3VR+DiCrxjsyTQlTSS+P31p+Cdvrxb/R/BsJXYBXMBGHmVJS4OLWAAw
         EiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UAVBoDevT9l3v6Yq4HsTsFUpmF8NbevOuwC5bYWFSWQ=;
        b=Dv7nKtOso/CNh4aYdbC4Omn0NaIrsNN8t8qWrSQdKMr75NnZhwhifC7wWRZKKkHcML
         EN+6C36bWjfLpX6Svd7g4OfE9kdkE4xwHZjtt07D09VUQv5jk1budC02cQc6lcNHZmvm
         R6V51Ocqzn030Z938m5ulQUaXxL/whWMLBdp7j83n8+EaZfJBbRi3M8/+8MZL04dk5Mt
         hlb1RUbC7TeTYz0V4mnnDwGSq9Kp0kACHVnjupg+XVaZOQjKc5yfEtzj6KgsA6bGafJd
         JRXekbWuvGSNsNj8L3thPWlanEiJN6of5ZO1FfsNm03TgGWT30vdgFUjovJ15IOBLuE4
         I6+Q==
X-Gm-Message-State: AOAM531AOdHOtuAk5zQgR62Kmv5kE5AhzD1bUsmf1ey2c0u/+gby7bOI
        poE8X45gVRoZr4H3LJoi8Mk=
X-Google-Smtp-Source: ABdhPJy19jYEOl6sx7SJm2Wm3Wdy/XAVvcrykV+8Mej2tLYRkj8qz6QC2RlptrTKGELkrQs2E9tFfA==
X-Received: by 2002:a17:90a:e287:: with SMTP id d7mr1821541pjz.170.1600217642302;
        Tue, 15 Sep 2020 17:54:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u22sm12458883pgi.85.2020.09.15.17.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 17:54:01 -0700 (PDT)
Date:   Tue, 15 Sep 2020 17:53:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] Input: omap4-keypad - Fix handling of
 platform_get_irq() error
Message-ID: <20200916005359.GE1681290@dtor-ws>
References: <20200828145744.3636-1-krzk@kernel.org>
 <20200828145744.3636-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828145744.3636-2-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 28, 2020 at 04:57:42PM +0200, Krzysztof Kozlowski wrote:
> platform_get_irq() returns -ERRNO on error.  In such case comparison
> to 0 would pass the check.
> 
> Fixes: f3a1ba60dbdb ("Input: omap4-keypad - use platform device helpers")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. None
> ---
>  drivers/input/keyboard/omap4-keypad.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> index 94c94d7f5155..b075f1af0305 100644
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> @@ -240,10 +240,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  	}
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (!irq) {
> -		dev_err(&pdev->dev, "no keyboard irq assigned\n");
> -		return -EINVAL;
> -	}
> +	if (irq < 0)
> +		return -irq;

You must have meant just "irq", right?

>  
>  	keypad_data = kzalloc(sizeof(struct omap4_keypad), GFP_KERNEL);
>  	if (!keypad_data) {
> -- 
> 2.17.1
> 

-- 
Dmitry
