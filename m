Return-Path: <linux-input+bounces-13847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ADBB1CFAF
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 02:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA661889E16
	for <lists+linux-input@lfdr.de>; Thu,  7 Aug 2025 00:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9E04A11;
	Thu,  7 Aug 2025 00:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akbBS9j7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C93A36D;
	Thu,  7 Aug 2025 00:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754525282; cv=none; b=r5C0mehDAQS4bahVkpzrkdpf3DJbXafOLd21QhCbnogPD59SR/m9XKnzfHgDh8Gw7sTuQzepETSxS4G/JopqNLcanXOaTd0sdNROcsZzqZfPZJbfPPnHWG8JCEEsZhIgxVYCD0AECDYmpybCaDhj0lwpbGJMS4CG5a7MbCV+e4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754525282; c=relaxed/simple;
	bh=i1Qi1/3wzDaKetCKmFYqM8eZOcimxutdL+vhkFS3Up4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ez5AeIbuOXKQMcKlHnTwJA88khuvhNn7ha3mpXEwoNNLE+fUaTS3BiPYYn23A9+2E4Tf8qos1a3zCnq+Hu0pAjijqSABiJ9hJn6lFV29ecmSNIjB+hQyPaI3rA8t26AHVCy4xt1+jwT4vvEj+jmY267mPX/HuOxbUBRSw78bqp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akbBS9j7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D8BC4CEE7;
	Thu,  7 Aug 2025 00:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754525282;
	bh=i1Qi1/3wzDaKetCKmFYqM8eZOcimxutdL+vhkFS3Up4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akbBS9j75asLBDfgYXm9aUCnsMFoBIprkjJgc7KXttK4z6RST44eQGAK/E4R09Ko8
	 PvxWNuXzOSPlojIXKnCYyLz4c2MN9OSrZ1a6CzwLGD+6fxLJeEXCZTJicajSCKlWQ4
	 se9SA3mGsu8H7Nd8QCEX0AMQ8XeyVOjBXST/PvSInQloGkd2/D49Ttd7TYJEHAOIpx
	 fS8ItDq75rWU7mpvLArpbK4KaQoeBHVB3tyn6B/7kMPo/S1UkZRf2m6paPS6I0iSBi
	 EPdS6F5Xy5vLJFOZVTti7HU/iaHZQvQ5H1tyTT+lHA6+0s/XAHyG84OxTDwfeP9ayD
	 QhRIc1+98UjWg==
Date: Wed, 6 Aug 2025 19:08:01 -0500
From: Rob Herring <robh@kernel.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: input: Add bindings for Awinic AW86927
Message-ID: <20250807000801.GA2081012-robh@kernel.org>
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
 <20250806-aw86927-v1-1-23d8a6d0f2b2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-aw86927-v1-1-23d8a6d0f2b2@fairphone.com>

On Wed, Aug 06, 2025 at 05:10:08PM +0200, Griffin Kroah-Hartman wrote:
> Add bindings for the Awinic AW86927 haptic chip which can be found in
> smartphones.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  .../devicetree/bindings/input/awinic,aw86927.yaml  | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
> new file mode 100644
> index 000000000000..43012f28d9aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only)

Dual license please: OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/awinic,aw86927.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW86927 LRA Haptics driver

The binding is for a device, not a driver. So drop 'driver'.

Otherwise, looks good.

> +
> +maintainers:
> +  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> +
> +properties:
> +  compatible:
> +    const: awinic,aw86927
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        vibrator@5a {
> +            compatible = "awinic,aw86927";
> +            reg = <0x5a>;
> +            interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
> +            reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> 
> -- 
> 2.43.0
> 

