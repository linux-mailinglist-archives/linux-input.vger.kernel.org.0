Return-Path: <linux-input+bounces-10810-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A37E8A60BD2
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 09:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2959A188AD4F
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 08:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9871DB55C;
	Fri, 14 Mar 2025 08:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F/J1Cg80"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B4E1D619D
	for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941270; cv=none; b=O2JQnIWbzBy1STxgHi3L9AyhGVilSB/+yVgY6CzjFxbxIgZsXoBCYFKMPESHxUuhq+ZIQAFNhwOg5/gc70pafFl9HlufjX52Y0oVoZmHxDevuFTVFhSR6xO57kdYVDRYMLsWymKCBCWhmvC7OVaBVfbxRbRSih7pyI5vGUSFtv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941270; c=relaxed/simple;
	bh=Y6avr2myEPlVX/TtmeWB+WHBd87SJ1PkPTov3+80k5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbrc1x2EhtKrqfPaSwT+WXac/M/itYnaPcscE8T1OaxmJe3vtSQ25DlCSo/3OkBWfKEtvHE2pF2W8LiYKo22E6UYY+O9IZMtso/KXsWjRJE07z3g2wf37uaNDGLMDQ/O2jrKnc9b4kB58qVyx52A8OIcrhlauNE4n1d3rx1/Nq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F/J1Cg80; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3061513d353so22552371fa.2
        for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741941265; x=1742546065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZpAgjGwH0utmNulKzYZy5inQOshYJyhiBsdybHGg9A=;
        b=F/J1Cg80kgJSEhc2F1h4jZcfkFE8duM5s2vMzdsHdyE2gTHtFgNbv6RRfY1GFKznMD
         MmJgiMb28NweFIq4JgpOK8xr3tK6e0UEVrI90g4AXSU1b3/JQ8d2Yc2GFNOVsIb0Q6ph
         8Z30kuHsk9WnoVsS3VdxhMQXvSEhL2XDTZW6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941265; x=1742546065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZpAgjGwH0utmNulKzYZy5inQOshYJyhiBsdybHGg9A=;
        b=ZWDk6qJLJsV10H6zCm5oaFKUYcdvzU9IeaDvAyZO8WVguLxEtDhJLP6YhZGs24HYiR
         exMHBXbPSBs7UmKJyqxjEdi9db5JxieIiTj22s+nEkOru6rmxQFT0hPPq7DJdFZXp+aU
         rMt0iK4hn3fwOEW/w/rUVlrHK9rdF1/3Ds5NNeK9UZDOZzWCPaoqPmyIpo+tMx+NsmON
         L5CFjQg6KKEY0qCnH56SwDaCYLJx184DHJsEZ7Jvu7UCI5E7WFecDsmr1bEuuyB58O1f
         35ZKMTU3SKPM860pA6mKpjXoY0VdlLcu7DUaXP83Ejl4nOFPm0DwSAJjqvXruFlftaZk
         FIYA==
X-Forwarded-Encrypted: i=1; AJvYcCVkdCEHg68PFT5daXBfyuaEI5o+jumBlSAic34CcXoO5/s5CzgVlQZ3ZBKHypzWSEL+wWrrwyxdiTZ8tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQGuLaMzZ83uDpGCM5WwF4l5OfCXYvJ7lQ7vPsnEj47XlK5a3g
	pFpRS9o0SyZCrwPQRtGDAP+vqUj4yQqgHB6BUgHFyeZJZl1UfNQPsjwJl8cc9E5e7IqU7OHIfS/
	z5Yi5SwdwGhgYCMgOjwt5TMWZ12zSDx9s4tKsc3C6oSjOiQyyvw==
X-Gm-Gg: ASbGncs0TzkFHX64kTjXeAol8RgukAoy8oejYLaNLGnGbxGkvI3k9Cb5Jrm0w5xSyI/
	Nwey8KG/ubWwXShrx2sn78nbGykyx63ASiQEvsTvsCKIINoJ59uKyNqFv74T0zvvoQaoFcc1ZQK
	/Tq2w4A38vWiWSqVArJOQ2EeuEmiLQa41HymjWvN4dCP4b/ttgTHuKapvCDcJIhKw=
X-Google-Smtp-Source: AGHT+IFeG2vASJFBcUYON5CpB2pCpsn5Qni6S+429lhxSZT9jExopLARUFhUuvYTV/jamF8BmUY325TX1o31O/IfcCs=
X-Received: by 2002:a05:6512:1241:b0:549:5769:6adb with SMTP id
 2adb3069b0e04-549c38eabd5mr545062e87.5.1741941265129; Fri, 14 Mar 2025
 01:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314073307.25092-1-Lu.Tang@mediatek.com> <20250314073307.25092-6-Lu.Tang@mediatek.com>
In-Reply-To: <20250314073307.25092-6-Lu.Tang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 14 Mar 2025 16:34:13 +0800
X-Gm-Features: AQ5f1JrxNwBtyEMHMU4cnPir_h2MVBk0naTrsiwIFPX2nky8qr1kDmNLCL6d8BU
Message-ID: <CAGXv+5GMgkCSthLgna-0DwyMbw5pOd-jLi_H2Gk+5U0sUsnAFQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: pmic: mediatek: Add pmic documents
To: "Lu.Tang" <Lu.Tang@mediatek.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Chen Zhong <chen.zhong@mediatek.com>, Sen Chu <shen.chu@mediatek.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 4:03=E2=80=AFPM Lu.Tang <Lu.Tang@mediatek.com> wrot=
e:
>
> Add new pmic mfd and adc documents for mt8196
>
> Signed-off-by: Lu.Tang <Lu.Tang@mediatek.com>
> ---
>  .../iio/adc/mediatek,spmi-pmic-auxadc.yaml    |  31 ++++
>  .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
>  .../bindings/mfd/mediatek,mt6685.yaml         |  50 +++++
>  .../bindings/mfd/mediatek,spmi-pmic.yaml      | 173 ++++++++++++++++++
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
>  5 files changed, 256 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,sp=
mi-pmic-auxadc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6685=
.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,spmi-p=
mic.yaml
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic=
-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic=
-auxadc.yaml
> new file mode 100644
> index 000000000000..250782ad7d01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic-auxadc=
.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/mediatek,spmi-pmic-auxadc.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SPMI PMIC AUXADC
> +
> +maintainers:
> +  - Lu Tang <lu.tang@mediatek.com>
> +
> +description:
> +  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
> +  in some MediaTek PMICs, performing various PMIC related measurements
> +  such as battery and PMIC internal voltage regulators temperatures,
> +  other than voltages for various PMIC internal components.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6363-auxadc
> +      - mediatek,mt6373-auxadc
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - "#io-channel-cells"
> +
> +additionalProperties: false

This is simply a sub-function of the PMIC, and is really not tied to
whatever interface the PMIC uses. Please integrate this into the existing
binding:

    Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml

> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.y=
aml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index b95435bd6a9b..ce760039d4c2 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -31,6 +31,7 @@ properties:
>        - mediatek,mt6358-keys
>        - mediatek,mt6359-keys
>        - mediatek,mt6397-keys
> +      - mediatek,mt6363-keys
>
>    power-off-time-sec: true
>
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
> new file mode 100644
> index 000000000000..d3276df8952b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6685.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6685 Clock IC
> +
> +maintainers:
> +  - Lu Tang <lu.tang@mediatek.com>
> +
> +description: |
> +  MT6685 is a clock IC.
> +  Please see the sub-modules below for supported features.
> +
> +  MT6685 is a multifunction device with the following sub modules:
> +  - RTC
> +  - Clock
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6685
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spmi {
> +        mfd@9 {
> +            compatible =3D "mediatek,mt6685";
> +            reg =3D <0x9 SPMI_USID>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yam=
l b/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
> new file mode 100644
> index 000000000000..a8f1231623cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,spmi-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SPMI PMICs multi-function device
> +
> +maintainers:
> +  - Lu Tang <lu.tang@mediatek.com>
> +
> +description: |
> +  Some Mediatek PMICs are interfaced to the chip via the SPMI (System Po=
wer
> +  Management Interface) bus.
> +
> +  The Mediatek SPMI series includes the MT6363, MT6373, MT6316 and other
> +  PMICs.Please see the sub-modules below for supported features.
> +
> +   MT6363/MT6373 is a multifunction device with the following sub module=
s:
> +  - Regulators
> +  - ADC
> +  - GPIO
> +  - Keys


> +   MT6316 is a multifunction device with the following sub modules:
> +  - Regulators

Then it is not multifunctional. Please move this to the MT6315
binding:

    Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml

Also, you have not covered regulator bindings in this series.


ChenYu

> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt6363
> +          - mediatek,mt6373
> +          - mediatek,mt6316
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  regulators:
> +    type: object
> +    description:
> +      List of child nodes that specify the regulators.
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          - enum:
> +              - mediatek,mt6363-regulator
> +              - mediatek,mt6373-regulator
> +              - mediatek,mt6316-regulator
> +
> +    required:
> +      - compatible
> +
> +  adc:
> +    type: object
> +    $ref: /schemas/iio/adc/mediatek,spmi-pmic-auxadc.yaml#
> +    unevaluatedProperties: false
> +
> +  keys:
> +    type: object
> +    $ref: /schemas/input/mediatek,pmic-keys.yaml
> +    unevaluatedProperties: false
> +    description:
> +      Power and Home keys.
> +
> +  pinctrl:
> +    type: object
> +    $ref: /schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +    unevaluatedProperties: false
> +    description:
> +      Pin controller
> +
> +required:
> +  - compatible
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spmi {
> +        main_pmic: pmic@4 {
> +            compatible =3D "mediatek,mt6363";
> +            reg =3D <0x4 SPMI_USID>;
> +            interrupts =3D <0x4 IRQ_TYPE_NONE>;
> +            #address-cells =3D <0>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <2>;
> +
> +            mt6363keys: keys {
> +                compatible =3D "mediatek,mt6363-keys";
> +                mediatek,long-press-mode =3D <1>;
> +                power-off-time-sec =3D <0>;
> +
> +                power {
> +                    linux,keycodes =3D <116>;
> +                    wakeup-source;
> +                };
> +
> +                home {
> +                    linux,keycodes =3D <115>;
> +                };
> +            };
> +
> +            mt6363_pio: pinctrl {
> +                compatible =3D "mediatek,mt6363-pinctrl";
> +                gpio-controller;
> +                #gpio-cells =3D <2>;
> +            };
> +
> +            mt6363regulator: regulators {
> +                compatible =3D "mediatek,mt6363-regulator";
> +
> +                mt6363_vs2: vs2 {
> +                    regulator-name =3D "mt6363_vs2";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                    regulator-always-on;
> +                    regulator-allow-set-load;
> +                };
> +
> +                mt6363_vbuck1: vbuck1 {
> +                    regulator-name =3D "mt6363_vbuck1";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck2: vbuck2 {
> +                    regulator-name =3D "mt6363_vbuck2";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck3: vbuck3 {
> +                    regulator-name =3D "mt6363_vbuck3";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck4: vbuck4 {
> +                    regulator-name =3D "mt6363_vbuck4";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck5: vbuck5 {
> +                    regulator-name =3D "mt6363_vbuck5";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck6: vbuck6 {
> +                    regulator-name =3D "mt6363_vbuck6";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck7: vbuck7 {
> +                    regulator-name =3D "mt6363_vbuck7";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                // ...
> +
> +                mt6363_isink_load: isink-load {
> +                    regulator-name =3D "mt6363_isink_load";
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinc=
trl.yaml
> index bccff08a5ba3..bf3ba58a7705 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.y=
aml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - mediatek,mt2701-pinctrl
>        - mediatek,mt2712-pinctrl
> +      - mediatek,mt6363-pinctrl
>        - mediatek,mt6397-pinctrl
>        - mediatek,mt7623-pinctrl
>        - mediatek,mt8127-pinctrl
> --
> 2.46.0
>
>

