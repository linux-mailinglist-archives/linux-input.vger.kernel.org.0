Return-Path: <linux-input+bounces-4775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFB991E6D4
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 19:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87EBEB21208
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 17:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B079216DEDA;
	Mon,  1 Jul 2024 17:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+YPqWk8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00B15A85F;
	Mon,  1 Jul 2024 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719855974; cv=none; b=OuapL7ILKrGFxQL/ioks8Ckk59N8bxOoYinzqjMLw0W/O8a/1uEeiHZN+kUTKtCqoAx4YF+OrShXQoz3nKfa92diK/J+f+1gay8/JZedF/bAaSbDoZkGT84abJemfpaWO96hwi5/9OH9MJrusPquCp4oIOXY2zcCgJek+BXfKlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719855974; c=relaxed/simple;
	bh=wci4+W9GeP0U7in3LTGi+QSTAQK4rVss0pVpzAhOo/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYHqC29fP8Aw2+vdcsEWPuV3+SkXn90paGGtTuaJcCbZUYHN52tNSslf4Ltqw3SOhvIYuHDgD9OHscbj47mtOoZoV+phnC/P8pUbvjQKpOncLUjx4VMttEDgR+mDeQxGqHeV9SroZgKM+OMQfoPTjkeaP5vBiI/tffMh7Bv0uKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+YPqWk8; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-74840cb804dso805626a12.2;
        Mon, 01 Jul 2024 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719855972; x=1720460772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDfU/E7NximEh+ePQe6fwwT9wo95bqQJ44SzFp5cz5U=;
        b=K+YPqWk80xxz+sZUBbca4umtoVOtDPOGvSjBLmLBdmUEnxEcpq9Tyqnuau/pTl095Y
         juMfsXHcQIozxTn2//Qr1t4jOE7pKqf7FOzNXzJgwbd91it9svaR99QtTZWlvOpMtvoL
         oIUU51R92pPCH3fI2Ni7pBEgsew+nG0YMIgCaZabVoEnhA7Sq70SXlsCS2ujww/lF27D
         eLDvqxrJwQynlkRimqcWMStFc9mnnp41kUYP5jqtahiyuV2IeVxLZ/rd7/ZHN2aItTbs
         VnOW+GUKKAnrMfM73tzGnXeVzn5CskejGImycBeWXT9zIB/Y+xfiVvc6OoWfC5YAbRWU
         nh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719855972; x=1720460772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDfU/E7NximEh+ePQe6fwwT9wo95bqQJ44SzFp5cz5U=;
        b=qJdmkMQRJf1+NPMMMniKBl9QFL20SRD7VniKv4TkguoDGIIGCnVb2NvH4eFCm9u36w
         xhQ8P9mwS0/wwAe4cYQXqF+anmRWG5uOjdPeOIp4jQlI2HvwHePRiNpfKgxw9aMY2xrD
         2SNbo/gNpPeIPdSZ06f5+2KiFw+H4Xj+h926+QQVO3OSxF+4s0QvKT/SAfxUGP85+Q+X
         kKnai6PtjwCPpTxx1K3+RTSh14KNQrQ3N5fm70hI30OJmiuln8ymyFY+cLFoOe1dPDpG
         FfdcXLGxJoO9TBH0VxQZuq6gs+ePhZjqp1CU8oct5Wa/I7VyB7U3PF71IPQsXcb+Wa5V
         0P8g==
X-Forwarded-Encrypted: i=1; AJvYcCVxWM7ECmsNne9TvtDeB8JE5EoWBB+MZ+qPZECXAizINR5F2c7PtLSEOI4xik3JJ+YhM/EO+VLhMA+bpoC1S3QXgNRQHoKSIo6+bd2Ou8dDE7pIs2Y1IFy+nKVL+J7YzNW4YdQRR1tdE0mneEWm5fxZp/T8e9ALaGvBopH17x+3l2di1Yg+
X-Gm-Message-State: AOJu0YyJUj+hmkS6y/QdiQeNfJmwjcTNTzEpPiDYCC1XSZv6X8wo/PFH
	ECA9JOPeyG+tqUPHzGIS/M53u4PvNGO0pc09tjxoNoD7drii9vpD
X-Google-Smtp-Source: AGHT+IGxkduV6KdRJoavHrAWCnQJOcYjJsCXh6tx2oOz1qYdldZJrbKnyQhvsHZgBt76YwOYDN5ExQ==
X-Received: by 2002:a05:6a20:8425:b0:1be:cfb:cdd1 with SMTP id adf61e73a8af0-1bef61ed43cmr9494456637.39.1719855972221;
        Mon, 01 Jul 2024 10:46:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044b0b61sm7034232b3a.176.2024.07.01.10.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:46:11 -0700 (PDT)
Date: Mon, 1 Jul 2024 10:46:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: utsav.agarwal@analog.com,
	Michael Hennerich <michael.hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Oliver Gaskell <oliver.gaskell@analog.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5588
Message-ID: <ZoLrYTp2IUKFBvzq@google.com>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
 <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
 <20240701-battalion-tacky-c52566b37a97@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701-battalion-tacky-c52566b37a97@spud>

On Mon, Jul 01, 2024 at 04:46:12PM +0100, Conor Dooley wrote:
> On Mon, Jul 01, 2024 at 04:04:51PM +0100, Utsav Agarwal via B4 Relay wrote:
> > From: Utsav Agarwal <utsav.agarwal@analog.com>
> > 
> > Updating dt bindings for adp5588. Following properties are now made
> > optional:
> > 	- interrupts
> > 	- keypad,num-rows
> > 	- keypad,num-columns
> > 	- linux,keymap
> > The proposed new property "gpio-only" has been added as an optional
> > property with an additional example.
> 
> I can see that as it is clear in the diff, but this doesn't explain why,
> which is what you need to do in your commit message.
> 
> > 
> > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > ---
> >  .../devicetree/bindings/input/adi,adp5588.yaml     | 28 ++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > index 26ea66834ae2..158fbf02cc16 100644
> > --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > @@ -46,6 +46,11 @@ properties:
> >    '#gpio-cells':
> >      const: 2
> >  
> > +  gpio-only:
> > +    description:
> > +      This property applies if keypad,num-rows, keypad,num-columns and
> > +      linux,keypad are not specified. All keys will be marked as gpio.
> 
> Why is a property required for this? Is the absence of the 3 keypad
> properties not sufficient to determine that you're in this mode?

Yes, I think it should be enough.

> 
> 
> >    interrupt-controller:
> >      description:
> >        This property applies if either keypad,num-rows lower than 8 or
> > @@ -68,10 +73,6 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > -  - interrupts
> 
> I don't understand why interrupts is no longer required.

I think it should be possible to use this chip as a GPIO controller but
not an interrupt controller, in which case one does not have to wire up
the interrupt line from it. However this requires much more elaborate
binding description (i.e. no keys and no "interrupt-controller"
property).

Thanks.

-- 
Dmitry

