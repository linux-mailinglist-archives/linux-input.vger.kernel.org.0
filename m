Return-Path: <linux-input+bounces-5249-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 902BE9434E4
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 19:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CA7EB21F8A
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 17:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943D6288B1;
	Wed, 31 Jul 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRj47Qt0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F551396;
	Wed, 31 Jul 2024 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722446488; cv=none; b=efNtaPRyxU4ETop215DLBItaOq5aszSEH9Hm7X1A8uvLuULXzAzZQDUo60zdZrnXxYWOCzh36ZS2vVL/5U1NNtE7h10hYg70Xr1MbBL1j0I6WXOg5W4jz52oAj2XgsProSM6hpTdkgZpq7Ja8dma4dur+NYOYHaoR21fW/bn6Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722446488; c=relaxed/simple;
	bh=CG14NY2A0ihH7oohN1CWODLoVUIME2UXWhcp66wtfpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwkluYEP37+0ejjyoXcDypTW3x8Uo2HBwd5Uun2lclzCY+BGG7oLeCyel0PMSilvICyIPjh1w/FeZsYfJt3+dYINcKZ8CjCMjg+24QPCI2c0W5usy1GvjlfVSlNbgcjAeM935McSq1SWNHIljgthhZDaPPhsdtVCyikeASu/NVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRj47Qt0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ff3d5c6e9eso16123265ad.1;
        Wed, 31 Jul 2024 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722446486; x=1723051286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPgq514fiAPaLYvLga2vUyWNlDF+aYYzYIabngonVww=;
        b=XRj47Qt0jZ9/4CXVPCFlUR7W2L+iDG2Aax6xj5envcl06/p0KaQt3H45VggOJ3TZ2p
         aZHTNNMuu/uo7OcyKpUZE1QFwtm3y1mXou01CsPZwJM4RPlsCkz8TY4zrtpVXDfD3wmk
         7SyFmbmfbLbr047UeE6cIAxc8C3abyFQ1eta7V+beXAEljX3ES5vd59UYnybMuuT47N/
         4EJNbKcAyQnljo+JcosncTHX/8keQ3IlVCQaKyAVvhzB/nUeMijgoQHTogzk1bciCgXF
         V5llRA8IGKeZmdSBN3ehMNSgXIq2Bhn7By3n5CJAnKH9IGOvBYPLkb9tX4sb4K7PZdTv
         YNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722446486; x=1723051286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPgq514fiAPaLYvLga2vUyWNlDF+aYYzYIabngonVww=;
        b=UeHEQA45MyNRbr9iJ5bdKyOjHczLazmUX1ESis1CXbXH7di1sj/s8jf2WZane8uGCx
         rTfr+rFmj5flm5ZNBstLmg5Awzsp9TEW8SbGAiIAP3eYF7O0SZpfNMBJYMF4n3Z6uLvQ
         qMCTta8deMuk4yhTrjdu2q42y7VbiwAzdbGcMyE7q3tC8ZjkT+LtwBF6xym+xIRD2snR
         h7pdajOhWXGb000b3Jn0R2EYvr6DPoIoOS3njSLbui6cyR7HnJgo4bpqKYwH2dbKmUCn
         lrPils7P2vPLJ3wpmKQZh8a3xqnZa+nujrk/x3/d3YM2CqIvDGkeqCaZmJ2nyhhvekZ7
         H5dg==
X-Forwarded-Encrypted: i=1; AJvYcCWS6xD6KK+/K5zBJygbHCmOQ+QxNavgOBIgyTrevsS8BIxxBt6XieSDRsndmyM9sOogoU7bPGIlS15YXzM8B3tOKcGjqhKXJJ6k+eVrmgACysA9Tq7A2/RmLx0DiJgsQH3ieQD4bpteK7M=
X-Gm-Message-State: AOJu0YwxM5nlgB7XpWtOs556oxAbRK7d1Yyl7hhAAwwfNtFBEkV4tAwo
	jHSsE89AnJahc24B9wzRSQg+/XRtxP6WomhMpQ0Z93UbO4+4iXZJ
X-Google-Smtp-Source: AGHT+IHLvQNW5jJT1CuCBU+Kx8QYf0NulawWCf96QEEU0iZZBaTSwTPQERqLYLi8ZCqQhvr2EqumDg==
X-Received: by 2002:a17:903:190:b0:1fb:3474:9500 with SMTP id d9443c01a7336-1ff04842406mr115764175ad.27.1722446485846;
        Wed, 31 Jul 2024 10:21:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ca9420sm122872895ad.63.2024.07.31.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 10:21:25 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:21:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macromorgan@hotmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adc-joystick - fix optional value handling
Message-ID: <ZqpykkwdhS-Oz1RC@google.com>
References: <20240731093310.3696919-1-jkeeping@inmusicbrands.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731093310.3696919-1-jkeeping@inmusicbrands.com>

On Wed, Jul 31, 2024 at 10:33:09AM +0100, John Keeping wrote:
> The abs-fuzz and abs-flat properties are documented as optional.  When
> these are absent, fwnode_property_read_u32() will leave the input
> unchanged, meaning that an axis either picks up the value for the
> previous axis or an uninitialized value.
> 
> Explicitly set these values to zero when they are unspecified to match
> the documented behaviour in the device tree bindings.
> 
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Applied, thank you.

-- 
Dmitry

