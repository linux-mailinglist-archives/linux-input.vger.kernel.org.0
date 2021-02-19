Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A2231F438
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 04:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhBSDfI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 22:35:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhBSDfI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 22:35:08 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA04C061574;
        Thu, 18 Feb 2021 19:34:27 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id s16so2594848plr.9;
        Thu, 18 Feb 2021 19:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rh/oSk8woDzhMcxGvDnFOJ03XjGV7BI5BPA5myV9isc=;
        b=C3t0oHXN4wAB9/LdbmYTJWD2bVF4iWyvQVkSjdggb2MLyf8hB0BJdJIKTMY/leTncG
         tCsDlmbufPcKAMbiz4A/AXRlahZNZ0VdttbQe5jn8qP8p7Nezxw1XzaddaIsr/+LxIJ1
         V0wx9rkBNttA0CFcTmnBBhf19nib0CYLyqCf3djVKaeFNRu9i65JzH8QlsR54fVP7/6T
         jv8HHZT/5XORXkUdCU/NHhqcXW1XL10fMB5WiEPFYS0rJwPUl2oB0x1m/Usg0IXO1Lp0
         4TpDYUcXakbmivf3sxUzHIqPCATJZOjWI6Afgf1AdcB41vE2VOo7XJIoz8qqiFZqhwFQ
         wUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rh/oSk8woDzhMcxGvDnFOJ03XjGV7BI5BPA5myV9isc=;
        b=XJMg0swDEzmYrRRxsWy+AoXoaImpXZ/5sfVrsf5niU7HYdENYSkUGztdY/7+5FPJf6
         bEyxF72uD54ml2z20aM4KGbePJc9kRDNxw+4F7HWBILXtPHtyuWCG4kqDKrPqVjJrgkX
         wmpoLPIXsk5Y5079vinWqf/Kvt6S5W7xIglWpYGWQeSIrT+5PxGaoBFQhQe6WYcaT5YF
         zL6p0SFbXkt11vynMUAM5dOPTv0eqAXqF4qApp/csta00XWMreGiYVk80fc4eqdweRMH
         QvYySMYYEW5hsST9bdvFsXg22RbvEEUIkxAZ3CYryOIDdmaJjLLuGY98rel/4V+ZnmUz
         Vnmw==
X-Gm-Message-State: AOAM532JCCwFLyiZ1TM6EKUAM6KFnRJxJkRDjbZAoMikhBrLmj3iFVDS
        h7ziLZIM6Ir/Gtb0TjPkJVnL9lo76ms=
X-Google-Smtp-Source: ABdhPJz9JfX63LDo/ER51CrqgMOVZDMVMKLqAZuOYcxBN5lwpI+eRl2vCVilKJYslp/uMAaWQprIMw==
X-Received: by 2002:a17:90a:ea88:: with SMTP id h8mr7074671pjz.175.1613705667206;
        Thu, 18 Feb 2021 19:34:27 -0800 (PST)
Received: from google.com ([2620:15c:202:201:8d20:87b2:91b7:7f7b])
        by smtp.gmail.com with ESMTPSA id y23sm7465947pfo.50.2021.02.18.19.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 19:34:26 -0800 (PST)
Date:   Thu, 18 Feb 2021 19:34:23 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     rydberg@bitmath.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: Use true and false for bool variable
Message-ID: <YC8xvyj48UKonhXI@google.com>
References: <1613643835-1147-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613643835-1147-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Feb 18, 2021 at 06:23:55PM +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warnings:
> 
> ./drivers/input/touchscreen/zinitix.c:250:8-9: WARNING: return of 0/1 in
> function 'zinitix_init_touch' with return type bool.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/input/touchscreen/zinitix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index a3e3adb..acb1d53 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -247,7 +247,7 @@ static bool zinitix_init_touch(struct bt541_ts_data *bt541)
>  		udelay(10);
>  	}
>  
> -	return 0;
> +	return false;

This is incorrect, as earlier we try to return error codes from this
function. It needs to be changed to return int, I'll take care of it.

Thanks.

-- 
Dmitry
