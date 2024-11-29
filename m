Return-Path: <linux-input+bounces-8312-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB379DBFAF
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2024 08:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A26DB21776
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2024 07:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E92E156C5E;
	Fri, 29 Nov 2024 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM5swOw3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F745C14;
	Fri, 29 Nov 2024 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732864565; cv=none; b=jL+I/oCrFd/rxfLzSB7a/VeHARshvxCEQLv8Qiw6I73ZymmS2/CYsDd16mIDbTPXXwBzv4TUhfdbQT7J5yyKT1xw/g3DRBFcIu5PrUkYRquWG4d48WD+Ye63JTY3g20ga4vACh3rNM9NMjnHsWS/+bo3hBu/0OB44vNAjvhLMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732864565; c=relaxed/simple;
	bh=yfUMcS/42xc22dFe7ApSwq6gDTwMxL0f/YsB9GrDmHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRyyBvr4J8m6byTAmt7YZcavBXaUH+PGuQRkfGqbgw69MTeHnYGLGG2yDjA1LcvLUGFMTNZGt3HDXMxot1NDNp0f1xjMc9Cq/l5j9iFdngh9mUrrUsym+AOvs/71UEbHVsEQwSNZvFrHtLKYHdGT+RVIxPVFYKU4SnZwZXGj4v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OM5swOw3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CC3C4CED2;
	Fri, 29 Nov 2024 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732864564;
	bh=yfUMcS/42xc22dFe7ApSwq6gDTwMxL0f/YsB9GrDmHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OM5swOw3L1BAa8TgjDLNaPD2oVuJGxzlpg9LJlS7Wpnn6Kns4WLL3qhuuxt6Ob14Z
	 YFfS+qnoJ8NhMOBA88PNiV7nytXrP4iOgLCMKt8EnYHSDft4YzGQhfmNQfa6aQTuYd
	 wFGDkOrSODM2BfdFJH1sJhCjCM8D6bfB2BjrRHwL2fkDvfanzptMPIhYqoeTDGv3jd
	 6/1q5/BJpo++JYRg/SQwKpq0xPC2r4ORO3rHjNGkKrS1W3+1ppSpOG6gJgU0vXuflb
	 qfQ90xSq46FTfejzB+Solr9cMTt7n1kV648yJk0qRq5V4se6GVeYRUvPHf64xpj/XE
	 VvQUsBjBm2/3A==
Date: Fri, 29 Nov 2024 08:16:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Message-ID: <abmpkfnfrbcarqhp7pspxmy4veuiavpy2p5zqe5ljkstveuuzz@ur7grz3zd7xx>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-1-76cc59bbf117@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128-z2-v2-1-76cc59bbf117@gmail.com>

On Thu, Nov 28, 2024 at 11:29:16PM +0100, Sasha Finkelstein wrote:
> Add bindings for touchscreen controllers attached using the Z2 protocol.
> Those are present in most Apple devices.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../input/touchscreen/apple,z2-multitouch.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c4c0b41178728d5e0a782979d6eecd32e0a83618
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/apple,z2-multitouch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple touchscreens attached using the Z2 protocol
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: A series of touschscreen controllers used in Apple products
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - apple,j293-touchbar
> +      - apple,j493-touchbar
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  apple,z2-cal-blob:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      Calibration blob supplied by the bootloader

What is the expected size? Fixed size or maximum?

Add it to the example.

Best regards,
Krzysztof


