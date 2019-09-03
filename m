Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742F8A6D59
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbfICPzS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 11:55:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46444 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbfICPzS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 11:55:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so3181200pfg.13;
        Tue, 03 Sep 2019 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HjIj0TCKxAKuR3QfpdPe/8S7nPK87N1m6h0smFsq8vo=;
        b=DuAP3yuj6/YBW2V8TYf3y74Yak+o8fl1Hpq1a/5PCJ3j70Z1AbIFqda42EpA9fAze6
         yFta1CyS5+z+GPJivsidCmsiBEmlSSrVeeDpm8kY+hnUMOTSFoVsiCfrGVYeEm4wAp/3
         Re502wSoKZVTgVPysIUrBfz74iLFZlviIn/Tt/Mk9iAJyOkPaYURSyVrk7gUEDTYNt3U
         5KN9qponoHQaIc3lY3smFgus74FAc5uQyP+4j1Va7wQV63NAAPAK+J7oJMFiqGJUKMCV
         Ol0gknSX8/4eLTv4bQoJpVLcrbUiDjRSfG9aOCo6EI1CYVQdxITDcHNpObreryRDrVwX
         uw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HjIj0TCKxAKuR3QfpdPe/8S7nPK87N1m6h0smFsq8vo=;
        b=nT73vPJPu9Bqj6k4eDBiRjhsRov0CvNmF+OWu2wzXz2JRLxEpSZfmFvZLuKMnfSt8/
         U68+qyoD+MFQg24rMFOwPUsulvThFnwSgb2QMMPElZjUoFgcWREDOmtWWTxcYTPQ/PRb
         +T083aEHCdyxEaveU1P5lbE6Ql8DEfLLGDfH8VibyAMSqe6ZR/XHPqaqr0ViFs+Zn5+6
         6aZreub4iUGzp9/FRBc4ki6hVI48K+jwKYgGeHcUW97TYNTA/e7+XNzlr2jXxJVbvW+d
         PUPF1c1qKcbrQnBSVLpPPif3WVcv91hNXn8fj2hl7FVPYnjXc23B2DxoKUW7ZuWoHcSu
         bf9g==
X-Gm-Message-State: APjAAAVTd9JriIo/wAMdvqoSsIy9jRAsXtd+9e3nlAjpaUVTCcBzAp2O
        9K/aKu9MF03iT54+tlS3/pc=
X-Google-Smtp-Source: APXvYqxWwDx3eMrG5RHWz4EZV/J06Xuc2lq2SZo7nCYK4bUJnfIw69wbcwWrNvVFHHcXach6sP3mlw==
X-Received: by 2002:a62:8204:: with SMTP id w4mr26531515pfd.30.1567526117581;
        Tue, 03 Sep 2019 08:55:17 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a134sm14974917pfa.162.2019.09.03.08.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 08:55:16 -0700 (PDT)
Date:   Tue, 3 Sep 2019 08:55:14 -0700
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     "Johnny.Chuang" <johnny.chuang@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        =?utf-8?B?J1NUUkQyLeiUoeaDoOWsiyc=?= <jennifer.tsai@emc.com.tw>,
        =?utf-8?B?J1NUUkQyLemZs+W0h+aYjue2k+eQhic=?= 
        <james.chen@emc.com.tw>,
        =?utf-8?B?J+aigeWNmue/lCc=?= <paul.liang@emc.com.tw>,
        'jeff' <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c - return real value of
 elants_i2c_initialize()
Message-ID: <20190903155514.GL187474@dtor-ws>
References: <1566958886-25756-1-git-send-email-johnny.chuang@emc.com.tw>
 <000601d55d49$05878160$10968420$@emc.com.tw>
 <20190829182933.GD187474@dtor-ws>
 <001e01d561ff$fb3d7000$f1b85000$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001e01d561ff$fb3d7000$f1b85000$@emc.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 03, 2019 at 10:33:33AM +0800, Johnny.Chuang wrote:
> Hi Dmitry,
> 
> Thanks for your explanation.
> If I want to abandon this patch, what's step I need to do?

Absolutely nothing ;) Consider it dropped.

> 
> Many thanks,
> Johnny
> -----Original Message-----
> From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com] 
> Sent: Friday, August 30, 2019 2:30 AM
> To: Johnny.Chuang
> Cc: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; STRD2-蔡惠嬋;
> STRD2-陳崇明經理; '梁博翔'; 'jeff'
> Subject: Re: [PATCH] Input: elants_i2c - return real value of
> elants_i2c_initialize()
> 
> Hi Johnny,
> 
> On Wed, Aug 28, 2019 at 10:33:46AM +0800, Johnny.Chuang wrote:
> > The return value of elants_i2c_initialize() was always 0.
> > It maybe register input device when initialize fail.
> 
> We do not want to return error here, because it will abort probe, and then
> we will not be able to initiate firmware flash flow so we can attempt to
> recover the device.
> 
> If you want to try you can change the ts->iap_mode before trying to register
> input device, but then you need to be very careful about registering and
> unregistering it later, after flashing or re-flashing firmware.
> 
> > 
> > Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> > ---
> >  drivers/input/touchscreen/elants_i2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/elants_i2c.c
> > b/drivers/input/touchscreen/elants_i2c.c
> > index d4ad24e..9c9816f 100644
> > --- a/drivers/input/touchscreen/elants_i2c.c
> > +++ b/drivers/input/touchscreen/elants_i2c.c
> > @@ -571,7 +571,7 @@ static int elants_i2c_initialize(struct elants_data
> *ts)
> >  	if (error)
> >  		ts->iap_mode = ELAN_IAP_RECOVERY;
> >  
> > -	return 0;
> > +	return error;
> >  }
> >  
> >  /*
> > --
> > 2.7.4
> > 
> 
> Thanks.
> 
> -- 
> Dmitry
> 

-- 
Dmitry
