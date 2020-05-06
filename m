Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149991C64DE
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 02:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbgEFALk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 20:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgEFALk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 20:11:40 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E75C061A0F;
        Tue,  5 May 2020 17:11:40 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 207so286894pgc.6;
        Tue, 05 May 2020 17:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6rGu0sVp/3NAepP9oEGraMQ5oL3cJh69tpXja2JPQP4=;
        b=IXrHIwTyy3IDmGOzmo5iSmZ+KvsIf0gBiVOQSwCflXVcOaOMZmqzfbgRWuqZnXyYo7
         iZ0KpTwkfpJjntjSY7Nz+3gTsao2qBjKjfWjMtSU/qdhKDekGy9LkiRd5SFqoxALlske
         Kwqc9FQrRzZfLQ8Mr4KPGaH+OawqY+9ByhXte490wCUD7/dcCcS2qui7RlLHFUDkK+G8
         A/zCA9+oI26Oxb2WTLavHDdDAHsi9aZYG/ar13ujOwHi/2anN6sCdo10G5dLWMfT5/y1
         dVaVT3TUM8/0JBH+SRXEArqGCJfaXs+PYpv4woXWaF+Pzw93a8XDJNuCkDJeAzjBhzH3
         7/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6rGu0sVp/3NAepP9oEGraMQ5oL3cJh69tpXja2JPQP4=;
        b=WeOWe0t8Yob301EazAvCCKh3wNs08I4JKQH5Ne/RCN1Gs6ShIaFlG6vDIBfjf1WPdy
         7fJSD9VGwfQN3X6R8ODSiwqhBxF4tOGj0lPQIRgIyAn1b1BX1pr0u+g965/Ky/MsoSlt
         oGMfRvXd0juoN4uoXwY5LvyVe739xKRw4gcCGuKt4T3BdhFJ9t/bNBziiwSCE4voQHNY
         8MJut5fhJlsDB7bKQOP678+AXTQ6QQwaakGZX1hSkFK5Vbe1N4eaVSBP9jv4PNQNx6dw
         ed6N0dNapbb43Mw39gOgOOn6K7wxh1mGZIqSJJRFAsD328aQbxwlG2WN43gywdyV/VQ+
         bRkA==
X-Gm-Message-State: AGi0PuZjQxOSy9aSPuHTQDbXObfEo56dyJVNvDae+jbgyt1uCZX4UnlI
        mnlK0INhhSd7V3OLr0lj7B4=
X-Google-Smtp-Source: APiQypL1IVmchFlXHqi3N/XTIbZoB088fB3C0Kk+juCoogCCiluAItpGPHUrfWmgKDbZ701pnpjksg==
X-Received: by 2002:a63:1820:: with SMTP id y32mr4691563pgl.182.1588723899444;
        Tue, 05 May 2020 17:11:39 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id b75sm3018009pjc.23.2020.05.05.17.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:11:39 -0700 (PDT)
Date:   Tue, 5 May 2020 17:11:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] input: lm8333: update contact email
Message-ID: <20200506001137.GA89269@dtor-ws>
References: <20200502142639.18925-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502142639.18925-1-wsa@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, May 02, 2020 at 04:26:39PM +0200, Wolfram Sang wrote:
> The 'pengutronix' address is defunct for years. Use the proper contact
> address.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied, thank you.

> ---
>  include/linux/input/lm8333.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/input/lm8333.h b/include/linux/input/lm8333.h
> index 79f918c6e8c5..906da5fc06e0 100644
> --- a/include/linux/input/lm8333.h
> +++ b/include/linux/input/lm8333.h
> @@ -1,6 +1,6 @@
>  /*
>   * public include for LM8333 keypad driver - same license as driver
> - * Copyright (C) 2012 Wolfram Sang, Pengutronix <w.sang@pengutronix.de>
> + * Copyright (C) 2012 Wolfram Sang, Pengutronix <kernel@pengutronix.de>
>   */
>  
>  #ifndef _LM8333_H
> -- 
> 2.20.1
> 

-- 
Dmitry
