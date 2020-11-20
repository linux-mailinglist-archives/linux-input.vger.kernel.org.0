Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2217F2BA0D9
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbgKTDJ7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgKTDJ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:09:58 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB81CC0613CF;
        Thu, 19 Nov 2020 19:09:58 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id 18so4097915pli.13;
        Thu, 19 Nov 2020 19:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=F7vSo0BOU1nMjwQQj/h9kQQ/3Z1BtrTqi/HVObj+xyQ=;
        b=Cs1ZuXzWPPmzPMNDxwcdzY87vfmP/+PFqskRsub6V5FnxLEdRJBsEqxPsYiP3En+x2
         ANYMa4vWUroICS1Q/HUGan3JZqmt4qfcm24gArL9qk71yuGQT3equ1g1gAQuy1a3sDpH
         wZMpILFF21g/y62x0M3Qol4d+QUaUaVfcc8Pmm+zrOUf6exZkXqW2rgPdFvcw57g67vc
         mEdoZUTOlJPmj24XpF8Gd1ZkHbI4Wcf3pYtjEMU8yTiO3gIEzGy8oZb8GvNZNdVBXbT/
         ZN2VW1QOh+UX0GblVDlmvSlVJjXTti4SQZVIRUDgbIIleFG0YZ/+Y21Q28YB8bNa7mLz
         B8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=F7vSo0BOU1nMjwQQj/h9kQQ/3Z1BtrTqi/HVObj+xyQ=;
        b=kPemfl9KetKL9GBn159xy5yQDb7PdGzudePE8zvj+dz4BWu4iF1h88HMQlJ3LUaKpm
         P8PxdpO6y0OEc2P+uqBAI3sqn3m4b3EMqnf4ei3X1DPn2pMkpJURSSALYcYzM3Ql9Jjf
         L86KHTv7HOGSYE979ff/fiQWy09a7xnUYxaGNL8QY1sY6ZEERgRfIsUpojyFFY9IR3Lf
         jBbRVKF97M0M7ELxjgqIb//3Ko+W3U7S+6cX2jElNLMxJEeSbXz0Pl2CpC0D0s9LLueP
         IWRbtjGPHEXpLOsnAjUNPYZ0gDFn/iMd2lGRSPEEJg/TgVVHMRWCbXQJuxp3YU746mFi
         OBfQ==
X-Gm-Message-State: AOAM531ckHU62aoqxoA+kA5DiLsE9J1gKqMTTUYrJEJob1CUa26WS40M
        AKbCcvws1O7vBpZE9sUfElw=
X-Google-Smtp-Source: ABdhPJzYuD8g4mawcmtRU0+a6ZOGmhVh1TeKTFP400wfZwAWgObHwVyQJq2MJp6CbsWx0a4JuY6Hlw==
X-Received: by 2002:a17:902:bf43:b029:d6:8b99:3ca2 with SMTP id u3-20020a170902bf43b02900d68b993ca2mr11397423pls.43.1605841798429;
        Thu, 19 Nov 2020 19:09:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z17sm1394006pjn.46.2020.11.19.19.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:09:57 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:09:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Hilliard <james.hilliard1@gmail.com>,
        Daniel Ritz <daniel.ritz@gmx.ch>, linux-input@vger.kernel.org
Subject: Re: [PATCH 07/15] input: touchscreen: usbtouchscreen: Remove unused
 variable 'ret'
Message-ID: <20201120030955.GK2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-8-lee.jones@linaro.org>
 <20201113073655.GF356503@dtor-ws>
 <20201113075631.GI2787115@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113075631.GI2787115@dell>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 13, 2020 at 07:56:31AM +0000, Lee Jones wrote:
> On Thu, 12 Nov 2020, Dmitry Torokhov wrote:
> 
> > On Thu, Nov 12, 2020 at 11:01:56AM +0000, Lee Jones wrote:
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >  drivers/input/touchscreen/usbtouchscreen.c: In function ‘nexio_read_data’:
> > >  drivers/input/touchscreen/usbtouchscreen.c:1052:50: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> > > 
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > > Cc: James Hilliard <james.hilliard1@gmail.com>
> > > Cc: Daniel Ritz <daniel.ritz@gmx.ch>
> > > Cc: linux-input@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/input/touchscreen/usbtouchscreen.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> > > index 397cb1d3f481b..c3b7130cd9033 100644
> > > --- a/drivers/input/touchscreen/usbtouchscreen.c
> > > +++ b/drivers/input/touchscreen/usbtouchscreen.c
> > > @@ -1049,7 +1049,7 @@ static int nexio_read_data(struct usbtouch_usb *usbtouch, unsigned char *pkt)
> > >  	unsigned int data_len = be16_to_cpu(packet->data_len);
> > >  	unsigned int x_len = be16_to_cpu(packet->x_len);
> > >  	unsigned int y_len = be16_to_cpu(packet->y_len);
> > > -	int x, y, begin_x, begin_y, end_x, end_y, w, h, ret;
> > > +	int x, y, begin_x, begin_y, end_x, end_y, w, h;
> > >  
> > >  	/* got touch data? */
> > >  	if ((pkt[0] & 0xe0) != 0xe0)
> > > @@ -1061,7 +1061,7 @@ static int nexio_read_data(struct usbtouch_usb *usbtouch, unsigned char *pkt)
> > >  		x_len -= 0x80;
> > >  
> > >  	/* send ACK */
> > > -	ret = usb_submit_urb(priv->ack, GFP_ATOMIC);
> > > +	usb_submit_urb(priv->ack, GFP_ATOMIC);
> > 
> > I wonder if we should handle potential errors instead.
> 
> Your call.  I'll do whatever you decide.

OK, please add error handling here.

Thank you.

-- 
Dmitry
