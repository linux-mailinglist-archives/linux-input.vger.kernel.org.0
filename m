Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952CB393444
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 18:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbhE0Qq7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 12:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234169AbhE0Qq5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 12:46:57 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92552C061574;
        Thu, 27 May 2021 09:45:23 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id v12so236102plo.10;
        Thu, 27 May 2021 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qDn42LT1xAazGRJGWA/HURpLm02fMnzdaimeWX1K4GQ=;
        b=GotNOjM140+2FLHDJ5X9Ndjm4JVlo+MUR0xxM18+DBEA/D5Zcum30jOAxuTEEpLQMJ
         6UpVYce+bR9DqMDsHBEPJlauuV55AE2o8CguUVynneYzinlv4gR8KQJRphneDapku4Ma
         sGjkSKr0Owcd3JDfkwPtMGrPAIK2lvPOjrwkRM47Gge46q7Zj2zKqcA0F95lu1asUOg5
         wPNw1116vWdbKe4M9mxGbkXo/r/vPK9MWjKeoyUUvOvw4VObbjVSchhnPC/YMRw2R8Y2
         tbOITr87grETh6+Xo76nWvxaGU4atI6MOSGbSful4ne1oyS1Yu1h5eZrVkZPUZgtWdv7
         Xrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qDn42LT1xAazGRJGWA/HURpLm02fMnzdaimeWX1K4GQ=;
        b=ZAp0/Getd7EQBuKWuLrm0kazgTV+jPefRnk9HOugAc6JakLrkCsYWHyKIWfrKr17xQ
         OfgJIkMmMLZJ5RExivLgkJXbidSUU37RdBZlTfLy9SeVclOTfOPLQ9uq75WRUuk0ZjaA
         Qnm8teLcL7+JtKzNoca4yh7w6viiEWcQ6kaKSaD+cg08bfb1HekEcV0j8mvDA+eQoAwH
         P/lJs7TCrHBelQzz6n8z2T+5r4qAiEuB4VvFRD35cnE82hGBqn4AusPKKkPuxgLYYuxa
         i2U1Sn6HzTqDlKgab9t3O6SHFHLDbBD9GeVqAlmg3Vgp7JLftoHIg9PAzzoadwkEo7aE
         mdGw==
X-Gm-Message-State: AOAM532/BG2egfSYgNOHN3tQ1DD+FxGpLyHb6csYyioU0KNuN1dW70d/
        9FfeV60THg+1teRAd+gTu8I=
X-Google-Smtp-Source: ABdhPJxx9NkAr/tl9rPVBV100j2nQ8oO9A5qHmyM4hmjouFqpxQ2HAGsNWtZmRBsPA/WAf4/hhxQ0A==
X-Received: by 2002:a17:902:f543:b029:f3:bfca:21b4 with SMTP id h3-20020a170902f543b02900f3bfca21b4mr4009885plf.6.1622133923183;
        Thu, 27 May 2021 09:45:23 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id a9sm2241070pfo.69.2021.05.27.09.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 09:45:22 -0700 (PDT)
Date:   Fri, 28 May 2021 01:45:17 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbmouse: Avoid GFP_ATOMIC when GFP_KERNEL is
 possible
Message-ID: <20210527164517.GA143281@hyeyoo>
References: <20210524145743.GA92203@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524145743.GA92203@hyeyoo>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 24, 2021 at 11:57:43PM +0900, Hyeonggon Yoo wrote:
> probe in usb don't need to be atomic. So GFP_KERNEL can be used here,
> instead of GFP_ATOMIC.
> 
> Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> ---
>  drivers/hid/usbhid/usbmouse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
> index 073127e65ac1..c89332017d5d 100644
> --- a/drivers/hid/usbhid/usbmouse.c
> +++ b/drivers/hid/usbhid/usbmouse.c
> @@ -130,7 +130,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
>  	if (!mouse || !input_dev)
>  		goto fail1;
>  
> -	mouse->data = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &mouse->data_dma);
> +	mouse->data = usb_alloc_coherent(dev, 8, GFP_KERNEL, &mouse->data_dma);
>  	if (!mouse->data)
>  		goto fail1;
>  
> -- 
> 2.25.1
> 

Hello for me it was simple and obvious patch.
Is there something wrong about it?

Then please let me know about it!

Thanks,
Hyeonggon
