Return-Path: <linux-input+bounces-6191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAAA96C6D2
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2AC41C21B5C
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03501E0B81;
	Wed,  4 Sep 2024 18:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFNULMYb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC25E093;
	Wed,  4 Sep 2024 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476018; cv=none; b=bWbhVrc1Rx76jCp8ZKY816pTrkEBZzwRJLWa7t4HGWqZMDhF8v+AJZieEDuVHtRatLHNmF2p9OdeaYnnYUE3DX5X0kV59erijN4vlNwyo/Ps4dPZxXP1Rx0qwDqV0pbEsP+LH4fM5/kJHU8VaGsbopBDHD72ZWBMAekeAm3JLZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476018; c=relaxed/simple;
	bh=RJrRVEzXJI+a2hn4R12i9beqrn2sI0QMEqHi0DdYtuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuexJcdpjFxwpl2oOaCkgVodcOySpuKU8O/gj0qb7uJIkud/ANHudeV0a3pd5MK846VKR6UvLxy5IwJ3ZhVaDPLsgRnOA9sr+G5gYLs2R8aJ/+uvfrNP/2oH+NpBAKClTkbaesDu93a8vo+zo1O1ucu5ie1j+ffHIx9qYxMvxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFNULMYb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7141e20e31cso5663535b3a.3;
        Wed, 04 Sep 2024 11:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725476017; x=1726080817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/gJPDkA5vMIX2hQfZSOSL3Y4ECKZQBcfE6QNlOXBXO4=;
        b=VFNULMYbt9O9cT7CNk7cxJGMKmGMScxuPL0C4YETmR2JbfPvIowVanBtWmsPQlY3It
         ewcA7j3jZkaF1C+svRWd7XWM1dX+jVEK986a3lJjohpn4jWyMB4yo7J8MI5JSVPF2g4M
         EX/BEE5OPwlQ3DD3cOvGKKdQSBxmfhxvSNfj9hcysV2+sMb3tIGyRlO5zR6GxgNQhmyj
         8XrhHCVmHQmwKM5GkOTG3leycwYM5FsNYq5frPpteBXYYjVcJVsCsRYTVbVQ95yFuAZI
         9mB6DJvAS1r2QPhQoXvVNUll3cJj5zowihyL3gal5uL4e+4+Dl+ydc/FZAJ+J4VjnXAe
         WE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476017; x=1726080817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gJPDkA5vMIX2hQfZSOSL3Y4ECKZQBcfE6QNlOXBXO4=;
        b=i/li5/jUPiTbyxTzRVQzZHnf06GZtKVGECwgLg4COkmZySO/V47hTte+Ww3/JoEqS7
         C7nG5Sbsl1VuxqQJmxW7JmPgWmWOLSs4EUx2jIBIOojkWpT2a+caH+RwYM5zkUVsEqbu
         88smQlYWoumYQ+z/7K6erlgt0pmIxTbM7WCLoSlCPycSF0mI92gd8eSRdKiE6QLsoixh
         tOobCc7HeovpeTF4noB1fCM1xaVtybt1QR6lymF46cVxBLYSaCpskkaXPBhroB6753dz
         KVCpDoc2u9i7i4k8O1Z4hIoG41vyxVf+NAZo3i6+sBZsMk/YzNdUSF4xmSvSm+gFyHGL
         FRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhyTzJW65sS9MtLpSOq1yN84HOu8w1InXKWhBmXKbEJNWEqavxJQrIuQf49A9an/m6Od7Ld8CiWdmmKUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhwRj1Ikyka+mLUP3JemJMORrmM2duQNzTt2Atd+FQbHj9fz6U
	74OA34HyuxMatWxsBVxl1OD2/SjkJ6A2ueTKbO0tUL9TEB+oUI0cXrP+sQ==
X-Google-Smtp-Source: AGHT+IH17PXzrEmXUfH2jzHD3x2FT83SYKbBTkBMHlhF1erEIvc8Us0jX1lbIScsjNmYd5/fEQoGVw==
X-Received: by 2002:a05:6a00:1143:b0:714:200a:627e with SMTP id d2e1a72fcca58-7173cfbe0bfmr16924195b3a.19.1725476016422;
        Wed, 04 Sep 2024 11:53:36 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7178b5660adsm106378b3a.89.2024.09.04.11.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:53:35 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:53:32 -0700
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
Message-ID: <ZtisrIt5MdJhuwD_@google.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044756.1047629-1-dmitry.torokhov@gmail.com>
 <9cc5b106-88dc-4539-b831-3cc6cb3ef860@gmail.com>
 <ZtilRLKICDSXKyEp@google.com>
 <818a1972-2862-460c-89b7-476ac0680db7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <818a1972-2862-460c-89b7-476ac0680db7@gmail.com>

On Wed, Sep 04, 2024 at 08:41:30PM +0200, Javier Carrasco wrote:
> On 04/09/2024 20:21, Dmitry Torokhov wrote:
> > Hi Javier,
> > 
> > On Wed, Sep 04, 2024 at 03:53:40PM +0200, Javier Carrasco wrote:
> >> On 04/09/2024 06:47, Dmitry Torokhov wrote:
> >>> Using guard notation makes the code more compact and error handling
> >>> more robust by ensuring that mutexes are released in all code paths
> >>> when control leaves critical section.
> >>>
> >>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>> ---
> >>>  drivers/input/misc/iqs269a.c | 46 +++++++++++++-----------------------
> >>>  1 file changed, 16 insertions(+), 30 deletions(-)
> >>>
> >>> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> >>> index 843f8a3f3410..c34d847fa4af 100644
> >>> --- a/drivers/input/misc/iqs269a.c
> >>> +++ b/drivers/input/misc/iqs269a.c
> >>
> >> ...
> >>
> >>> @@ -453,9 +449,9 @@ static int iqs269_ati_base_get(struct iqs269_private *iqs269,
> >>>  	if (ch_num >= IQS269_NUM_CH)
> >>>  		return -EINVAL;
> >>>  
> >>> -	mutex_lock(&iqs269->lock);
> >>> +	guard(mutex)(&iqs269->lock);
> >>> +
> >>>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> >>
> >> maybe scoped_guard() to keep the scope of the mutex as it used to be?
> > 
> > Thank you for looking over patches.
> > 
> > It is just a few computations extra, so I decided not to use
> > scoped_guard(). Note that original code was forced to release mutex
> > early to avoid having to unlock it in all switch branches.
> > 
> >>
> >>> -	mutex_unlock(&iqs269->lock);
> >>>  
> >>>  	switch (engine_b & IQS269_CHx_ENG_B_ATI_BASE_MASK) {
> >>>  	case IQS269_CHx_ENG_B_ATI_BASE_75:
> >>> @@ -491,7 +487,7 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
> >>>  	if (target > IQS269_CHx_ENG_B_ATI_TARGET_MAX)
> >>>  		return -EINVAL;
> >>>  
> >>> -	mutex_lock(&iqs269->lock);
> >>> +	guard(mutex)(&iqs269->lock);
> >>>  
> >>>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> >>>  
> >>> @@ -501,8 +497,6 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
> >>>  	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
> >>>  	iqs269->ati_current = false;
> >>>  
> >>> -	mutex_unlock(&iqs269->lock);
> >>> -
> >>>  	return 0;
> >>>  }
> >>>  
> >>> @@ -515,10 +509,9 @@ static int iqs269_ati_target_get(struct iqs269_private *iqs269,
> >>>  	if (ch_num >= IQS269_NUM_CH)
> >>>  		return -EINVAL;
> >>>  
> >>> -	mutex_lock(&iqs269->lock);
> >>> -	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> >>> -	mutex_unlock(&iqs269->lock);
> >>> +	guard(mutex)(&iqs269->lock);
> >>
> >> same here?
> >>
> >>>  
> >>> +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> >>>  	*target = (engine_b & IQS269_CHx_ENG_B_ATI_TARGET_MASK) * 32;
> > 
> > Same here, calculating the line above will take no time at all...
> > 
> > Thanks.
> > 
> 
> As you pointed out, in reality the extra locked instructions will not
> make any difference. But as the conversion added instructions to be
> locked by the mutex without mentioning it, I thought it should be either
> left as it used to be with scoped_guard(), or explicitly mentioned in
> the description.
> 
> No strong feelings against it, but out of curiosity, why would you
> rather use guard()? I think scoped_guard() is a better way to
> self-document what has to be accessed via mutex, and what not.

Simply less indentation ;) and in this driver uniformity with for example
iqs269_ati_target_set() where critical section does indeed extend to the
whole function.

Not super strong arguments either.

-- 
Dmitry

