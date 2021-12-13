Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76C7472025
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 05:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbhLME7B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 23:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhLME7B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 23:59:01 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FF6C06173F
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 20:59:01 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id r138so13484999pgr.13
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 20:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SXDgu07HkSzPMhz9M2CgCN1Wgao7sWOPQpTB0uSjGBY=;
        b=CVD7DLPrZA1STsX2QqL7AKvjb+2IBEpC+hTUp0sENyw3oQpGlv2z7XrkyXYjQO2Gvg
         p52PCF5TEgeaOV+VkT8Tv4qZeW7P2tjv6FbvdUhQ4yDHFoaoOPH6RdWZkB22/h/MCMbS
         dbIM8EwzBfaMGDDknOiSFSf75z98czWOZB31d02LU1YMrWqxPkybrkYZ9AB8NYpUSwxx
         MmNdTn3PW0TSFBR7/2F8WTMIDPhj9NimA/r0gCLf0YVln31wVdb9S39CBrzCTfLJOV7b
         Z/D+JJE+H0Wl32b71OwFsijkb0oXd2w75rXFD/YoA3RLyMGjwj0Wj6ZgcTC+j1bK3CoT
         pCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SXDgu07HkSzPMhz9M2CgCN1Wgao7sWOPQpTB0uSjGBY=;
        b=B18nlP39akPM4UkaQi4cZSoIFapmRxIwxdwattQBj7ioSylekFSIQ2QgxJ78aeMF9k
         eccRK/1QiZrdyrEakYn1XGCNGwIpy7ZJmZSXpfkr+qo9HH0aYkgGWnKWIEKgTuL9UC05
         ag0oeRjcvuUjkXhxafi4VOrBkeBCx8HPnTXvko5gX2TM6BENnjHKmo+gOe7uaUGy3KNt
         oJfIaBhiViYUO6s6F6WFaphZw9EW+x9Qhk0LTNAQIZKPDx25dS/JwC/6+UfkQ9LHIE8Y
         IXAl+4zxr4q1xW3xzWpq1gT8G0xW6Vwfu4uapbbS4Z9A6vpa1+hEjdHjksVx7Gd6nbd5
         kopg==
X-Gm-Message-State: AOAM532jG/UDYANJ9eXJfgKBzyNZQnVbugBMUyQzZZMynqbFfWGk4Bsf
        Ch971zgdOyGM135Mlkcg2kM=
X-Google-Smtp-Source: ABdhPJyzCBB3uUfyKv4tmVkn+xXv7QAWGlTaOZFeexe4UBa6CmnGBwqwukiK57/dpoSR3Z/2vrFfXg==
X-Received: by 2002:a63:da17:: with SMTP id c23mr434211pgh.622.1639371540549;
        Sun, 12 Dec 2021 20:59:00 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e537:8856:7d40:7c6])
        by smtp.gmail.com with ESMTPSA id o2sm11209572pfu.206.2021.12.12.20.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 20:58:59 -0800 (PST)
Date:   Sun, 12 Dec 2021 20:58:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/5] Input: Add input_copy_abs() function
Message-ID: <YbbTERA000U9bPPR@google.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
 <20211212124242.81019-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211212124242.81019-2-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Sun, Dec 12, 2021 at 01:42:38PM +0100, Hans de Goede wrote:
> Add a new helper function to copy absinfo from one input_dev to
> another input_dev.
> 
> This is useful to e.g. setup a pen/stylus input-device for combined
> touchscreen/pen hardware where the pen uses the same coordinates as
> the touchscreen.
> 
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/input.c | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/input.h |  2 ++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index ccaeb2426385..60f3eb38906f 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -526,6 +526,40 @@ void input_set_abs_params(struct input_dev *dev, unsigned int axis,
>  }
>  EXPORT_SYMBOL(input_set_abs_params);
>  
> +/**
> + * input_copy_abs - Copy absinfo from one input_dev to another
> + * @dst: Destination input device to copy the abs settings to
> + * @dst_axis: ABS_* value selecting the destination axis
> + * @src: Source input device to copy the abs settings from
> + * @src_axis: ABS_* value selecting the source axis
> + *
> + * Set absinfo for the selected destination axis by copying it from
> + * the specified source input device's source axis.
> + * This is useful to e.g. setup a pen/stylus input-device for combined
> + * touchscreen/pen hardware where the pen uses the same coordinates as
> + * the touchscreen.
> + */
> +void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
> +		    const struct input_dev *src, unsigned int src_axis)
> +{
> +	/*
> +	 * input_alloc_absinfo() may have failed for the source. Our caller is
> +	 * expected to catch this when registering the input devices, which may
> +	 * happen after the input_copy_abs() call.
> +	 */
> +	if (!src->absinfo)
> +		return;

I'd probably check if source device actually declared EV_ABS/src_axis
and yelled loudly (WARN?) in such case.

> +
> +	input_alloc_absinfo(dst);
> +	if (!dst->absinfo)
> +		return;
> +
> +	dst->absinfo[dst_axis] = src->absinfo[src_axis];
> +
> +	__set_bit(EV_ABS, dst->evbit);
> +	__set_bit(dst_axis, dst->absbit);

input_set_capability() ?

> +}
> +EXPORT_SYMBOL(input_copy_abs);

Thanks.

-- 
Dmitry
