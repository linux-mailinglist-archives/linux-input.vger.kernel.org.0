Return-Path: <linux-input+bounces-14933-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328DB8B345
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 22:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DB14A0580E
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 20:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E833A27AC3D;
	Fri, 19 Sep 2025 20:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLEgARSi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6A256C6D;
	Fri, 19 Sep 2025 20:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314679; cv=none; b=bzNL53Bg6RTsfHGdDxWr30QgVt5KKCY8AFHrb81E1vk2qbFlbWC95QYMARw7RUULS+t3VydoXeEIFss07wKGWRB3evNRkLo9m6ma9xRC42MdvjvvQ3uWZNI5sdw4K8sCcGgHEyuXKapZckHJGEZ5MXFDV+8LiUOyrUuDajNvCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314679; c=relaxed/simple;
	bh=Nqbm8JHtC4qbA2KN+mmp4Vel4T38mLLZnMXpL1wOzU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB5QucWE+3w3NR0bjuKGDT6vnjO9YsPwAB6unFxEFTRFNy8IxckH4lbPIyuuQ6NKiKp/h1A9DkzaGGqpE6KDqY0zdPqpMhKv935F1ZF7KS4XLV5izg7AtNVA71YnXIX48szzJ/2gC6u+/HJOnqguwN2BalNdHj5pSszBNR9l7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLEgARSi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B23AC4CEF0;
	Fri, 19 Sep 2025 20:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314679;
	bh=Nqbm8JHtC4qbA2KN+mmp4Vel4T38mLLZnMXpL1wOzU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLEgARSiCCXof0XoxphMT8Z/4OkX5WpkWg3DrvrtQGViFwnerjHjel9I3mnKtQ09D
	 Y0uDR61pUlZcac6UnYIx9ZJAVdnBBlbYc3VnKwJRSSHMKvn3ST82eMgY+bcquxdRgD
	 6mxOlFipr5M7QrVYfclMSCXJewkexYBz/388ysbOrGhiOMzSAVikwrCoa/UsyEdMpz
	 BA+q4TebjXm5TkeOqp7NcuAKqjNaIAvs3nms47wZccvDpFtt33FPPFMkDqov0/L7Qh
	 byC5nyHLtgeUPtjnUpPpJpoPmg8mTQGzSWXbG9JMiAz89B4cskDknPKnml7R+XP2dB
	 FqcWWfFWKvpaQ==
Date: Fri, 19 Sep 2025 15:44:36 -0500
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
Message-ID: <20250919204436.GA2176045-robh@kernel.org>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
 <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com>
 <20250918200445.GA2529753-robh@kernel.org>
 <CABGWkvqX9aCxam6UMYsUBkwnMJrMNKjVKrqi5Ca7O5Jk8xRTAA@mail.gmail.com>
 <20250919143831.GA862818-robh@kernel.org>
 <CABGWkvrxOTzAcqWHLvuqk_7WFxybheSZFnMkqnksfkPi6wXcpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvrxOTzAcqWHLvuqk_7WFxybheSZFnMkqnksfkPi6wXcpQ@mail.gmail.com>

On Fri, Sep 19, 2025 at 05:12:42PM +0200, Dario Binacchi wrote:
> On Fri, Sep 19, 2025 at 4:38 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Sep 18, 2025 at 10:37:37PM +0200, Dario Binacchi wrote:
> > > On Thu, Sep 18, 2025 at 10:04 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Thu, Sep 18, 2025 at 05:52:31PM +0200, Dario Binacchi wrote:
> > > > > Add support for glitch threshold configuration. A detected signal is valid
> > > > > only if it lasts longer than the set threshold; otherwise, it is regarded
> > > > > as a glitch.
> > > > >
> > > > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > >
> > > > > ---
> > > > >
> > > > > Changes in v5:
> > > > > - Add Acked-by tag of Conor Dooley
> > > > >
> > > > > Changes in v2:
> > > > > - Added in v2.
> > > > >
> > > > >  .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > > > index 3e3572aa483a..a60b4d08620d 100644
> > > > > --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > > > @@ -206,6 +206,10 @@ properties:
> > > > >
> > > > >          unevaluatedProperties: false
> > > > >
> > > > > +  touchscreen-glitch-threshold-ns:
> > > > > +    description: Minimum duration in nanoseconds a signal must remain stable
> > > > > +      to be considered valid.
> > > >
> > > > What's wrong with debounce-delay-ms?
> > >
> > > Do you mean that I should rename touchscreen-glitch-threshold-ns to
> > > debounce-delay-ms?
> >
> > I mean that's the common property we already have, so use it or explain
> > why you aren't using it. I suppose the definition is technically a bit
> > different if it's purely a s/w delay vs. h/w monitoring of the signal
> > state. I don't think it matters if the interpretation by each driver is
> > a bit different.
> >
> > Maybe msec is not enough resolution for you could be another reason?
> 
> Yes, this is the main reason. As specified in the following patch:
>   v5 4/6 dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch threshold
> 
> Drivers must convert this value to IPG clock cycles and map
> it to one of the four discrete thresholds exposed by the
> TSC_DEBUG_MODE2 register:
> 
>   0: 8191 IPG cycles
>   1: 4095 IPG cycles
>   2: 2047 IPG cycles
>   3: 1023 IPG cycles
> 
> In my case, the IPG clock runs at 66 MHz, which corresponds to:
> 
> 124 µs for 0
> 62 µs for 1
> 31 us for 2
> 15 us for 3
> 
> So using milliseconds would not fit my use case. A possible trade-off
> could be to use debounce-delay-us. Would that be acceptable?

I agree it wouldn't map to what the h/w provides, but is what the h/w 
provides actually useful? There's plenty of h/w designed that's not 
useful. 15us is quite short for a glitch. Do you have an actual cases 
where the different values above are needed?

Rob

