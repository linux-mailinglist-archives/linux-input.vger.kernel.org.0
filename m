Return-Path: <linux-input+bounces-5407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6823294A469
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 11:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 966341C20BEC
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 09:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6381CB32D;
	Wed,  7 Aug 2024 09:35:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB921B86C2;
	Wed,  7 Aug 2024 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723023319; cv=none; b=X9OUw6xLA3mudZMyZFjFB2NaUSDvIbC0+23Kml/OkCRweXTG84IPI8pZkv+m135ePXcEcUWRJUn6aWqlNkgJmoSAx72351SZNQacEXoSD1Od/RgMJLbefJ66VpWMl6V3odHIMywIQ3ybO8MGnkLzDGIiGzXb9PHNZ9iQzrDGemw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723023319; c=relaxed/simple;
	bh=0rhb2vRZQeOGURRtbcyH5apu/JN8DC3SqwjnxjklUAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dX4UfjTjrcx9tge2ywAOPIenrQ0u/4lOWC/0kd4rhPlmGXHUWMCgcSglc9CvLZGil79khqfEMPjqQPdN1htdj+HdOBkIZ1CpEOVqoo3rYfOaBa/Nm9at9rW8e/cE7TfGhbkIjQZu/Yk33KXcQBp+2d3BdiGTCyDqSTqx9yA13Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sbd4G-0006qI-Rp; Wed, 07 Aug 2024 11:34:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: lee@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
 dmitry.torokhov@gmail.com, pavel@ucw.cz, krzk+dt@kernel.org,
 conor+dt@kernel.org, ukleinek@debian.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH v3 1/7] dt-bindings: mfd: add binding for qnap,ts433-mcu devices
Date: Wed, 07 Aug 2024 11:34:51 +0200
Message-ID: <1895730.u6TykanW85@diego>
In-Reply-To: <20240805191723.GA2636745-robh@kernel.org>
References:
 <20240731212430.2677900-1-heiko@sntech.de>
 <20240731212430.2677900-2-heiko@sntech.de>
 <20240805191723.GA2636745-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Rob,

Am Montag, 5. August 2024, 21:17:23 CEST schrieb Rob Herring:
> On Wed, Jul 31, 2024 at 11:24:24PM +0200, Heiko Stuebner wrote:
> > These MCUs can be found in network attached storage devices made by QNAP.
> > They are connected to a serial port of the host device and provide
> > functionality like LEDs, power-control and temperature monitoring.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  .../bindings/mfd/qnap,ts433-mcu.yaml          | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml b/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
> > new file mode 100644
> > index 0000000000000..5ae19d8faedbd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/qnap,ts433-mcu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: QNAP NAS on-board Microcontroller
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +description:
> > +  QNAP embeds a microcontroller on their NAS devices adding system feature
> > +  as PWM Fan control, additional LEDs, power button status and more.
> 
> Doesn't really look like the binding is complete.

Hmm, apart from the fan subnode, anything else that is missing?

Input device does not need data from devicetree, as the existence
of the button and buzzer is attached to the specific mcu-compatible.

Similar for the LEDs I guess, their number and color are a property
of the MCU variant used. I guess one could do subnodes for the
linux,default-trigger property?


> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qnap,ts433-mcu
> > +
> > +  "#cooling-cells":
> > +    const: 2
> > +
> > +  cooling-levels:
> > +    description: PWM duty cycle values corresponding to thermal cooling states.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    items:
> > +      maximum: 255
> 
> These are fan properties and should be in a "fan" node referencing 
> hwmon/fan-common.yaml.

ok, I'll add a fan-0 subnode as some hwmon already does and move the
cooling properties into it.


Heiko



