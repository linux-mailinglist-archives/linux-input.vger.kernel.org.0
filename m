Return-Path: <linux-input+bounces-14982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A828B91D91
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 17:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237D4188C7FA
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 15:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F10B2D8365;
	Mon, 22 Sep 2025 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVr1+wwM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD2C2472A5;
	Mon, 22 Sep 2025 15:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758553678; cv=none; b=NbIYmoXYHcuLAbJmeNJUEX+y5K9G/CxwjdH3BYmJpZrxyoZ/NBNtNL3Imq/WAUOoZS27J6b7o+LW4fCj5OBnMw3qN/lJy1jcb5ld9Tr83GJHmfnOOBcgIqB/qK0kdV6b+5OTx+61tIraH3bQQrfuhTlUHTbN9y88iXBm2tjqY2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758553678; c=relaxed/simple;
	bh=vbLkyYO1ho2QXwgTCTsuqDjxvmrQw+xxt3g7fmU6nZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gk+yKwCDaNKggKtOVADKuajHdizfPtik4DLVXGSgc/+a+hSG7GDOjC8eL4pmGOckllRReVV0XMO4urTgoGP9ECgb0GLp1aWxzns9yiuXl7xzQn+MR3SB5P7wNB72t+d2KeR744Lp06C0IxC1kgEk1BMzoxlLPyIC+aPGyCgk3Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVr1+wwM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63E6C4CEF0;
	Mon, 22 Sep 2025 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758553677;
	bh=vbLkyYO1ho2QXwgTCTsuqDjxvmrQw+xxt3g7fmU6nZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVr1+wwMiIk7xARqd87WYOOfkEkqFyxyxwimW7Dnlfd45uNXpOpOljuAQWdk+j+A0
	 VmhcjKz7iCaYTsUzfbB28gZQtvHT73G+IcaxhfHia0l8FW5LhAXLIoGvq42ve27NfC
	 eLZa/8HCOphRn8xOHJwZeGVsNIljhAtWntTg+DaQkvjfCrWJIHRV/IE4TdI7P2W83O
	 B3NdwRjkhGLxQQKn4OwQjQ9wk15ZPVFf0gJxb26dpQoNJTq0pyf83qlWKhKVLWw+9z
	 aNuRK0sLaQPszJEl/YCuAtHjcUcMjFtMGR0d8bn5HKKqD1n9SaeUtM/IqZB9Hy4jrY
	 fBMZgSk0mrZQw==
Date: Mon, 22 Sep 2025 10:07:56 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: touchscreen: add
 touchscreen-glitch-threshold-ns property
Message-ID: <20250922150756.GA4067300-robh@kernel.org>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
 <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com>
 <20250918200445.GA2529753-robh@kernel.org>
 <CABGWkvqX9aCxam6UMYsUBkwnMJrMNKjVKrqi5Ca7O5Jk8xRTAA@mail.gmail.com>
 <20250919143831.GA862818-robh@kernel.org>
 <CABGWkvrxOTzAcqWHLvuqk_7WFxybheSZFnMkqnksfkPi6wXcpQ@mail.gmail.com>
 <20250919204436.GA2176045-robh@kernel.org>
 <CABGWkvr8X5a0ezeu6HDCMfjh+xbg-bQq4cLwzRD2BvoJsvH_BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvr8X5a0ezeu6HDCMfjh+xbg-bQq4cLwzRD2BvoJsvH_BA@mail.gmail.com>

On Sat, Sep 20, 2025 at 11:39:59AM +0200, Dario Binacchi wrote:
> On Fri, Sep 19, 2025 at 10:44 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Sep 19, 2025 at 05:12:42PM +0200, Dario Binacchi wrote:
> > > On Fri, Sep 19, 2025 at 4:38 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Thu, Sep 18, 2025 at 10:37:37PM +0200, Dario Binacchi wrote:
> > > > > On Thu, Sep 18, 2025 at 10:04 PM Rob Herring <robh@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, Sep 18, 2025 at 05:52:31PM +0200, Dario Binacchi wrote:
> > > > > > > Add support for glitch threshold configuration. A detected signal is valid
> > > > > > > only if it lasts longer than the set threshold; otherwise, it is regarded
> > > > > > > as a glitch.
> > > > > > >
> > > > > > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > >
> > > > > > > ---
> > > > > > >
> > > > > > > Changes in v5:
> > > > > > > - Add Acked-by tag of Conor Dooley
> > > > > > >
> > > > > > > Changes in v2:
> > > > > > > - Added in v2.
> > > > > > >
> > > > > > >  .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > > > > > index 3e3572aa483a..a60b4d08620d 100644
> > > > > > > --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > > > > > @@ -206,6 +206,10 @@ properties:
> > > > > > >
> > > > > > >          unevaluatedProperties: false
> > > > > > >
> > > > > > > +  touchscreen-glitch-threshold-ns:
> > > > > > > +    description: Minimum duration in nanoseconds a signal must remain stable
> > > > > > > +      to be considered valid.
> > > > > >
> > > > > > What's wrong with debounce-delay-ms?
> > > > >
> > > > > Do you mean that I should rename touchscreen-glitch-threshold-ns to
> > > > > debounce-delay-ms?
> > > >
> > > > I mean that's the common property we already have, so use it or explain
> > > > why you aren't using it. I suppose the definition is technically a bit
> > > > different if it's purely a s/w delay vs. h/w monitoring of the signal
> > > > state. I don't think it matters if the interpretation by each driver is
> > > > a bit different.
> > > >
> > > > Maybe msec is not enough resolution for you could be another reason?
> > >
> > > Yes, this is the main reason. As specified in the following patch:
> > >   v5 4/6 dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch threshold
> > >
> > > Drivers must convert this value to IPG clock cycles and map
> > > it to one of the four discrete thresholds exposed by the
> > > TSC_DEBUG_MODE2 register:
> > >
> > >   0: 8191 IPG cycles
> > >   1: 4095 IPG cycles
> > >   2: 2047 IPG cycles
> > >   3: 1023 IPG cycles
> > >
> > > In my case, the IPG clock runs at 66 MHz, which corresponds to:
> > >
> > > 124 µs for 0
> > > 62 µs for 1
> > > 31 us for 2
> > > 15 us for 3
> > >
> > > So using milliseconds would not fit my use case. A possible trade-off
> > > could be to use debounce-delay-us. Would that be acceptable?
> >
> > I agree it wouldn't map to what the h/w provides, but is what the h/w
> > provides actually useful? There's plenty of h/w designed that's not
> > useful. 15us is quite short for a glitch. Do you have an actual cases
> > where the different values above are needed?
> 
> Considering an IPG clock at 66 MHz, currently at reset the deglitch
> filter is set to 124 µs,
> the driver sets it to 31 µs with a hardcoded value, and in my use case
> I need to set it to 62 µs,

It would be helpful if the commit message explained why. What platform 
needs it and what happens without this support added?

> as you can see in the patch:
> https://lore.kernel.org/all/20250918155240.2536852-6-dario.binacchi@amarulasolutions.com/
> and its handling in
> https://lore.kernel.org/all/20250918155240.2536852-7-dario.binacchi@amarulasolutions.com/
> 
> Another option could be to use a specific binding for the
> fsl,imx6ul-tsc controller, as I did in the
> earlier versions of the series.

No, add debounce-delay-us to the common binding.

Rob

