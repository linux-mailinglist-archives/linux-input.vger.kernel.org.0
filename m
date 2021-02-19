Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4361C31F42A
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 04:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhBSDS3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 22:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhBSDS3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 22:18:29 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D046C061574;
        Thu, 18 Feb 2021 19:17:49 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id b8so2561106plh.12;
        Thu, 18 Feb 2021 19:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OwNV1ruvrzmTZHtKgrE8lgFC0d23DBddIr+rAQj3fCA=;
        b=mQVOnq7krNIwtuspcWotiXg5heQPESU1irjCJKrU1ZtWJvLEO6jBJeWwIUIORpQ6tH
         7D+TeDxnfet25IIiZr0F1aAgjoZTMHeK8qsviNcF3zyBdjodrClDssx8AI8ixMKZZo42
         otffnoTunn14v3Zh5pxhuOdzB5eoAhXL1TBcLTqJkoGPkpJdcgjGVQsRLu6MgBpFNbAA
         n5mk4y26kht2t/OmXeehMcFdBp1fnxflbwsv/3slI2X2Kz9xDcO4aozgwA18RSix9s5D
         j58yYanvC8U/qwaMdIspKo8NmBZxm2JbidJVcn64Oyw5cVIYotXgRp7tbcYIWd73ugm0
         RYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OwNV1ruvrzmTZHtKgrE8lgFC0d23DBddIr+rAQj3fCA=;
        b=bFIiKP2DiPIxyJqGvcbVqjr0RKvsI9D23vVOBbqffx4v7iBCbYQQV6yAkRUX1EMVru
         tQq0b73IipZ1NaAXRxPtcAmI/JWekN2Sr/APzv6jFpzygNN1/71BZk7r/7252TyfE21b
         KKKedqzjqvO/PlJpHNP+QMZfHUsKHgzeiPYlLHILvvipqYqqjWsrVglxuMIJguTfxdnt
         JzTiGzwLVNhPff1W1WRr9527534UnNCd3/QzfHVrkyPQ5q9O+syIcj+Fn02oOjEkHgIt
         fLxLfDBZTucwcopmh4CisEXZ22+CME0X21JdGS7NeVss2QDoO0yGKBOJ3CrD0gNkgiYN
         R37w==
X-Gm-Message-State: AOAM53256Av7LCPvsFKtJvP/+Zwxt7GTEM8gdFeGGfmE7rzxALggoj0T
        UH/+WWM3fqndmHCQcqyRKUk=
X-Google-Smtp-Source: ABdhPJxcaFa410Ckz6MrT2jZ1L/de+5zRk4l6zVCRdamgk6nWQVdwrJsbyrFtsvXY7xe/3XJYmvRRg==
X-Received: by 2002:a17:90b:1093:: with SMTP id gj19mr6909241pjb.40.1613704668174;
        Thu, 18 Feb 2021 19:17:48 -0800 (PST)
Received: from google.com ([2620:15c:202:201:8d20:87b2:91b7:7f7b])
        by smtp.gmail.com with ESMTPSA id b15sm3521500pgg.85.2021.02.18.19.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 19:17:47 -0800 (PST)
Date:   Thu, 18 Feb 2021 19:17:44 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: joydev - prevent potential read overflow in ioctl
Message-ID: <YC8t2EHKRSF7DwmF@google.com>
References: <YCyzR8WvFRw4HWw6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCyzR8WvFRw4HWw6@mwanda>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dan,

On Wed, Feb 17, 2021 at 09:10:15AM +0300, Dan Carpenter wrote:
> The problem here is that "len" might be less than "joydev->nabs" so the
> loops which verfy abspam[i] and keypam[] might read beyond the buffer.
> 
> Fixes: 999b874f4aa3 ("Input: joydev - validate axis/button maps before clobbering current ones")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for the patch.

> ---
>  drivers/input/joydev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> index a2b5fbba2d3b..750f4513fe20 100644
> --- a/drivers/input/joydev.c
> +++ b/drivers/input/joydev.c
> @@ -456,7 +456,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
>  	if (IS_ERR(abspam))
>  		return PTR_ERR(abspam);
>  
> -	for (i = 0; i < joydev->nabs; i++) {
> +	for (i = 0; i < len && i < joydev->nabs; i++) {
>  		if (abspam[i] > ABS_MAX) {
>  			retval = -EINVAL;
>  			goto out;
> @@ -487,7 +487,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
>  	if (IS_ERR(keypam))
>  		return PTR_ERR(keypam);
>  
> -	for (i = 0; i < joydev->nkey; i++) {
> +	for (i = 0; i < (len / 2) && i < joydev->nkey; i++) {


I think we also need to make sure that len is even. Do you mind if I add
the check at the top of the function to return -EINVAL if it is odd?

>  		if (keypam[i] > KEY_MAX || keypam[i] < BTN_MISC) {
>  			retval = -EINVAL;
>  			goto out;
> -- 
> 2.30.0
> 

Thanks.

-- 
Dmitry
