Return-Path: <linux-input+bounces-490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5A4804D6D
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 10:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DCDEB20AC0
	for <lists+linux-input@lfdr.de>; Tue,  5 Dec 2023 09:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9A83DB9D;
	Tue,  5 Dec 2023 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LNe765YM"
X-Original-To: linux-input@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F93C6;
	Tue,  5 Dec 2023 01:17:58 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 271311BF209;
	Tue,  5 Dec 2023 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701767877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0q/m5JZa+81MKMuwCNwp5xuzKunJSbVF6gjFLpmzVo=;
	b=LNe765YMnux7MK8ddMiwBbFZzHoejAofsMPr0uArVIAYHr2Cxap2phCX1VeQLy5sQP7xrs
	3DIeVhqfUvbI9ReUDqM26HB1PYgJZ0AfmdCtXieDDV6Q/+/76xwdiaBkxxroBFdk8qJJ4F
	NXpI7+IVz256/sbnBcKJZSwIcmDXPtEtEzVuSfUZMS04O4J7SpkPsqaM1P5fXgeR1/D8lz
	ptnC8RLtGWnpAR77qBKHakk/woRu4nOoMs90ubbK+MPHBdPvEWr4fPLM39qfFR2QNOJntx
	NiKqCotiBVfm8YfYUTqzqF6OA31nIAiuQSOCYH810/jxqIvke/4Pis9x1x36oQ==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 05 Dec 2023 10:17:56 +0100
From: Kamel BOUHARA <kamel.bouhara@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marco Felsch
 <m.felsch@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>,
 catalin.popescu@leica-geosystems.com, mark.satterthwaite@touchnetix.com,
 bartp@baasheep.co.uk, hannah.rossiter@touchnetix.com, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Gregory Clement
 <gregory.clement@bootlin.com>, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v4 2/3] dt-bindings: input: Add TouchNetix axiom
 touchscreen
In-Reply-To: <3ce65c3a-e781-4ba3-8436-8379e8e94d6b@linaro.org>
References: <20231204140505.2838916-1-kamel.bouhara@bootlin.com>
 <20231204140505.2838916-3-kamel.bouhara@bootlin.com>
 <3ce65c3a-e781-4ba3-8436-8379e8e94d6b@linaro.org>
Message-ID: <8ac4a9924e1d3b98c9f74dcb07b044b2@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Le 2023-12-05 09:15, Krzysztof Kozlowski a écrit :
> On 04/12/2023 15:05, Kamel Bouhara wrote:
>> Add the TouchNetix axiom I2C touchscreen device tree bindings
>> documentation.
>> 
>> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
>> +$id: 
>> http://devicetree.org/schemas/input/touchscreen/touchnetix,ax54a.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TouchNetix Axiom series touchscreen controller
>> +
>> +maintainers:
>> +  - Kamel Bouhara <kamel.bouhara@bootlin.com>
>> +
> 
> Why you do not have ref to touchscreen? Is it not a touchscreen?

The common properties are not used or applicable here, should I still 
ref touchscreen ?

> 
> 
>> +properties:
>> +  compatible:
>> +    const: touchnetix,ax54a
>> +
>> +  reg:
>> +    const: 0x66
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  poll-interval:
>> +    description: Poll interval time in milliseconds.
> 
> Missing type or missing ref to input. It seems you want to use existing
> property thus no type, but you did not reference input.yaml
> 

Ok is this the right way to do it :

allOf:
   - $ref: input.yaml#

properties:

   poll-interval: true

>> +
>> +  VDDA-supply:
> 
> lowercase
> 
>> +    description: Analog power supply regulator on VDDA pin
>> +
>> +  VDDI-supply:
> 
> lowercase
> 

Ack.

>> +    description: I/O power supply regulator on VDDI pin
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> Supplies are usually required. Devices rarely can operate without  
> power.

Indeed, can I still have them optional in the driver ?

I have fixed regulators and Im testing on x86 hence I
would like to avoid having extra acpi code to supply them.

> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
> 
> Blank line

Ack.

> 
>> +      touchscreen@66 {
>> +        compatible = "touchnetix,ax54a";
>> +        reg = <0x66>;
>> +        interrupt-parent = <&gpio2>;
>> +        interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>> +        reset-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
>> +      };
> 
> Best regards,
> Krzysztof

Thanks
--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

