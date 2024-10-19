Return-Path: <linux-input+bounces-7556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 505959A4FF5
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 19:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B31C1C20D9A
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 17:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D711891A9;
	Sat, 19 Oct 2024 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LO2tz8QG"
X-Original-To: linux-input@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B421E498;
	Sat, 19 Oct 2024 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729358328; cv=none; b=WDzZcV6Hy2d3xcZLsx1edVqPrDWECeZCgs1jdCeMezRvDZ7lbwDrkPRzHckhAg9TzQZ8czQtV25WiCpde3qymB/zeMm8e4mm+Knw9xL1EtuPtSnIt6bWOpGutHLFeKZFKoUtzzA0xYoOrNPW4gAY+oh9AxQQU774Us/zb5nqeL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729358328; c=relaxed/simple;
	bh=8ImAwU5m8AEcCmQ684nh4/tZ0Ob8/McJrsusUcgLo34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oz3STeDPCWaV7z6l6H+daLVGjsiHtUi3kEQJqMnQH0v6petIY/fPZ3Uu9Jns5aAo7PJ50MZZLeiC4qmBqKfea2nlpYr8jcRBQAsEK0kOONVIZiNZ8KyKOGSBWC7dlnRGL7n4Bh6LYf+qEn+mgsOgZX+LF1ButaIy40ryaL3BWXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LO2tz8QG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D00D352;
	Sat, 19 Oct 2024 19:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729358214;
	bh=8ImAwU5m8AEcCmQ684nh4/tZ0Ob8/McJrsusUcgLo34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LO2tz8QGGEfD3Dha8MzF/3OOA1T6Nia2jqHGsEfyf8Oa4oWZpuPGG87+tJrZx7ZTj
	 kIEYF+yf/fq05MHE3vasT/IAUrhY+1zDdfDDAE1c0pXb/nS/od47E5ihCiWjYql27d
	 UeY7s9cwBBKfkxOzj02dEtGsejOIYsY9/HyB/+GQ=
Date: Sat, 19 Oct 2024 20:18:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>,
	Nuno Sa <nuno.sa@analog.com>, Mike Frysinger <vapier@gentoo.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 00/13] Input: adp5589: refactor and platform_data removal
Message-ID: <20241019171833.GB13357@pendragon.ideasonboard.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
 <d1395bd61ce58b3734121bca4e09605a3e997af3.camel@gmail.com>
 <ZxLTbBGqQLrsDLWv@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxLTbBGqQLrsDLWv@google.com>

On Fri, Oct 18, 2024 at 02:30:20PM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 16, 2024 at 03:36:03PM +0200, Nuno Sá wrote:
> > On Tue, 2024-10-01 at 15:41 +0200, Nuno Sa wrote:
> > > This series aims to remove platform data dependency from the adp5589
> > > driver (as no platform is really using it) and instead add support for
> > > FW properties. Note that rows and columns for the keypad are being given
> > > as masks and that was briefly discussed with Dmitry. For context
> > > on why this is being done as mask [1].
> > > 
> > > The first couple of patches are fixes that we may want to backport...
> > > 
> > > [1]: https://lore.kernel.org/linux-input/9db96c99c805e615ba40ca7fd3632174d1e8d11f.camel@gmail.com/
> > > 
> > > ---
> > > Nuno Sa (13):
> > >       Input: adp5589-keys: fix NULL pointer dereference
> > >       Input: adp5589-keys: fix adp5589_gpio_get_value()
> > >       Input: adp5589-keys: add chip_info structure
> > >       Input: adp5589-keys: support gpi key events as 'gpio keys'
> > >       dt-bindings: input: Document adp5589 and similar devices
> > >       Input: adp5589-keys: add support for fw properties
> > >       Input: adp5589-keys: add guard() notation
> > >       Input: adp5589-keys: bail out on returned error
> > >       Input: adp5589-keys: refactor adp5589_read()
> > >       Input: adp5589-keys: fix coding style
> > >       Input: adp5589-keys: unify adp_constants in info struct
> > >       Input: adp5589-keys: make use of dev_err_probe()
> > >       Input: adp5589-keys: add regulator support
> > > 
> > >  .../devicetree/bindings/input/adi,adp5589.yaml     |  310 +++++
> > >  .../devicetree/bindings/trivial-devices.yaml       |    6 -
> > >  MAINTAINERS                                        |    8 +
> > >  drivers/input/keyboard/Kconfig                     |    3 +
> > >  drivers/input/keyboard/adp5589-keys.c              | 1397 +++++++++++++-------
> > >  include/linux/input/adp5589.h                      |  180 ---
> > >  6 files changed, 1254 insertions(+), 650 deletions(-)
> > > ---
> > > base-commit: c7bf046925dc5885d9c4d8fbcbb7e4e73665bfcf
> > > change-id: 20240930-b4-dev-adp5589-fw-conversion-955b2f42da70
> > > --
> > > 
> > > Thanks!
> > > - Nuno Sá
> > 
> > Hi Dmitry,
> > 
> > Something really caught my attention now while checking 6.12 merge window. It seems
> > we have a new MFD device for adp5585 [1] which adds duplicated functionality (that
> > was already present in adp5589-keys.c). So, having this as MFD might makes sense
> > (even though it makes it harder to validate the keys and to make use of gpio-keys)
> > but we are now duplicating GPIO support. Bottom line, not sure what we should do next
> > and should I proceed for v2?
> > 
> > Also ccing Lee and Bartosz...
> 
> Let's add Laurent and Krzysztof too please.
> 
> I am surprised we do not see warnings for various bots because
> "adi,adp5585" compatible is present in trivial devices.
> 
> I think moving it all to MFD makes sense (I think original drivers were
> added well before we had MFD infrastructure), but we need to make sure
> the device tree binding is complete and allows describing keypad (and if
> not maybe we can pull it from the release and work on it so that it
> describes the hardware fully).

Keypad support is nice. I didn't include it in my adp5585 driver
submission because I had no way to test it. Would it be more difficult
to add it to the MFD driver, compared to what is done in this series ?

> Hopefully next time folks try to add drivers to Analog devices they will
> remember that Analog is pretty active upstream and they will reach out
> to you guys so that work can be coordinated better.

I had no idea, and neither did get_maintainer.pl. I suppose I could have
explored git log deeper, and I'll try to remember for next time.

-- 
Regards,

Laurent Pinchart

