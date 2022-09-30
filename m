Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 144365F09B2
	for <lists+linux-input@lfdr.de>; Fri, 30 Sep 2022 13:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbiI3LO6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 07:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiI3LOb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 07:14:31 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7485C5FD4
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 03:54:37 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so6302576lfb.6
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CG46qpGi1TQneWTfKK3XJ8Vd/RFXnm0rteijyYtSCok=;
        b=hAJZwEJ5tb88Pja8jdMLmPc14gJVC568fe0tNiO7Xr7K3DSf7/wH6bimSV5dr8k6sG
         lnFHOzncPzITGyrq76w2yjkowH/xQCw9fVO9f7lVs6v1AXqb1vffeGcfLpzX0GTHEu8C
         xBXCguoRhC/TUXiesLQxBg/npHrxUUjynRNmkVzcah9Q5pkLKM0BbVshR9hMZOFLiESb
         dWBVntlfG9aGGOz3pim1JbpRMsT+5yMYUo1M0D1x8MRxIk6ACQjwvhLsxnxPFAtogBWv
         tTC2SKTOuEcZ0Pk3f7qLhtU4HS1HMX5HEKVxR5+NTondvd00DXXhvhOMvhha32dJIpuP
         0bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CG46qpGi1TQneWTfKK3XJ8Vd/RFXnm0rteijyYtSCok=;
        b=HdL8Gl0vjw39hVObn6z7V9N2oult4aAetFeQ1VOcJt5EgvClsTcQDVnSerzk3aUyBE
         hzsk3WtzsuZRghYCKeFBhvIBocZAmTdmGdzXwEohzoPM3Q6PXHpB+C6M+cdiC5z3D+cO
         uchb2X89kM+Xus9PB3qgvdWH+T6kgmFI+LB/S3aXKxG85Qptl4I+GTtNxM3hOoXW1sFf
         rcf83bbnGL0G8B1UkHFh15f5mKh27Bc+tFb9z2UJUX2eCjigSivgCAbWivpNfczMP9QS
         TT5c5wF2Vs0WvbUskTRIlqC9SZhGFvUd3yAHTixGWIpq8i22dqCyg5m5KdaBbToIBOD0
         31og==
X-Gm-Message-State: ACrzQf2B5XMBkbtfjEzXsmLkUNN+lZpBFR4qxWhc4+bOyX1p6+BpDxCY
        ERuPR4vjwM6n2p63jTF8DgIp5w==
X-Google-Smtp-Source: AMsMyM77gJnBWx//CtSj7aGdnpqCvDEIw/WNJrKyZaR6UpLgCffzGnbkHU8dNKZczBiny40V1iXMUw==
X-Received: by 2002:ac2:4bd0:0:b0:497:abfd:3572 with SMTP id o16-20020ac24bd0000000b00497abfd3572mr2957436lfq.200.1664535275909;
        Fri, 30 Sep 2022 03:54:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id du10-20020a056512298a00b0049487818dd9sm261454lfb.60.2022.09.30.03.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 03:54:35 -0700 (PDT)
Message-ID: <bcf0e3fe-ba69-2898-ed99-49afd08d1f72@linaro.org>
Date:   Fri, 30 Sep 2022 12:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] dt-bindings: input: touchscreen: Add Hynitron cstxxx
 bindings
Content-Language: en-US
To:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
References: <20220928214806.13572-1-macroalpha82@gmail.com>
 <20220928214806.13572-3-macroalpha82@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928214806.13572-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 28/09/2022 23:48, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the Hynitron cstxxx touchscreen bindings.
> Hynitron makes a series of touchscreen controllers, however for
> now this is expected to only be compatible with the cst3xx series.

Drop redundant (second) bindings from subject.

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../input/touchscreen/hynitron,cstxxx.yaml    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
> new file mode 100644
> index 000000000000..c98d14e9844a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cstxxx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hynitron cstxxx series touchscreen controller bindings

Drop "bindings"

> +
> +description: |
> +  Bindings for Hynitron cstxxx series multi-touch touchscreen
> +  controllers.
> +
> +maintainers:
> +  - Chris Morgan <macromorgan@hotmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hynitron,cst3xx

Isn't the panel CST3240? No wildcards in compatibles.


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

Best regards,
Krzysztof

