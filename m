Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708BF776284
	for <lists+linux-input@lfdr.de>; Wed,  9 Aug 2023 16:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233352AbjHIOb2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Aug 2023 10:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjHIOb2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Aug 2023 10:31:28 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298B81FCC
        for <linux-input@vger.kernel.org>; Wed,  9 Aug 2023 07:31:26 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5416243f8f.0
        for <linux-input@vger.kernel.org>; Wed, 09 Aug 2023 07:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691591484; x=1692196284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFjpoWiKrYc/7swWNiDoznRKv0z/2+v/fxMff/HbFKs=;
        b=MYTFsaKlHMyoX/W9hD4vnmL4WV1ZgMtFu3FpiM9k2RVc0hVapCNWC2xnhYasMZvvRK
         Bk7j0dekxTmcoPrsIVZj8zVVXaokd5jJ/ThBL+8SZh7rne6m0tU53qc3wmGQSCm+piv6
         wFCj7WYKEU+1w754sUq2ehVVxUGft/PwNDjP6p169VH2COKSiBSl27k4JnYSRulSclj3
         73GFX0bR5jQnfTaHvfLMyyFHdDu+15rlgoayAJCdlrU4c0cJutXs7CjY/UFlrJgsSKTl
         /HmB3o8XYjuypIAy2ZgeaBdfV5Fp4dZB8LNiG3pSxDiIMJnd/w4QhIIQ3p89ba4N2kqH
         BkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591484; x=1692196284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFjpoWiKrYc/7swWNiDoznRKv0z/2+v/fxMff/HbFKs=;
        b=laJ7elfJGAC6X9iNtEbajKcJUhbkLbCQCu5EMTxyq4DMSWlwPRSAE93Y/HsPkSx7dT
         9+beQzjrMjxacupJODdhVGb05gyhaBGWu1Jcap2f4euoUXckxAP9H5QpYMA7Ja1l1MDk
         XeivWkvbjjkCMIlDL7OkFR6n2y2kBDAi82czyOwYkpYM54AK/OJ84ruS9SvCkKqNLrQw
         JWmBtgovi8in1mdq6OxVauVuIsbAxVqZT+Stw8vNM7m049kDfhVofIZI2t66XI4ga3Ta
         9kKv56SC2bLX3f78rT7BE4UmGkCmQnndUu8Ilr739V2N8Aw8/lSHWm3Twna4a83hNftK
         p+xw==
X-Gm-Message-State: AOJu0YyEWueZS+LdOhcqGRgqIWtvCaOkz/5HzfG9REBiRJ+2FDqrDsXA
        p32f3LLOrQMGzqxzJKUSiQouAg==
X-Google-Smtp-Source: AGHT+IHY0SyoRhCDAjJpmtQj6Df328GUTUN9z5VZLOgfANwBi/3guZ/uk3CPOMM3JxD0ngYv90AXAA==
X-Received: by 2002:adf:e80b:0:b0:317:5cc7:794b with SMTP id o11-20020adfe80b000000b003175cc7794bmr2061578wrm.13.1691591484561;
        Wed, 09 Aug 2023 07:31:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x12-20020adfec0c000000b0031274a184d5sm16881086wrn.109.2023.08.09.07.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 07:31:24 -0700 (PDT)
Message-ID: <6e16e580-b8bb-d6c2-41ed-bcaa6d407b95@linaro.org>
Date:   Wed, 9 Aug 2023 16:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] dt-bindings: input: cirrus,cs40l50: Support for
 CS40L50
Content-Language: en-US
To:     James Ogletree <james.ogletree@cirrus.com>,
        dmitry.torokhov@gmail.com
Cc:     Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Jacky Bai <ping.bai@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
        Jeff LaBundy <jeff@labundy.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Jean Delvare <jdelvare@suse.de>, Joel Stanley <joel@jms.id.au>,
        patches@cirrus.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230809135313.731706-1-james.ogletree@cirrus.com>
 <20230809135313.731706-2-james.ogletree@cirrus.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230809135313.731706-2-james.ogletree@cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 09/08/2023 15:53, James Ogletree wrote:
> Introduce device tree bindings for the initial commit
> of the CS40L50 driver.
> 
> Signed-off-by: James Ogletree <james.ogletree@cirrus.com>
> ---
>  .../bindings/input/cirrus,cs40l50.yaml        | 77 +++++++++++++++++++
>  MAINTAINERS                                   |  9 +++
>  2 files changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml b/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> new file mode 100644
> index 000000000000..5437c6beb1b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/cirrus,cs40l50.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic CS40L50 Advanced Haptic Driver
> +
> +maintainers:
> +  - James Ogletree <james.ogletree@cirrus.com>
> +
> +description:
> +  CS40L50 is a Haptic Driver with Waveform Memory DSP
> +  and Closed-Loop Algorithms
> +
> +properties:
> +  compatible:
> +    enum:This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.
> +      - cirrus,cs40l50
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
> +  VA-supply:

No improvements...

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

