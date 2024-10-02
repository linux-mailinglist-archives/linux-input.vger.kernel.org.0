Return-Path: <linux-input+bounces-7014-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49098D232
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 13:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26B51B21B0C
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F4C1E7646;
	Wed,  2 Oct 2024 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6wxxkdj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA381E6DD4
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868501; cv=none; b=G4pNljMVcAvOgIPx8J+gpaukqBAxIcVsaMTv1XpnOBNMq8vXYVOtcnkngB/V/iOoq+pSws6lZddQFwdG8T7jWuZ68y1xVekuXfPElX4q45AEXGeB0Ae4B3eYru+PSFyHKZIifv8bNoErRCkxl5nhIlvQK2smbW9DajTRIyfYZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868501; c=relaxed/simple;
	bh=xo+oBDeBFnvA5nmTYcV67LvOa+i4s/0IhoyeknTKOfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shGkmirCOZe0m/VJeyYygMpOheOsS1unot3a2ZbdfCF6NmRnT8xEQNNceG/T1yfaW77UEPmurnzBvk9gEdPhjdneWDmBayTFieVR+muG5BN2XB5ck5hCOtNYTq0uLlxl16t0V0QFWVQqpjWPYPbtjfCAixskVehC3sYnZBdo0TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6wxxkdj; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e07d91f78aso4936587a91.1
        for <linux-input@vger.kernel.org>; Wed, 02 Oct 2024 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727868499; x=1728473299; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AdtHqpPmHUdiLup/75DGUiY8zsZpqPCyoOBhA9PP9nQ=;
        b=H6wxxkdjghvnpv4ftNH+ve132YWgUZLpGUsWR9sX15+YsW69/yJRsmS6adLsoO4V0Q
         /l9edi3+y4HwZp4peZNM4hepwhYW/ZRMzNdTKKnrvKhkE06WxIA6eEewQunlpNAIvEot
         qhQNW8P/X/x7lGxVkELES2DTCxJ2aLXk0OpxnmHI5uHR4rrzcHi36zaqcRwxSL3daMei
         6lKozFkykn0W1kx2BYa5v7E1qlu8748nelcN6gwpeGD3tbMqIr1D5OOgpxLrmRYOoYDu
         OBj9M+b+RXQapGbCOSY49Gblb9a7s00jsau98b6v3S/NSV0K14c426x1kBgYA7qeK9vE
         aU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868499; x=1728473299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdtHqpPmHUdiLup/75DGUiY8zsZpqPCyoOBhA9PP9nQ=;
        b=UjMdJfk2g/TvpG4XyHPhtAD5+YXKjXf+FYl9HqhJMNhC7XOcc4Pl+E3qGimgd/gwFc
         t237+YKPutBWZSyWJ/uqrknocWhLZyWg8fYdHglSToNisFvUIZpFBplQ7lqF1X27PQZ0
         VpmdSpGpC32tSksOv2RdzLAlPaCH88IPWxCYJMVKYYVc9XiqQ2RJd6erLqSiLPTSsOX9
         9bTjP3ZeJQo2V1o6/orbWXYQaRTa3255/Oqjhui55qRGCIdA3dATqPTOp4ngcHosmc/A
         5VV6I0Py6/U8N6aUuizMBled1vJxfG11hO+y6Bd+wWmuwXqCImpydm6XPHmftgNRmSX1
         HVGw==
X-Forwarded-Encrypted: i=1; AJvYcCXJUfySptYSA1UIPULpS7gFsA62kRV2u3BjA2Lu+ciRu5R3zRP4aTZdOlORtMdoMS5FCzbnOZy2HtiM4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0CfdXD5kCHK9TdYWZA81x4JLMlp4TlRoosGyQKVAVsuAmsRRa
	sAuKUJ3I8qHAhbQTXJ6Ef+R14BtpKF2EUMwPdjFnan5dyu+3Odt3
X-Google-Smtp-Source: AGHT+IG8BK+h9Qkr5j9a2ZsL0ysRN+Ps+xSX8qWGz8MuEWtsv0QEZNmO5Xw261Shnyz9KRKUwuK55g==
X-Received: by 2002:a17:90b:1e42:b0:2d8:ebef:547 with SMTP id 98e67ed59e1d1-2e18496989dmr3400566a91.35.1727868499544;
        Wed, 02 Oct 2024 04:28:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:59b3:a140:3cbe:62fc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18f8c7cf5sm1305834a91.41.2024.10.02.04.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:28:19 -0700 (PDT)
Date: Wed, 2 Oct 2024 04:28:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, Michael Hennerich <michael.hennerich@analog.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: adp5588-keys: bail on returned error
Message-ID: <Zv0uUH6dV_bFK6M-@google.com>
References: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
 <20241002-fix-adp5588-read-refactor-v1-1-28800f1b9773@analog.com>
 <Zv0pzelCZJpI0dxa@google.com>
 <58d1af4cddbbf5f96cc5f3d08eae4250b636b257.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58d1af4cddbbf5f96cc5f3d08eae4250b636b257.camel@gmail.com>

On Wed, Oct 02, 2024 at 01:23:18PM +0200, Nuno Sá wrote:
> On Wed, 2024-10-02 at 04:09 -0700, Dmitry Torokhov wrote:
> > Hi Nuno,
> > 
> > On Wed, Oct 02, 2024 at 12:51:50PM +0200, Nuno Sa via B4 Relay wrote:
> > > @@ -455,8 +457,16 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
> > >  	for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
> > >  		kpad->dat_out[i] = adp5588_read(kpad->client,
> > >  						GPIO_DAT_OUT1 + i);
> > > +		if (kpad->dat_out[i] < 0)
> > > +			return kpad->dat_out[i];
> > > +
> > >  		kpad->dir[i] = adp5588_read(kpad->client, GPIO_DIR1 + i);
> > > +		if (kpad->dir[i] < 0)
> > > +			return kpad->dir[i];
> > > +
> > >  		kpad->pull_dis[i] = adp5588_read(kpad->client, GPIO_PULL1 + i);
> > > +		if (kpad->pull_dis[i] < 0)
> > > +			return kpad->pull_dis[i];
> > 
> > 
> > Unfortunately all these are u8 so they will never be negative. You need
> > to do the adp5588_read() refactor first and then (or maybe together) add
> > error checking.
> > 
> 
> Ahh crap... Completely missed that. Yeah, will see what looks better... Thanks for
> catching this.
> 
> BTW, this is also wrong in the adp5589 series.

I didn't get that far there ;)

Thanks.

-- 
Dmitry

