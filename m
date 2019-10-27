Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCC1E64CA
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2019 19:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfJ0SP4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Oct 2019 14:15:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43748 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbfJ0SP4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Oct 2019 14:15:56 -0400
Received: by mail-pg1-f196.google.com with SMTP id l24so4923702pgh.10
        for <linux-input@vger.kernel.org>; Sun, 27 Oct 2019 11:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bi8F8P1/sNQ5fKt4svCxodoGs825HqWDYybdDNwDs2w=;
        b=q+P+FU5qaPJOdhzW19U1IVhuJykmmlQHzxUeaHG2Gx1z1zYX2KJtzf10y7rA1nHaoG
         KGz6cWNuV1roOOR+1W9rVEEnKZl37/tE0vIptl7tOeTTxhGHn0ImbqxGcxOFp6KUmLWZ
         6YX11rMpsCHXbCg0vff7SHHYwRFOEw868PKibVRIL1QRniSRVfLjlUHhA8aj3x0wnwiO
         jHeQHuzuII1L92+zq6s/d2qZkP41W6lleinfU6juCkagD8nuORAevdCIgJJuE6g0IGG+
         H0H3w97TlSBTFtkSjiZmQ7aTCV3SC7d1NQZl1SFRGCH96Evgs9WxVUVGNwNGYKXmvLTD
         nh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bi8F8P1/sNQ5fKt4svCxodoGs825HqWDYybdDNwDs2w=;
        b=CbHLo4dymi0nPQeJm1L8cwkDcv2W+qYwb3tCG/2VjjECiO1kTgw2qJR8J73Eahn1K8
         oh7+VJVOg3f6WwscVvpJN/u5ZA9N72VwrJYuU8XqQ4FPWXFz8YQqajyq7sL0xb1hkh1v
         VAxCt+/2ibULCRDMOi3v2lHN1WGmk77ZI7gAMXtw2QQJjQrTJDK0OYNLLDUqX0lCA22u
         RtMmV8ECCB0BhzHI0R/c6cL9Jw9ySdgqIrUdBrYQYtrSstWxFG3K7Ed/l83X7yCnV7uy
         dii+9gvYyZA1mZr6pk09K+12j+ADSR4Qi4NozcX3Ltf+bMi1CymSoMLKK4It1uVk4ALm
         ekAA==
X-Gm-Message-State: APjAAAVa5J424jGHWGiAtnR+QNBSGkdGZzUpQpoZU2SGNrd/lBebbY1M
        5ZjKs9ghUQSp0VZX1Ck/YO4=
X-Google-Smtp-Source: APXvYqy3sfnpq/UKN45MFG+3VAE9A7Ksexk3qM8UIwg8+Lso9at/IAIxIBXLXqOc1xUqum0f7Zt89g==
X-Received: by 2002:a17:90a:3be4:: with SMTP id e91mr1655788pjc.56.1572200154031;
        Sun, 27 Oct 2019 11:15:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o5sm10360922pfh.48.2019.10.27.11.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 11:15:52 -0700 (PDT)
Date:   Sun, 27 Oct 2019 11:15:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: s3c2410_ts - remove unneeded gpio.h header
 file
Message-ID: <20191027181550.GE163068@dtor-ws>
References: <20191026185958.24158-1-festevam@gmail.com>
 <20191026185958.24158-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191026185958.24158-2-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 26, 2019 at 03:59:57PM -0300, Fabio Estevam wrote:
> There is no gpio functions used in the driver that is exported
> by the gpio.h header, so remove this unneeded header.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/s3c2410_ts.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/touchscreen/s3c2410_ts.c
> index b346e7cafd62..82920ff46f72 100644
> --- a/drivers/input/touchscreen/s3c2410_ts.c
> +++ b/drivers/input/touchscreen/s3c2410_ts.c
> @@ -13,7 +13,6 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/gpio.h>
>  #include <linux/input.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> -- 
> 2.17.1
> 

-- 
Dmitry
