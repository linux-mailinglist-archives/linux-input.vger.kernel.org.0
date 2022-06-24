Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8F55597AD
	for <lists+linux-input@lfdr.de>; Fri, 24 Jun 2022 12:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiFXKTy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Jun 2022 06:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbiFXKTx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Jun 2022 06:19:53 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3177A6F6
        for <linux-input@vger.kernel.org>; Fri, 24 Jun 2022 03:19:51 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id eq6so2776113edb.6
        for <linux-input@vger.kernel.org>; Fri, 24 Jun 2022 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Q/ovqEoOD+hVmnJ1ZaktfSaUD+tCfL6g1YxFd7nkrg4=;
        b=AKgStJX5Aau9B4NUvSQeYUqMYzsnwzORpUESXepLAMWshgDtfR1h9wQGbrnGlM+QCB
         vt/StFAHYfiJHl7quv14FjPTSXfj4s5bB+NjgxOXHZkhl2ovoAkMTjmC/icHtVZj835F
         HUc4UhiI85m9PhoIjx9iAVsisdH5E7hpDwWugls9+m7vMvBsZ0HeE8GeUOQ+FbIBTDv6
         FLnJ+dVTJVRDDE28sx3jtdy+/KCF83vz2ty+q+4iG8bzC+VM4EpWAuyoBC7FE//UckJY
         gKlmt3yjVmxXSYS5/L9+Fw+g90aI3TobVPTkJN2D/QguySH9FwGVnYuQd2mozR/ho8cO
         c2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q/ovqEoOD+hVmnJ1ZaktfSaUD+tCfL6g1YxFd7nkrg4=;
        b=WgbGjIO07te4kZEJVgCQEbN+aKs8KEPsYdyhar/89BQquz5x5yCIB2eWNrc6iFmv0Y
         N1Ku8yXvucVeBFsed7agl0R/cMaQtEYfpyqDa9EOIhNIs1IW9QpsaxZr8rRbzpiOjNG2
         HNmoIJuAjC7pppZFIRjTye1pcWf2Izyhya+sV0hDbqKPFNqWXnMFzlnoC3STsQhi7TOa
         iVTYKFYOqKQFt2PIupoGKLpce1BIgxTkYTBaJBQw0XUkF5oItI/IV5Ho62iiFiS7z+pE
         MMmFSYKDksUhZkNiIwBvAG3iCkik76cFJq//RygR7fIBWxVu0AqXkqQFrJobyxmYWBTc
         4A7w==
X-Gm-Message-State: AJIora+TEsZOQ9o6ZZmHT+nYUZv9k+IcRjubOfWVpZXK7wKU03LL/PQ8
        0SFI39ifKIZyntQt7Jk5zEnvcg==
X-Google-Smtp-Source: AGRyM1vuu58Df44GqIbPYw7kKBGPJa+EM9ddo6TMqN8wrNwFBXS4pW3xOw33Lo5nwodAZ32L02wywA==
X-Received: by 2002:a05:6402:2753:b0:431:9c8b:5635 with SMTP id z19-20020a056402275300b004319c8b5635mr16567506edd.152.1656065989588;
        Fri, 24 Jun 2022 03:19:49 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7db83000000b0043580ac5888sm1621695edt.82.2022.06.24.03.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 03:19:49 -0700 (PDT)
Message-ID: <6df3bcd8-10a9-55a1-330b-19ef0d5603a5@linaro.org>
Date:   Fri, 24 Jun 2022 12:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 09/14] dt-bindings: watchdog: Add fsl,scu-wdt yaml file
Content-Language: en-US
To:     Viorel Suman <viorel.suman@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
        Ming Qian <ming.qian@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Abel Vesa <abel.vesa@nxp.com>
References: <20220616164303.790379-1-viorel.suman@nxp.com>
 <20220616164303.790379-10-viorel.suman@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616164303.790379-10-viorel.suman@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16/06/2022 18:42, Viorel Suman wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'watchdog' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../bindings/watchdog/fsl,scu-wdt.yaml        | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> new file mode 100644
> index 000000000000..c5d3063a4130
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/fsl,scu-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX SCU Client Device Node - Watchdog bindings based on SCU Message Protocol
> +
> +maintainers:
> +  - Dong Aisheng <aisheng.dong@nxp.com>
> +
> +description: i.MX SCU Client Device Node
> +  Client nodes are maintained as children of the relevant IMX-SCU device node.
> +
> +allOf:
> +  - $ref: /schemas/watchdog/watchdog.yaml

Blank line

> +properties:
> +  compatible:
> +    items:
> +      - const: fsl,imx8qxp-sc-wdt
> +      - const: fsl,imx-sc-wdt
> +
> +  timeout-sec: true

Drop it.

> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    watchdog {
> +             compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";

Indentation...

> +             timeout-sec = <60>;
> +    };


Best regards,
Krzysztof
