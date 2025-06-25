Return-Path: <linux-input+bounces-13028-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F14AE73D5
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 02:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5855116E78E
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 00:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956A2481B6;
	Wed, 25 Jun 2025 00:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="sSQQz0OQ";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="sSQQz0OQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5862307498;
	Wed, 25 Jun 2025 00:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750811593; cv=none; b=daiFXPW4VKGQSWvM74XkOio6vP5HAe+UQNs1hhz9hCd8Bs9JdsU4XcI82pCR/8GyFFWOGgjvWL6DX2DZPgwGbuPuESjTZQs6SgEC39nkqXSnXdmZSakPZSYXRb0tUMSfx/UG91wNSStMyX/MXRenFce73cvbwRQDZptJFlAx9G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750811593; c=relaxed/simple;
	bh=ms3WGlOprzDLUzYMZcYywfUti3aVLPF3z/nEEQvXhrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TU4Y++mfnF4RwLt62iRQ3v5LwP2zhnUgzy7h6VuSyQsIAHK4boWKNih7JxfzA9a3c1XtgYWbZ4pgAdX99Z3v8o0UYLR7svY6M9V4YXpxLhpKypRNRg80zDkZCBQTFgajwUpUxqdUVOx+nxA4qNDvT7S8VeXkevoQEPD5ah3+eH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=sSQQz0OQ; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=sSQQz0OQ; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750811590; bh=ms3WGlOprzDLUzYMZcYywfUti3aVLPF3z/nEEQvXhrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sSQQz0OQm9lCEeKuVh4ox28UFocW3eGPqwamBIA0Xp8OaN2Ezo/uoeC6jVnZNwxVO
	 JjK6qL8NllT2RjvMOEgZ8QJJkL+g0wtaqGeXn4CFZdYGInb6ovbWgE2WfyiBdMF9Jn
	 nrlhWT7VbwdYE75scHJVVPPpCW3VVkWp+9hSOaJuqlXNI6Nunt+royyZ+ZGMa+piV+
	 /zhcIAUsRdA+2WY9MA9Vx6jkLs1v5QdVPTyVxn1vZQ6Ed1q/g4KkOnotWOTm7+gKr9
	 14bQsXa+hNuZlHu8qn1Hgz/iY7oRboMDK5aXecgWfI73dmu2199GKB9q02iEp6wIW+
	 rM7AkOZSZTTKQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 6E0BA3C43A8;
	Wed, 25 Jun 2025 00:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1750811590; bh=ms3WGlOprzDLUzYMZcYywfUti3aVLPF3z/nEEQvXhrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sSQQz0OQm9lCEeKuVh4ox28UFocW3eGPqwamBIA0Xp8OaN2Ezo/uoeC6jVnZNwxVO
	 JjK6qL8NllT2RjvMOEgZ8QJJkL+g0wtaqGeXn4CFZdYGInb6ovbWgE2WfyiBdMF9Jn
	 nrlhWT7VbwdYE75scHJVVPPpCW3VVkWp+9hSOaJuqlXNI6Nunt+royyZ+ZGMa+piV+
	 /zhcIAUsRdA+2WY9MA9Vx6jkLs1v5QdVPTyVxn1vZQ6Ed1q/g4KkOnotWOTm7+gKr9
	 14bQsXa+hNuZlHu8qn1Hgz/iY7oRboMDK5aXecgWfI73dmu2199GKB9q02iEp6wIW+
	 rM7AkOZSZTTKQ==
Message-ID: <07f1d17d-5a14-4a87-90a2-5bd181ccce3a@mleia.com>
Date: Wed, 25 Jun 2025 03:33:08 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250624201151.2515150-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250624201151.2515150-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250625_003310_471608_DAB3BC9B 
X-CRM114-Status: GOOD (  15.79  )

On 6/24/25 23:11, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>   .../input/touchscreen/lpc32xx-tsc.txt         | 16 --------
>   .../input/touchscreen/nxp,lpc3220-tsc.yaml    | 39 +++++++++++++++++++
>   2 files changed, 39 insertions(+), 16 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt b/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
> deleted file mode 100644
> index 41cbf4b7a670d..0000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -* NXP LPC32xx SoC Touchscreen Controller (TSC)
> -
> -Required properties:
> -- compatible: must be "nxp,lpc3220-tsc"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: The TSC/ADC interrupt
> -
> -Example:
> -
> -	tsc@40048000 {
> -		compatible = "nxp,lpc3220-tsc";
> -		reg = <0x40048000 0x1000>;
> -		interrupt-parent = <&mic>;
> -		interrupts = <39 0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
> new file mode 100644
> index 0000000000000..34cb8b68216aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/nxp,lpc3220-tsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx SoC Touchscreen Controller (TSC)
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-tsc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

"clocks" property is mandatory, the old scheme is broken in this sense.

Please either fix the old scheme before conversion, or at least mention
the difference between the old scheme and the new one in the commit
message, and please add "clocks" to the list of required properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    touchscreen@40048000 {
> +        compatible = "nxp,lpc3220-tsc";
> +        reg = <0x40048000 0x1000>;
> +        interrupt-parent = <&mic>;
> +        interrupts = <39 0>;
> +    };

--
Best wishes,
Vladimir

