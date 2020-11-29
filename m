Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9F92C7756
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 04:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgK2DAn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Nov 2020 22:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgK2DAn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Nov 2020 22:00:43 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB58C0613D1;
        Sat, 28 Nov 2020 19:00:03 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id e8so7902446pfh.2;
        Sat, 28 Nov 2020 19:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dWe3whOvygBHGLtaZw1VVKRb+y5IcmvSwxztDTSeh8Q=;
        b=HnqGJJZrLndYEpvS4e/LrPtLHRxxoMILdbKm/6sLrL3mF5DY/U19yuQum2KRcygp/D
         jO5fdJ+Z2Xn9ilgrcVLD4BmFrZkQEmOfktI1B/lST1YdScPuk5jhoADxLHeum7V0tDsb
         qjSTEXBZAgazDbVhU07BgFYOB1lrgF6AXN3mwknHbPKEBkTzdDgO7RkPPCOwSvq3IYIP
         zD0EBxd/THbqfX6e8GiZQYSH4dY/e0m3z5+KgU+XMevF3idi81znahTNS3biQa5dsycJ
         tpIOKorZ9ZKiAoVHf5jyM7P0yMrc7ebt2BttvOtGXlrHluJ6EgIpwZ6UX3/NLqeOtEoy
         3UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dWe3whOvygBHGLtaZw1VVKRb+y5IcmvSwxztDTSeh8Q=;
        b=p6MVZ3axW6FKNzS3ebjifuK+40n/AUbNQah2zC2OeMblaN+EUPGPpLt6S2lBIDr3Jw
         26a3MzW057V1FU2d/F3TZkEP3/ZTFHiOLXGaqXF/UvM3uSIsymUlvvILQRzqvsBNFer7
         IoQf/9hXEkl9rLBWqdA9m9adF5qtAGg9iNxQLEQaoCPZP2DThzXdQIS0QS+ObaiI/wlL
         hMzZUj0FA1dr3KACSnsKY/WPWm+94vDMTq6leIOxkjeScUluyrGIGRISfAuLBjycASn9
         /WowU5mzry9Jt+b5p+i6wsF0UcQIa3IsZ9uqIgBTiP4D8SDbBkQ5cgBnNTvRiOdeqm2E
         Sf7w==
X-Gm-Message-State: AOAM530msCLHNiF+hKdWrnQxYRVsLYBDx9vt/sYCW6nEi/nxFRRJ7Xeb
        nCiezA2uYBT9PE6vu/bTV/Y=
X-Google-Smtp-Source: ABdhPJx4GvcumAPuDWHRLXZnk+xYHK0Etit9np+GBhEqGIZiNEt8C3AyUJi2LTbdhBcjPaxoR/wqaQ==
X-Received: by 2002:a62:1c88:0:b029:197:f6e4:bc2b with SMTP id c130-20020a621c880000b0290197f6e4bc2bmr13011503pfc.6.1606618802754;
        Sat, 28 Nov 2020 19:00:02 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b2sm13067065pjq.20.2020.11.28.19.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 19:00:02 -0800 (PST)
Date:   Sat, 28 Nov 2020 18:59:59 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Hilliard <james.hilliard1@gmail.com>,
        Daniel Ritz <daniel.ritz@gmx.ch>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/4] input: touchscreen: usbtouchscreen: Remove unused
 variable 'ret'
Message-ID: <20201129025959.GJ2034289@dtor-ws>
References: <20201126133607.3212484-1-lee.jones@linaro.org>
 <20201126133607.3212484-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126133607.3212484-4-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lee,

On Thu, Nov 26, 2020 at 01:36:06PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/usbtouchscreen.c: In function ‘nexio_read_data’:
>  drivers/input/touchscreen/usbtouchscreen.c:1052:50: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Daniel Ritz <daniel.ritz@gmx.ch>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/input/touchscreen/usbtouchscreen.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> index 397cb1d3f481b..c3b7130cd9033 100644
> --- a/drivers/input/touchscreen/usbtouchscreen.c
> +++ b/drivers/input/touchscreen/usbtouchscreen.c
> @@ -1049,7 +1049,7 @@ static int nexio_read_data(struct usbtouch_usb *usbtouch, unsigned char *pkt)
>  	unsigned int data_len = be16_to_cpu(packet->data_len);
>  	unsigned int x_len = be16_to_cpu(packet->x_len);
>  	unsigned int y_len = be16_to_cpu(packet->y_len);
> -	int x, y, begin_x, begin_y, end_x, end_y, w, h, ret;
> +	int x, y, begin_x, begin_y, end_x, end_y, w, h;
>  
>  	/* got touch data? */
>  	if ((pkt[0] & 0xe0) != 0xe0)
> @@ -1061,7 +1061,7 @@ static int nexio_read_data(struct usbtouch_usb *usbtouch, unsigned char *pkt)
>  		x_len -= 0x80;
>  
>  	/* send ACK */
> -	ret = usb_submit_urb(priv->ack, GFP_ATOMIC);
> +	usb_submit_urb(priv->ack, GFP_ATOMIC);

I thought you were going to add error handling here?

>  
>  	if (!usbtouch->type->max_xc) {
>  		usbtouch->type->max_xc = 2 * x_len;
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
