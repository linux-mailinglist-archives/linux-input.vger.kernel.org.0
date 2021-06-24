Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB84C3B2457
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 02:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhFXAvM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Jun 2021 20:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFXAvM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Jun 2021 20:51:12 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4FCC061574
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 17:48:53 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id y14so3229609pgs.12
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 17:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3wQ6buHRGFhucdmZCxtJr200Yac6dAbyNtXEoOoXMfE=;
        b=QfhOkSsUxs7bqkA9tvKA6dfwrxOeExXdjDYKabDUcnmbEvx5JOJA74fpqfhrSA/+2V
         BKcXlgye4q3OvGiGEki5XxwXHICnmMZ1AXM1ngQopwh4ehvS/QySa2iCVfGZXdtlaPzZ
         vncjWVxcAt1hvhhNEG94LgTp6Uy/V0bddZWznDrAHtd2BYcjXKafZsKcmfRBmNGfBZIu
         9rggORVTs5LG9zUT2VN919Y9X7iBScx4IG+YzNevsaf7AURKyKQsbPKZ0opZpYkotaYy
         WysxaDZUBS+JU4w0FjLST8rTTjjsA94HfHTbo9yTqWK2+hS9T5znZfX50kyXPLI5Kfb5
         yxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3wQ6buHRGFhucdmZCxtJr200Yac6dAbyNtXEoOoXMfE=;
        b=UsHFnQsOEA9QzwizlA2CPf+5Kl8uYiLpijfrKvFiK0UbK+Id3+kyvU9tcnjjLomP5z
         Y1xp5q2lVqJUwEzO6aK8LtPP8fHyHJxPJosykhL/ku4AyXwzzqK0Xqr/w5OlFu8My5rP
         bVMLWxl1qpNttPE2lf9Rj4ZvHU/nehBvalZuafM3kCe0Y92QeOspmb740pqt3RCWCq7u
         q+UXbXfyMQ7XsolLKjNbSPLgZW9mUMbqCm9JRiXs7/mBZKGgbJ3pETUhRTw8Q1MA1to8
         L2C4cHGz75wd2LZg97z01dvUPjsMLnDGdnyBQCIvcPdbQg1+9cN9HCtcaVxD8Uhza5yX
         DKXw==
X-Gm-Message-State: AOAM531TwwRlb5IT54Rc8GT9QtWRncc6jNkhmgjncjU7A88IFYd7E406
        T1svWepU6P/35h8whPfZJ/E=
X-Google-Smtp-Source: ABdhPJzSY5CVInJ/SkvKR0HbwO3uLH5AOFSbGODkEzmMtF+n7QmypqbRFR8NDQ7TENg5sD2RsSkLxQ==
X-Received: by 2002:a62:b616:0:b029:303:aa7b:b2e0 with SMTP id j22-20020a62b6160000b0290303aa7bb2e0mr2346988pff.21.1624495733037;
        Wed, 23 Jun 2021 17:48:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:db68:d728:8b76:2cb9])
        by smtp.gmail.com with ESMTPSA id 190sm290449pgd.1.2021.06.23.17.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 17:48:52 -0700 (PDT)
Date:   Wed, 23 Jun 2021 17:48:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: atmel_mxt_ts: atmel_mxt_ts: Fix event loss
Message-ID: <YNPWcXkG4gCBmmeT@google.com>
References: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org>
 <1624456597-9486-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624456597-9486-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 23, 2021 at 03:56:37PM +0200, Loic Poulain wrote:
> If both touch events and release are part of the same report,
> userspace will not consider it as a touch-down & touch-up but as
> a non-action. That can happen on resume when 'buffered' events are
> dequeued in a row.
> 
> Make sure that release always causes previous events to be synced
> before being reported.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 807f449..e05ec30 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -990,6 +990,13 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
>  		input_report_abs(input_dev, ABS_MT_DISTANCE, distance);
>  		input_report_abs(input_dev, ABS_MT_ORIENTATION, orientation);
>  	} else {
> +		/*
> +		 * Always sync input before reporting release, to be sure
> +		 * previous event(s) are taking into account by user side.
> +		 */
> +		if (data->update_input)
> +			mxt_input_sync(data);

That means we sync for every contact release, whereas I think ideal
would be to only sync when we observe touch-down and touch-up in the
same slot.

Let's also add Peter to the conversation...

> +
>  		dev_dbg(dev, "[%u] release\n", id);
>  
>  		/* close out slot */
> -- 
> 2.7.4
> 

Thanks.

-- 
Dmitry
