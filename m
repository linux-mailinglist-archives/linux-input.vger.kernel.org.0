Return-Path: <linux-input+bounces-14828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E147B829F9
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 04:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DC582A7DEB
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 02:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848E821255A;
	Thu, 18 Sep 2025 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVywYqx4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFFC2629D;
	Thu, 18 Sep 2025 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758161580; cv=none; b=K0mz5kUFTQJ9Nz4TL5wxtMeO3vfcZfhiZ2652klmqCYoKP4LDT+WTULQraIzvRUsy42XPQoEC0gDBuYIztT8tRyc9OJrCRRixzWTlUOjFy5TNsAYTB9UoWj9R8wHfSuDhok37XAo/qSQEpyRAhePG/hFHwGdAhgHiIUyBrHmVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758161580; c=relaxed/simple;
	bh=RmTmszHy29/IYyE8hO8RdzIEpogaX5vISAAq3PM6OJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P42kynysPmZ0OLFPaXVhccO4xhTMS8dhKc/hn81bNRYv9eoZB4Ht4y5HLymN9hv0HnivuBc88iNNPHj2s2HKOf+JD5WLXoXxjFQ4xAnyOlhv3H/bEtx6pE3Y68rB9C4q92JJjwr3q4u1E2ioNxUMH8HkRsSHJX2dulxm3ZDJRQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVywYqx4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85620C4CEE7;
	Thu, 18 Sep 2025 02:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758161579;
	bh=RmTmszHy29/IYyE8hO8RdzIEpogaX5vISAAq3PM6OJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVywYqx45ZFQAmZ3lqtf9zoVMbbJu80Ydr+/B+L7X9S9MkA3YPyEfbe0daz4taGAf
	 dJrettLKjUgStBsqUXMpZh26C4h5OW23BK7vKrdGKOu1r5RIGLtHPxr5qE65Ohyp/X
	 Mdu8zvfWTN8yCvkc3rjp/od6Au2TlwWToewpNLWJuyAl3Z7lvdpuEYxpMcS7Iq4kgJ
	 pHdiz52f68dQ4RKnOHjZyRcHmvMX0osguMIp5MB2Ec6Z1YmHEWyf46Fzos324fW7ro
	 zIN5TiaTjAkaF+h29N4hpSvC7d7E9z7I8HKFWzIaCf93Rbq4YelIt43Halj+79tloE
	 SwKwedynV0SZg==
Date: Thu, 18 Sep 2025 11:12:58 +0900
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: touchscreen: convert bu21013
 bindings to json schema
Message-ID: <20250918-turkey-of-inescapable-freedom-1a1b1c@kuoka>
References: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250914203812.1055696-1-dario.binacchi@amarulasolutions.com>

On Sun, Sep 14, 2025 at 10:37:52PM +0200, Dario Binacchi wrote:
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/bu21013.yaml b/Documentation/devicetree/bindings/input/touchscreen/bu21013.yaml
> new file mode 100644
> index 000000000000..aeb581fcaf29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/bu21013.yaml

Filename based on compatible, so rohm,bu21013.yaml

> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/bu21013.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rohm BU21013 touchscreen
> +
> +description:
> +  Rohm BU21013 I2C driven touchscreen controller.
> +
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rohm,bu21013_tp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO resetting the chip

Drop description, obvious.

> +
> +  touch-gpios:
> +    maxItems: 1
> +    description: GPIO registering a touch event.
> +
> +  avdd-supply:
> +    description: Phandle to the regulator supplying the analog circuit.

Analog circuit supply.
(rest is redundant, it cannot be something else than phandle)

With these fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


