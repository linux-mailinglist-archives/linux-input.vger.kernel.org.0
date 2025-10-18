Return-Path: <linux-input+bounces-15584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CC358BEC71A
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 06:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 416863502ED
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 04:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373A9286D40;
	Sat, 18 Oct 2025 04:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5mWOdgv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E852750FB
	for <linux-input@vger.kernel.org>; Sat, 18 Oct 2025 04:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760761368; cv=none; b=ImQp7i/wo+0NCqjhsbT/IFmPJBQQpairtcS94Izc8cJmpSXQxU90HI1Gop8/hPRQyhS57uhpgLFh40CvrOaIWKoIytCfAwC3Wj7jfyhbKN84Ay4CraT+1U0X6CRDigX05DXNnMy+MnqJHG5JzR4MXbZE/kuGflCACGr7y1GB2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760761368; c=relaxed/simple;
	bh=exZpVuWOIBxlqb5BFOJUqBQoP1y1IaWov30sQCj+Y2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ptsta2KVEWVKGyMpwo5X7BMLYsEbvbLvJy76FTtIkCkrs86OfWV0G19ufQTeCUjIVW+oTElwotOgSKJUQBQ0BTRI7BtgovfL4kNtlpNXK3lKaO1fho2B2C+lFZ3An4gveSaiB5gZmf1NG1bxh4XSVVHfhNRRW03Ozr3OpYYNgPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5mWOdgv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2909448641eso25013375ad.1
        for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 21:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760761366; x=1761366166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZFnDDXwZoBpjbUJskJ8yzMDCPN1YwW/10NX6AdoJr4=;
        b=f5mWOdgvO1R5dFNH81x31/A1rT99kQwDD1Wd+GefQHRxFLnPrgmVJ3DKxxQSt7R9pe
         cqpnzNaksnKfIjDqOHf0fiN72RDRmO6MidnM1tDnqkbHYkGLZl+tvMr4sNvqFLt496ot
         3vDROh+fEjUOlNro8uq0HnFzLTl1ND64yzWiYM5DqOlPmut9jCGO2zhv3GAtUPW9af0D
         pCRnAmqTKumZcwCIZVgRvagbeUuvCT/GXXcr94UMXX0Tf2ubovkXi6689cDFcOyI9xA1
         u9XJY8uvF+1bb2Uuf3PoqzAHbh6HCNm00i7/cge1fyaO0Wgr55IR416yJCUNnK1kXqcE
         Szdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760761366; x=1761366166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZFnDDXwZoBpjbUJskJ8yzMDCPN1YwW/10NX6AdoJr4=;
        b=qNsknSrehB5dyCd1qq+4RmKLG6VxV6MZraNwwJH9tO+7wwkSvWMktT5hnA1gOlgUji
         NKbiKJTJ2WY2WmmKk8uxiTej6afXAi2wZXMjtth6dz7VzTQ02d67utVD+s2W0nyEC5ba
         +xC5aT7y+ZVJTMmqY3yMAfgei6OMK2DLtr7VBAdB/ZRZnWQPvMX2DxataufdDwN2KnsQ
         /sMAGOIgEySX/4+VfrvNbv6dzUw9PteE7tE7x5yy6rzuH1UGmk8H2QROFx8/vP2zTYa9
         jb4DKG6l4vokXIUNibVJDfbwhCJ88FQ+ZsDon1pw7n24Fv40WrqRbZ3j/+Gp+FOEHBIC
         4k6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXUYAGwZJ02VozxEnPVnleDs6D+XXerKQaj6lV0qAQziJz8/sRrMxV9tvPy80IHCu++F/YoCtoEtCa9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAdKyz3ek4+7qSa6IDLO4nd8mDs20GKC6Giag7JnQEa+HP2wcS
	3jqCvi3bhHCvSVkqXilt31eURDTXPC57inuyesAwKgSenx1Eg+MP0i5i
X-Gm-Gg: ASbGncvy/CZvNIdljKZp8UAj8BGngm+i4sUrbD875F19DC/v5A3fqH608atQ6cfMmJG
	jPuSNfq1CvRNQPtXJseM/8t9IwdwWdKmKniIEFxcu/uSOBwvthrO3w4IjBEjFxKVutLibiGFLi8
	lL9yuU3dikXRemhMggXdsRXzIrM9f/TOV5OqA744jLfVlZR639fTm1icUICSWhQDwCvOjUpXkA4
	ahZS57211HOT81Oiw7xpvJo4+GPK7/V6+NyEYZrK+Aigb9vxBf/qdKlB71uo1LEysq3tnu0LwrW
	iAkdY1UZ8w8/1qKJltqmts+MIKIErYsSieD10u011nILXiRBJoM28DT+y8cE/BBmGQD+KL5ANsl
	FtQpccygOmeSSBuYHVQicSvl+R1/QFmKhzhu+oKAy0E5gT5UyM5tQzWyLljMScE/rlWHvx2JVKN
	DNI1FmFC5+QSAYRSY+e1ySU6Nt1MYoLUrxE4ttwE/s
X-Google-Smtp-Source: AGHT+IE2+OLcWPAcD+e3Cof7+/cYK6cBgEAdvfBAMWtRu6sBlIeGSM3216zL5aw1nuX6hNOb13kO2g==
X-Received: by 2002:a17:903:234d:b0:267:44e6:11d6 with SMTP id d9443c01a7336-290c66d9d55mr75380665ad.6.1760761365765;
        Fri, 17 Oct 2025 21:22:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5e2d:c6df:afce:809b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5c0bsm11885895ad.69.2025.10.17.21.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 21:22:45 -0700 (PDT)
Date: Fri, 17 Oct 2025 21:22:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dt-bindings: touchscreen: rename
 maxim,max11801.yaml to trivial-touch.yaml
Message-ID: <syo4wuohnpfcinq2pxxif5yig45k6pszdhmu4fgxrkg6q4xn7g@dyfy7k3wfhg7>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926184720.391335-1-Frank.Li@nxp.com>

On Fri, Sep 26, 2025 at 02:47:11PM -0400, Frank Li wrote:
> Rename maxim,max11801.yaml to trivial-touch.yaml for simple i2c touch
> controller with one interrupt and common touch properties.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

