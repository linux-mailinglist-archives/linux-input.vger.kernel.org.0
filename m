Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB274287481
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 14:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgJHMrY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 08:47:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:33260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729869AbgJHMrY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Oct 2020 08:47:24 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA69B2083B;
        Thu,  8 Oct 2020 12:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602161243;
        bh=euznez8g2lNiMUcU12nOD+uysphnv3GB3UYCsmyBzZQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n5HWs/s6pr4pqch41EhZWUfgPYhpDt7iH/f65wToyLVwvcRc0AXlh4kycBYakzZ2D
         MyL2+dPvzYhLbQPu2DOira0y9fZR4Ot+EkoIj0SYNRfxpEF63uyY4VOI8UWVVsZrC6
         muovn52cLMI8CqdagV5fAlngz3Ep4U2jMNS06lWc=
Received: by mail-oi1-f170.google.com with SMTP id c13so6125991oiy.6;
        Thu, 08 Oct 2020 05:47:22 -0700 (PDT)
X-Gm-Message-State: AOAM533JRSb2BRgwjOhQVPDbbaC+CZzzwli5h/1DidrPVAqhGFXQAWWd
        6M+bo5kCMyV1ZFcw+cTmTpV1+7l48F6Y8ZDOLw==
X-Google-Smtp-Source: ABdhPJz9uUArDgzQ0KTvCl2mNkGHA+ISn1qwzawVRqnnT3olrVHCvXxi/3AC66jaHc5LwP1s2uxVSvpQOd4ntUNIhHg=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr5030077oiy.106.1602161242218;
 Thu, 08 Oct 2020 05:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201007180540.322257-1-kholk11@gmail.com> <20201007180540.322257-4-kholk11@gmail.com>
In-Reply-To: <20201007180540.322257-4-kholk11@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 8 Oct 2020 07:47:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLwWPqyd74bkD2-dG9oKh8AQVD3UB1Wm7SeRvqygCsp9w@mail.gmail.com>
Message-ID: <CAL_JsqLwWPqyd74bkD2-dG9oKh8AQVD3UB1Wm7SeRvqygCsp9w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>, priv.luk@gmail.com,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, Konrad Dybcio <konradybcio@gmail.com>,
        Martin Botka <martin.botka1@gmail.com>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 7, 2020 at 1:05 PM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Please send to DT list so checks run and it's in my review queue.

>
> Add binding for the Novatek NT36xxx series touchscreen driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../input/touchscreen/novatek,nt36xxx.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> new file mode 100644
> index 000000000000..9f350f4e6d6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/novatek,nt36xxx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT36xxx series touchscreen controller Bindings
> +
> +maintainers:
> +  - TBD
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - novatek,nt36xxx
> +
> +  reg:
> +    enum: [ 0x62 ]
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpio:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Power supply regulator for VDD pin
> +
> +  vio-reg-name:
> +    description: Power supply regulator on VDD-IO pin
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      nt36xxx@62 {
> +        compatible = "novatek,nt36xxx";
> +        reg = <0x62>;
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <45 IRQ_TYPE_EDGE_RISING>;
> +        reset-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +      };
> +    };
> +
> +...
> --
> 2.28.0
>
