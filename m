Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E622B16C4
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 08:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgKMH4f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 02:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgKMH4f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 02:56:35 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06287C0613D6
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 23:56:35 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 10so7251691wml.2
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 23:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cOP+0eig0gjhxgKfd2cuaF6IlWUlTJn2OZzeeMSeWhc=;
        b=AerqIHFgop/7P2PMm34Kz4CM7dd9l3bj7/XhKrLyW6aWmKvZBgBzqELCxRfY2BluTP
         twdkIIzY7N/ZBOZ5sntVK6ItihT7OxNfxff3Cu5DPL/JFIzALuOJ3iu1lNRJtZuZ4Fcu
         IDf0YHJFazOe8fRL+vywm3GiYlackXME6lN9lftrCr48IXm4gOxGKUDPkWJgbkFv7grq
         nIoV2i/T6k7syAq4sZCgDW+7XhUCu9qBfTjCn2HUBjHcIxKigL8JF0PElYgCP0b3YhGo
         cWXZKkVlJKcxJ0Ns4LjlG+iNPDQW/zHBwaXng6FBoqebvNCtZAmeJ2CvhKeBosdRBX6N
         /Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cOP+0eig0gjhxgKfd2cuaF6IlWUlTJn2OZzeeMSeWhc=;
        b=VndOY4LfkQxAKepPRm4kxZd2Mgdy8gezyfwzwbKP49lQZQ3I+BkVfeHZaHHCtQHcu7
         sArUQvC4HVd2rEj9fP82jgJbKqsPinHsgln30ue+IpTPSVhftin0kA1TVU6nYjCVK7Ut
         irXIjqXIaUtZ5rIlSmnYcqL38A5HBiSvnnRbaIBt/5ghmNQKSjyCYXONYBiLnab3rBAu
         992k5Yf+1pC38SCm88IbOyC7WNbpS9SDSNZkdYZ0eogUHjmM8c6nD7flLTUIvNMKDyx8
         YREqBzMP6NHL24Qn6N8nhUPTDiG2PoSrvmKu7MD/x6kdg9lWN2GY9fK8A443RQoTGkH6
         Aedw==
X-Gm-Message-State: AOAM532TLiAAmwnyNgYwKtRErK4mtpdLcGIBFnwjDskHr0M7i6q7yt8h
        UPPASGuj9L73QrvqNPYD8kuNSODDq/ptOi4x
X-Google-Smtp-Source: ABdhPJwkNK+wFKVZpkIBP9nA+L6UcyZoyc3Re9G9w9f2S1MCGByMREJr+NBCR3FXY7k421EsDRw2BQ==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr1175562wmi.42.1605254193779;
        Thu, 12 Nov 2020 23:56:33 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm9212415wmf.35.2020.11.12.23.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:56:33 -0800 (PST)
Date:   Fri, 13 Nov 2020 07:56:31 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Hilliard <james.hilliard1@gmail.com>,
        Daniel Ritz <daniel.ritz@gmx.ch>, linux-input@vger.kernel.org
Subject: Re: [PATCH 07/15] input: touchscreen: usbtouchscreen: Remove unused
 variable 'ret'
Message-ID: <20201113075631.GI2787115@dell>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-8-lee.jones@linaro.org>
 <20201113073655.GF356503@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113073655.GF356503@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 12 Nov 2020, Dmitry Torokhov wrote:

> On Thu, Nov 12, 2020 at 11:01:56AM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/input/touchscreen/usbtouchscreen.c: In function ‘nexio_read_data’:
> >  drivers/input/touchscreen/usbtouchscreen.c:1052:50: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> > 
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > Cc: James Hilliard <james.hilliard1@gmail.com>
> > Cc: Daniel Ritz <daniel.ritz@gmx.ch>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/input/touchscreen/usbtouchscreen.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> > index 397cb1d3f481b..c3b7130cd9033 100644
> > --- a/drivers/input/touchscreen/usbtouchscreen.c
> > +++ b/drivers/input/touchscreen/usbtouchscreen.c
> > @@ -1049,7 +1049,7 @@ static int nexio_read_data(struct usbtouch_usb *usbtouch, unsigned char *pkt)
> >  	unsigned int data_len = be16_to_cpu(packet->data_len);
> >  	unsigned int x_len = be16_to_cpu(packet->x_len);
> >  	unsigned int y_len = be16_to_cpu(packet->y_len);
> > -	int x, y, begin_x, begin_y, end_x, end_y, w, h, ret;
> > +	int x, y, begin_x, begin_y, end_x, end_y, w, h;
> >  
> >  	/* got touch data? */
> >  	if ((pkt[0] & 0xe0) != 0xe0)
> > @@ -1061,7 +1061,7 @@ static int nexio_read_data(struct usbtouch_usb *usbtouch, unsigned char *pkt)
> >  		x_len -= 0x80;
> >  
> >  	/* send ACK */
> > -	ret = usb_submit_urb(priv->ack, GFP_ATOMIC);
> > +	usb_submit_urb(priv->ack, GFP_ATOMIC);
> 
> I wonder if we should handle potential errors instead.

Your call.  I'll do whatever you decide.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
