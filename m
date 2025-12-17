Return-Path: <linux-input+bounces-16615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A86CC7E04
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 14:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0A9E30A9DC1
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 13:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A753659EB;
	Wed, 17 Dec 2025 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geltRgvB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5489C364031;
	Wed, 17 Dec 2025 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978483; cv=none; b=uf3xUkrJt2+S9HWBB8t0i0OOwolvShDqqeRb4P/FwFkBWDPeupY6q05BxPUG/+pDEljSYMfKgofp/LYzYhN/bM29tqh/yQDl0KUuK64gcSkuX56p9eo1RWXqml2HkVViQ4u20LnIB00XEgvD2f/7oWduUI1plh5xyB8JhdLoRQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978483; c=relaxed/simple;
	bh=WbdwYa16DoWEN3/Yr3ZaWWyy2Z5ondfDmYkQkpRb1w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo9Mqb4qMk5/JcFJcCyPsI00SdZS+yZeeGlDMDqOSUjrALG7L7UBiqwolW2d8tkzOfHTkgPn8O4OH25U8+VlbzeW00kfsuXdHJcC60IKpksIMx0DyKsFcubCQhTJJt3dgoDJdL/eRuQ1Tlhz3jNIqNDr+a47Fz6a87muaOFRjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geltRgvB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD577C113D0;
	Wed, 17 Dec 2025 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765978482;
	bh=WbdwYa16DoWEN3/Yr3ZaWWyy2Z5ondfDmYkQkpRb1w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geltRgvBm39rAwgQ1NV0VCrxJsi4mQabC5ra3uEZbjEbJRMGnBEjnozr0GbS58oA3
	 XIyekP5dO+Q3sAX4Stmiqp9IzlsrYMYorbBWnrh9ZhReJX+X4PY10UNjOJtSc2OBPw
	 Hl7GgdvVcfl+2g3IysGfSoF2C6vtgFfGRlQoEnwJQlI7fZX5+NwsDllQ4AaIJsncYt
	 UbdlD64bh7Fcqz1Wo23uTDeE8hUIyELSP+Vd3dP7/9vkwJfw5aUAN6QATdcMHzDS6P
	 VKfzBrl08GFv08hDif1j+B2/D+mtSzvGUIgaSy1I94Y5PNK75yHVyqe3A4DQUibk4Z
	 8bbUPxvCVVtyw==
Date: Wed, 17 Dec 2025 07:34:40 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
Message-ID: <20251217133440.GA724723-robh@kernel.org>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
 <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
 <6778765.lOV4Wx5bFT@workhorse>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6778765.lOV4Wx5bFT@workhorse>

On Wed, Dec 17, 2025 at 01:57:46PM +0100, Nicolas Frattaroli wrote:
> On Wednesday, 17 December 2025 09:31:15 Central European Standard Time Krzysztof Kozlowski wrote:
> > On Mon, Dec 15, 2025 at 01:29:29PM +0100, Nicolas Frattaroli wrote:
> > > adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> > > property. This makes it impossible to model devices that have ADC inputs
> > > that should generate switch events.
> > 
> > The solution is to use unevaluatedProps instead, which also allows
> > dropping other properties.
> > 
> > Best regards,
> > Krzysztof
> > 
> > 
> 
> Hi Krzysztof,
> 
> to understand the motivation behind this suggestion correctly:
> are the "linux," vendor prefixed properties, especially with regards
> to key codes, generally a bit of a thorn in the side of DT bindings
> maintainers?

Not really. Most have existed for decades. New ones get extra scrutiny 
and often end up dropping the linux prefix.

> I'd imagine so since they technically tie the DT to a specific OS
> kernel (though of course, others are free to translate those key
> codes). And the whole idea of configuring which code is emitted
> from something is basically abusing DT for configuring software
> rather than describing hardware.
> 
> I'm mainly interested because this is a thought that has been in
> the back of my mind for a while now, and I'm curious if the DT
> binding maintainers happen to have arrived at the same impassé,
> where linux,input-type et al abuse the DT model for something we
> would tell any other vendor not to abuse it for, but no better
> solution exists right now to achieve the same thing.

Not sure what the BSDs do here. It's never come up that I remember. Best 
I can tell is they just make it a userspace problem. So every possible 
keyboard needs a keymap file. Though I'm not sure how that would work 
with GPIO keys as you don't really have a scan code.

Rob

