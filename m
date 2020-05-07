Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498811C9B1A
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 21:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgEGTaV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 15:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726515AbgEGTaU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 15:30:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8BDC05BD43;
        Thu,  7 May 2020 12:30:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d184so3500266pfd.4;
        Thu, 07 May 2020 12:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wT+mRFdn10BsX6lr+zvdnj+FlyAlUAG454zQtB7yLh4=;
        b=ISHzewaDihZtLo69vhscvBrzu5TSpNcrAqC8XTeHSFmzmLskKKNP9+JyWpZcMTy0Q3
         XhmOPkZftMvsSN23wHjKRvaa3uMwlL8QJ41bN8XQ3wKGh9gHynk4n+amimeBZvA9FPZy
         jgw0MHBKfONAIM64HzJ/Al9L+azKLTRiuB/z6Yaw42/kFwB40x4bch+YShGbKzKMx676
         ZkX7yHoNS6ELrgjjZroV/WSvBTcYPVvVSz7JKG2ZGRamw307aF2DTvISry0Ndp0hGayv
         7R0OhWzh27bg/TMG/eysVLtQbSyPCY+VbJlA/JI5E3QALXCEzCkzXPV4yjsGRmn7Uznl
         SAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wT+mRFdn10BsX6lr+zvdnj+FlyAlUAG454zQtB7yLh4=;
        b=A99mKOn+11+j1McRQ8HAGz8v8JYZEwWdcYHTcZy4d0qUxFr1Z0A3ZHHOKbwGdkpdxo
         3MUPiPdVthy+Qg2h03/VqfWfM/LA7Dg54GyUamSXDVJRBxaQYL+GcIcrEl99xadblrXj
         UGcHYnae7KLtw7EiXXqI5DGn4pRN84LJIUFVUQnqUo+5P3GDEVW1aZgA/T7jpIUyLQF+
         rCy1Bd6wNkZrWbP9QRSohOCWrD2Z/ougvGBSclj6fwMBLTYNwEcPCUslJWZfdLxRiJgq
         lNrwwqO6PaOfEgzgTKSsDq/BU2nWz3/PYs2lNiAZEWeWx2jvkKHPqoYImaXsWVpxbEiR
         E3Xw==
X-Gm-Message-State: AGi0PuZ+F2pMdYbEkYXRiZYmXxb3lFf0eWAbTH7f+5pDkAGcmzxHEj5t
        qy382Uo11xqmpPO38I+rKTw=
X-Google-Smtp-Source: APiQypIQxy+/cA0vId2s+7hdgtueCxQZ/IiM5LLjgeUjNQ9AeHkkA/LYYMiAAamTg3sXHVYKgnEMzg==
X-Received: by 2002:a63:4503:: with SMTP id s3mr12964794pga.85.1588879820170;
        Thu, 07 May 2020 12:30:20 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t80sm5811824pfc.23.2020.05.07.12.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 12:30:19 -0700 (PDT)
Date:   Thu, 7 May 2020 12:30:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: Replace zero-length array with flexible-array
Message-ID: <20200507193017.GL89269@dtor-ws>
References: <20200507185347.GA14499@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507185347.GA14499@embeddedor>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 01:53:47PM -0500, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> sizeof(flexible-array-member) triggers a warning because flexible array
> members have incomplete type[1]. There are some instances of code in
> which the sizeof operator is being incorrectly/erroneously applied to
> zero-length arrays and the result is zero. Such instances may be hiding
> some bugs. So, this work (flexible-array member conversions) will also
> help to get completely rid of those sorts of issues.
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied, thank you.

> ---
>  drivers/input/keyboard/applespi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> index d38398526965..14362ebab9a9 100644
> --- a/drivers/input/keyboard/applespi.c
> +++ b/drivers/input/keyboard/applespi.c
> @@ -186,7 +186,7 @@ struct touchpad_protocol {
>  	u8			number_of_fingers;
>  	u8			clicked2;
>  	u8			unknown3[16];
> -	struct tp_finger	fingers[0];
> +	struct tp_finger	fingers[];
>  };
>  
>  /**
> 

-- 
Dmitry
