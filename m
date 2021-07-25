Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F653D4F5C
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 20:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhGYRU2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jul 2021 13:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhGYRU1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jul 2021 13:20:27 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACF4C061757;
        Sun, 25 Jul 2021 11:00:57 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so16476332pjb.0;
        Sun, 25 Jul 2021 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g8x7gOlTWfMKksQpsXTKa9OYruUBvsfh/1O6vQANTHY=;
        b=oKFH0hvtstC1XS5QLRCNkxTYrWWqQ+c0dbO4ehMnS1j+y2d5k8PD5nI/rTexu6xNq8
         5bfR1yB91D9A9a2G4utIfcFCvXFxjEczAooD0Ga4xHgsZLSbO3zd6rlgoPfciyyF25m3
         89InWxjz5SgznVE5MW+6kIRxNCtM2Wsq90Ua9XZq1jlSRGFJuDwXOuoIAkKF43ZSkX5u
         vwqsJ7sZEx7+a/UCPm4gkg+d42N/MKeOT8jc/s615cJFdH9H2q9d9uXYOyQvlgmtcmb8
         U3GiIsytr8f8uykyIi39Eeu6dvnli0suwGdsGpQpOV9ETIl6YDACL3+ttJ9wqgQx/4gy
         L6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g8x7gOlTWfMKksQpsXTKa9OYruUBvsfh/1O6vQANTHY=;
        b=eGUjirNDH2eYok/YL9w4CIifgcnmZ4tI92sKmLUE2Ow83VrExuu8LZHw8ZELUkla+y
         709/zdY1DB8Hoya58zrc+FCOfM/kOf5an6+G9xRrd+RUwsRCDO2fn5JNDIPJBV3ZtF1L
         pJuDCWDdNifKuZuSGv8+4rjcjdTSV75e+lWnRduP5tBpU8n+QbJE7DmSybGLNnasDu/u
         Q4Z3JRGYBpJv0z8Eir+zqXf6Ui1ru/6iXesBHmx5PvAGdA38cZKFCq/IeT/RloospKtq
         QpmEGLIbw+B+zF2A+SZeFZwewutirYFhktUI7w0C7qT02mOFFv5opBZmUMwVJrXmmzCL
         tg0Q==
X-Gm-Message-State: AOAM532hOPLR09oEOmFaxx4SXHxFeeQwZXL9FKaGeSfa/0nnK7OPASrx
        hG70jDUnl8QPcm5YGNj+kCWVeTlFykA=
X-Google-Smtp-Source: ABdhPJwu+ohZPjNhjnhARIh2JiLFCvWfOeyW6OglF1ISJWTCYGD68QXOle6dmf6LT4JNwd7elNAz5Q==
X-Received: by 2002:a17:902:ea09:b029:12b:1dc0:ac74 with SMTP id s9-20020a170902ea09b029012b1dc0ac74mr11408116plg.82.1627236055898;
        Sun, 25 Jul 2021 11:00:55 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:47a8:ca26:9af3:7f64])
        by smtp.gmail.com with ESMTPSA id r10sm39652035pff.7.2021.07.25.11.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 11:00:55 -0700 (PDT)
Date:   Sun, 25 Jul 2021 11:00:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Salah Triki <salah.triki@gmail.com>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: joystick: pxrc: use usb_get_intf()
Message-ID: <YP2m1IG6ilw5aTXH@google.com>
References: <20210724213617.GA586795@pc>
 <YP0FU1jMuhcy6wLu@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YP0FU1jMuhcy6wLu@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 25, 2021 at 08:31:47AM +0200, Greg KH wrote:
> On Sat, Jul 24, 2021 at 10:36:17PM +0100, Salah Triki wrote:
> > Use usb_get_intf() in order to increment reference count of the usb
> > interface structure.
> > 
> > Signed-off-by: Salah Triki <salah.triki@gmail.com>
> > ---
> >  drivers/input/joystick/pxrc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
> > index ea2bf5951d67..59304352548b 100644
> > --- a/drivers/input/joystick/pxrc.c
> > +++ b/drivers/input/joystick/pxrc.c
> > @@ -143,7 +143,7 @@ static int pxrc_probe(struct usb_interface *intf,
> >  		return -ENOMEM;
> >  
> >  	mutex_init(&pxrc->pm_mutex);
> > -	pxrc->intf = intf;
> > +	pxrc->intf = usb_get_intf(intf);
> >  
> >  	usb_set_intfdata(pxrc->intf, pxrc);
> >  
> > -- 
> 
> You can not add a reference and never drop it :(

On top of that taking a reference here is not useful as the interface
must be valid until disconnect() call.

Thanks.

-- 
Dmitry
