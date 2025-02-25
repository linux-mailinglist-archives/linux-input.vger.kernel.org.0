Return-Path: <linux-input+bounces-10326-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C578BA43599
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEAFF16D2D2
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E098E2561C5;
	Tue, 25 Feb 2025 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kN8DBztz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6566B17799F;
	Tue, 25 Feb 2025 06:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740465974; cv=none; b=txFoTp8A+Lmhg1r0n1oOjQftAC2SjHWbdzACF/2ehnxmUP0T2XziWzSzMq0oFz1UEEQFQjygsCJmJJVi2kfWCIozxqWlE2iPCbI4pawAlmUXTNPU+tOTyK5nh0nbNfL58PUxYMPkcBYrPIV9j/QQgz4NdjxMlD7k9K8zwTpFk1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740465974; c=relaxed/simple;
	bh=YhMEIbsRIvbWB+7KZzTlLukUlrMY88pxddu0Q/hl0/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reHpeICh5IVcRgdvlEtFN8WS9pZR1VJR2sRgSPDDtGZcwJv/LonD/5XDMQa2bQkQdQElZK/fTAc0fMAV1R6yj9PrzIh7hSIH2+Mo3BRSSjdfi5eF0pyRt0y68j2TGlDM+o8tATmatFKYDPn4vQrpVInYOTS6vYNEiFwuj30PiLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kN8DBztz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220bfdfb3f4so3774325ad.2;
        Mon, 24 Feb 2025 22:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740465972; x=1741070772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=erzJh64ZInq4C+WQxodkZcfUgNCq+SmOBLDEylQe/ks=;
        b=kN8DBztz73+oR5t5EIQxPkwPN6hRvNAgrNJdHkUd7w2rfzrJJ4mn871hApWhKuOwKo
         JWgGhJ0jhcL0s853UKTTa4xTk9ILPiQ2j7ougX2n/UlIO6idJbhHJ5ZVCdvdcUZ6bEIj
         VW9jO2Do5eJNcyFiVBx/gAtTEwOENxdO6tvDWHI1HELDZ8qxwdLttpQDX6Wp4MMQfV9p
         Cxzu1M4waq4dB9HjVC+4iJDsglPBmibx6Jf/vf9kz5SRiwPTaTTA1JJdBAV7umfIUXSP
         YSZJ71HSr6x7sOWXSxs6i9UJQlYoIB+KM9z+0N5IvGAxbzzpwFztSnqT+7pX+Xq8GQ0Z
         iYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740465972; x=1741070772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erzJh64ZInq4C+WQxodkZcfUgNCq+SmOBLDEylQe/ks=;
        b=K/W4c5SLuaPQXe7KoeXKbNAjW1t+TP5jXtnd6dUoFsvg8FXo9rSm49pkBxvIyEmkQl
         1kdvY345eaCeKQspmhO0ohkTb+HlJVQa/bS+L0tbTvDNkYTHakVKsyefGRQvq/ECVZX1
         xa+icTiyTwxd5mtD7CM7J0YbB9hOeTSNRgr3WUg8Q/67KrUkFKKuj0f8VgQ2JDdYMQ0p
         TwDciJayvTb0yZNBdT/P9Ytr0W7bCFN+kOhXaGngsUl3CfN0EpTYDucl1SxlhqIMoa7h
         0rvT6vbSlpfhloz8R9Rz+4WSf36aJs3N1J08K/HWSRLLKIaEDM79wdsoAPWa5YU5N6Th
         UFiA==
X-Forwarded-Encrypted: i=1; AJvYcCW7vBVIbOMLuuesaX5L1KYGpwtcqh0eUeuoEA+qvzVFbaWT4VwR3fsK2q+lBPjSST5Qompw7dOukMcqSLM=@vger.kernel.org, AJvYcCX7EFArYW1ZGsjUagCDk9wgExB6qG0OexFUZ4uAUb7r71qYfzE42rfU79N+GBbyuYfHH4zptOxMqV4x6gf3@vger.kernel.org, AJvYcCXReb2oMJJzS45UJ98cYuLzi6/6weFzYgnFQSE0ljfPLuwTowY2Q918mJXrFxkBe8QMTHGnsSOu9ouB@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/CPtyT7LlSLdaL/f4lmeTGPIj2bttX5X0OwHn0Sf/RBUsduK
	KY8aIKu9ssIXpF0zX4lwsp+xZhki9Fu8ZijE3oKMjH4XhnlazUMd
X-Gm-Gg: ASbGncsemtr3j/QyQXi3yQNXRb6RQlQZyfeNycT1c+mDt76uD+U7PBDjF+jFIRItaJu
	rkCAxgiu9V3aOaYEPttAkfatKZiKC7K9c7mEl9jvaz694kpjofEqOm1+9o4UGVfI4S1VIjjc8Ui
	Manacl3wwtwPhBioo+W71SoisSmw1jkKvBwF7d6JvrIh7aD3sNpz0KAdkMMpAFBuyLS8i4YLC5t
	ip0COP69CJos7nDG9d/6JACJsXk6a4s8/JVHs5H0qtLYiqBpFKwiH/+F1q5wNNwTvcSSMSEfmPt
	Q6eIQHbEr5uMp5lkR5tPXcZVJdE=
X-Google-Smtp-Source: AGHT+IEjteMLbPDStwxJWyvBRk9q2u4rnG1byUjMGICKrX4aTXbNk+HcE/9bPEWZmFzstr35XSNC3Q==
X-Received: by 2002:a05:6a21:9014:b0:1ee:d664:179e with SMTP id adf61e73a8af0-1eef3dcc4dbmr28018156637.37.1740465972601;
        Mon, 24 Feb 2025 22:46:12 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9ac6sm721825b3a.87.2025.02.24.22.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:46:11 -0800 (PST)
Date: Mon, 24 Feb 2025 22:46:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Manuel Traut <manuel.traut@mt.com>
Cc: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <Z71nMdTvyIg5a85Y@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-5-markus.burri@mt.com>
 <Z7YJ2ENZ04Nktnwf@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7YJ2ENZ04Nktnwf@mt.com>

On Wed, Feb 19, 2025 at 05:42:00PM +0100, Manuel Traut wrote:
> On Fri, Jan 10, 2025 at 06:49:03AM +0100, Markus Burri wrote:
> > The property is implemented in the driver but not described in dt-bindings.
> > Add missing property 'gpio-activelow' to DT schema.
> > 
> > Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> Reviewed-by: Manuel Traut <manuel.traut@mt.com>
> 
> > ---
> >  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > index 0f348b9..9c91224 100644
> > --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > @@ -40,6 +40,12 @@ properties:
> >      type: boolean
> >      description: Do not enable autorepeat feature.
> >  
> > +  gpio-activelow:
> > +    type: boolean
> > +    deprecated: true
> > +    description:
> > +      The GPIOs are low active (deprecated).
> > +      Use the GPIO-flags in gpio controller instead of this property.

No, we unfortunately can not rely on GPIO-flags. This is not how driver
works: current driver behavior is to force GPIOs as active high if the
property is missing and ignore polarity specified in GPIO property.

Thanks.

-- 
Dmitry

