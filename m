Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E349757BC98
	for <lists+linux-input@lfdr.de>; Wed, 20 Jul 2022 19:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbiGTR0W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jul 2022 13:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240334AbiGTR0V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jul 2022 13:26:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC4D5C9E6
        for <linux-input@vger.kernel.org>; Wed, 20 Jul 2022 10:26:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z22so17776126lfu.7
        for <linux-input@vger.kernel.org>; Wed, 20 Jul 2022 10:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UVvVeRmRXvjPzaajbXaiFutpIfSgHDSdBxsW2NCtmn0=;
        b=NyMbMqZNAENBaZXdyz+DOU3rwHXHVCQ83gQ+nkqnGXzpxSskOqEKlotsHZTdX/RqnK
         v6UyFwE2bNLiveAg/ysC2E4WJFQhAChBQG4LrlATdsVvuSfHIy25yGfyATLO0fdEq8SA
         QgVerrtSqqo0ZNUG/D8M9lDHzrdp1qH1eGbYR9uzd27TQf9seZ11rsXItN3cZ1EoCGpY
         m5mPtpFHpQ2jXHRaC/neiCohXGZ57ccVXcbEo/OD1lzHcj4DF0jsYz1oMhGclZQN/IyF
         gxFbetjC4B+gKE2VVTek2BFV0SXLe+IBCGvK4k3noKwIyulFlRlnVZ/tFcPSkciDe/Zl
         uWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UVvVeRmRXvjPzaajbXaiFutpIfSgHDSdBxsW2NCtmn0=;
        b=vrLJIkKkxo995A63wEeFofgoipHLx7JwZrVvXtBj3kY8ehZgJpE8avjdTlB4q7zwWp
         jR2PYZFp6RXMjOzSp9QbjfmkdVG6w2vlP1XMZ59FFBCHmLTHZPYr5LdXkKPCGANNLc9W
         PwHMZ2Fad2v7qU3quRIzdFoKnnpwWq46b7fuRSSPVq/rm7PzP7TFPN2GW5liGygdRBLA
         cj4ZEECwtBeWKRFAIwIKYtOjELEjqNqXfWMcudSv3aEA53qiG9f6lB82gx1Hfn+n3hZR
         AnOUOGzT5diSyU1K/DkrL+Ll6Ns1VDNH/28zKGaxvz6HTw8sG7XjcxcYpXZc1Qmn3qDn
         hyew==
X-Gm-Message-State: AJIora9nRFKJIeMAXfgKXJh3C+RuO6ruYs2b+Cnx8i/c012fieM14+rG
        QbCEsXV3w2u+M3OUDJ7+rpTdYA==
X-Google-Smtp-Source: AGRyM1ttDyYjCxw5IvCY0G5ADuGKWEioaj6UptwigoLgIn75ac03PnpcHjZ6Mpy4L72UO3cALygi5Q==
X-Received: by 2002:a05:6512:10c4:b0:489:de26:cef7 with SMTP id k4-20020a05651210c400b00489de26cef7mr22165488lfg.216.1658337978951;
        Wed, 20 Jul 2022 10:26:18 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id r6-20020ac25f86000000b00488e50527e0sm3891305lfe.112.2022.07.20.10.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:26:18 -0700 (PDT)
Message-ID: <98ec7967-d007-46d7-ef54-aa41426b5f9f@linaro.org>
Date:   Wed, 20 Jul 2022 19:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,double-keys
Content-Language: en-US
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20/07/2022 16:48, Mattijs Korpershoek wrote:
> MediaTek keypad has 2 modes of detecting key events:
> - single key: each (row, column) can detect one key
> - double key: each (row, column) is a group of 2 keys
> 
> Currently, only single key detection is supported (by default)
> Add an optional property, mediatek,double-keys to support double
> key detection.

You focus here on driver implementation and behavior, but should rather
focus on hardware, like - in such setup two keys are physically wired to
one (row,column) pin.

> 
> Double key support exists to minimize cost, since it reduces the number
> of pins required for physical keys.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> index ca8ae40a73f7..03c9555849e5 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> @@ -49,6 +49,12 @@ properties:
>      maximum: 256
>      default: 16
>  
> +  mediatek,double-keys:

Do you think there could be another MT keypad version with triple-keys?

> +    description: |
> +      use double key matrix instead of single key
> +      when set, each (row,column) is a group that can detect 2 keys
> +    type: boolean
> +
>  required:
>    - compatible
>    - reg
> 


Best regards,
Krzysztof
