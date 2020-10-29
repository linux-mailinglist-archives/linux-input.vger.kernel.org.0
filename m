Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2406729F3A3
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 18:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgJ2RxB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 13:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgJ2RxA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 13:53:00 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A2B8C0613CF;
        Thu, 29 Oct 2020 10:53:00 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g12so2963501pgm.8;
        Thu, 29 Oct 2020 10:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7zoU5cUE4YpN/HwZnaDsQKl1Im3HzToC2Y9JqAnH86I=;
        b=eCsRrQC1KdcbB1iea3lgRshQ5gARYCmKP1i9kSZ9wGJZCEat/C2TfKNH5WEFxBZWvc
         SpxsZxrUkChtqKiARch5VeXw6XCsd7MFztIQI/mjTx3TN0V8/oHMMjtv5VTTWYzcFkJ5
         JV+K6S3B1QOy5e97XGjB6EMfzkvmUeHzh5/IaS+r/XnHniWFRqQeXWDzIeBlLIF3knZU
         mGHj9RgmlrS3gjpiacnhR1NrKOEaz1H99ljtpxoeilihJF3udOn/GL50FqDj6yW2iJKN
         SJHBlMEPau6+WNfyyGmL28T5IjKOyroIHOjLPaIqKDxbz/JYzEoL3rzxtbc0mTJ8Jmyz
         khoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7zoU5cUE4YpN/HwZnaDsQKl1Im3HzToC2Y9JqAnH86I=;
        b=Mv34hvxQiDbT5AkBM6vyQvkxDiDCzcx6dKzDfsZymKjqflzhrhommV0m3CchDlq8ap
         hxqAVYn4MOSURlk3WXWOBEk2wmiZ4c1scR/RxRdFkhbMtqSu4qF/N/uIzD3+qrWOyizm
         kTDYCqfHQfLjkEp1xNR5cF6vvtwBKgRlwUemxvSEH5xRhrJ1p9FZM+4yJH304acL0ibY
         N1Suregpb/oapyOZ/crNUAMQ74Ai8gf4TuhHR/utPuMRi8Vco9rW9Ry+GLwF5qB1+IwF
         pgeb9P4RZKSwgOVXB/1X0fqjaNvl5nvcQM3GFxPWVQrKv1aZlzhR8xavm8UArc7xDG+A
         Fsww==
X-Gm-Message-State: AOAM532LIsNDdRbo+KcSpFmaM//DnZVcXOPIiE4jpjmCP8giyKPIYRtL
        O9F6lFCnIQG3/Aw+CmC9SDo=
X-Google-Smtp-Source: ABdhPJydK0HnwSa4MJ3KkR6A7sszg89jnvRWzJbNu4AnXv6Wnxu8Bs7nanBBvf8nW9GmEq4npY6dWQ==
X-Received: by 2002:a65:6808:: with SMTP id l8mr4914707pgt.50.1603993979882;
        Thu, 29 Oct 2020 10:52:59 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id l82sm3730669pfd.102.2020.10.29.10.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 10:52:59 -0700 (PDT)
Date:   Thu, 29 Oct 2020 10:52:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] Input: pmic8xxx-keypad: remove unnecessary
 CONFIG_PM_SLEEP
Message-ID: <20201029175256.GD2547185@dtor-ws>
References: <20201029075236.228335-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029075236.228335-1-coiby.xu@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 29, 2020 at 03:52:34PM +0800, Coiby Xu wrote:
> SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Doesn't it result in "defined but not used" warnings if you compile
without CONFIG_PM? I believe if you are dropping #ifdef guards you need
to add __maybe_unused annotations.

> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/input/keyboard/pmic8xxx-keypad.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/pmic8xxx-keypad.c b/drivers/input/keyboard/pmic8xxx-keypad.c
> index 91d5811d6f0e..c04ab04331b2 100644
> --- a/drivers/input/keyboard/pmic8xxx-keypad.c
> +++ b/drivers/input/keyboard/pmic8xxx-keypad.c
> @@ -621,7 +621,6 @@ static int pmic8xxx_kp_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int pmic8xxx_kp_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -661,7 +660,6 @@ static int pmic8xxx_kp_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static SIMPLE_DEV_PM_OPS(pm8xxx_kp_pm_ops,
>  			 pmic8xxx_kp_suspend, pmic8xxx_kp_resume);
> -- 
> 2.28.0
> 

Thanks.

-- 
Dmitry
