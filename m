Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C39400A36
	for <lists+linux-input@lfdr.de>; Sat,  4 Sep 2021 09:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbhIDGzs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 02:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233068AbhIDGzr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Sep 2021 02:55:47 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075F3C061575;
        Fri,  3 Sep 2021 23:54:47 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so1051105pjt.0;
        Fri, 03 Sep 2021 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0t2QJrjw4Lw/OGtiF8954HkIrjujVf75m31WabHpThg=;
        b=gSFaEDHcDfDucFW7WmmyPeYRW6Pk6tJBSmwu7Xj831pIwAtCQGBUlgxQe6t1g4QBHg
         ieA/cYNmbnR7xpkkN7zaCubFjIrAkBE8Z1Z8eQt3FrMJSRHG9Fy4Tg4Gt5twCQEkOQGY
         lJwNUAO0+yjKBKL5VRsXT7mqMEqA3xGHz5HL1GeAM3piFqBphtql49vWHzKeo+HSPOQR
         0hImHq2QndGBVWdjd9SfCode7ZVIl7hiLkw1ZwTXJxYOXLHwMJVgJSx2p+SdIA6PT6FC
         06Qm/OaqEQ0vcw2AKmClTQE4/YlHkhIAmLv7+R01ux9xqfP6AvnFGrfLKwL4LDCN/jyn
         E4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0t2QJrjw4Lw/OGtiF8954HkIrjujVf75m31WabHpThg=;
        b=CamKXN4Bx1sRSKWIPSwQM2XZnesDWJ/50SzLVV9GsTImviKJ+/qd5mEX1ydaFylW7f
         ca2KpafiGLCr5uZA7wiu/kl3Nnju/nAxfR+pU9S8rNQNYFVP+WMFcY84gIiYhm9/zQSI
         nifmHAem8Dai7w81tBXH6mqYI4v8CKmESD/py2ZTE+Yo2oKMmn+d2GhRSgVcsJjawLZI
         8MzZPFuPOCM4Mu9hSzhk1OV/oT7lw11Z7HFpBqkfGQ14QLI07rpf1Sc5wsp8Yf3Khfix
         rFXsmuM4SDOF0DJrkBfkPR6HlumWBEjmCJUHjprWzRjvaIBFwP0Ox8vfEJmPDK9oP48t
         otnQ==
X-Gm-Message-State: AOAM531BAhGyBmRwJTZdpc1DQke1Cvd09+sTeh9VOxq3ggfKxQaw2sye
        1jJ4p5g5dLoMw1RjhiCWWsY=
X-Google-Smtp-Source: ABdhPJzk+yE+5VUo1cuX3PeyTNnixCd8UAWsCWzhAQTYHy9PTbGdIgw9WcVNAUETyzP1qxbHFExTnA==
X-Received: by 2002:a17:90a:f8e:: with SMTP id 14mr2762173pjz.85.1630738486432;
        Fri, 03 Sep 2021 23:54:46 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:44a5:4d4e:ed46:daa])
        by smtp.gmail.com with ESMTPSA id z7sm1206197pjr.42.2021.09.03.23.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 23:54:45 -0700 (PDT)
Date:   Fri, 3 Sep 2021 23:54:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     mateng <ayowoe@163.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mateng <mateng@yulong.com>
Subject: Re: [PATCH] input/serio:unneeded variable:delay
Message-ID: <YTMYM6s+PZA/r1mw@google.com>
References: <20210323070250.1306-1-ayowoe@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323070250.1306-1-ayowoe@163.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 23, 2021 at 03:02:50PM +0800, mateng wrote:
> From: mateng <mateng@yulong.com>
> 
> delete unneeded variable 'delay'

Sorry, but this is bogus.

> 
> Signed-off-by: mateng <mateng@yulong.com>
> ---
>  drivers/input/serio/i8042.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index abae23a..145bda1 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -1126,7 +1126,6 @@ static void i8042_controller_reset(bool s2r_wants_reset)
>  
>  static long i8042_panic_blink(int state)
>  {
> -	long delay = 0;
>  	char led;
>  
>  	led = (state) ? 0x01 | 0x04 : 0;
> @@ -1142,7 +1141,7 @@ static long i8042_panic_blink(int state)
>  	dbg("%02x -> i8042 (panic blink)\n", led);
>  	i8042_write_data(led);
>  	DELAY;
> -	return delay;
> +	return 0;
>  }
>  
>  #undef DELAY
> -- 
> 1.9.1
> 

-- 
Dmitry
