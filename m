Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A71639AB4
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 13:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiK0M7P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 07:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiK0M7O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 07:59:14 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4267BE27
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 04:59:12 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j16so13504491lfe.12
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 04:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odd5BKOP3r/Q1qpvDnP8IjYVVymNS9+hVlQ4PJuzq/0=;
        b=ooePBeQ4FlFs1MtkQrdglnqnRss2yWt/crEqPOzRXuTFXjuHo1onkkXv0WjZGmSuYn
         G4Jk80MNn2Vk2q4gih+dHCIf6offofJmYOAXJXP77uAGtN8WrQ+xwJMcDnwMN7ONi8vh
         gx59p6P4iSUqciIf1Y2WAeVc5qT7ihO+2YhCeId34tFdPPQyY7NtRy+xRETswW9tgGFU
         gCAiaSH5mhq743Xd/zEa9IlJhbPCFnpaYT4JRJxxaUqPM6lf0MggOoBzJ5wgNFLMBxV3
         MABDzY42sWP+sqBIol1l4HEmqH60yPs4YJZnhu0ZYIMI72eoekYmYLq5PcfohVmulmVK
         uNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odd5BKOP3r/Q1qpvDnP8IjYVVymNS9+hVlQ4PJuzq/0=;
        b=rThMlSNQtOSCaJHegYyCwVx1F0xOewdcQExK8BFPZKs4XxFIKpJxyw+2aDLWebq866
         WL+9mj51/Z2XIbmyhAnnrf9ffrizDPM99hxRlJ++OHk4gakku1BWhCT/uUF+5Zmg5PiP
         6FxwBWLJpbv7x7acfRK8fsnmyvnffgy4io3Wgo8OjZj3RnxAvoYP3YdfgdjPXu+Jyc0X
         WLgD525Kzlm4I3tSlrS3IjMAZ9h/W/ooST92TWwEl/qDmrVJ56d5aEGK2gb2eE53LDXE
         0wLk75tQ3ruqzsNpWP9lgfp5yfx2cBGmK5q3n558muqY9b9GkFAmhBmx2FHyjguU4QGr
         c8jg==
X-Gm-Message-State: ANoB5pnStncegzQoMDCVOBu8Ef6bqui+5WHzoc+otogGtPkrTv3iJD7z
        QVZ7q10sGFy03RKdgyEM3xE3YQ==
X-Google-Smtp-Source: AA0mqf6Nb7bgFLK+aQOYxO7ioCxhc6CnMrFkeq/jmzwjK69jpbJDpAAXcAnGANXlVcgSlxTbCKFPmw==
X-Received: by 2002:a05:6512:340d:b0:497:456d:890 with SMTP id i13-20020a056512340d00b00497456d0890mr9974562lfr.687.1669553951170;
        Sun, 27 Nov 2022 04:59:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d23-20020a193857000000b00497a879e552sm1284870lfj.291.2022.11.27.04.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:59:10 -0800 (PST)
Message-ID: <f7f0753c-f0bc-b87c-b99a-8b1bc3ef40b2@linaro.org>
Date:   Sun, 27 Nov 2022 13:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 02/10] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
 <20221005-mt6357-support-v6-2-4f589756befa@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005-mt6357-support-v6-2-4f589756befa@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25/11/2022 16:10, Alexandre Mergnat wrote:
> - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
> - Add maintainer
> - Remove the .txt binding file

Conversion includes removal, so you can skip the last comment.

> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
>  .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 35 ++++++++++++++++++++++
>  .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -------------------
>  3 files changed, 36 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 0088442efca1..79aaf21af8e9 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -33,7 +33,7 @@ Optional subnodes:
>  		- compatible: "mediatek,mt6331-rtc"
>  		- compatible: "mediatek,mt6358-rtc"
>  		- compatible: "mediatek,mt6397-rtc"
> -	For details, see ../rtc/rtc-mt6397.txt
> +	For details, see ../rtc/mediatek,mt6397-rtc.yaml
>  - regulators
>  	Required properties:
>  		- compatible: "mediatek,mt6323-regulator"
> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> new file mode 100644
> index 000000000000..97b09c81e548
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> @@ -0,0 +1,35 @@
> + # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6397/MT6366/MT6358/MT6323 RTC
> +
> +maintainers:
> +  - Tianping Fang <tianping.fang@mediatek.com>
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description:
> +  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
> +  as a type of multi-function device (MFD). The RTC can be configured and set up
> +  with PMIC wrapper bus which is a common resource shared with the other
> +  functions found on the same PMIC.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6323-rtc
> +      - mediatek,mt6358-rtc
> +      - mediatek,mt6366-rtc
> +      - mediatek,mt6397-rtc
> +
> +  start-year: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt b/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> deleted file mode 100644
> index 7212076a8f1b..000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-mt6397.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Device-Tree bindings for MediaTek PMIC based RTC
> -
> -MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
> -as a type of multi-function device (MFD). The RTC can be configured and set up
> -with PMIC wrapper bus which is a common resource shared with the other
> -functions found on the same PMIC.
> -
> -For MediaTek PMIC MFD bindings, see:
> -../mfd/mt6397.txt
> -
> -For MediaTek PMIC wrapper bus bindings, see:
> -../soc/mediatek/pwrap.txt
> -
> -Required properties:
> -- compatible: Should be one of follows
> -       "mediatek,mt6323-rtc": for MT6323 PMIC
> -       "mediatek,mt6358-rtc": for MT6358 PMIC
> -       "mediatek,mt6366-rtc", "mediatek,mt6358-rtc": for MT6366 PMIC

That's not equivalent change and you did not mention any differences
from conversion.

Regardless of it, Rob suggested squashing it into MFD device schema and
I think his proposal is still valid - you have here only two properties...

Best regards,
Krzysztof

