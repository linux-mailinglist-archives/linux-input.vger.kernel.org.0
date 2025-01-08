Return-Path: <linux-input+bounces-9056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B5A05516
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 09:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE0C3A3868
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 08:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6E91DF25D;
	Wed,  8 Jan 2025 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhHdiyKp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE821B3938;
	Wed,  8 Jan 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324011; cv=none; b=BOZjz+PgXMLCUyf7Wljl+tqzycaOMZ0DfdX07kF1apjt0g5MQJKe4Xkhge5c8GzCXXANh/qGSuB+LVChJC4YPhnCLiC2p1DH1l+yoTSiTKOMkjLDxDACOqcJUg8VOQftetJuBXkuIUG6FDXhXG5YyblGwjexUbRiGBRFPnYvFmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324011; c=relaxed/simple;
	bh=jZHEfq+T+rhY8yWw+U8ne465e6CWj3IX1cnnsWkkfLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/9rrXU+D9ADQi6js0y0uofVyk0Ly85AidBPSPjUQthzqOw6oucWPbXZg+2A1AmV8Jf31/KT6f5QLidfll9G+hyOlPvHcHXDekJMQ7yloEptdeDmka6fY3ILo+Jsqah/rHkgrjChW9aKW1fj9kuuSZI6HDfDAqNxXFgM0ehe8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhHdiyKp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C3AC4CEE0;
	Wed,  8 Jan 2025 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736324010;
	bh=jZHEfq+T+rhY8yWw+U8ne465e6CWj3IX1cnnsWkkfLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhHdiyKpLTvWmHD+PArkrJ6XMwjvfiydeJrQZN7OAwVwEqQNvLZOSc8pEbTDbUmJV
	 qEjbUiPKa6zgSKYnxGwVnOmZ3CN5+x+fwLCpcXI1GqpzVigzG486Vtop3o98/pvQLU
	 NBBEOxnNHCkUYUfKgseAqYM2pPd3N/x75NuBAbXuu5qSDnUhYledRmo389cC0OF9cF
	 /6c3C9vuulfjOdKFSyg2oKAxv64m1Tyzd/oAQyAfRz3qBNi4ryMYrcmb7+QhWuc2Xx
	 BrXNuHL9C9aH0KOlvhrq4R9XiD648p3+ecRN6IMhpAry5BEuOfn8KF3+D/4YfvW1TN
	 chFFnpNpY33jg==
Date: Wed, 8 Jan 2025 09:13:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ming-Jen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com, 
	arnd@arndb.de, sudeep.holla@arm.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v5 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <ux55pgpmkngxjsl4semw2cfiljbszvotaydrxrihdu3zphsfqc@vsk72c3wqorc>
References: <20250108011812.627-1-mjchen0829@gmail.com>
 <20250108011812.627-2-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108011812.627-2-mjchen0829@gmail.com>

On Wed, Jan 08, 2025 at 01:18:11AM +0000, Ming-Jen wrote:
> From: Ming-jen Chen <mjchen0829@gmail.com>
> 
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>
> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..889f253b3bc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml

I don't see changes.

I already raised concern that you sent new versions without implementing
or responding to comments. So the fourth (!!!) time: Filename matching
compatible.

Best regards,
Krzysztof


