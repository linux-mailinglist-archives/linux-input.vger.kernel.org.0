Return-Path: <linux-input+bounces-5950-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39F964D69
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 20:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 920B9B22813
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 18:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21A61B5EC8;
	Thu, 29 Aug 2024 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNQm1kzL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB818C35B;
	Thu, 29 Aug 2024 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724954870; cv=none; b=aa2o3Yd5WyegsN8BPg1aFmqsCmfsB/ypEpd17Grd43Svp3iA0cmVh6EPbZdVLvQoCehtgy8TpKFtEE/c1xqN+zOCCw4qDTKb+HYBIhXa2biYNc7pWTkfU8a9HUEcZZJlt1shztQOL6tctovocFD7MGHsXxRu3MizgaVorwqmgCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724954870; c=relaxed/simple;
	bh=TvwZdsa0XTSJDJAQvIyF4rUi+e6ORh47zdR0914SXec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqBNXiH//4CwoU8xyjduh/hqkKXpNIXRcuA7phGafLl+ugfttJzleZwSFdLMLWFk+PSZZjZDdoeDZeyJZj5IQE/x3j3GOh5tdpMKGO+/kSU5dY7tzfSaPUvRwIrYdlIv2RfHiP48JT4sVzoh7C6K4OSDNB9UaKRGivvcODIBjVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNQm1kzL; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d69e2a88e8so705840a91.2;
        Thu, 29 Aug 2024 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724954868; x=1725559668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=om7WCiQnbgg42PU4SJCD5MwWoTRj4K8/Yts9A2p8tAc=;
        b=RNQm1kzLaXfumBEEGTDieG3JFz/tqOmcd9UU5RuFEJG7gNfm2at5mXoa5eVJEGJTa9
         n+OeOVTAoWa5/1JO4MaKhsjwJItWjAK+j7EzHvJNaVwbSMGblFjiX8M9Iddlo2Ae4sBe
         8FICPEOWUg5xEqk2c9BQJsB79qffjmjv3IVgVYP3tduiNQSZrDAQihZDCvb/agJYflIx
         z2vcM6R+EHSS8+X2sUmruaz+CcWWHuLKvYBRJUB2FR4E0Kcmk2Q5C/4pewLAJ5V/I+4c
         iReBHOD9KiHUderMO/P2V7u9Dfcee3YpmDwV32ep88kRwceLkrnfR1ZGEzZy6JyEvsM6
         oW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724954868; x=1725559668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om7WCiQnbgg42PU4SJCD5MwWoTRj4K8/Yts9A2p8tAc=;
        b=s14rSmy45B4jY7i5kYHQn8xFIhKuX8u8frYuhJmxEZarF8lQMODbLbSh6Gt5Ln2ncp
         AdaxqFLJ5Z/dQoa7wrCHh0npGyFmsSndnr7wTc7MYppDGz0XnL/IUf38eSMUqEKukJtA
         kaETjPLSXCi9ubtBT0tFwMMUwzXEmC4tP2707/90AXU3ZAWhYVBgTpMWckAWBTI05gdg
         P29qmIUR1OupmuKQkwAmiEd28kLfwD2vzFH7phmfgSpf4YDr0d4ilL1Cf+t5QXahPzn6
         YH+2uVYo0PaoAm8cOqsOxWyeQXDWvMdfDrnEUyN6HI95ZCdrdbtGR3qBc+XZktmP/bdR
         o9jA==
X-Forwarded-Encrypted: i=1; AJvYcCVjKodE9etpjKCOsgMEvBDq57RcL/wjxEKacaqhmY53Cl0/x+f5XheZ9BbqaU5g0Sc1ARfPDUFIiyqP@vger.kernel.org, AJvYcCWScT1r8RMG4YoZytpDSFwaDHbZob/ngfnOGI/bWvLG6r2WbmStuzp7Gy2aB+ztXjSfH8pryDrjeXRmtTL1@vger.kernel.org, AJvYcCXWFheyrk9KqI8rPWccDEOERjNe88OlK3VL2xG7a69z1QDBxdoPPbkzqzztfKNclEmRWL0s+nXBmroj2QM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyfI5V/aA7o/ml30VnKqpBwMzCQw3zaUgp4e1a4YWHZarKD5R5
	ByEPUCo9zF2bvbD0deZqIbPmNs4XwtbsRyxht0LpfXwHiJ7tfru/
X-Google-Smtp-Source: AGHT+IGmCH/YJw3qLKLhNLSpa/wZtw3uVKjGF7gN6cZ2ajGEjBLwygKcxT8qSBehx2aqMUTFx8xdMA==
X-Received: by 2002:a17:90b:286:b0:2d3:d7b9:2c7f with SMTP id 98e67ed59e1d1-2d8564a46fdmr3876995a91.35.1724954868265;
        Thu, 29 Aug 2024 11:07:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ed6:5fae:d35c:9c2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b0fe193sm1989518a91.7.2024.08.29.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 11:07:47 -0700 (PDT)
Date: Thu, 29 Aug 2024 11:07:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: touchscreen: ad7877: add bindings
Message-ID: <ZtC48cOrWPG5SdiS@google.com>
References: <20240829092007.25850-1-antoniu.miclaus@analog.com>
 <20240829092007.25850-2-antoniu.miclaus@analog.com>
 <20240829-mossy-dispense-bab38650455f@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-mossy-dispense-bab38650455f@spud>

On Thu, Aug 29, 2024 at 05:16:30PM +0100, Conor Dooley wrote:
> On Thu, Aug 29, 2024 at 12:19:36PM +0300, Antoniu Miclaus wrote:
> > Add device tree bindings for the ad7877 driver.
> > 
> > Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> > ---
> >  .../input/touchscreen/adi,ad7877.yaml         | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
> > new file mode 100644
> > index 000000000000..5fc5124c5999
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/touchscreen/adi,ad7877.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices AD7877 Touch Screen Controller
> > +
> > +maintainers:
> > +  - Antoniu Miclaus <antoniu.miclaus@analog.com>
> > +
> > +description: |
> > +  Analog Devices Touch Screen Controller
> > +  https://www.analog.com/media/en/technical-documentation/data-sheets/AD7877.pdf
> > +
> > +allOf:
> > +  - $ref: touchscreen.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> 
> > +
> > +unevaluatedProperties: false
> 
> So, all of the properties in those two files are valid for this
> touchscreen controller?

No, the driver does not support transformations (swapping axes,
inverting, etc) but that is driver limitation, not property of the
hardware, which DT supposed to be, right?

Still I think we need to extend the driver to do that before adding DT
match tables and adding DT bindings (or maybe together with it).

The driver also need to have proper GPIO controller support instead of
having ad-hoc sysfs attributes, and converting in now before there are
mainline users would be a good time.

Thanks.

-- 
Dmitry

