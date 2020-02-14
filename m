Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3CC15CF44
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 01:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgBNA5N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Feb 2020 19:57:13 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40925 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727604AbgBNA5N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Feb 2020 19:57:13 -0500
Received: by mail-pg1-f194.google.com with SMTP id z7so4043115pgk.7;
        Thu, 13 Feb 2020 16:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bGkG6EmBM3SxY3EHAOikLI2DxuwzV4xiWAyP2JMjyI8=;
        b=vEK7ZNs0UsRHVsXXdzZpSl9xAT6pZ/7af3d/3zklhcTsPWw7UQ7goyJaU+NFyBpfC7
         pZBg74IiGr3SiR+fCF5txXhLyeKfv0+/fuD4zakoVyK3gwBP9kbRVp+FrgMUbW0t8ZsD
         qR0ulFcoBWY9l4Glj//EAdlZ6JncAin3VAsQtgwBI4/RrCkCPl/g84sKaEa27xwoUi1z
         cws0dvJ+mrjbuJQuSPPGFqzXv0KHWH6xjm3t52zxQJ+Xl+irouGNkp4802yWdmxyXvHs
         J4cYbvSQ0qba89ke5oHLURs2921aJgYYxJNskjVztCqDUDRCXMByfZRtte7FwAELHPp2
         wBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bGkG6EmBM3SxY3EHAOikLI2DxuwzV4xiWAyP2JMjyI8=;
        b=mlkPyr1JCPi/VZu0y1nNcOZhi4dnMMdwkmxKMNAbOJTkPWgmO7KamsiAaSvK/npa3g
         vzT8FnxVHbsU6T1IJYU1juaXw35JsKxa4q5aM85I3ZurPp0XW8PXFLixUnVxkzO6rkAx
         cfkaTPT7BzcEVMCs1OZ2hHSyuWF6kIHQAZFH/FYhAhy2OqgwPVCBtuj+ELSyhC5Trmtm
         iIWCIc4Jt/NTCP704WBS+JXH2AtcWUI8DiqF9GSCUT/qBw3YiqJR23/h6jziAtljitNW
         tlsZO8kOwm5eQgfkPij1UiRXPkitlZ7ZxKMldDcEHhKWjNaYeqwFE14Rtmsii5foSStT
         Ch+Q==
X-Gm-Message-State: APjAAAVfw6s0AtWw7DTrH7BBtVZcfl5G1TiEFCEiaiwG5hkYxccRaKjG
        EykSP/SKSiWH7OdzJ4rfkgk=
X-Google-Smtp-Source: APXvYqxGanzLFfeCrA1ydSnSbR6XpGrSh1y4w8O/mNEJCHkakUU3huCSE28aiHVzPV2pGxFbkcsRwQ==
X-Received: by 2002:a63:8c18:: with SMTP id m24mr733183pgd.70.1581641832052;
        Thu, 13 Feb 2020 16:57:12 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g24sm4505499pfk.92.2020.02.13.16.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 16:57:11 -0800 (PST)
Date:   Thu, 13 Feb 2020 16:57:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goldfish_events - Replace zero-length array with
 flexible-array member
Message-ID: <20200214005709.GA183709@dtor-ws>
References: <20200213002430.GA31056@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213002430.GA31056@embeddedor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 12, 2020 at 06:24:30PM -0600, Gustavo A. R. Silva wrote:
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
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/goldfish_events.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/goldfish_events.c b/drivers/input/keyboard/goldfish_events.c
> index bc8c85a52a10..57d435fc5c73 100644
> --- a/drivers/input/keyboard/goldfish_events.c
> +++ b/drivers/input/keyboard/goldfish_events.c
> @@ -30,7 +30,7 @@ struct event_dev {
>  	struct input_dev *input;
>  	int irq;
>  	void __iomem *addr;
> -	char name[0];
> +	char name[];
>  };
>  
>  static irqreturn_t events_interrupt(int irq, void *dev_id)
> -- 
> 2.23.0
> 

-- 
Dmitry
