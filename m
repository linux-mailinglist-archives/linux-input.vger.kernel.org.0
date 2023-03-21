Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9966C351B
	for <lists+linux-input@lfdr.de>; Tue, 21 Mar 2023 16:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjCUPIK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Mar 2023 11:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbjCUPIE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Mar 2023 11:08:04 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057DD4FCD2
        for <linux-input@vger.kernel.org>; Tue, 21 Mar 2023 08:07:45 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id i9so14040662wrp.3
        for <linux-input@vger.kernel.org>; Tue, 21 Mar 2023 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679411264;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFyWXWqsoSrr2n/nr5WFH4+XCUi3HeyHPmJXflcFG4M=;
        b=BkQC5wUD4CWB2PJ4wIBzixl/nv2bZ/wbBAXgWZZBoB7CPKElqOeL7pFUsAo8WyLasZ
         Jk8ZoxGEZke4a2oxpZG9QCWIwNaYzub2IogYm1zDpaGaAF7AxcOvlzdgqWkxcI30/EV0
         CItrJgAVwwUf9XiGhNvVA9DBIvM47GPVrzm6Z/04/pDDR634UO4mgcxXh9Yq9KsMJc8G
         0GjVOjqZAoZUTr4aeCb0Yh30eN9ajC6lmP6ioYSj9Sr8AtxTKDo7pR2NHAdPC2SC844a
         z32CGoa1C7I2uMynCUxep9zr5N6h3lu1RPDx14JyxzjPfB17oOuhFnVItnGm4nKEJxXk
         y/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679411264;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFyWXWqsoSrr2n/nr5WFH4+XCUi3HeyHPmJXflcFG4M=;
        b=HTcrnCslUBWvOvbGLqBi40x24aQhq4YuVdGOgCeImX7PnNmmnEebzXkANd4OgxW4WY
         XS7BC9ULNDVbi1UhOit3MhGAnCA6cLwVwCMg4JDJOAsdRniUzetDQN346QWwUV2O0pzV
         93sWPbQRrT1jn/PH+L679yrTGaG5VXDFXRtAW+PmwpYcAL0masQHbe8Ig+/H31yC/Z68
         E3VSNA2nOevlfWP6Lrev+1V1aVt+lQjd+BFx/B3lvtj73nm/4SpDbUkfen6AjSkctc5M
         ehVF35DyoKcakzS7QZXaiXBF9eapgrDI6DCp+PeENhgrZnt+krpzBmn+qxDBDeTYkyvK
         A68g==
X-Gm-Message-State: AO0yUKVY1rS+s2AGiAx1OT2SPcHTOl5EQy/fRsJPlSoAQX33zAEe0JDe
        kRXKeeLYQe1/n4wlXLJ+yePAGg==
X-Google-Smtp-Source: AK7set84LPqCUYf6yhhlDvPsISDuuO8P7FciRBhYMTb88p9jq1jWKFXiaxN9uhODbTmEO9zz5pAljw==
X-Received: by 2002:a5d:528f:0:b0:2d2:ac99:a72 with SMTP id c15-20020a5d528f000000b002d2ac990a72mr2379240wrv.46.1679411264305;
        Tue, 21 Mar 2023 08:07:44 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d4889000000b002c559843748sm11573794wrq.10.2023.03.21.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:07:43 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: Drop unneeded quotes
In-Reply-To: <20230320234718.2930154-1-robh@kernel.org>
References: <20230320234718.2930154-1-robh@kernel.org>
Date:   Tue, 21 Mar 2023 16:07:42 +0100
Message-ID: <87lejqkurl.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On lun., mars 20, 2023 at 18:47, Rob Herring <robh@kernel.org> wrote:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # for mediatek,mt6779-keypad.yaml

> ---
>  Documentation/devicetree/bindings/input/adc-joystick.yaml     | 4 ++--
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml        | 2 +-
>  Documentation/devicetree/bindings/input/imx-keypad.yaml       | 2 +-
>  Documentation/devicetree/bindings/input/matrix-keymap.yaml    | 2 +-
>  .../devicetree/bindings/input/mediatek,mt6779-keypad.yaml     | 2 +-
>  .../devicetree/bindings/input/microchip,cap11xx.yaml          | 4 ++--
>  Documentation/devicetree/bindings/input/pwm-vibrator.yaml     | 4 ++--
>  Documentation/devicetree/bindings/input/regulator-haptic.yaml | 4 ++--
>  .../bindings/input/touchscreen/elan,elants_i2c.yaml           | 4 ++--
>  9 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> index da0f8dfca8bf..6c244d66f8ce 100644
> --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019-2020 Artur Rojek
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/input/adc-joystick.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/input/adc-joystick.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: ADC attached joystick
>  
> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index e05690b3e963..3486c81699a8 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -57,7 +57,7 @@ if:
>        contains:
>          const: google,cros-ec-keyb
>  then:
> -  $ref: "/schemas/input/matrix-keymap.yaml#"
> +  $ref: /schemas/input/matrix-keymap.yaml#
>    required:
>      - keypad,num-rows
>      - keypad,num-columns
> diff --git a/Documentation/devicetree/bindings/input/imx-keypad.yaml b/Documentation/devicetree/bindings/input/imx-keypad.yaml
> index 7514df62b592..b110eb1f3358 100644
> --- a/Documentation/devicetree/bindings/input/imx-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/imx-keypad.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Liu Ying <gnuiyl@gmail.com>
>  
>  allOf:
> -  - $ref: "/schemas/input/matrix-keymap.yaml#"
> +  - $ref: /schemas/input/matrix-keymap.yaml#
>  
>  description: |
>    The KPP is designed to interface with a keypad matrix with 2-point contact
> diff --git a/Documentation/devicetree/bindings/input/matrix-keymap.yaml b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> index 4d6dbe91646d..a715c2a773fe 100644
> --- a/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> +++ b/Documentation/devicetree/bindings/input/matrix-keymap.yaml
> @@ -21,7 +21,7 @@ description: |
>  
>  properties:
>    linux,keymap:
> -    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: |
>        An array of packed 1-cell entries containing the equivalent of row,
>        column and linux key-code. The 32-bit big endian cell is packed as:
> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> index d768c30f48fb..47aac8794b68 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Mattijs Korpershoek <mkorpershoek@baylibre.com>
>  
>  allOf:
> -  - $ref: "/schemas/input/matrix-keymap.yaml#"
> +  - $ref: /schemas/input/matrix-keymap.yaml#
>  
>  description: |
>    Mediatek's Keypad controller is used to interface a SoC with a matrix-type
> diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> index 5fa625b5c5fb..5b5d4f7d3482 100644
> --- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> +++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/input/microchip,cap11xx.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/input/microchip,cap11xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Microchip CAP11xx based capacitive touch sensors
>  
> diff --git a/Documentation/devicetree/bindings/input/pwm-vibrator.yaml b/Documentation/devicetree/bindings/input/pwm-vibrator.yaml
> index a70a636ee112..d32716c604fe 100644
> --- a/Documentation/devicetree/bindings/input/pwm-vibrator.yaml
> +++ b/Documentation/devicetree/bindings/input/pwm-vibrator.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/input/pwm-vibrator.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/input/pwm-vibrator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: PWM vibrator
>  
> diff --git a/Documentation/devicetree/bindings/input/regulator-haptic.yaml b/Documentation/devicetree/bindings/input/regulator-haptic.yaml
> index 627891e1ef55..cf63f834dd7d 100644
> --- a/Documentation/devicetree/bindings/input/regulator-haptic.yaml
> +++ b/Documentation/devicetree/bindings/input/regulator-haptic.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/input/regulator-haptic.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/input/regulator-haptic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Regulator Haptic
>  
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> index f9053e5e9b24..3255c2c8951a 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/input/touchscreen/elan,elants_i2c.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/input/touchscreen/elan,elants_i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Elantech I2C Touchscreen
>  
> -- 
> 2.39.2
