Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEAC92F2785
	for <lists+linux-input@lfdr.de>; Tue, 12 Jan 2021 06:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbhALFIu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 00:08:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbhALFIu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 00:08:50 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D8EC061786;
        Mon, 11 Jan 2021 21:08:10 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y8so759817plp.8;
        Mon, 11 Jan 2021 21:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P6VkIs8Z9QcqFUhAseTLLApJ3FGgMyLE0KYVlCffRwo=;
        b=GjydUO3i/ZcQI60CsRb5319uTp8zN70+HAjUKxruILdh6s2g1uMhhGVaTywDWxVUvQ
         TjSPCL9LNBw3wg7bh2e+SnnJHDdgsFE/2U4RZFFvFFy8as4SQImMdAVB7y2w+OjRYZ+s
         WvU0L/b9NuVCrg4zWirHAOQyhUj16xqvjflf76+ZcU5TgbgxFXHdtNXEGkT59rXYba3a
         NQ29bYfPHZzJG5S0XulTh5h8oHKNxrI8MmvP/MsMbJPLZBLDInCdBuGy5EydQ3/Srw2z
         0Nql2UIYg1O9U+oL/g2Ptdc9Tqnf35Bq/kWvrgBsAMUGZ2B6+RRc/Js0PtkGB0gc/eRe
         0XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P6VkIs8Z9QcqFUhAseTLLApJ3FGgMyLE0KYVlCffRwo=;
        b=ZWMl9suQOCAhtx62dds54Ec1/kz0a9peXBgIiKbXAvUS28MSDUU++AdyF4ADDftkG0
         PmOQJChjkfAdpeoG9BjfTwMvVm7QwJ3yGHE+ixTWGihr1xRHdKxgfwadHM84iGlL/o0p
         aGkLlBgGlyPKatWlZg8VsS4jhqecCc49Jaw1GreajxA5LHqVfICZWeyyHGE4RcE2dp5Z
         gOQouKFbgNXRlehMDydHHiBMYQagfEoKiptrV+Rfi7AAbWgLLQPIeOoiKODuF7nEa6L2
         NviYNWYSDq+NNOQvdbjFZC4GE/U3HXyTJSos6axfbSjuQzaVnHiKaT521sUGs5xdDayb
         5mHA==
X-Gm-Message-State: AOAM533D7zdUiYIGAPDzphf4/vpwlgEoye0tkFEgD0BWVmWLl+oKLLoe
        AK2l39VfufdYrSuPUXm4AkE=
X-Google-Smtp-Source: ABdhPJxoEBeHVu15OUO+CwBO028RDuQgVgmRzsnK78KZGGpFOR+ogTH4vjhkDJhm/ysvM3u13puaCQ==
X-Received: by 2002:a17:90a:a608:: with SMTP id c8mr2377355pjq.61.1610428089565;
        Mon, 11 Jan 2021 21:08:09 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h1sm1691512pgj.59.2021.01.11.21.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 21:08:08 -0800 (PST)
Date:   Mon, 11 Jan 2021 21:08:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Radim Pavlik <radim.pavlik@tbs-biometrics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] input: auo_pixcir_ts - add missing check for gpio
Message-ID: <X/0utdv13PT0ipTs@google.com>
References: <20210107093217.2499-1-radim.pavlik@tbs-biometrics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107093217.2499-1-radim.pavlik@tbs-biometrics.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Radim,

On Thu, Jan 07, 2021 at 10:32:17AM +0100, Radim Pavlik wrote:
> The of_get_gpio() may return error, so check it immediately. The old
> code might fail with EPROBE_DEFER which was masked by the
> folowing gpio_is_valid() and returned EINVAL.
> 
> Signed-off-by: Radim Pavlik <radim.pavlik@tbs-biometrics.com>
> ---
>  drivers/input/touchscreen/auo-pixcir-ts.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
> index c33e63ca6142..8f3cfd743bdd 100644
> --- a/drivers/input/touchscreen/auo-pixcir-ts.c
> +++ b/drivers/input/touchscreen/auo-pixcir-ts.c
> @@ -479,12 +479,16 @@ static struct auo_pixcir_ts_platdata *auo_pixcir_parse_dt(struct device *dev)
>  		return ERR_PTR(-ENOMEM);
>  
>  	pdata->gpio_int = of_get_gpio(np, 0);
> +	if (pdata->gpio_int < 0)
> +		return ERR_PTR(pdata->gpio_int);

Hmm, while this check might make sense it definitely renders the next
one unnecessary.

BTW, do you have a device that uses this touch panel? This driver could
use more improvements, such as switching to gpiod API and generic device
properties, and dropping the platform data support.

Thanks.

-- 
Dmitry
