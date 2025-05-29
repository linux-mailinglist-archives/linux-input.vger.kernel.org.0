Return-Path: <linux-input+bounces-12646-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8EAC7AFA
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 11:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2593A46D9
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 09:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E1721C188;
	Thu, 29 May 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzPkHh0J"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74965217F2E;
	Thu, 29 May 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510760; cv=none; b=TLABmQk17Wci71l1swGjLvTGAReMeXBni8g3t1RwnjcfMPhqWE/rBfhMgyVw2bkAu5+v0W5NAnmeNislPc82SBGjEhVmqElptfHdoV03Xv9Oa6WkTobu3fVJAP/nGosvAA2/IWefwsLyFv0OE8Cw6ujygo2kOXcvLcKS/rwN2m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510760; c=relaxed/simple;
	bh=TPf17Srkj75OPuqtsL9XiNFW7BhWVGpAxkRKv9nx2DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgfiqMwAJzu4z0q04EluiRqfwbamS9lxupQTmZuu2ALWGTRZWrnsUz+ZuduILQxrOf8uAydmxba4Iq3rV66CCuhqeN1B68QCQ51lbZkX8Bfmg/UchOVbM8d9df183cZdWZxO5xvz3VaS/JfDNR3M3/aP9WW/PBB2xyVZ0SI/49o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzPkHh0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D00BC4CEE7;
	Thu, 29 May 2025 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748510759;
	bh=TPf17Srkj75OPuqtsL9XiNFW7BhWVGpAxkRKv9nx2DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzPkHh0JgrDi8egvrx1TCx/NWCB+5MU+3/RKeh8pSPPdQsoj//UjplxYGfLBx+ztb
	 2dfpKHuUjWLY+fzABF9VTpM6GZjBn452ScDpxCSlEy1ohd0u8Q/yvPD9ULwIZ9hgdH
	 ZT9gJ47X6WU9LFLICUMkZ0SepFXB1tdrLh1YMfufI9ATy6Eo7Nxk43dEtbJbcgNNEh
	 XqotuxKJvFhvxv6zg7LUHOAntWp1mj/DLT4PE15RPj+MY/wls9dN7IKMNyBM5Oj3zn
	 9gaJk3suO4Y2YUvjqX+kkTfk55fcpVR4YlSCsNv4K+hJI6AoqECyo3jT49+9+z+uvT
	 iLdVlYbYAMtIA==
Date: Thu, 29 May 2025 11:25:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Job Sava <jsava@criticallink.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julien Panis <jpanis@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	jcormier@criticallink.com
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
Message-ID: <20250529-wise-tremendous-stork-a7d091@kuoka>
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com>
 <20250521-wandering-tested-porpoise-acbef7@kuoka>
 <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com>

On Fri, May 23, 2025 at 09:46:49AM GMT, Job Sava wrote:
> On Wed, May 21, 2025 at 6:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Tue, May 20, 2025 at 01:43:36PM GMT, Job Sava wrote:
> > > The TPS6594 power-button option permits users to enter STANDBY or
> > > ACTIVE state by a push, release, or short push button request.
> > >
> > > Signed-off-by: Job Sava <jsava@criticallink.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 15 +++++++++=
++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/=
Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > > index 6341b6070366..a40808fd2747 100644
> > > --- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > > @@ -37,6 +37,21 @@ properties:
> > >        device on the SPMI bus, and the secondary PMICs are the target=
 devices
> > >        on the SPMI bus.
> > >
> > > +  ti,power-button:
> > > +    type: boolean
> > > +    description: |
> > > +      Optional property that sets the EN/PB/VSENSE pin to be a
> > > +      power-button.
> > > +      TPS6594 has a multipurpose pin called EN/PB/VSENSE that can be=
 either
> > > +      1. EN in which case it functions as an enable pin.
> > > +      2. VSENSE which compares the voltages and triggers an automatic
> > > +      on/off request.
> > > +      3. PB in which case it can be configured to trigger an interru=
pt
> > > +      to the SoC.
> > > +      ti,power-button reflects the last one of those options
> > > +      where the board has a button wired to the pin and triggers
> > > +      an interrupt on pressing it.
> >
> > Don't you need to handle two other cases as well? I assume you copied
> > this from the other binding, but all three options are valid?
> >
> > Best regards,
> > Krzysztof
> >
> Hello Krzysztof,
>=20
> Thank you for your response!
>=20
> I agree that the other two cases are valid options. However, for this
> particular patch series, they may be out of scope. The primary goal of
> this patch is to enable push-button functionality, rather than
> addressing the VSENSE or EN modes.

Binding should be complete, because if you design this as bool, it
cannot be later changed to three-state (enum).

I don't know if the EN and VSENSE modes are anyhow useful, maybe people
interested in this hardware should say.

Best regards,
Krzysztof


