Return-Path: <linux-input+bounces-6183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CFA96C63E
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78514285C3B
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3139E1E1A04;
	Wed,  4 Sep 2024 18:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cgrp5k09"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23091DA319;
	Wed,  4 Sep 2024 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725474122; cv=none; b=DOcwgpD+Wc6hejdd+kp+DUpEpY7YryFtmWXEuC0Q4UW3gkxREZcLHTt1enk0+oTBWoX9HvrggY0gzQGBXSL24TK1V0ZoRcLJYlKxGP+RJlHvDU23V7nGanaRmMFnvpHvbhN9suVDamCRchHBjzu+BU7qVLrAPRMh4n73rI1loOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725474122; c=relaxed/simple;
	bh=A0faNTxkiMzBYmuTTN0ZzLV4veAU5OaMV1hnDsvBwIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwFihvusEnxmQFKCD0rq6K3yTvzhZNAeZLa8sws6YbLzZU74YQiHzX6//4CmXwNpRk5Fm7JRadrJgQaH85CpVuRjEyynKvUK8AnCNcXDNw2iZwiceeMnVTHl+XFXOLnt6S0/3IC4o4vPESJJ0yLzvIZeg7Svp50GZHj+wM6TzoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cgrp5k09; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d86f71353dso885025a91.2;
        Wed, 04 Sep 2024 11:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725474120; x=1726078920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJpc+ZEMX6jhpZEWdLE1bD6DvQQdbuNOMH/8jm0J4lw=;
        b=Cgrp5k09+134eXLgAXjny4woJDAtj7r9RCLZIyYswD5xS5rwT1THmfa9evMA0rolAk
         ZLXrJi//mux///zJE49u2nAX4btRySZAUbEZmdJodKu4OJgBTaiaCtXWMPUPBdynBMyk
         +pYS3iBvL6Pguk6f3+wIT9CquCnoKP748DQgXNYyZjJAVKCVkj5sKaOGwscZEVSVOxXA
         mfoInZ9XDHJtlhm2q0l+jvZOLuSs5/6Cx4/U2jNM6AdHgcnpQvrEi03r/3j7rbdEwDVm
         9SdKz9zQCrqcC7omDxKRQOtz90xkYZpEmC6uFQebb+CHbxQ7JXStqHyL8+BM8CgXl1F2
         Xqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725474120; x=1726078920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJpc+ZEMX6jhpZEWdLE1bD6DvQQdbuNOMH/8jm0J4lw=;
        b=hy3mvK9kB0HCSeArA8ZPltCVnrsc3eLtwNUTjihGnmvEmgrCY4jKvV005KWDv6TsOY
         SQb/NI3g2qzLRLDCwgbIXrXMbiZq8zJLxhttx030AjWXJQ1VKYRFrEvwkqNqgZCCC5oW
         WwLHmSsiVwKneLdvlPyTn4djfPM65kY+mTuOD/meWPZ0mfBx2beBDZ+3dHONKYOgRRU3
         PQMps155YWmXer/7a7FpFf9SwcIVteJ5FMAtpICf4MT2h++UAdpAPL3u0PDLw7oHzgNo
         ZqvLDJgxEoRRfhxk5ON/KP1jpZCC2w8W5fwyUu6sNKlq9mJ0U6FK7hzcSkCBiRMK1hDT
         +kCA==
X-Forwarded-Encrypted: i=1; AJvYcCVLmX5d6iZye9AtW8j6kTAlKHiDmE67+f4GvJu2JccP8bD4if4BVCaIWFPfSTcenzBrHj0rxRpfhxDXEMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP9fFLszJ2KA+fDIsLtSISDxJIup3sWSg/9Q6747IYF+4S/c5u
	3xyOr7WBBus0i4S/4b6Ya+XTnJ/tOL3eLmYXuKcUmU5eOF916lz2
X-Google-Smtp-Source: AGHT+IFphHoOiRbLa07D7e0spLfqWeZxZAUZ4YyltwytzvEzrp1ktg5YzCRb0xvYK4QxHCbVnrdIzg==
X-Received: by 2002:a17:90b:1c90:b0:2d1:bf48:e767 with SMTP id 98e67ed59e1d1-2d856392068mr20847722a91.29.1725474119722;
        Wed, 04 Sep 2024 11:21:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da7224197asm3552274a91.31.2024.09.04.11.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:21:59 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:21:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/22] Input: iqs269a - use guard notation when acquiring
 mutex
Message-ID: <ZtilRLKICDSXKyEp@google.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044756.1047629-1-dmitry.torokhov@gmail.com>
 <9cc5b106-88dc-4539-b831-3cc6cb3ef860@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cc5b106-88dc-4539-b831-3cc6cb3ef860@gmail.com>

Hi Javier,

On Wed, Sep 04, 2024 at 03:53:40PM +0200, Javier Carrasco wrote:
> On 04/09/2024 06:47, Dmitry Torokhov wrote:
> > Using guard notation makes the code more compact and error handling
> > more robust by ensuring that mutexes are released in all code paths
> > when control leaves critical section.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/misc/iqs269a.c | 46 +++++++++++++-----------------------
> >  1 file changed, 16 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> > index 843f8a3f3410..c34d847fa4af 100644
> > --- a/drivers/input/misc/iqs269a.c
> > +++ b/drivers/input/misc/iqs269a.c
> 
> ...
> 
> > @@ -453,9 +449,9 @@ static int iqs269_ati_base_get(struct iqs269_private *iqs269,
> >  	if (ch_num >= IQS269_NUM_CH)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&iqs269->lock);
> > +	guard(mutex)(&iqs269->lock);
> > +
> >  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> 
> maybe scoped_guard() to keep the scope of the mutex as it used to be?

Thank you for looking over patches.

It is just a few computations extra, so I decided not to use
scoped_guard(). Note that original code was forced to release mutex
early to avoid having to unlock it in all switch branches.

> 
> > -	mutex_unlock(&iqs269->lock);
> >  
> >  	switch (engine_b & IQS269_CHx_ENG_B_ATI_BASE_MASK) {
> >  	case IQS269_CHx_ENG_B_ATI_BASE_75:
> > @@ -491,7 +487,7 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
> >  	if (target > IQS269_CHx_ENG_B_ATI_TARGET_MAX)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&iqs269->lock);
> > +	guard(mutex)(&iqs269->lock);
> >  
> >  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> >  
> > @@ -501,8 +497,6 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
> >  	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
> >  	iqs269->ati_current = false;
> >  
> > -	mutex_unlock(&iqs269->lock);
> > -
> >  	return 0;
> >  }
> >  
> > @@ -515,10 +509,9 @@ static int iqs269_ati_target_get(struct iqs269_private *iqs269,
> >  	if (ch_num >= IQS269_NUM_CH)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&iqs269->lock);
> > -	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> > -	mutex_unlock(&iqs269->lock);
> > +	guard(mutex)(&iqs269->lock);
> 
> same here?
> 
> >  
> > +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> >  	*target = (engine_b & IQS269_CHx_ENG_B_ATI_TARGET_MASK) * 32;

Same here, calculating the line above will take no time at all...

Thanks.

-- 
Dmitry

