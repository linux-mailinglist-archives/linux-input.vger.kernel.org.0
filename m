Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C91EF6142D
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2019 08:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfGGGON (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Jul 2019 02:14:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35153 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfGGGON (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Jul 2019 02:14:13 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so4841195pfn.2;
        Sat, 06 Jul 2019 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j5vrgS9+95IhHBa7HDa1UVKPrb7RPwdim9qXDwM8OLk=;
        b=uFvA1Q8GlVBUOsDAWk6HCh4LoYV9bv+YgCqeGPSnKhBS4tuZTiWv0ZxAe8z6xuB3HP
         Yj5vEBULGa2Sxqu1wbsvMw3ddXjJazTgM+1J/9Qh/NB4VcnrIzAzXJDLsxepo79Ue6Sx
         dHapa7PzqIDVOcAYBddVKFAnyDPFVCnQoJL2zOrzkcJ0ZvrKyTD8FhYqLM37caZTvPbg
         5+wr0NnhIEuUSoKChXtzIwz7m4Jkw4tPp/XQF0m6Q6Y2vRw3/AFCyBObYpMySGnWN+IE
         wv2TkpNVBm4Y5kRLSHEk8phdnLtY7eWskiT+XHV4X0F9Y0aO0TUR693ciVMSGMQ+YA63
         mLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j5vrgS9+95IhHBa7HDa1UVKPrb7RPwdim9qXDwM8OLk=;
        b=Tfibd7BleG0qSdA9RCC3/W3H/dcbKVMkXkp00MA/GGWhboq3MLt6ssU3S5B6Pymk4T
         ojP7yS1z2DH4yXBSYCCuC+gQ4Nm/EIZnEdqbYVTTXkM1OMZVsUb3aaD3kDwqMGzggsKZ
         tGqpGSCvBWGBp7v7vAUb2RVdFra0uNr4kuI7H/fJtQjwp57gGCF9lxyV8/4kcDsSgXOw
         72sPTKetMphVQsRTNWvhTKik4kMAN0uVLrCuZmiHd4HdG7m4gTj344YUh6nsJfAwyaxF
         Zjri7m6DEoSvll6bdk1e2ypbUPV/P0llQM0XPe/5tIYaWl2PvUPTh6YFlbj7/DqH+1oY
         WZ6g==
X-Gm-Message-State: APjAAAV+x75cjsJn5RKi/I8kdpBHRhBR455+MtbG2h1sBgKLMd1fOrJK
        GRRl1Jdou7awi6FhOJ4fJFc=
X-Google-Smtp-Source: APXvYqzhPYRNfc9z52H4efrEwBhYtYi1tx8htuDqHKn9ySzV0TCozqMZ/IIufYVsLzlJAgU5uPxBIA==
X-Received: by 2002:a17:90a:5288:: with SMTP id w8mr15622238pjh.61.1562480052801;
        Sat, 06 Jul 2019 23:14:12 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o16sm31212952pgi.36.2019.07.06.23.14.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 23:14:12 -0700 (PDT)
Date:   Sat, 6 Jul 2019 23:14:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] input: keyboard: gpio-keys-polled: use input name
 from pdata if available
Message-ID: <20190707061410.GA174189@dtor-ws>
References: <1561648031-15887-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561648031-15887-1-git-send-email-info@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Enrico,

On Thu, Jun 27, 2019 at 05:07:10PM +0200, Enrico Weigelt, metux IT consult wrote:
> Instead of hardcoding the input name to the driver name
> ('gpio-keys-polled'), allow the passing a name via platform data
> ('name' field was already present), but default to old behaviour
> in case of NULL.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/input/keyboard/gpio_keys_polled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index 1eafe6b..c168493 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -269,7 +269,7 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  
>  	input = poll_dev->input;
>  
> -	input->name = pdev->name;
> +	input->name = (pdata->name ? pdata->name : pdev->name);
>  	input->phys = DRV_NAME"/input0";
>  
>  	input->id.bustype = BUS_HOST;

I also added fetching name from "label" device property ad applied,
thank you.

-- 
Dmitry
