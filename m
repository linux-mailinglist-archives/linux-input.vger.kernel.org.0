Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42B3286EDE
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 08:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgJHGyk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 02:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:54544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgJHGyk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Oct 2020 02:54:40 -0400
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98AD22168B;
        Thu,  8 Oct 2020 06:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602140079;
        bh=xets6aocGoBonJWZWZR/AqSEf1Th8uPkmzNNEDt6KFE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=i+OlTFuEwT0wNF5dNY+Nzl3gOhkaJuibi5BepaLzFGvx5DXa78zYIvpWM0kiEYORz
         PvmM8m0qQtj15D+PuMK+zXFVXicCZU9w2FQtaF/DeFl70rD/UB9IY7YFmzII//Rh1v
         GFhzzj9yKyGwVzc3iVHM6EWIPCVYJ2RWCEPheOmk=
Received: by mail-ed1-f46.google.com with SMTP id l24so4690306edj.8;
        Wed, 07 Oct 2020 23:54:39 -0700 (PDT)
X-Gm-Message-State: AOAM531GtgvLd0ViYeChmmjbtrWWZ6Rw4maOm0nU7tcOp70SIG9aI23p
        g9yrXo8zxRvNfXTMokwmCf5pJJN217cAUL/neAs=
X-Google-Smtp-Source: ABdhPJy+9gE89PnSy3HmXagIvjctuY9MSJe7IsZxoIYvJsTYc0E89DdzYTlR+ULlO53SZOEjz53Yn+Jdef1VUgHPX+E=
X-Received: by 2002:a50:cc8d:: with SMTP id q13mr7286456edi.298.1602140078091;
 Wed, 07 Oct 2020 23:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201007180540.322257-1-kholk11@gmail.com> <20201007180540.322257-4-kholk11@gmail.com>
In-Reply-To: <20201007180540.322257-4-kholk11@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 8 Oct 2020 08:54:26 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcKPXFehzoa65YxjY8+qs-8JxAzj-ER58Y2V43RMD1qYQ@mail.gmail.com>
Message-ID: <CAJKOXPcKPXFehzoa65YxjY8+qs-8JxAzj-ER58Y2V43RMD1qYQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: touchscreen: Add binding for Novatek
 NT36xxx series driver
To:     kholk11@gmail.com
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 7 Oct 2020 at 20:22, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
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

Hi,

It is surprising that this is your v3 and you put here TBD. In such
case, add here subsystem maintainer:
Dmitry Torokhov <dmitry.torokhov@gmail.com>


> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - novatek,nt36xxx

This is not an enum, but one const.

> +
> +  reg:
> +    enum: [ 0x62 ]

Usually addresses are fixed in schema, because they could change (e.g.
by some pin configuration). Just use maxItems: 1.

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

What is this for? Is it a supply for the device or the device is a
regulator provider?

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

Incorrect node name - should be touchscreen.

Best regards,
Krzysztof
