Return-Path: <linux-input+bounces-14928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B747B8A02B
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 16:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD40B188E980
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 14:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441782EC08F;
	Fri, 19 Sep 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLcu6yWs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA8F34BA36;
	Fri, 19 Sep 2025 14:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292713; cv=none; b=G1H9gTwmG6ONnDRd4gd8MaHHMRpdr3VPGsXOBQ8bL7zmUg4akz2QWuXOlzKUPGfb2/7HzJu/G/KkCmogeClp/sBfX0Kxec5omzPRl4VV8uLPa5v4gdjpCBW9aTvvmr4hzawUCS4Qdpm+ZbQwPFkWMOM+RlLMQwEJ8uBJCFhqVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292713; c=relaxed/simple;
	bh=sRytTU8N2qcA0vJtdANVdDgGTxeg75+ZJbKaUoipNVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+nJX+Darn10gK31y03QPvzBfMbZUezvwmZVqRtSbsZ8APsCxNZyb4pmIB+cooQgtAuSstsSy3cKLzplM3DoPnqRCrNDDV4IWDOPXEKyrLjBJuHgudP2mz81ErlDj3PVxZiipUd+guwtBknvY1RAvTtZgiDixHmpl2YRds8ajI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLcu6yWs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C9AC4CEF0;
	Fri, 19 Sep 2025 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758292712;
	bh=sRytTU8N2qcA0vJtdANVdDgGTxeg75+ZJbKaUoipNVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLcu6yWsg4vZ9tR2T+G68EV4YLLAALHQyXDqiRSL3vLWKSEJC4Z7zCP/m8k1WSRk7
	 hRP7UXyTb56G0FyAYzM5Xqfw+m04CC8lyHumoQzEudZzWFSJD41dcI3o7lk23OXJFv
	 PvwqYCqviQF9u7HDtnOMpgdMeN1G6oBsfGxtPFFwlvrqJURttRG7cnz+FoNE8o5Llg
	 cJEdYFFAsRDKO01NwYmT80B8FJpfIa+Kw7kDgcMtztFUEXJUAdRCpTypCcNeH4yMM6
	 rREzSBu+7Cp8q1+invpGvMxc5bk2qp134W2DS7H1OsAV1hwl9DMxn2/oMJOEEiVb9t
	 J+jO6KQqQuykg==
Date: Fri, 19 Sep 2025 09:38:31 -0500
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
Message-ID: <20250919143831.GA862818-robh@kernel.org>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
 <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com>
 <20250918200445.GA2529753-robh@kernel.org>
 <CABGWkvqX9aCxam6UMYsUBkwnMJrMNKjVKrqi5Ca7O5Jk8xRTAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvqX9aCxam6UMYsUBkwnMJrMNKjVKrqi5Ca7O5Jk8xRTAA@mail.gmail.com>

On Thu, Sep 18, 2025 at 10:37:37PM +0200, Dario Binacchi wrote:
> On Thu, Sep 18, 2025 at 10:04 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Sep 18, 2025 at 05:52:31PM +0200, Dario Binacchi wrote:
> > > Add support for glitch threshold configuration. A detected signal is valid
> > > only if it lasts longer than the set threshold; otherwise, it is regarded
> > > as a glitch.
> > >
> > > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > ---
> > >
> > > Changes in v5:
> > > - Add Acked-by tag of Conor Dooley
> > >
> > > Changes in v2:
> > > - Added in v2.
> > >
> > >  .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > index 3e3572aa483a..a60b4d08620d 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> > > @@ -206,6 +206,10 @@ properties:
> > >
> > >          unevaluatedProperties: false
> > >
> > > +  touchscreen-glitch-threshold-ns:
> > > +    description: Minimum duration in nanoseconds a signal must remain stable
> > > +      to be considered valid.
> >
> > What's wrong with debounce-delay-ms?
> 
> Do you mean that I should rename touchscreen-glitch-threshold-ns to
> debounce-delay-ms?

I mean that's the common property we already have, so use it or explain 
why you aren't using it. I suppose the definition is technically a bit 
different if it's purely a s/w delay vs. h/w monitoring of the signal 
state. I don't think it matters if the interpretation by each driver is 
a bit different.

Maybe msec is not enough resolution for you could be another reason? 
Looks like your h/w supports that assuming the clock frequency is 10s 
of MHz. But are touchscreen glitches really in sub msec times? Not in my 
experience, but that's 20 years ago on resistive touchscreens...

Rob

