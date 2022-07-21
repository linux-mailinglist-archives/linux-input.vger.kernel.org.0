Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728CF57C716
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 11:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbiGUJGs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 05:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbiGUJGr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 05:06:47 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2833B944
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 02:06:45 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id b21-20020a05600c4e1500b003a32bc8612fso454978wmq.3
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 02:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=/H+ubGz5dC0Dz+m1egBSS+mn3sw5UpB8w1f81HptlFo=;
        b=D0wGWDqCWVf1ogvzp2scTFOcL/n/BMEgsTofv86DsSTkPtAJuQsI83k7g+ea2/xTwQ
         aI8aQ9xBbDoOqQ5HJIENAZCvvpuIuNc0skABIW5X+dF/ISz+o6oMNsblkkia9J5AZedK
         i1y3HXa+oWE2R64nyu9rYveTvuz0cb5odonsNSBEx+cwUiSPpkiGVPKv+peVdCd6QB3d
         OtgnnK4tBoOJsH602xwzjG1GygYAmo2MkVu23eWuqc5iZFp0sPMmFleasSQjSUwtBoAI
         yE+DInYb6Y7WwG1PbJk9v2V3UK6GMrfcKtTGnRUskE8dqSv80KIp37ZBuWUxeHQGh8H3
         9VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=/H+ubGz5dC0Dz+m1egBSS+mn3sw5UpB8w1f81HptlFo=;
        b=DqJKwH2vSTOkIQYdy882PzoPcf7sEEXPdDmIMkMFV7WlkdyNwAnD/aNUmUGDOwCd86
         Tr1iYo/0rG3IJ7BprItPLyv8bklW2Qv1I/siU+INZGq0yLdZAvW5NqKwO5V/Rsqvtcab
         aQJj9BC6PyevSWZcOrUgsYC9Ksis/DsO/ZSqHa2kUA8cdUpflgO26+lgShnmjZPAVb3f
         1r85TvDhexcjOeElVw5k3RokZNmDjD0xqCwuGzl6MM1uVPLcBg3NPdiBdOL8fiEjPy4U
         sSSUrL1YwVE/kPdBJWPe876FVXiaYnPsHh8F40++2AWs0n/PpF5kLD0ZOr28lycuDyND
         zswQ==
X-Gm-Message-State: AJIora84AhFrti1rJP3ME8oyXJ8aOlSI8lqBz2+ORKSNU0i6KCovvDC2
        YR3p0InlFVPLgzeW+a02ppUXYA==
X-Google-Smtp-Source: AGRyM1tZz2TDn6be9lWTWQ2CDScl7zAd9M2KfMm9B3ELPlAoh19nphaaWcU/vY70sT+0kbd5D4xRGw==
X-Received: by 2002:a05:600c:5006:b0:3a3:2dcd:8730 with SMTP id n6-20020a05600c500600b003a32dcd8730mr3710520wmr.99.1658394403779;
        Thu, 21 Jul 2022 02:06:43 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id q15-20020a5d658f000000b0021e48faed68sm1225231wru.97.2022.07.21.02.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 02:06:43 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/6] dt-bindings: mediatek,mt6779-keypad: use
 unevaluatedProperties
In-Reply-To: <e1ec8511-d1dd-faa5-031f-50c4e55062cd@linaro.org>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-2-ef9fc29dbff4@baylibre.com>
 <e1ec8511-d1dd-faa5-031f-50c4e55062cd@linaro.org>
Date:   Thu, 21 Jul 2022 11:06:42 +0200
Message-ID: <874jzaj0m5.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 20, 2022 at 19:14, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 20/07/2022 16:48, Mattijs Korpershoek wrote:
>> writing-bindings.rst states:
>>> - If schema includes other schema (e.g. /schemas/i2c/i2c-controller.yaml) use
>>>   "unevaluatedProperties:false". In other cases, usually use
>>>   "additionalProperties:false".
>> 
>> mt6779-keypad includes matrix-keymap.yaml so replace additionalProperties:false
>> by unevaluatedProperties:false.
>
> This is not sufficient explanation. You now allow all properties from
> matrix-keymap.yaml, which might be desired or might be not (e.g. they
> are not valid for this device). Please investigate it and mention the
> outcome.

Hi Krzysztof,

Thank you for your prompt review.

In mt6779_keypad_pdrv_probe(), we call
* matrix_keypad_parse_properties() which requires keypad,num-rows and keypad,num-cols.
* matrix_keypad_build_keymap() which uses linux,keymap

Therefore, all properties from matrix-keymap.yaml are
required by the mt6779-keypad driver.

In v2, I will add the above justification and also add all 3 properties
in the "required" list.

Initially, I did not do this because from a dts/code perspective it seemed
interesting to split out SoC specific keyboard node vs board specific key configuration:
* [PATCH v1 5/6] arm64: dts: mediatek: mt8183: add keyboard node # SoC specific
* [PATCH v1 6/6] arm64: dts: mediatek: mt8183-pumpkin: add keypad support # board specific

What would be the recommend approach for above?
I see at least 2:
* "move the whole keyboard node into the board file (mt8183-pumpkin.dts)" even if it generates
  duplication between boards using the same SoC.
* "add a "dummy keymap,row,cols" properties in the soc node which can be overriden in board file.
  For example, use rows and cols = 0 which would have the driver early exit.

Thanks,
Mattijs

>
> Best regards,
> Krzysztof
