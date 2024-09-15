Return-Path: <linux-input+bounces-6556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D89797CA
	for <lists+linux-input@lfdr.de>; Sun, 15 Sep 2024 18:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29C5C1F2184F
	for <lists+linux-input@lfdr.de>; Sun, 15 Sep 2024 16:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EC01C9DD1;
	Sun, 15 Sep 2024 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xf6zgAfb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082851C8FD3;
	Sun, 15 Sep 2024 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726416902; cv=none; b=IKZ4xfsGu7q1TB9HzQDgcOsbMnLm7jQA1PgdgSHbMx6VKZylb0XpPiNyTkEgc10o6YZWIwaX7rGhVEopvnFK0UvH2EqII7qjE1gq9PZ1Q7/jVrL9Mqbmx9a0wmJbcpkj9UzuRFXrK6wFVCF3Kp7+EZna8yaWoC0iSDjvCFYlmX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726416902; c=relaxed/simple;
	bh=ftHZY0JCaOKDjvNn1rQ2nWhluVfp9kaJPBVz0E9o7M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpkgELs/C/Yln8rscWnE6bJlAjpd1NuUKLYNbWGu8Meo4QSP6iJl1PVBrFulDzZcQde9P+hpMYi+UVNDiD5oXK26+TyMK35B8GglEPxhJf7r+FR6Wf5vaSBlejOjP7ECfpPQZJJTo/L8P3lq8v4ml7at9ewc/JvrhmdErNcGc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf6zgAfb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345F5C4CEC3;
	Sun, 15 Sep 2024 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726416901;
	bh=ftHZY0JCaOKDjvNn1rQ2nWhluVfp9kaJPBVz0E9o7M4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xf6zgAfbAn/PH/VOOHg/VpDP1xvqAFSonl6FWurJu4zkdzaBzUGRhrvLfWyS9RuGA
	 Wld4aElKU5/+up+F7BQZTb2wZ7gC3G5wrHjQDq90Ya/NnhK0VodXbEzkFZXNFFafYP
	 MYSeuWfnH3VWmd7WEWNoXHlSRRvgf8TIgGc2wFMXNNWxdGBtjZdCaCb4fNWI/xKr4X
	 h6gKNU023fiQF4+/4JVAbWuCDjSRZs+ZkujAyiKhvljln5xXty4GQKrsBHffaU7/BF
	 eRCif7VBM3IWu/OYxV0PDZXYKFPjWpKvGabMvcwh+msUeEySNVmhvvYP1lnoFoUkO7
	 UbzyqUa0lBBiQ==
Message-ID: <b3a1cf47-a47b-4b2c-bb2a-f6b8a58e3922@kernel.org>
Date: Sun, 15 Sep 2024 18:14:55 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: input: touchscreen: add Hynitron
 CST816X
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, igor.opaniuk@gmail.com,
 Neil Armstrong <neil.armstrong@linaro.org>, Jeff LaBundy <jeff@labundy.com>
References: <20240912132823.123409-1-kuzhylol@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240912132823.123409-1-kuzhylol@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 15:28, Oleh Kuzhylnyi wrote:
> Add documentation for the Hynitron CST816X touchscreen bindings.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Drop. This is significantly different binding. Like 100% rewrite.

> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
> 
> Changes in v7:
>  - Introduce the gestures field along with its sub-fields
>  - Make reset-gpio property optional
>  - Extend main description
>  - Remove "touchscreen" reference
> 
> Changes in v6:
>  - Fix minor tweak adviced by Krzysztof:
>  - Move additionalProperties field after required
> 
> Changes in v5:
>  - No code changes
> 
> Changes in v4:
>  - Add Conor's Dooley "Reviewed-by" tag
> 
> Changes in v3:
>  - Rename filename to hynitron,cst816s.yaml
>  - Update description with display details
> 
> Changes in v2:
>  - Apply pin definitions and DT headers
>  - Use generic name for DT node
>  - Drop status field
> 
>  .../input/touchscreen/hynitron,cst816s.yaml   | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> new file mode 100644
> index 000000000000..99ac29da7a5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> @@ -0,0 +1,126 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hynitron CST816S Touchscreen controller
> +
> +description:
> +  The CST816S is a touchscreen controller from Hynitron, which supports gesture
> +  recognition for swipe directions, tap, and long-press actions. This binding
> +  document defines the necessary properties for integrating the CST816S with
> +  a Linux system.
> +
> +maintainers:
> +  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hynitron,cst816s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Optional GPIO line used to reset the touchscreen controller.
> +    optional: true

??? Please test your patches before sending.

Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Best regards,
Krzysztof


