Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3637131D4A9
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 05:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhBQEim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 23:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhBQEic (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 23:38:32 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19F4C061574;
        Tue, 16 Feb 2021 20:37:35 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id b145so7648213pfb.4;
        Tue, 16 Feb 2021 20:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=44ShtG5WJ+pqs/ArcKyFGnYEiuuIxdNBPE7wV3aeDwc=;
        b=gpCCGIddm/B6rmV2KiGKKhOyTyGmKO8Rf3M46vVJUJktaxCP341TMqZqyowgsbEU0k
         MhVEoT/mH7EvAfKJ98e0XKALYQCYYYA98XmNJo5s1Xu6g/uZkGG3UJdEXfDFLSJ3GvCx
         ZDeYeZUR5yJXj6Hxvbbb2T32/Gqb86SfRhK5XTMn9DJDNgt9yZ3YLVWBaAmIxXsXuUEg
         gc943cCjChgOhnk6GavWx/uGBgbyf1aO0pozaoyS3GL6RvAOo3GXd38QiYt7vP8VtNiK
         2aUFpsf/C1gjzTSD0c5QoI7X3+cvuZ0ozPHhnJy5/gP4IcOSFd2q4jmSp6Y1v7G/whh4
         efIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=44ShtG5WJ+pqs/ArcKyFGnYEiuuIxdNBPE7wV3aeDwc=;
        b=ZRmu/F5ZNWIAB8N/iiU1BdMjv1x2SZhicXIzAASTSzlKwKxYcenF4batQ+YIODFBHL
         poF1822BC9BD+x34TmuM9C4prHBhEroavJIeQV7QHbnClE+ReP4/V0gjD5JCSaZgH2V6
         sBq1oZDz7DfeWMxS8AHRJIU1iLRB+kqKPgKVxYgSQ6ZRV85+VoyMgwwYz5vjc0gblth0
         zPCa/Usil9ZzjFZIjsLK6TdQXY94X4NhBJa/SpwcfTIZ8WmptEzL7Tbk8BZPsRDhxY2e
         OjCMQ4VcyWfODiWC0/4ocDQ0KIrJaWzmmqsCg/xD4GXPLe2o1Vq0IeLILjtDVWF5FMPi
         jG8A==
X-Gm-Message-State: AOAM530XUr12ow1YIoyooUHu2p/iZSJfD0XJAV7ebiQaPDNj4oSoTUc9
        lOtdYknYZU3IjTVIicJKcBM=
X-Google-Smtp-Source: ABdhPJy2PvurZVvJhZ1T4WQy9t31Imb9+EiUQLw8xeER4wgKDn7/uXQvRPpdN+MJMWTv/ZgDfq/2SQ==
X-Received: by 2002:a62:5bc4:0:b029:1e7:5b23:1d59 with SMTP id p187-20020a625bc40000b02901e75b231d59mr23231877pfb.0.1613536654732;
        Tue, 16 Feb 2021 20:37:34 -0800 (PST)
Received: from google.com ([2620:15c:202:201:21d3:2abc:ad8c:8b3a])
        by smtp.gmail.com with ESMTPSA id t4sm527239pfe.161.2021.02.16.20.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 20:37:33 -0800 (PST)
Date:   Tue, 16 Feb 2021 20:37:31 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Shaun Jackman <sjackman@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: elo - fix an error code in elo_connect()
Message-ID: <YCydi5tfV/l0NGHw@google.com>
References: <YBKFd5CvDu+jVmfW@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBKFd5CvDu+jVmfW@mwanda>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dan,

On Thu, Jan 28, 2021 at 12:35:51PM +0300, Dan Carpenter wrote:
> If elo_setup_10() fails then this should return an error code instead
> of success.

Thank you for the patch.

> 
> Fixes: fae3006e4b42 ("Input: elo - add support for non-pressure-sensitive touchscreens")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/input/touchscreen/elo.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
> index e0bacd34866a..4b2fb73da5e2 100644
> --- a/drivers/input/touchscreen/elo.c
> +++ b/drivers/input/touchscreen/elo.c
> @@ -341,8 +341,10 @@ static int elo_connect(struct serio *serio, struct serio_driver *drv)
>  	switch (elo->id) {
>  
>  	case 0: /* 10-byte protocol */
> -		if (elo_setup_10(elo))
> +		if (elo_setup_10(elo)) {
> +			err = -EINVAL;

Ideally we'd propagate error from elo_setup_10() and underlying code,
but we are not ready for it, as most serio code simply uses -1 for
errors. However I think that -EIO would suit better here. Please let me
know if you disagree, otherwise I'll fix it up on my side.

Thanks!

>  			goto fail3;
> +		}
>  
>  		break;
>  
> -- 
> 2.29.2
> 

-- 
Dmitry
