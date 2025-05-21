Return-Path: <linux-input+bounces-12490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3503FABF0A7
	for <lists+linux-input@lfdr.de>; Wed, 21 May 2025 12:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ACBC189D2D0
	for <lists+linux-input@lfdr.de>; Wed, 21 May 2025 10:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0920259C9E;
	Wed, 21 May 2025 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4a6yHfE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85212134BD;
	Wed, 21 May 2025 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821711; cv=none; b=qgM1md8FPfRo3CKsG4Popph3/o+4R+4blbGrEOoqyDLKmMP1gd6DVPMo5opDfsrz7HLBdXpkixJR+dT+GOIL2KB/0ZrWC3JDqO+r3SfWKR0f4tnE5sKjAnPohCVCEnEP7iiYbfEnXl3af4n3+JHXXGKAneDq4v0NCUI/LK7MXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821711; c=relaxed/simple;
	bh=NJQ8OmBdwTB+cIr8Qv4+qQSzLBTClOT44bxY3oQSDRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GywFkGzE5FE0S2f017hebu50no89ceRbaeG7rt3DdIu4dX7+yhLrTR0RE79dBtY5OSi4ifMghYRoZH0gOLIlpNOznPdcOWCeDadn5b2dpK49fHEdts4aUcC0eJ63duers+O/2MyboaIRYml7AbaTDHDuYtbN4oPVz/FXzzKmjwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4a6yHfE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D276C4CEE4;
	Wed, 21 May 2025 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747821711;
	bh=NJQ8OmBdwTB+cIr8Qv4+qQSzLBTClOT44bxY3oQSDRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4a6yHfE/HdheeMOQJwboy0t+IpuE9AAK46vV+6pBSy/yiTJKWbaGbS6QEVrO/j81
	 GVoXb2XuA0Q8/rFSTbTT04hYx/Rgh7H2WJYiQbZ8bdtaID0Dja3ybZTgC4S2EoAeZm
	 RW+RTOR/Ivz3lI9bO9UBDjgfwcrTOlTAJfbxN8f+RGSv7LPb1C33D5CnucSOxAhyhF
	 TM4nm6EYeS2rRXKwt5QOWIOeazj7nEPS4bNEYywf3Y1FyMJUe0RlSIkbnOPtYIAc6z
	 fTIKdNMm2obyFPOHIZo+sjByGBIhFVuJPOtqr4gTNvXwT0DrFikfv03C/Jw6Z+eRWu
	 /TKG5nFJJGwwQ==
Date: Wed, 21 May 2025 12:01:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Job Sava <jsava@criticallink.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julien Panis <jpanis@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	jcormier@criticallink.com
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
Message-ID: <20250521-wandering-tested-porpoise-acbef7@kuoka>
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com>

On Tue, May 20, 2025 at 01:43:36PM GMT, Job Sava wrote:
> The TPS6594 power-button option permits users to enter STANDBY or
> ACTIVE state by a push, release, or short push button request.
> 
> Signed-off-by: Job Sava <jsava@criticallink.com>
> ---
>  Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> index 6341b6070366..a40808fd2747 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> @@ -37,6 +37,21 @@ properties:
>        device on the SPMI bus, and the secondary PMICs are the target devices
>        on the SPMI bus.
>  
> +  ti,power-button:
> +    type: boolean
> +    description: |
> +      Optional property that sets the EN/PB/VSENSE pin to be a
> +      power-button.
> +      TPS6594 has a multipurpose pin called EN/PB/VSENSE that can be either
> +      1. EN in which case it functions as an enable pin.
> +      2. VSENSE which compares the voltages and triggers an automatic
> +      on/off request.
> +      3. PB in which case it can be configured to trigger an interrupt
> +      to the SoC.
> +      ti,power-button reflects the last one of those options
> +      where the board has a button wired to the pin and triggers
> +      an interrupt on pressing it.

Don't you need to handle two other cases as well? I assume you copied
this from the other binding, but all three options are valid?

Best regards,
Krzysztof


