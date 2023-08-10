Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7681F77702D
	for <lists+linux-input@lfdr.de>; Thu, 10 Aug 2023 08:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjHJGTh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Aug 2023 02:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjHJGTg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Aug 2023 02:19:36 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FEFD2
        for <linux-input@vger.kernel.org>; Wed,  9 Aug 2023 23:19:35 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so630384a12.0
        for <linux-input@vger.kernel.org>; Wed, 09 Aug 2023 23:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691648374; x=1692253174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9BxbZlPw6g9QiuhUYRIHONrtuVwpEGzzLSdFOf9tac=;
        b=qZk02UVUcidbnsvZu4FwaopDOYbsz1Y+az7raG/mRGT9xxAymWWI43NRVew/y7Cejm
         Zm+OqwJ/ebA0q6C4Az1/CDrkZ8JNYCpgySbClsuCX8x6rH3dWK/edikEcIVl2dzdg6zU
         hgRcARfgk7d9Fd1TfL1wOMF5926OPIwQdH8iamTkM8G8yMTyY9UUnZQbI+YDBBsSMSRi
         WnNeHVFBfLkG5gRGG5Gg/Xl92Hk4rkecq2OV6v3zhNPFgJXrkkCROSXg/H28gMQNBLuW
         76DIJYVsr8f9BFsd62Iormmx8KUznPPRIB6ttw01sC1ZVvKRkV7dk2GsiHEFIVLSHTio
         Za3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691648374; x=1692253174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9BxbZlPw6g9QiuhUYRIHONrtuVwpEGzzLSdFOf9tac=;
        b=jrftElq2CV+360BI83lZnNzkjB8IUka6zCOHD76QmnQIwOx1jPTfzC5tweCjxaIQ2e
         2vcR+uRFrYtJr/E2gJ4F9YJHEcUxdsI7VRMQJyG64RF/1YHY3X3TthtR4c0H0lmvQeyI
         j4hxKWmr8zLLEhx/q2nhm+Egjocan0fPfWrz+H9wYK+6yDIuEpdWk1oR/6IWpxhEr4jG
         rXLD5O138uxYKuJTPcki+XEiHNGbJq/+werR4kfr0JOuh3HblV5dHgQEu0lidxp4d+6s
         L/77wXn7KXwtJmdYt75gJvebdjboGDHpOB8w775mNkfwvOpFqTp1gwluZja5U1mYoxa6
         cCEQ==
X-Gm-Message-State: AOJu0Ywnkb6/CLyisUYcUN2BC3zx3GEaOiYBu5FFMmPr3XWH10CxjOwG
        HFVjtinrtJfp1Cj6+rWMafGhbA==
X-Google-Smtp-Source: AGHT+IHs00+xRRgfgIDgsyiI7JGjl2BYKVJTGy6qiwakL3haOHUzxmRH83in5dFAGmXxbFXzgAVQtQ==
X-Received: by 2002:a17:906:3019:b0:99b:4aa3:6480 with SMTP id 25-20020a170906301900b0099b4aa36480mr1262649ejz.40.1691648374153;
        Wed, 09 Aug 2023 23:19:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id m22-20020a1709060d9600b00992a8a54f32sm463065eji.139.2023.08.09.23.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 23:19:33 -0700 (PDT)
Message-ID: <86010807-d6e3-745f-ab39-b58f7f64815d@linaro.org>
Date:   Thu, 10 Aug 2023 08:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/2] dt-bindings: input: cirrus,cs40l50: Support for
 CS40L50
Content-Language: en-US
To:     James Ogletree <james.ogletree@cirrus.com>,
        dmitry.torokhov@gmail.com
Cc:     Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Jean Delvare <jdelvare@suse.de>, Arnd Bergmann <arnd@arndb.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eddie James <eajames@linux.ibm.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Jeff LaBundy <jeff@labundy.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jerome Neanne <jneanne@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        patches@cirrus.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230809191032.820271-1-james.ogletree@cirrus.com>
 <20230809191032.820271-2-james.ogletree@cirrus.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230809191032.820271-2-james.ogletree@cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 09/08/2023 21:10, James Ogletree wrote:
> Introduce device tree bindings for the initial commit
> of the CS40L50 driver.
>

> +  va-supply:
> +    description: Regulator for analog voltage
> +
> +  vp-supply:
> +    description: Regulator for peak voltage
> +
> +  vio-supply:
> +    description: Regulator for digital IO voltage
> +
> +  cirrus,external-boost:
> +    description:
> +      Bypass the CS40L50 boost converter.
> +
> +      The amplifier on CS40L50 can be powered internally through the boost
> +      converter, or else can be powered using an external supply. If an
> +      external supply is used, the boost converter must be bypassed.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios

I would expect at least some supplies/regulators to be required. This
should match what the datasheet says. The rest looks good.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

