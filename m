Return-Path: <linux-input+bounces-7545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E69A48E5
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 23:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A581928114E
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 21:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0860818C332;
	Fri, 18 Oct 2024 21:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYg2qMzF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0676C61;
	Fri, 18 Oct 2024 21:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729287026; cv=none; b=fohjp93o741oSZG6rdF1iLcAJu1NinlpR/WTpMVRAegUpjaOABAuGngB0k/3zHfgxLBdyLneddiapXKVeKfghZ7PWS5c2WYEL7XTvb8EQE0BFGOQm5rA2saXwMQdn8wkuS4g+hnOrQ+m6Y1Vp5Bn0/BQnIkAqC4wAxigHB75NUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729287026; c=relaxed/simple;
	bh=juMLTOEXCDK6gOZ5HRyd5DhG8xehQaK+cumKDO47+Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSGtuhrsb0NggbHKvDE1i9/2cnw7aRbSuaDXplq/y+0r1THEeHvsjLcyJ4bKDXBrHLi3j15yuMHFT4Tlb8c+EN3zzzRTfLt6gNJfo9wQjsvt1pB8y1sZgHmL6IlwLA7fWBa9X0LNiRf9mq6udAXwStVOMuG2ZW/D6AHhr7hH61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYg2qMzF; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2dc61bc41so1864008a91.1;
        Fri, 18 Oct 2024 14:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729287024; x=1729891824; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ULZXBudPIUUAeLpkQ/mrazZgZRZ5q0jGrrP2oCW70E=;
        b=JYg2qMzFLwMdeVigRrXHZMnXRMJ/BHh/BsDUjZD/pSxc0OgZZNhwmDiCgn3tzqdotI
         lTVvcyRyI19+nCStnRogU/kXrmr+RUG4PTrJj29KL8FLgbfoGHx/GFBBBLCvEkn2njpp
         XLdH0A2XBspZ3zM8bM+rPhR9ii8s1riMWV4cvkE4fstvBPN/QRr/2RMgkrK0hrQknISN
         f0dWGnD0Wm7Ri0Nnwe3LjXq0GBi5CeFRjEbOay/tVnCD0Ee1uFiqJruqadyKRjgdwWDK
         6+0k8jfqe9jC3v7Vcyj4bO92ZKb5TqG3OyEVzGjWFOaPuu+8y3fcQmg1/zfsJXnplbT/
         85Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729287024; x=1729891824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ULZXBudPIUUAeLpkQ/mrazZgZRZ5q0jGrrP2oCW70E=;
        b=SpqRvv+6GIC1L0MFuDV3kCLCX6b+hVOWwhn67QHAiosMCPZcM8F2KyxLn9L5KUTxl/
         utpUD+qVS30GQ64E+6zg/OCDfeTnoj830CVc7dys5J0fxWr2NU2hIizMwRLhoAUXrM6Y
         ViPJ2Jv5Yed4/DG+/W8qHz73vPoiDUqPk+eRsJjOfvxe8I2ebDITYVxZj4wGH0oZVWXF
         9IEJq4WK1YeeltI9CjAP/GU6zjbyM8iSkpByaN0V1L7MOmHOqw8/cgLyvckYINRlcme8
         uJ89XZpfs16wyjzENEjtB1PEdalyVxKWtlOR8JDKf7jLMHbBte9WkIlfS9H9fa7K7AdA
         0hRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4e4KQDVSovxHO3HNLRnOkWEoOy+pmAuAIHHQ+Gm99Pgi6Tq27Lbm/usf38d3vYFOTBq88bLsfH+z4@vger.kernel.org, AJvYcCX6ar0RJ0LxhQQuz0cOff3z65zW131K09N3nOYaPoiiP/1Zd+9K4yqlBMs//iG8L4rPtY0pjw8Xyv0OQDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuUuPkOL4apJKfYUyMmCS2376tTOnW3T8/49Ulra9PMDawaEgx
	ngkbK/E3NUuh5rWqR0xJ8mDkfqgNNFKMtwkmKw08E0AVfALF2Bji
X-Google-Smtp-Source: AGHT+IFvqrBxX4d/rwMCiUacscknQ2LyCpVeT/+of4waLQ76S8imVk0J4g22RKvUlTO3Q62fVVhXhQ==
X-Received: by 2002:a17:90a:c587:b0:2e2:e597:6cd3 with SMTP id 98e67ed59e1d1-2e561721138mr3911230a91.17.1729287024105;
        Fri, 18 Oct 2024 14:30:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5611d6da4sm2519932a91.18.2024.10.18.14.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 14:30:23 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:30:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, Mike Frysinger <vapier@gentoo.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 00/13] Input: adp5589: refactor and platform_data removal
Message-ID: <ZxLTbBGqQLrsDLWv@google.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
 <d1395bd61ce58b3734121bca4e09605a3e997af3.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1395bd61ce58b3734121bca4e09605a3e997af3.camel@gmail.com>

On Wed, Oct 16, 2024 at 03:36:03PM +0200, Nuno Sá wrote:
> On Tue, 2024-10-01 at 15:41 +0200, Nuno Sa wrote:
> > This series aims to remove platform data dependency from the adp5589
> > driver (as no platform is really using it) and instead add support for
> > FW properties. Note that rows and columns for the keypad are being given
> > as masks and that was briefly discussed with Dmitry. For context
> > on why this is being done as mask [1].
> > 
> > The first couple of patches are fixes that we may want to backport...
> > 
> > [1]:
> > https://lore.kernel.org/linux-input/9db96c99c805e615ba40ca7fd3632174d1e8d11f.camel@gmail.com/
> > 
> > ---
> > Nuno Sa (13):
> >       Input: adp5589-keys: fix NULL pointer dereference
> >       Input: adp5589-keys: fix adp5589_gpio_get_value()
> >       Input: adp5589-keys: add chip_info structure
> >       Input: adp5589-keys: support gpi key events as 'gpio keys'
> >       dt-bindings: input: Document adp5589 and similar devices
> >       Input: adp5589-keys: add support for fw properties
> >       Input: adp5589-keys: add guard() notation
> >       Input: adp5589-keys: bail out on returned error
> >       Input: adp5589-keys: refactor adp5589_read()
> >       Input: adp5589-keys: fix coding style
> >       Input: adp5589-keys: unify adp_constants in info struct
> >       Input: adp5589-keys: make use of dev_err_probe()
> >       Input: adp5589-keys: add regulator support
> > 
> >  .../devicetree/bindings/input/adi,adp5589.yaml     |  310 +++++
> >  .../devicetree/bindings/trivial-devices.yaml       |    6 -
> >  MAINTAINERS                                        |    8 +
> >  drivers/input/keyboard/Kconfig                     |    3 +
> >  drivers/input/keyboard/adp5589-keys.c              | 1397 +++++++++++++-------
> >  include/linux/input/adp5589.h                      |  180 ---
> >  6 files changed, 1254 insertions(+), 650 deletions(-)
> > ---
> > base-commit: c7bf046925dc5885d9c4d8fbcbb7e4e73665bfcf
> > change-id: 20240930-b4-dev-adp5589-fw-conversion-955b2f42da70
> > --
> > 
> > Thanks!
> > - Nuno Sá
> > 
> 
> Hi Dmitry,
> 
> Something really caught my attention now while checking 6.12 merge window. It seems
> we have a new MFD device for adp5585 [1] which adds duplicated functionality (that
> was already present in adp5589-keys.c). So, having this as MFD might makes sense
> (even though it makes it harder to validate the keys and to make use of gpio-keys)
> but we are now duplicating GPIO support. Bottom line, not sure what we should do next
> and should I proceed for v2?
> 
> Also ccing Lee and Bartosz...

Let's add Laurent and Krzysztof too please.

I am surprised we do not see warnings for various bots because
"adi,adp5585" compatible is present in trivial devices.

I think moving it all to MFD makes sense (I think original drivers were
added well before we had MFD infrastructure), but we need to make sure
the device tree binding is complete and allows describing keypad (and if
not maybe we can pull it from the release and work on it so that it
describes the hardware fully).

Hopefully next time folks try to add drivers to Analog devices they will
remember that Analog is pretty active upstream and they will reach out
to you guys so that work can be coordinated better.

Thanks.

-- 
Dmitry

