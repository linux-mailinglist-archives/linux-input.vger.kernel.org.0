Return-Path: <linux-input+bounces-13659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F6B0E9EB
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 07:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBE787A851D
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 05:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2BA1DE2B5;
	Wed, 23 Jul 2025 05:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFgEIPu6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA722E371B;
	Wed, 23 Jul 2025 05:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247000; cv=none; b=p93jzfkqEowMHGg6YTv5HivkmOn6Tc17DXg5/GEW5cpMG2hHpn6OKK8/+tgBei8djNWXpyhgw6MSo8q34Ct2wWRv4unVaMzP+q/gJBeswbO/X+7ZJlvsuLwp28woosGyDQCV05sIVoq+e0HxqpqHvqZmCLWTuG1rcL1EmpL7TnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247000; c=relaxed/simple;
	bh=sGUgLIaP/Z0tvkzXFj01jJ3wxnd0SZ2j65uyOh60nU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amg951U3+pbJTzl8EsQaorfpnmcaIRiJKE+HRy6tZ4dupKiu8/LM8W6i90dBFK8gadahuzc215567iGplBiMm5RKKWLnNqoDvkkL6gqzKwNbLdJf2rL96JKbVKaLtv9yfmY9s+3KJBpzaV+oIlJhmU/QCTVLtKLvzKPZCpHuZa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFgEIPu6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA37BC4CEE7;
	Wed, 23 Jul 2025 05:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753247000;
	bh=sGUgLIaP/Z0tvkzXFj01jJ3wxnd0SZ2j65uyOh60nU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFgEIPu6EtnEWZfeCcl7APZas9ZV/jC40tp36n3EIp3UKg9u+eUDU/r7QPtMC6P4Q
	 VQYwQyS/i9wKs4m6/WTcYuqrB42CNH3M1FmZ60WeahCovItnFKxozFtfertYHnbUac
	 1lwlt44WaPTjHODh4/7ulZngjKNdV9IHvk7YzJ2a2DisyqywDmCHxM7+RXX2DV9Kvf
	 eJdR7nLSOJbVCxJBS/E2+JMbiRVYS1KYhotkq+MFsBlK6p6BvbWdez+EGizC2tUBry
	 fZE1OD8tADJ7hVdTk4vrrU/XxuL0AJT1jfF/IN1ljbMDcB1sJfPJT8xROh9fWCRdQk
	 uv6LtbP0pa0MA==
Date: Wed, 23 Jul 2025 00:03:19 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
 fsl,glitch-threshold
Message-ID: <20250723050319.GA1239529-robh@kernel.org>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
 <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>

On Tue, Jul 22, 2025 at 12:36:16PM +0200, Dario Binacchi wrote:
> Add support for glitch threshold configuration. A detected signal is valid
> only if it lasts longer than the set threshold; otherwise, it is regarded
> as a glitch.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> index 678756ad0f92..2fee2940213f 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> @@ -62,6 +62,23 @@ properties:
>      description: Number of data samples which are averaged for each read.
>      enum: [ 1, 4, 8, 16, 32 ]
>  
> +  fsl,glitch-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +    enum: [ 0, 1, 2, 3 ]
> +    description: |
> +      Indicates the glitch threshold. The threshold is defined by number
> +      of clock cycles. A detect signal is only valid if it is exist longer
> +      than threshold; otherwise, it is regarded as a glitch.
> +      0: Normal function: 8191 clock cycles
> +         Low power mode: 9 clock cycles
> +      1: Normal function: 4095 clock cycles
> +         Low power mode: 7 clock cycles
> +      2: Normal function: 2047 clock cycles
> +         Low power mode: 5 clock cycles
> +      3: Normal function: 1023 clock cycles
> +         Low power mode: 3 clock cycles

Don't we have common properties for this expressed in time? Debounce 
time IIRC.

> +
>  required:
>    - compatible
>    - reg
> @@ -94,4 +111,5 @@ examples:
>          measure-delay-time = <0xfff>;
>          pre-charge-time = <0xffff>;
>          touchscreen-average-samples = <32>;
> +        fsl,glitch-threshold = <2>;
>      };
> -- 
> 2.43.0
> 

