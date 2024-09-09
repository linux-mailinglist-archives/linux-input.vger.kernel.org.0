Return-Path: <linux-input+bounces-6335-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4C3970DE8
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 08:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A988C1C21C6F
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 06:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BCE14C5BA;
	Mon,  9 Sep 2024 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5/KtBZW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5869B658;
	Mon,  9 Sep 2024 06:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725863572; cv=none; b=uaJxpD8rb+q+OcUhuA/T6pr6bj1MIKdnpFcYH0TgSLHk5ZMvPVZJIdsZ/QO5jAC3rU1gykqsGkybSPonzkvexsNFD1/wN03c6t9PJIrHg0llubW84al9scN+A9lxbr8POZ4iaDP2KLBleWt9ruWC5mvt6whyu9WL6MElwn2Zcto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725863572; c=relaxed/simple;
	bh=3VjCDHyYl7o6cspbJQhyt1tYrUbMkyEfRXkZVsxszqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8FFad+2i7NdzKrDumMIPW+EASJFZacg2L2rdzXATg1zdmyQR8WMW6KqvbZ44ocQvzN8vMThvfYtEu3yWe3nvkxr8E9KWkmiBgnc/HOVaJ0lWh2V/bc4QnMgxlbCl+PzyiwjTUPupgjVZq0nhY8krvit93ccHJlVWfTK3ziUZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5/KtBZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F86AC4CEC5;
	Mon,  9 Sep 2024 06:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725863571;
	bh=3VjCDHyYl7o6cspbJQhyt1tYrUbMkyEfRXkZVsxszqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D5/KtBZWJ/+RqP4w+B2plo+Ivny1XXxJ2WYXymmd308ny95yjU2oWdAcoApImCJ1T
	 2+axcMkmeCPOGkx3NTr3WEYKY0IBq71m7dA6hjoHUrXwXZ2YFozWFsIksfOiyqU9yk
	 qpyk2dXTeyXeEo0IJeeDALinX84HLkqxMaD7fwtyEr/AMm364K10nu4wECnv92Dtgs
	 tssVXT5qk9E1aj/+NseLpd2N3UZb+FhHetIwuMVLt+S25jkmLkNoFm7iba5QZyKkus
	 Kq5eu1GQ1MAxwocm98dgG27qWoybMWSf+oAY3hOYqjF/lVN3Jif+uPSxdY+PZG6OLz
	 yLUXgUiGL9OyA==
Date: Mon, 9 Sep 2024 08:32:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sayyad Abid <sayyad.abid16@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Michael Welling <mwelling@ieee.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-binding: touchscreen: fix x-plat-ohm missing type
 definition
Message-ID: <sllpurhdxfgducp5hb3rs7u5db76vy2wtmyha7uspskvvek463@tq2aq65qqw4x>
References: <20240908151742.2453402-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240908151742.2453402-1-sayyad.abid16@gmail.com>

On Sun, Sep 08, 2024 at 08:47:43PM +0530, Sayyad Abid wrote:
> This patch fixes the issue with x-plat-ohm missing a type definition.
> The patch adds the fix for this issue by adding value of this property

You repeated twice the same while it is unclear why this is missing.

Also:
Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


> should be a 32-bit unsigned integer.
> 
> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> 
> ---
>  .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml       | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
> index 7187c390b2f5..98ff65cf9f9f 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
> @@ -38,6 +38,8 @@ properties:
>  
>    ti,x-plate-ohms:
>      description: resistance of the touchscreen's X plates in ohm (defaults to 280)

> +    $ref: /schemas/types.yaml#/definitions/uint32

$ref should not be needed, so what is exactly missing? Provide some
sort of proof that you are fixing real issue.

> +

Just one blank line.


Best regards,
Krzysztof


