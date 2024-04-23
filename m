Return-Path: <linux-input+bounces-3189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3098AE705
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 14:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAEC01F25A7C
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 12:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886B912E1EA;
	Tue, 23 Apr 2024 12:51:13 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B4B84A20;
	Tue, 23 Apr 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876673; cv=none; b=J0KuzuQ4DHwA2EYvHms8brR2Uf7ZNjPr/FjerA25pCNRyGlpcX1k3/AZZ5SLWAO0Cwoc3Fq5juWXeBdWehcF9Q/RE820xJK7t5UzIjuMTEiPoWzGSKvohw2p4TVD+MrBOFoMTaaeiuSPPreQ9nufOpGL9bsja7T9SqCg8ftEQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876673; c=relaxed/simple;
	bh=2E6SRIyA73cjTpevRa1WmA6oQJTuq8bhZKn4jV3QIk8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZlv/ctKIL1Zvu034O8J5lkVwoGWJjUxAQZnaQp5k+UKggRdscvWXQC+jbj6osIzuCcC4MXebTnRsypTjWF5yYcxybqg7ZpHH+IdckgknAqv7h/UOWx2tzIrq12Ipz5OCgGKAfV+AXq+qV/ma+oIszdBksOEcKos5MEkB65h6jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4272339;
	Tue, 23 Apr 2024 05:51:38 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6E3B3F64C;
	Tue, 23 Apr 2024 05:51:08 -0700 (PDT)
Date: Tue, 23 Apr 2024 13:51:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, James
 McGregor <jamcgregor@protonmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: Add H616
 compatible
Message-ID: <20240423135106.02ab4473@donnerap.manchester.arm.com>
In-Reply-To: <f2021c5d-25fa-4bdf-8f8c-b0bc271eb54e@linaro.org>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
	<20240422164511.2488261-2-andre.przywara@arm.com>
	<20240423111502.6e068887@donnerap.manchester.arm.com>
	<f2021c5d-25fa-4bdf-8f8c-b0bc271eb54e@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Apr 2024 14:18:23 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi,

> On 23/04/2024 12:15, Andre Przywara wrote:
> > On Mon, 22 Apr 2024 17:45:10 +0100
> > Andre Przywara <andre.przywara@arm.com> wrote:
> > 
> > Hi,
> >   
> >> From: James McGregor <jamcgregor@protonmail.com>
> >>
> >> The Allwinner H616 SoC has an LRADC which is compatible with the
> >> versions in existing SoCs.
> >> Add a compatible string for H616, with the R329 fallback. This is the
> >> same as the D1, so put them into an enum.
> >>
> >> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>  
> > 
> > Compared the descriptions in the manual between the R392 and the H616, they
> > look the same:
> > 
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>  
> 
> Why do you review your own patches? Does it mean that you contribute
> code which you did not review before?

I just merely sent the code on behalf of James, because he had trouble
with the email setup (Protonmail has no SMTP), but didn't want to delay
the post any longer.

> This is odd process.

I agree, I would have liked it more if James would have sent it himself,
and then my review would look more natural, but with my review I
wanted to explicitly point out the technical correctness. Besides: I found
this ordering issue in the other patch only after sending, so needed to
somehow respond anyway.
Also I wanted to make the process transparent: someone posts a patch (in
this case via a proxy), then it gets reviewed.

> Your Review is implied by sending the patch.

Is that really true? I was under the impression that sending is
independent from review. I mean I doubt that every maintainer sending
patches up the chain (when they add their SoB) implies a *review*? Surely
they do agree on the patch (also typically expressed by an Ack), otherwise
they wouldn't send it, but a "review" is still a different thing.
The Linux history has both Rb + SoB from the same person and just SoB
signatures, so I assume that it's not implied.

> And you have there SoB which indicates you sent it...

Yes, but SoB just means I sign off on the legal aspects: that I got the
patches legally, compliant with the GPL, and that I am fine with and
allowed to release them under GPL conditions.
That does not include any code review aspect, AFAICT.

Happy to hear other opinions, but this is my interpretation.

Cheers,
Andre

