Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE2A3B09B3
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 17:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhFVQA7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Jun 2021 12:00:59 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:37531 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231936AbhFVQA6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Jun 2021 12:00:58 -0400
Received: by mail-il1-f175.google.com with SMTP id x12so18890922ill.4;
        Tue, 22 Jun 2021 08:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VR4qkGDWYtdjfgziGh5tyR/mzFAynXqFUJLLjnq0V20=;
        b=p8DEwFWwcZpNjvV8MomlZvRiDs0y8/u9PeLVn+VoiuJyfdK7TzJ5JPnevyTQUmYLcV
         1nPnCXr70incadxptnu97pOY1LmMljIe2nvjaJ3LMSXh1SzKT23R3D5100P0L67Y1tC3
         7bQztl31JftaaHBnkBuHZPAnrx9euO6/CiqxhjXbQBYwyWBRugOsdrtv3lBr4vIoK/mP
         JIN5Ri/nqpQbGJOt1+vhwOdFzGXllHJzJks7M90XEpbV1hpM4Vv3tanW3MRHyHZjFK7Z
         3BRPaDSTe/2L3vyorkD7ldtWEyWkGpRo5AHNw2J0w/T/F5uZ25ZLzVD1XAC5OGuExEkN
         pnMQ==
X-Gm-Message-State: AOAM532Z9SYWkt9lgQTyN0VnJDBfdVmeobyRQADlNgvEc/rKgMqqHuRQ
        aj4KFn/vdD7/jYJIVHQCmg==
X-Google-Smtp-Source: ABdhPJzhwE6GGWNHAo4/uOYQ52b7LZ0FbGdFFI/udfP+fCqx80BFtyeMtlZlfl2czEZpqOLCiinO6Q==
X-Received: by 2002:a92:b004:: with SMTP id x4mr3209935ilh.121.1624377521556;
        Tue, 22 Jun 2021 08:58:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x11sm8247636ilg.59.2021.06.22.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 08:58:40 -0700 (PDT)
Received: (nullmailer pid 3755885 invoked by uid 1000);
        Tue, 22 Jun 2021 15:58:37 -0000
Date:   Tue, 22 Jun 2021 09:58:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jami.kettunen@somainline.org,
        jo@jsfamily.in, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/6] dt-bindings: input: add Qualcomm SPMI
 haptics driver
Message-ID: <20210622155837.GA3746854@robh.at.kernel.org>
References: <20210618175041.323495-1-caleb@connolly.tech>
 <20210618175041.323495-2-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618175041.323495-2-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 18, 2021 at 05:51:03PM +0000, Caleb Connolly wrote:
> Add bindings for qcom PMIC SPMI haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/input/qcom,spmi-haptics.yaml     | 128 ++++++++++++++++++
>  include/dt-bindings/input/qcom,spmi-haptics.h |  32 +++++
>  2 files changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>  create mode 100644 include/dt-bindings/input/qcom,spmi-haptics.h
> 
> diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
> new file mode 100644
> index 000000000000..8ef9b4ec3a07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2020 Unisoc Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc PMI8998 spmi haptics
> +
> +maintainers:
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +description: |
> +  Qualcomm SPMI haptics is a peripheral on some QTI PMICs. It supports linear resonant
> +  actuators and eccentric rotating mass type haptics commonly found in mobile devices.
> +  It supports multiple sources of wave data such as an internal buffer, direct play
> +  (from kernel or userspace) as well as an audio output mode.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - qcom,pmi8998-haptics
> +        - qcom,pmi8996-haptics
> +        - qcom,pmi8941-haptics
> +      - const: qcom,spmi-haptics
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: short circuit interrupt
> +      - description: play interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: short
> +      - const: play
> +
> +  qcom,actuator-type:
> +    description: |
> +      The type of actuator attached to the hardware.
> +      Allowed values are,
> +        0 - HAP_TYPE_LRA
> +        1 - HAP_TYPE_ERM
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    default: 0
> +
> +  qcom,wave-shape:
> +    description: |
> +      Selects the wave shape to use.
> +      Allowed values are,
> +        0 - HAP_WAVE_SINE
> +        1 - HAP_WAVE_SQUARE
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    default: 0
> +
> +  qcom,play-mode:
> +    description: |
> +      Selects the play mode to use.
> +      Allowed values are,
> +        0 - HAP_PLAY_DIRECT
> +        1 - HAP_PLAY_BUFFER
> +        2 - HAP_PLAY_AUDIO
> +        3 - HAP_PLAY_PWM
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2, 3 ]
> +    default: 2
> +
> +  qcom,wave-play-rate-us:
> +    description: |
> +      Wave sample durection in microseconds, 1/f where f
> +      is the resonant frequency of the actuator.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type for standard units.

> +    minimum: 0
> +    maximum: 20475
> +
> +  qcom,brake-pattern:
> +    minItems: 4
> +    maxItems: 4
> +    description: |
> +      The brake pattern are the strengths of the pattern
> +      used to brake the haptics. Allowed values are,
> +        0 - 0V
> +        1 - Vmax/4
> +        2 - Vmax/2
> +        3 - Vmax
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    default: [0x3, 0x3, 0x2, 0x1]

To express the constraints on all items:

items:
  enum: [ 0, 1, 2, 3 ]

(items is a schema here rather than a list)

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - qcom,wave-play-rate-us
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/qcom,spmi-haptics.h>
> +
> +    pmi8998_lsid1: pmic@3 {

Drop unused labels.

> +      compatible = "qcom,pmi8998", "qcom,spmi-pmic";

Really, this needs to be converted to schema first so we're not adding 
warnings.

> +      reg = <0x3 SPMI_USID>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      pmi8998_haptics: haptics@c000 {
> +        compatible = "qcom,pmi8998-haptics", "qcom,spmi-haptics";
> +        reg = <0xc000>;
> +
> +        interrupts = <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
> +                     <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
> +        interrupt-names = "short", "play";
> +
> +        qcom,wave-shape = <HAP_WAVE_SINE>;
> +        qcom,play-mode = <HAP_PLAY_BUFFER>;
> +        qcom,brake-pattern = <0x3 0x3 0x2 0x1>;
> +
> +        status = "disabled";

Don't show status in examples. 

> +      };
> +    };
> diff --git a/include/dt-bindings/input/qcom,spmi-haptics.h b/include/dt-bindings/input/qcom,spmi-haptics.h
> new file mode 100644
> index 000000000000..14a7e7d1471e
> --- /dev/null
> +++ b/include/dt-bindings/input/qcom,spmi-haptics.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license please. DT files are used elsewhere.

> +/*
> + * This header provides constants for pmi8998 SPMI haptics options.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_
> +#define _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_
> +
> +// Actuator types
> +#define HAP_TYPE_LRA		0
> +#define HAP_TYPE_ERM		1
> +
> +// LRA Wave type
> +#define HAP_WAVE_SINE		0
> +#define HAP_WAVE_SQUARE		1
> +
> +// Play modes
> +#define HAP_PLAY_DIRECT		0
> +#define HAP_PLAY_BUFFER		1
> +#define HAP_PLAY_AUDIO		2
> +#define HAP_PLAY_PWM		3
> +
> +#define HAP_PLAY_MAX		HAP_PLAY_PWM
> +
> +// Auto resonance type
> +#define HAP_AUTO_RES_NONE	0
> +#define HAP_AUTO_RES_ZXD	1
> +#define HAP_AUTO_RES_QWD	2
> +#define HAP_AUTO_RES_MAX_QWD	3
> +#define HAP_AUTO_RES_ZXD_EOP	4
> +
> +#endif /* _DT_BINDINGS_QCOM_PMIC_SPMI_HAPTICS_ */
> --
> 2.31.1
> 
> 
> 
