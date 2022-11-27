Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09032639AE6
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 14:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiK0NMT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 08:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiK0NMC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 08:12:02 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231BBDFC1
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 05:11:52 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id n1so5550710ljg.3
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 05:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsGPEbguNLyXyXtQzAB2wJ4fId8JLFhyfl8o2yashtI=;
        b=Li8wQ2MQpsuNmifYz+kZPILDr2YWOgtE++hH3wSz9Z+uybeOrU6yyv7gDgyYRvZAao
         K/WQQAGYKTxeFyp2lJ6yr4rGmA62AyzdTDQm4qkyyfLXDGDhXUZkuiX1Y5upwCOru6Qp
         e/7iO2LdF0Yj03tAP9XKjVFAXFUeBkBP3MZZldlKmCRIha4elFm2h1HNfzjZFodGmwrH
         O3ValvaUQYKgnFAfzlfh59v2zqUkzcWEqXo5b2BkbyPRrhfXKtsHbgMNk17fZ96rkNd+
         E4UUeYlbXU/owMrUuyd9fQ4Ly34fFLgYlskbnO5pey4cLlYW7Uyy5ugOkbR8jX7VNbpc
         ReHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsGPEbguNLyXyXtQzAB2wJ4fId8JLFhyfl8o2yashtI=;
        b=pRlYAAFuO+TCiUnwkQWH9sQLoKyWa4E5W4iknZLjhYx1pUHX33fNGP57zHrT6inJRK
         BC5pqlV6oL5piJx4Ak5wTmjFVC7FeGWIstwb839A1zn/qh2hZ6mc3Ub025gmn0YAG3ju
         j9UIab0sHL7D8zMRAilJuYZCbhZgAb8gaQrafd6MF3eXBupmqda7EuJlbOyFvX56JRDU
         Uc1DU8SkPzMcNFhc2OyRRqMzgQuk3qc5Sa8GHsQMoO640I3NYRxGd1+x6utjw+iUPMmh
         ZwjBP455B3hubXHXNQsY44AmDmrSC3qiuldAfkVYGpMURzewH/olghv2n+MoHSdemT49
         Fr3w==
X-Gm-Message-State: ANoB5plZ/UkmkvKSQiErlINGbPxV0wGRrrsRKqDbn3MJzjLgFZgvz71C
        aRrB5z21Tmbr3lPL6PGQsg6XoQ==
X-Google-Smtp-Source: AA0mqf7D55Zimr5WD3Ta5W+Zbl1zFVFSuDEI4UZ2hLZvj32iV1yJ3DkH5cOJNK3LtUi7drUUjwEUdA==
X-Received: by 2002:a05:651c:198a:b0:277:6c67:1a7f with SMTP id bx10-20020a05651c198a00b002776c671a7fmr15712660ljb.133.1669554710421;
        Sun, 27 Nov 2022 05:11:50 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bp29-20020a056512159d00b0048aee825e2esm1298537lfb.282.2022.11.27.05.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 05:11:49 -0800 (PST)
Message-ID: <c94d15bf-c5ed-b400-abdf-8cca4102b078@linaro.org>
Date:   Sun, 27 Nov 2022 14:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 05/10] dt-bindings: soc: mediatek: convert pwrap
 documentation
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <20221005-mt6357-support-v6-5-4f589756befa@baylibre.com>
 <a9a47e08-1a08-abe5-1dbe-1537d3414af6@linaro.org>
In-Reply-To: <a9a47e08-1a08-abe5-1dbe-1537d3414af6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27/11/2022 14:04, Krzysztof Kozlowski wrote:
> On 25/11/2022 16:10, Alexandre Mergnat wrote:
>> - Convert soc/mediatek/pwrap.txt to soc/mediatek/mediatek,pwrap.yaml
>> - Add syscon compatible const for mt8186 and mt8195 to match the DTS needs.
>>
>> +  resets:
>> +    minItems: 1
>> +    items:
>> +      - description: PMIC wrapper reset
>> +      - description: IP pairing reset
>> +
>> +  reset-names:
>> +    minItems: 1
>> +    items:
>> +      - const: pwrap
>> +      - const: pwrap-bridge
>> +
>> +  pmic:
>> +    type: object
> 
> What's here? Other schema? If not then maybe compatible? What about
> description?

I guess this was comment from Rob, so it's fine.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>> +dependentRequired:
>> +  resets: [reset-names]
> 
> Drop.
> 
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8365-pwrap
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 4
>> +
>> +        clock-names:
>> +          minItems: 4
> 
> else:
> ???

Actually this looks less complete than your previous patch.

else:
  clocks:
    maxItems: 2
same for clock-names

> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/mt8135-resets.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        pwrap@1000d000 {
>> +            compatible = "mediatek,mt8135-pwrap";
>> +            reg = <0 0x1000f000 0 0x1000>,
> 
> This does not match your unit address. No warnings when compile testing?
> 
>> +                  <0 0x11017000 0 0x1000>;
>> +            reg-names = "pwrap", "pwrap-bridge";
>> +            interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk26m>, <&clk26m>;
>> +            clock-names = "spi", "wrap";
>> +            resets = <&infracfg MT8135_INFRA_PMIC_WRAP_RST>,
>> +                     <&pericfg MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
>> +            reset-names = "pwrap", "pwrap-bridge";
> 
> Missing pmic. Make your example complete.

Probably pmic should be skipped, I understand it is described in MFD
binding.

Best regards,
Krzysztof

