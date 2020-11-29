Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6126A2C7872
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 09:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgK2I2Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Nov 2020 03:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgK2I2Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Nov 2020 03:28:25 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F7FC0613D2
        for <linux-input@vger.kernel.org>; Sun, 29 Nov 2020 00:27:44 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so10893197wrb.9
        for <linux-input@vger.kernel.org>; Sun, 29 Nov 2020 00:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Mwp+wLhKN7vN1/marM/K/cNTZgEqNTEdBKewJkpgExE=;
        b=uXw98NlwdRQWqRkNdQa2fd99jOkOsRq2nFbhIblejp+1K8VLWcydvxpPAl0WtpEkEz
         5Ujj/MqrlI3dxocx8hemaLqKOqx09IE8Ji+LVzBD1PpGLQ6EH93gH2ECGUxhFZsQTByk
         6tKVPIUKuyE5MyHdrK4DQi8AIURUGlhyz2VTIRAoyk2LaHx6Q9+xMYCsjTeEC5kuHSMU
         f6mxRQLirf+bAspbt6ydgkKzwSCyaKNOuMBwrF1TDvv2AGI3+ZOhqfGdVEVeAY7nBEaB
         i+UwDR3r+e2qiYtuxaZ4Y0sE3TQ5+1Hthjh9Y6913piK+zUxhrfTVjNN6/A7PYpVR8xX
         MrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Mwp+wLhKN7vN1/marM/K/cNTZgEqNTEdBKewJkpgExE=;
        b=CQNwYf3KvbxsJNAbkmFUC64KXjC3NkEBOHKLh9ToOu1yNu4s53T+fm0zO+UmdVv9He
         xvsuE4Ct7fQnoqh4L25LH8McCs0NZ2xoV+uF5Zf75199OoeYzz+ze9BE6EX2pDXf05dV
         sbofp8fTUpyKDbahP9419PXHHKpGKJjburV9+nj7lBLH6AjUv0IBG3nZ/NmSknXvT+/L
         SIttTle9Fx1dR/eAdo1WFMQkFrybBspvqbyJnEtUAYU2Np1+/1q2hRFOuAQ09TKksB3N
         tSTXB1aBwqR9/j7NNKtP5IvuB+Im4suy+bluJPiO+naO2+MWpEoMXg0MWZiVwmUwwEHm
         4xXw==
X-Gm-Message-State: AOAM533qsH0EScCKk72HCgEqokFFb1zEex2Wcbx3w5ZzvIsbCu02BBw6
        GX+yxreaBrZIDWvNIVMxHd9Rsw==
X-Google-Smtp-Source: ABdhPJwS5LRuWrn3ndaQ29NyblSdbZ8UHSMefZd4iI1cwaQF2OzW0V7m+sO9yafUKvk3LX2kcphHwg==
X-Received: by 2002:a5d:538a:: with SMTP id d10mr21784381wrv.368.1606638463179;
        Sun, 29 Nov 2020 00:27:43 -0800 (PST)
Received: from dell ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id l14sm19760636wmi.33.2020.11.29.00.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 00:27:42 -0800 (PST)
Date:   Sun, 29 Nov 2020 08:27:40 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Hilliard <james.hilliard1@gmail.com>,
        Daniel Ritz <daniel.ritz@gmx.ch>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 3/4] input: touchscreen: usbtouchscreen: Remove unused
 variable 'ret'
Message-ID: <20201129082740.GB3857718@dell>
References: <20201126133607.3212484-1-lee.jones@linaro.org>
 <20201126133607.3212484-4-lee.jones@linaro.org>
 <20201129025959.GJ2034289@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201129025959.GJ2034289@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 28 Nov 2020, Dmitry Torokhov wrote:

> Hi Lee,
> 
> On Thu, Nov 26, 2020 at 01:36:06PM +0000, Lee Jones wrote:
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
> I thought you were going to add error handling here?

Hmm... I thought I handed all of the review comments!

Will look into this again on Monday.

> >  	if (!usbtouch->type->max_xc) {
> >  		usbtouch->type->max_xc = 2 * x_len;
> 
> Thanks.
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
