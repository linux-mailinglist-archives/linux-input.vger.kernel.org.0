Return-Path: <linux-input+bounces-529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F0806C39
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 11:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FD691C209EB
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 10:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEA12DF9F;
	Wed,  6 Dec 2023 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSZWCwtt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF391BE7
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 02:37:52 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c0a11a914so34376045e9.2
        for <linux-input@vger.kernel.org>; Wed, 06 Dec 2023 02:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701859071; x=1702463871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQuVCNirRe4aag9NFC52gi3i42BmYuL6ayZ4P1JiWgc=;
        b=bSZWCwttuP1D8suTrBjZmL5i1xc8ckpk8GIWHDAPkld/rdv49+ljf3m/DD34PGWdRR
         rcnWHZOjgtlvbejq0aHR3gJA3mDzliXxmuw4I9yLi+lpATPPfIFvFsVHqqoW04Jo9yHs
         6qToBwW5UJ0FNtx0CHDrKY+NLmzb0U5M0xK5txUTpXh+LpfdeMuXyjXsHVCK8Sqodmyt
         Xjqy63ph2Kzg72XiVLn7QKBxGyfREkah/yGuH5WHU9zv7v3w6tdwua+kNsYCBim5cnpD
         XZfEieoQX4Z8Y0BGlRJlD5BaM5K1mez6Yn0yrKtjtfiqHeh1vV+Pfy2Biv3f437e9iDO
         QPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701859071; x=1702463871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQuVCNirRe4aag9NFC52gi3i42BmYuL6ayZ4P1JiWgc=;
        b=QEGQ5tSJOj0SfyNwz4ODgzMixrrW09a7mRpkV6A+A4m3FfH7XzE7XXpXdGARorbcuq
         XC9lznJ+iYanSX8rpG+97hXvgEUTIscpw6HjaWdDU+vwTJXJFGmCGw2B0WmTFJU5K06O
         RJPnc9rwxf04dbRVtoGA3Y8CTDW3FE3YvzWmZR4J1l+VyMOXmfiPyMFvOqQOueOZuv8F
         jt4qX1uoBEKUUllUdTEXvCour/yqBET1QNGY+QyAkYrr4AdXm2yVjKWDLSN2ll7LMriq
         xSs/pVb5m17lposHWAH3rngt9nju/EWGHVYo81mzx8xhevK2BbNRk5iRFLoBcLkrJArB
         Z6gQ==
X-Gm-Message-State: AOJu0YwYyWpowLCbuQe+LZyMSc2ohiDRpjC84daQq/6T0IXbv5Z8ES49
	ryQVDmcMeluSntLTfe3AoFJSJA==
X-Google-Smtp-Source: AGHT+IElbJK+qwEWYCL6Spp7LhtvGkhlzcdvXetdM5c5vo7GZ1QuGod4jOnY6xs73XUkwgcLVEgLag==
X-Received: by 2002:a05:600c:1989:b0:408:3d91:8251 with SMTP id t9-20020a05600c198900b004083d918251mr489406wmq.5.1701859071080;
        Wed, 06 Dec 2023 02:37:51 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id bi10-20020a05600c3d8a00b0040b4c7e1a65sm25125668wmb.13.2023.12.06.02.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 02:37:50 -0800 (PST)
Message-ID: <6e8a6fc2-88c2-4655-a8f0-45ece45170e2@linaro.org>
Date: Wed, 6 Dec 2023 11:37:48 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: input: Add Himax HX83102J touchscreen
Content-Language: en-US
To: Allen_Lin <allencl_lin@hotmail.com>, dmitry.torokhov@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jikos@kernel.org, benjamin.tissoires@redhat.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231205100552.723620-1-allencl_lin@hotmail.com>
 <TY0PR06MB56116A355D2A5BF665FA0D899E85A@TY0PR06MB5611.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <TY0PR06MB56116A355D2A5BF665FA0D899E85A@TY0PR06MB5611.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2023 11:05, Allen_Lin wrote:
> Add the HX83102j touchscreen device tree bindings documents.
> 
> Signed-off-by: Allen_Lin <allencl_lin@hotmail.com>
> ---
>  .../bindings/input/himax,hx8310xx.yaml        | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/himax,hx8310xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/himax,hx8310xx.yaml b/Documentation/devicetree/bindings/input/himax,hx8310xx.yaml
> new file mode 100644
> index 000000000000..1cc65e9bd267
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/himax,hx8310xx.yaml

Filename like compatible, so himax,hx83102j.yaml

> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/himax,hx8310xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: himax hx8310xx touchscreen

Himax? HiMax? lowercase "himax" seems wrong and your commit msg also
suggest different capitalization. The same for "hx8310xx". And it is not
"xx" but 2J.

> +
> +maintainers:
> +  - Allen Lin <allencl_lin@hotmail.com>
> +
> +description:
> +  Supports the himax hx8310xx touchscreen.

Drop sentence, instead describe hardware like "Himax HX83102J is a
touchscreen connected over SPI ...."

> +  This touchscreen uses the spi-hid protocol but has some non-standard
> +  power sequencing required.
> +
> +allOf:
> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#

Missing ref to spi-peripheral-props

> +
> +properties:
> +  compatible:
> +    enum:
> +      - himax,hx83102j
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  spi-cpha: true
> +
> +  spi-cpol: true
> +
> +  spi-max-frequency: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>

Why? Drop


> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hid_himax_spi@0 {

No underscores in node names.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +        pinctrl-names = "default";
> +        pinctrl-0 = <&touch_int0 &touch_reset>;
> +        reg = <0>;

Oh damn... ok, so compatible is always the first property. Reg is second.

> +        spi-max-frequency = <12500000>;
> +        status = "okay";

Drop

> +        compatible = "himax,hx83102j";
> +        reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> +        spi-cpha;
> +        spi-cpol;
> +        interrupt-parent = <&gpio1>;
> +        interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> +      };
> +    };



Best regards,
Krzysztof


