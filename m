Return-Path: <linux-input+bounces-8261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161D9DA075
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 02:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FEFB281D5C
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 01:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96ECF18E0E;
	Wed, 27 Nov 2024 01:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHLuzg68"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE1ECF;
	Wed, 27 Nov 2024 01:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732672308; cv=none; b=QBBbQl9y4ANkBb6leNrFwXw7eFzQt/JwfHI//rEFqLIKoO7nXiB/CJMspGQSXexADuwr7ioHjYjstW85Wa7wBJi1kjDQgyGG3KxNzgNFD4UEzqC57tnDzqjSjHoYdX5k4wV+JFqrWgAEYxDe/oOmhzRXT7IQl3QxNqJscSKrq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732672308; c=relaxed/simple;
	bh=NidMgqMWIjDze9tE3gkGIg9VormyUGi9/RD3MgaGCmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akp4k1pp7CZBD85GRlQ0NB6l+5aBtw2G/j2skyjuGW+oknUN63Lqw6PjO5J/e66ELX9/mY/MzTeE6jztCUah64A2gxMhlkbcLHIrC5iZRpkK2Ctx/b0QUa8o/Yu3GNqaPMlaeRnXHg9D0XzBgJeE7ChfO63L1QlNKoq1DId2BXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHLuzg68; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ea4e9e6ef2so4947840a91.1;
        Tue, 26 Nov 2024 17:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732672306; x=1733277106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f6yJthSITZz0JgeCwZB+IqdVfVUyc0ONXrqOpbvTgLw=;
        b=IHLuzg68XJcl/YyZOxhJGQOK4j5u1RNdccKeqm327+pCs9JmahiNN5IUUi/L85ggfU
         3Kvnl3Rv9Piq+HtCXUVxzBET2PvgkGQzImbqk7zCAYnMO+cR/n0425djRYbpvfKvmIkK
         uJtNZEFKSshLJmYI8/ZkCNYZkAyx9HkG4UcBGKL6yysC/GjMlXPvCEL3yeaKK1zrrkRr
         4Lzf00k8WGVuf50yA4CMWnKe5sxbSaL2ey5wlTz2ZaMY08Tya4LAPxIU+EHmQoeLhlgQ
         e4piHhikVgVtBUduG4iqczVb4nQ87u58EKk8z46zCfI+3RoP3E7mhFceNH5J2kCauXJH
         d4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732672306; x=1733277106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6yJthSITZz0JgeCwZB+IqdVfVUyc0ONXrqOpbvTgLw=;
        b=VbV2oLv+jDp0pPmUmn/oB1VWaurceRbMMFvzveyGughoyK4R83AWQ2+XxWjEdXDh2Y
         BxIwxYoOrnsWLy1doBRW3aPciDO8YxEdM+5Cm7V4S9sHnK4FoJeS+cnTxm0m8AilGcf1
         zpr8reKC1sbMSDj0qxwEpUXYZ/FxhpyydL4jeXu1MEfLiVEzW9bVZt+5QZ90N43qSjmH
         ujr8pwqoy1TUFiZvIYuQVPjm/UejK8Xmtw39OIoRmas3/ispIAj97OKFXQe3j1/oU4t1
         cKrSb5KrKrQHRPjZY4lk+8Ppse1XwBeAkVbwCZr0pBtnWACIoE5V+zkbKAyQbORvxqrp
         CSuw==
X-Forwarded-Encrypted: i=1; AJvYcCUNdRrM2nID+P+ZvQ0cfaRdKpoVOvu2Vc04OUET4aeDRO/8NxaZvJTHM0LuCZ2SXuBIYePuOhECh0FgVAc=@vger.kernel.org, AJvYcCXJ5ux6RQHZbpFMlU7txGmCfR2BfoGYitesPL3Liv9wXDCcrXig/7wD9DGXZ+H3+uezGZZvifxbSlwkvb0X@vger.kernel.org, AJvYcCXaJOZxb4e/8SnwMlm7oX8HgCUITQt/5AihcpZ/NFhEwkW8RyRDIix+MH3JkLFI9n0k6TvRUZ+aEg+W@vger.kernel.org
X-Gm-Message-State: AOJu0YxeECR1MgHJOAVeaSRVdQMMVh/49oc6HsMpvV/DuuGIamTAAhTl
	ugM8m1EK711SatdesxnMwrSWYSol2avh57sNF5qZ9MUNWIICvDyC
X-Gm-Gg: ASbGncvZGN6Go8JQEzCb9k8o2DXjWIpENFXI5VFuBsoorQJvJYn5BoKVRuoZ++rC1nb
	MYdAz7AG2Zr2ocl+nlTk0/eDm7sjr2Y2IGSVJJIsrFju6mMG7lheEfShAXU+IXfZ1CQiDS/j4Ol
	Fl+RUo5u28ULkQUnNmMlAsipoJfblp8CPJl9L2ZNsH4qUIA2JC5SlCyXcx8QNiW6u6fkEYMKgeT
	YSWp5qX0UoKdPxRuu37X1+98QKpHlx38jXTns5uQC0pymCBq4U=
X-Google-Smtp-Source: AGHT+IGWUC26ECFB/XST5h32zsfNM+cTFebDB426koYcgqVJ4sR4f37BBk7oSc1604wiVBTnh/A1ng==
X-Received: by 2002:a17:90b:1d81:b0:2ea:7d8f:6f17 with SMTP id 98e67ed59e1d1-2ee08eb5cecmr2142866a91.10.1732672306240;
        Tue, 26 Nov 2024 17:51:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fa6134fsm248728a91.18.2024.11.26.17.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 17:51:45 -0800 (PST)
Date: Tue, 26 Nov 2024 17:51:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
Message-ID: <Z0Z7Lrv3rBfzac_e@google.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>

Hi Sasha,

On Tue, Nov 26, 2024 at 09:47:58PM +0100, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and for the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
> in charge of speaking Z2 to the touchbar).
> 
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
> 
> The extra gpio needed to be toggled turned out to be a quirk of the
> j293, normal CS is unusable on it, and a gpio has to be used instead.
> (j493 does not have this quirk)

I believe this needs to be done at the SPI controller level. See
"cs-gpiods" property in
Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
as I understand, allows overriding controller's native CS handling with
a GPIO when needed.

Cc-ing Mark Brown.

Thanks.

-- 
Dmitry

