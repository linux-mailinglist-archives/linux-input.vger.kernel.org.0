Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4170F2B168B
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 08:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgKMHhA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 02:37:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgKMHg7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 02:36:59 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FA6C0613D1;
        Thu, 12 Nov 2020 23:36:59 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 62so6400842pgg.12;
        Thu, 12 Nov 2020 23:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DI+53oZSBiBFl4dOg9AxzRmdEkfr9Y5AiP/wrRfP7RI=;
        b=SbuJVIw3qwdjtjkK9lsYf5VXzo0CLsT2HwsFrA0XX56OB6nDEFAKlqiwT/xUatSdVL
         WURF1ZcBlBmtaFrSYuMlhQcwnJ/83N8qkLT6CmHfT7fIuI9ccLGdTIdUHnVXocLGHX2X
         16SK0YNCQ3T8Jtw6Sc1j6WpHTpJGnnPe7DLipNZ4bDiKp+QGjYB5QSn727dNlhwr+cet
         uzXJ8F8h1OpkoJ5b4B6SlfUzDsr3/h5YrI5017MztligKmLfJWjfKQd6iH3V51un9RL0
         BK8m4V7LDcEfQxtWSb33acB2WUqaIKAqQogYRluUSuDpCiaNzIdaXk1LSjwF16cHapCF
         pxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DI+53oZSBiBFl4dOg9AxzRmdEkfr9Y5AiP/wrRfP7RI=;
        b=RF1kTy8pPeKCZTmYuY5ZNwpnTv8wJfyn3+gPiNyCicjvoLbaN98wl0InDTkUY9HaZO
         zrLSSQfT3ycu/kHbDCxakjEIUOyimlePdJi/08BgjAtmhcwfRGqtMeNJVEtu+fg+tTTv
         aVY7WRGMZ33s6u7zSx53PbHN/P1aem2Arb13mUM9F3R7QVTxK+ckhHkocaKL6Ad3yx0t
         /1qdhGi7yKQ5m2ROYcv18DfepxacajcPnSOZHjgqYjhzM2PxiB6Q/s0dZCxaccgJwVEH
         K5jODwTX3yWxyHMxNFeGXASo05BMNfShxsR8vbJDwKcQ0JFL7oON3NANGRbceQINPtcZ
         fXyw==
X-Gm-Message-State: AOAM533giD1sm4EIfdiEpEaJPxTf6I6uOb+OewknNPr8U2hfCAHH8yc9
        yxkjw5H9IXI/m2NDIYUK9Ro=
X-Google-Smtp-Source: ABdhPJyDRb3qYR67UjgZRH7K/x0GnFBr0f0hPXPWVl8DWROkKyRM3whY/DuQ1nvnDUlLrf/pCa5tvw==
X-Received: by 2002:a17:90a:4417:: with SMTP id s23mr1491076pjg.156.1605253018911;
        Thu, 12 Nov 2020 23:36:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g5sm9458799pji.12.2020.11.12.23.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:36:57 -0800 (PST)
Date:   Thu, 12 Nov 2020 23:36:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Hilliard <james.hilliard1@gmail.com>,
        Daniel Ritz <daniel.ritz@gmx.ch>, linux-input@vger.kernel.org
Subject: Re: [PATCH 07/15] input: touchscreen: usbtouchscreen: Remove unused
 variable 'ret'
Message-ID: <20201113073655.GF356503@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-8-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112110204.2083435-8-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:56AM +0000, Lee Jones wrote:
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

I wonder if we should handle potential errors instead.

>  
>  	if (!usbtouch->type->max_xc) {
>  		usbtouch->type->max_xc = 2 * x_len;
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
