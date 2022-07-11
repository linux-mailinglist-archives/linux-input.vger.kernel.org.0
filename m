Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9465607ED
	for <lists+linux-input@lfdr.de>; Wed, 29 Jun 2022 19:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiF2R4v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jun 2022 13:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiF2R4u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jun 2022 13:56:50 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37892558B
        for <linux-input@vger.kernel.org>; Wed, 29 Jun 2022 10:56:48 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id h23so34050784ejj.12
        for <linux-input@vger.kernel.org>; Wed, 29 Jun 2022 10:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=QEpNBgWA7DRhjOO34rOQbdqFQ1nBsqCeu75uc4Igg6w=;
        b=twqjMZOblDHbP5Z3l420BkFOUPMQlQUxyJNW+943GGuxU5Rwhv3m7bZt7UkROj/R2s
         Sim9Usj6cVmIs3szgG4cgKxuOKetQ5jhQTFyalFnl8shkqFEvqNogG8Yv+cliT8IEGse
         X8jIl7rUFww74t456+GoXbnLDN+08Uxda9Iv80Yyy2nIkLrVnejQI/AdIM9vRf5yWyPZ
         ZJ3F5BWBtfLveytYxhDTcS9T6+afxqKyctpWBcdobNTM/PXy5DqYRMNGFZPYB8biVDVR
         mPBsOJAFSTkLeyyDiW2Cc0cgx1Lp8YsBLAtoGwn4Ab5gulYdZ0rPrbbrcm2p+2dSY5Gm
         uHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QEpNBgWA7DRhjOO34rOQbdqFQ1nBsqCeu75uc4Igg6w=;
        b=hoGAgiYzS6wLRrnTJR4Q7PqyV9noreg8ELOQjwsA+9QyRPA2gwCvsHViboJsRK2X4U
         NlBqKRkBBIvayBVGuVUPrqbnSGafbM8DFfW+h3xM9sOPGf5cHz1rlve4eHGXnCUEskJd
         /bQRNrXIoKscinhhtK8qNBcwceLda7B3rJYt3GpDmXyefElWY1S1HxEyFy6+1mjXI/yB
         MOoQwr8vui/gEoxyxQ87OiwwAQKRnmiHj/7lrucXKAjqxKazKMQeWM4T9MVDRsgGefem
         6jse1pzpSxzrGn89o6wI08mdWmRD5wVsFAwHKJZqnqO9jF5UzL5rlRFUBgokRlqwU6Gq
         DnoQ==
X-Gm-Message-State: AJIora9TIwxgQtmdpzWaLDhXxIs/PQhY43OtXhHCWiuOZTg+gYyTOV5h
        Hp/LTVl9NI+/71z8QhvIwQ460g==
X-Google-Smtp-Source: AGRyM1vP4xkE/Wge4HBy97Ies2gvawYtrDpCJvhIS6J7ZdtVB01q/aC0J6BgLRHrMfDfp+UXXiUqiQ==
X-Received: by 2002:a17:907:97c9:b0:726:b4f8:f675 with SMTP id js9-20020a17090797c900b00726b4f8f675mr4583269ejc.427.1656525408480;
        Wed, 29 Jun 2022 10:56:48 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d25-20020a50fe99000000b004355998ec1asm11589476edt.14.2022.06.29.10.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:56:47 -0700 (PDT)
Message-ID: <724de6df-d9a8-ad10-fbf8-860a6309513d@linaro.org>
Date:   Wed, 29 Jun 2022 19:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 04/14] dt-bindings: nvmem: Add fsl,scu-ocotp yaml file
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
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
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Liu Ying <victor.liu@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629164414.301813-1-viorel.suman@oss.nxp.com>
 <20220629164414.301813-5-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629164414.301813-5-viorel.suman@oss.nxp.com>
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

On 29/06/2022 18:44, Viorel Suman (OSS) wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'ocotp' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../bindings/nvmem/fsl,scu-ocotp.yaml         | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> new file mode 100644
> index 000000000000..a8972acb1b01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/fsl,scu-ocotp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX SCU Client Device Node - OCOTP bindings based on SCU Message Protocol
> +
> +maintainers:
> +  - Dong Aisheng <aisheng.dong@nxp.com>
> +
> +description: i.MX SCU Client Device Node
> +  Client nodes are maintained as children of the relevant IMX-SCU device node.
> +  Detailed bindings are described in bindings/nvmem/nvmem.txt
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"

Actually, you do not need the quotes here at all.

Best regards,
Krzysztof
