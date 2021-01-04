Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C082E8F4D
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 02:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbhADB70 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 20:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbhADB7Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 20:59:25 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B755C061574;
        Sun,  3 Jan 2021 17:58:45 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g3so13620299plp.2;
        Sun, 03 Jan 2021 17:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wJ/1G2K55JmGFecIGoHgxm3za8JbP8OvFmT1PDH78F8=;
        b=Y8mYL5QNtSDRFsn33XDWLykSN6W6sfkdX7AMpSb1GE7gZZTfbe0GBPNm0fT+uXR8d9
         zEkyHcNzYzIZlfMbitUt5MhW5HxJ+kAXl0neVKeEgIVqTShfExd9VgpdQSXYZcmJU21w
         VWva9OmXURa3DLZaNbO4TZotinC7bvFTiZ08NU15q9n0B9G1ioHE733y347YpxDOXHCg
         2v/m/Q5OFb6xmEGZDfrh+oo5sM3Yxj9Zo4Zgzc8n9cPN7xGSCcNdzW5TkF+08btFebCH
         OaEP4/SUzpCAKcC5wqr7DvTkAyCwfuktmkM+LEBnIlcaH9svavwf8lTvPWkzOPfy0Qum
         rC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wJ/1G2K55JmGFecIGoHgxm3za8JbP8OvFmT1PDH78F8=;
        b=seGRLpx3modNwf6RPASnqqBBV2d/wEbcljkXr4SVqidNAPXN4XFVX7mcveuc+pu6h7
         xArh08NnopR9ogvNxdZyWYo6D6WoOCnLK/xUErOg03IYhQhk1UYGeqawvObtZ35KUoch
         kH90OUV8qhvr/ekDDM0CUmO5e2ean4wnB7r6xs15gHDfddQC7TaoVt965bMvHjL3upIS
         LSZKJDas9OITedruJOITCUmdLAaFpa1gFglcJ6ERvgbxAV8fW/5BVMNb5O5G97D9uuI2
         Jjp2GrWtmmtuTBeHNPMEXecDzz5DnJP0Tm3qCchFDNU54isArOpSPBH/OHrbvOlt4gEK
         yPXQ==
X-Gm-Message-State: AOAM530W5/v8tms7cnLKlL6L0VlZhnJM4ibe8bO99QDIUuvBn9zMVfLb
        3WM205fWn//9s+QByr9JvfU=
X-Google-Smtp-Source: ABdhPJzEbuWdn+CuLvkjytPO7pQFgDeKHh8Rlnz56WrXmMdftO340nBRF+Apd/QfgYkjBsJPG56ToQ==
X-Received: by 2002:a17:90b:fd5:: with SMTP id gd21mr28573499pjb.139.1609725524976;
        Sun, 03 Jan 2021 17:58:44 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z16sm12724604pgj.51.2021.01.03.17.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 17:58:43 -0800 (PST)
Date:   Sun, 3 Jan 2021 17:58:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Roy Im <roy.im.opensource@diasemi.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: da7280 - protect OF match table with CONFIG_OF
Message-ID: <X/J2Ud24zs7ZJdTU@google.com>
References: <X9xRLVPt9eBi0CT6@google.com>
 <AM6PR10MB1926A5AB8951B4DE62A96EE385C30@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
 <20201220020109.GA13501@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201220020109.GA13501@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Sat, Dec 19, 2020 at 08:01:09PM -0600, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> On Fri, Dec 18, 2020 at 04:49:48PM +0000, Roy Im wrote:
> > On Friday, December 18, 2020 3:50 PM, Dmitry Torokhov wrote:
> > 
> > > The OF match table is only used when OF is enabled.
> > > 
> > > Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/input/misc/da7280.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c index 2f698a8c1d65..b08610d6e575 100644
> > > --- a/drivers/input/misc/da7280.c
> > > +++ b/drivers/input/misc/da7280.c
> > > @@ -1300,11 +1300,13 @@ static int __maybe_unused da7280_resume(struct device *dev)
> > >  	return retval;
> > >  }
> > > 
> > > +#ifdef CONFIG_OF
> > >  static const struct of_device_id da7280_of_match[] = {
> > >  	{ .compatible = "dlg,da7280", },
> > >  	{ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, da7280_of_match);
> > > +#endif
> 
> Just for my own understanding, would it not work just as well
> to include of_device.h? This includes mod_devicetable.h which
> in turn defines the of_device_id struct (even if CONFIG_OF is
> not set).

The issue here is not that the structure is undefined, but the variable
is unused. We could also fix this by not using of_match_ptr() when
assigning the match table to the driver structure, making the variable
referenced even if CONFIG_OF is off.

> 
> The reason for asking is because it seems many drivers do not
> include these guards.

It could be that they are either only compiled with OF, or they decided
it is not worth saving a few bytes, or maybe they are used on ACPI-based
systems with PRP0001 bindings in which case the match table in the
driver might still be needed.

Thanks.

-- 
Dmitry
