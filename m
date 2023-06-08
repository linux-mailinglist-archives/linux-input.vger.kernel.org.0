Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8729A728178
	for <lists+linux-input@lfdr.de>; Thu,  8 Jun 2023 15:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235470AbjFHNhY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jun 2023 09:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbjFHNhX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Jun 2023 09:37:23 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126F01BE4
        for <linux-input@vger.kernel.org>; Thu,  8 Jun 2023 06:37:22 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-77493b3d18cso23436239f.0
        for <linux-input@vger.kernel.org>; Thu, 08 Jun 2023 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686231440; x=1688823440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BDWspg0bM2Mt6zZ21elLYpHVPdFq4+1NTztyTSOtN8=;
        b=C3L07EpUmIxpNcWnorVaQ6eL5opDTwazZNgE+DPrh16zumQaZWgM0FMO+G1E5rKZ0p
         WEVVD7ALpfPvQ9PzZjH9mM8lDnV7PtnVGmZLaSx0aH5cNVH4+M/GB4cXGKRqTPksaHfw
         VOTFgCO8wy8XtSKWA801XSqlKTF9ADug4BHKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686231440; x=1688823440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BDWspg0bM2Mt6zZ21elLYpHVPdFq4+1NTztyTSOtN8=;
        b=hOz5vOzzWqi+M8bVoK/z0lzkBYWPnc7ndAZ8yYeszFrqL9dTX4Yd3oY/nhbxWieUr+
         lFQoOFsjho7N/Up5uoW3UzAcBWfFf9bXAMzx71V/cNwxV5zl29GFbOGyuR1cAuiB6cfZ
         ZzYVApt80oiCrCv79tLjKKz5YPMqcOLIVUfVA9lix9FY/jj0gSt/wbHvz1ncTSjXoUBz
         sEZXWmecMU+K+59XwWQVqJzqLuGbuqlTHxrv1fEzuRZDpqpoMrfQyDmo86DFm0PB2z/M
         hSP+FICFkmRkeCWJJ3DomlUKArP/Qkl0mkw9odiYdfeTvkp+iCyvRbHuFFZA5hJk3xyB
         pVEA==
X-Gm-Message-State: AC+VfDxGnbdZ5wCcfx+Woebyj7TtzLUq7Oy/PJEKxVF8jNXX9o7kjRLY
        F9+qJ6w8ELl4SGDthtq40ETylVmnB4xSUXqOI20=
X-Google-Smtp-Source: ACHHUZ6Hu5/Re8h2mRRqiwasKT/UC/E+/42qXaqdgDSfSH3ZrZjYp34UI2UI1nm/T2iSpvmLuEymGg==
X-Received: by 2002:a5e:a611:0:b0:777:aa56:f5e9 with SMTP id q17-20020a5ea611000000b00777aa56f5e9mr13460370ioi.16.1686231440697;
        Thu, 08 Jun 2023 06:37:20 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id g1-20020a056638060100b0040b671bcf15sm280896jar.30.2023.06.08.06.37.19
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 06:37:19 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-33b7f217dd0so136445ab.0
        for <linux-input@vger.kernel.org>; Thu, 08 Jun 2023 06:37:19 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d90:b0:335:6626:9f38 with SMTP id
 h16-20020a056e021d9000b0033566269f38mr239729ila.0.1686231439005; Thu, 08 Jun
 2023 06:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230608130147.2835818-1-yangcong5@huaqin.corp-partner.google.com>
 <20230608130147.2835818-2-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230608130147.2835818-2-yangcong5@huaqin.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Jun 2023 06:37:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTvZZA=AenE5vFMtrUVqLAp+RZMoZFU5t7R6tNpvnvjQ@mail.gmail.com>
Message-ID: <CAD=FV=VTvZZA=AenE5vFMtrUVqLAp+RZMoZFU5t7R6tNpvnvjQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: HID: i2c-hid: ilitek: Introduce
 bindings for Ilitek ili9882t
To:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, hsinyi@google.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Jun 8, 2023 at 6:02=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/ilitek,ili9882t.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ili9882t touchscreen controller
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>

Has Dmitry agreed to be the maintainer here? Traditionally when adding
a new file one lists themselves.


> +description:
> +  Supports the Ilitek ili9882t touchscreen controller.
> +  This touchscreen controller uses the i2c-hid protocol with a reset GPI=
O.
> +
> +allOf:
> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: ilitek,ili9882t
> +
> +  reg:
> +    const: 0x41
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  panel: true
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset GPIO.
> +
> +
> +  vccio-supply:
> +    description: The 1.8V supply to the touchscreen.

Why two blank lines between reset-gpios and vccio-supply?


> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vccio-supply

I think you want "panel" as a required property too, right?


> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      touchscreen: touchscreen@41 {
> +        compatible =3D "ilitek,ili9882t";
> +        reg =3D <0x41>;
> +
> +        interrupt-parent =3D <&pio>;
> +        interrupts =3D <12 IRQ_TYPE_LEVEL_LOW>;
> +
> +        reset-gpios =3D <&pio 60 GPIO_ACTIVE_LOW>;
> +        vccio-supply =3D <&mt6366_vio18_reg>;

...and "panel" would also need to go in the above example.
