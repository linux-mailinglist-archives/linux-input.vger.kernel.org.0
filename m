Return-Path: <linux-input+bounces-383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 610708017CB
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 00:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 867FA1C209BD
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 23:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E493F2D605;
	Fri,  1 Dec 2023 23:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYqOq338"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3423191;
	Fri,  1 Dec 2023 15:33:28 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b88f2a37deso825347b6e.0;
        Fri, 01 Dec 2023 15:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701473607; x=1702078407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=398jrWXkKZ2OzVRfOWZIi2jn7K7bDwM+UrCKJ7haNV0=;
        b=gYqOq338qOAuTz9SlXipK4H4XBzVpRrl2/H0jGrX3WZObpu5VYjdVlMNGyn+OoIfJx
         IwR4WouWqI7d+vOkMESRfi3aHjcNQUgTNs3SxFFQizDQgLxjFi3lAE/LbRGs4uOCI+CR
         EvD2PuhY54KLTIC2Hmq6m7mtsBTL6Kxe8JY6AHh+Ah1ZuGv8i5Zc0XL2SDR+h61qQz1S
         FUlmRcROVbmmlYfzFt8uFXgT7e3dqwLjDZ7hx8y08En2O+0BpXetc9XGNIJa+fbxoPfr
         n1y/UedMUrHxe2AxGMF2YVJnCoSWGBbKS7+OAKVeuCF2FAu7OBozcZ2Wc8IeJydCb1GD
         +QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701473607; x=1702078407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=398jrWXkKZ2OzVRfOWZIi2jn7K7bDwM+UrCKJ7haNV0=;
        b=KKkKlKOq4SiFdhPRNYVHb2UXM17qGyCLazTlMItTnq/qmaRyoXhMeIC/h1/iNvFOBD
         ezR1vXAplpqRbWxBvha2zwJFFBPkoYIAGKgQP01allbFKCpZpm2sgHvBN3RPEpFRBTL9
         nBLk08e1MzHyFhPPmm6vTzNlm0qft2i97eH3+KPY6w97NlhaFujHgR+578AlgHuAml1Z
         VPyOy3b8e5+VnaDJLpt9+ip2U0JdbJ6rQDwltwTq2g0Yu9yrMMk5G4vak9rJf/hs59AW
         ay1hLZ5sNBT7JxSZYREgeI4wjAh2o1SYCeAYHBKitSGgG1DpPbBxXK+uV0Lky4lsgNEF
         /HXw==
X-Gm-Message-State: AOJu0YyNmiuevjEn3bj4ewgdPlzCPN4NQ1S+fJFPRnQfoT7lnV57eM/Y
	tJF/x28xgGsoC0GILTbdGu4=
X-Google-Smtp-Source: AGHT+IFB3Et7yr7wPIzfEHSEIJHVBUYFZD6mzQRTb1RfVxnL6iMR2V50BOPC9e2LOmF/v/THyaK5NA==
X-Received: by 2002:a05:6358:904e:b0:170:17ea:f4e2 with SMTP id f14-20020a056358904e00b0017017eaf4e2mr304083rwf.47.1701473607279;
        Fri, 01 Dec 2023 15:33:27 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1900:8815:33a8:c99c])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001cfc1a593f7sm3863866plf.217.2023.12.01.15.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:33:26 -0800 (PST)
Date: Fri, 1 Dec 2023 15:33:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pxrc - simplify mutex handling with guard macro
Message-ID: <ZWptRAQ0OoK7RpDu@google.com>
References: <20231201-pxrc-guard-v1-1-38937e657368@gmail.com>
 <ZWnfsjIukIbAvQ-l@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWnfsjIukIbAvQ-l@hovoldconsulting.com>

On Fri, Dec 01, 2023 at 02:29:22PM +0100, Johan Hovold wrote:
> On Fri, Dec 01, 2023 at 01:08:45PM +0100, Marcus Folkesson wrote:
> > Use the guard(mutex) macro for handle mutex lock/unlocks.
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> 
> A couple of drive-by comments below.
> 
> > ---
> >  drivers/input/joystick/pxrc.c | 27 +++++++++++----------------
> >  1 file changed, 11 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
> > index ea2bf5951d67..3c3bf7179b46 100644
> > --- a/drivers/input/joystick/pxrc.c
> > +++ b/drivers/input/joystick/pxrc.c
> > @@ -5,15 +5,17 @@
> >   * Copyright (C) 2018 Marcus Folkesson <marcus.folkesson@gmail.com>
> >   */
> >  
> > -#include <linux/kernel.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/errno.h>
> > -#include <linux/slab.h>
> > +#include <linux/input.h>
> > +#include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> >  #include <linux/uaccess.h>
> > +
> >  #include <linux/usb.h>
> >  #include <linux/usb/input.h>
> > -#include <linux/mutex.h>
> > -#include <linux/input.h>
> 
> Looks like an unrelated change.
>   
> >  #define PXRC_VENDOR_ID		0x1781
> >  #define PXRC_PRODUCT_ID		0x0898
> > @@ -89,25 +91,20 @@ static int pxrc_open(struct input_dev *input)
> >  		dev_err(&pxrc->intf->dev,
> >  			"%s - usb_submit_urb failed, error: %d\n",
> >  			__func__, retval);
> > -		retval = -EIO;
> > -		goto out;
> > +		return -EIO;
> >  	}
> >  
> >  	pxrc->is_open = true;
> > -
> > -out:
> > -	mutex_unlock(&pxrc->pm_mutex);
> > -	return retval;
> > +	return 0;
> >  }
> 
> Eh, this looks obviously broken. Did you not test this before
> submitting? I assume lockdep would complain loudly too.
> 
> You're apparently the author of this driver and can test it, but I fear
> the coming onslaught of untested guard conversions from the "cleanup"
> crew. Not sure I find the result generally more readable either.

Yeah, for the code without conditions (like pxrc_close) the utility is
questionable, but I guess it is just a matter of getting used to the new
facilities...

Thanks.

-- 
Dmitry

