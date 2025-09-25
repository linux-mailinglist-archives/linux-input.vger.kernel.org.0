Return-Path: <linux-input+bounces-15096-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C539B9D7D0
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 07:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0A133B4A66
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 05:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57F62E7F05;
	Thu, 25 Sep 2025 05:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2g+S9br"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D2D24DFF4
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 05:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758779143; cv=none; b=ki/Cbndhr3szH0f2Goh3HC3ANyJU+w4GJMU18Vdlrg0ic8qIU4UV7AMq2+EfzC2/nRoSDica62d1+xYnSVMH3AzdjtfF8nLaxnySugtmQDatxPz8DDzTsPyHGO2Oi9AYBSnLiBN091xW665zCskhNtK90rzxSyB1RzPOwZv6Pws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758779143; c=relaxed/simple;
	bh=y91CveNU8o61qRzBPIlmeKWPSA+K8ejO5zowlYxLNPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhhCuog3SAK83c0AFlwFR4NGociW6uANTKImBcghB3b6YfDH6Kdi5oG3UDaO+AozH4ckHScuv64FsKefjOJ+bZKEfoQ9xuydgmkzEQE7/1dpSUr+xS/5evIYEJvFfM8onoMY9guFoum8fO9n4VUC7bWCNJ4DNk5uH/ty1R+LT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2g+S9br; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2445805aa2eso5798045ad.1
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 22:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758779141; x=1759383941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q6VyKRbOn4TYUtmAcOT7qWbJ+MHx1s5wBeVwgJ07ek=;
        b=D2g+S9brKnGuc3tx2zqhfvgvLwLrlqIElr36sUgjOi2lXYO9iKupEG061yyBgpjEXE
         iYYfg+Q04QFqAWqG0Seev3IcbNtm0hp2ePi3TIQX40lTVixf8M5ehqbHhpst28B+j6NF
         ddfvCOIxD3dsbmiaR8L4D8h7Wc3smbzXwJ4V7uX6zj5g5QqbFzwE2Qjs3PqjiDIuWdH8
         ygrxPsn7tMn/0l/yfSItt2BBEEW0WEO9D3pqG1Hzz38x4SLn/WATbRCvGJVIUCdNNjNn
         OKIugOdp8wcnEEaWzl+WpECE0KTR2vu59zqiPn+V4UpaFEilHMKxnMosXUd2OTaE6EPk
         BgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779141; x=1759383941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q6VyKRbOn4TYUtmAcOT7qWbJ+MHx1s5wBeVwgJ07ek=;
        b=Wl+LXRj3/SbJd7QqgDhQVB07mHXZ/StRTbJuMhSvgAI8HPLHUj9US2xqJ4c/H7B90X
         /hNucMCjXEn0YvAUvzV1Cvrxn+7RieAmqZ0XmG82minDJrI0iDpsuR3my0pIU8tJCOm6
         bKB3SS0h8UrLCdwpABo3FvRHUGGnxgElxkXE5Ep/EuLp2H/uhTzXot8s8Fcr3fMZ9xo1
         mgiAMkBzcwGxDI+aBDonvXFiK2X/JMZmbgwgdYNf4tXwoOMO14fNaQ2cjHKJOuAHswtP
         baCSjI4WlhqdykOZhuHWk4/EtK3s4TwK1savYUbSTk8CUpzCc+FtGDmgleTpjDUv7XdV
         u4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWPE3zeoRYni5IenHhWtFrXWVpVG4oHpsrz5GpNtJbL/BgLTjgBD49E3ifUZKwie0eP+NjkU22rBNP9Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5sX4UULINE0N1BA73jwsmx1eAPb8KpwQ3n79dQpTws/uANxk4
	QJoR3f+szwhDN9un3c592odAHDwM86bxuGZ71yIj5NnqyZEm/UAWf/Lb
X-Gm-Gg: ASbGncvaGYfSotE7Qr4CTz5pKyl3HJ43lKOgvzaJVW1jSo0LS356SzDPZVI0SVL57z1
	wKMVS+PWiYThm2EiWBlQxKpEL1G2Z+r2X/O/Cyt3TNrgGrvmdUSTR27/+0HoH2z2zSFndm7k16H
	ThGLgSHC+ikuDQbSxe4cyoLHxIqnHiU06sZkxovNe0Pr2THA9brP0FwLOZnsjZNTma108wgiwgT
	Af/ZgBcVkZECTSRgLdy+5vLVFaag/me/DV534vadE+BIV5u7O4JTittsLA2ohjebmseOw43sV1k
	oWlbvDXWGbBwMx3waFv2DqvLsrno+EOWptMgABDGzp4UelTEUeNe+11FcGWel2ntY6kArvqoEMj
	0piEUD0478ekxOM+wKreIo8XASqflBF+3
X-Google-Smtp-Source: AGHT+IFHyxcxK4Vd8sIGKGdSk7wQBBMmiacmoNUDPi5/Fxp6WTX1EZgpGu3p+r4H5CbHYpbKWFBz3w==
X-Received: by 2002:a17:902:cf0d:b0:27d:69bd:cc65 with SMTP id d9443c01a7336-27ed4a96a83mr23489065ad.45.1758779141061;
        Wed, 24 Sep 2025 22:45:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8bbsm11739105ad.59.2025.09.24.22.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 22:45:40 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:45:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Courtney Cavin <courtney.cavin@sonymobile.com>, Vinod Koul <vkoul@kernel.org>, Bhushan Shah <bshah@kde.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: pm8941-pwrkey: Document
 wakeup-source property
Message-ID: <3kww5et2q2mqddpvtqzuj3jqzvfds66qrufawcmumamrqoaugk@tiq6zoe5psom>
References: <20250909-resin-wakeup-v1-0-46159940e02b@lucaweiss.eu>
 <20250909-resin-wakeup-v1-1-46159940e02b@lucaweiss.eu>
 <efb03993-0481-45ed-8f7e-8b65519a55cb@kernel.org>
 <phctwoxml7hscwcgaipl233lotnrkgcpe7rxvhm5syoiadu3lv@ibgeib4kjyhs>
 <9e39f1b4-63b2-4c6a-8b31-6360be1952e6@kernel.org>
 <dcdbc6424db6953dfc39fc05e0e050ab@lucaweiss.eu>
 <kxgvebizxvlflu4qen3cb5v4lcuydmdixvi7624hrggo7f5u5f@zbengtjkekfj>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kxgvebizxvlflu4qen3cb5v4lcuydmdixvi7624hrggo7f5u5f@zbengtjkekfj>

On Tue, Sep 09, 2025 at 07:54:33AM -0700, Dmitry Torokhov wrote:
> On Tue, Sep 09, 2025 at 04:41:26PM +0200, Luca Weiss wrote:
> > On 2025-09-09 16:33, Krzysztof Kozlowski wrote:
> > > On 09/09/2025 16:08, Dmitry Torokhov wrote:
> > > > > >    compatible:
> > > > > >      enum:
> > > > > > @@ -36,6 +33,11 @@ properties:
> > > > > >             pin should be configured for pull up.
> > > > > >      $ref: /schemas/types.yaml#/definitions/flag
> > > > > > 
> > > > > > +  wakeup-source:
> > > > > > +    description: |
> > > > > > +           Button can wake-up the system. Only applicable
> > > > > > for 'resin',
> > > > > > +           'pwrkey' always wakes the system by default.
> > > > > 
> > > > > 
> > > > > I'll fix existing code, so don't repeat that style.
> > > > 
> > > > If you ack I can reformat on my side to match the patch you just sent.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Thanks for fixing that up Krzysztof! I noticed but didn't want to deviate
> > from the style just for this description. Of course better to fix the
> > formatting in the first place.
> > 
> > @Dmitry: Maybe give this patch some time (1-2 weeks?) to gather more
> > feedback,
> > given the reasons outlined in the cover letter. Also on the driver patch.
> 
> OK, I'll hold on to this for a couple of weeks.

Nobody voiced any objections so far, so applied both.

-- 
Dmitry

