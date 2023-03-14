Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9B96B9D5C
	for <lists+linux-input@lfdr.de>; Tue, 14 Mar 2023 18:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjCNRrj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Mar 2023 13:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjCNRrg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Mar 2023 13:47:36 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF26B3E0D
        for <linux-input@vger.kernel.org>; Tue, 14 Mar 2023 10:47:24 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h8so21551028ede.8
        for <linux-input@vger.kernel.org>; Tue, 14 Mar 2023 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678816043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+E718iy5nGXGzQKGRneg6M+KHDq68OckDs1UzdQ5Ro=;
        b=ozrOd+9/Tk6w3m3IF6QbH4X7ltIk8jCXKrqSLN/Xa9AQCZZHpzfIY1HJKhtOdbwprg
         JmNthFvcVDXzGtdtgvNbkV9t6oRnksOTsqM1Yu7qoPEced/UoJzzcqTSzjGTUY7DqUPt
         piRii8V9kVmVvH3DqT7ejhuMluQQgTfkoy/m2L69HSvU+GMSslYVfQFCJfHTYVM8zJax
         eQC1V2QRQ3zV3sbBi9rWWpszfjswwzwUVeYvcg2xPj48S/oLMoeOxLyXH/ykvdmbTCS1
         xOZ6IptXTzkAFrjCaYANEjqWC7qCWb3QSUzH8Q2xvHEXBBuoGoYHicEFXqFUlVoAKObU
         SfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678816043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+E718iy5nGXGzQKGRneg6M+KHDq68OckDs1UzdQ5Ro=;
        b=6kleq5TZX6Prc9pmUmfelNxUbaveQgSICT4zaocG/12nZZcZYMDuPACC+wgw/LwcOK
         pU0hZeAa21yBT1AsWC1oEXOl0GLe2X32LX5kOZHqF+Gy9VJ2UfDKYNpaevosBdS2GN3u
         tLagsYHQ8qxZqcNKYlruM4aAL+j1bPQtB4QHGdmT7xD24htw/HIIX+92DTWPO51YAy4H
         7Lw4+Mjgf2Me4Cv2HhaaEUFVC7QgQWteDut++oVk5gElkoVk9HDt6/OSkQYPJphXZDuR
         alJ6u/7L6Uqaf6pRPNpSaJgNzUskcgsmPPQj7mKh2EBUk1VipYGGYqzgjTAud8Gfhfwr
         gGhA==
X-Gm-Message-State: AO0yUKVQnVn8MskwgrNu1WNUjqvnSYv+LL7sQdF5AHjdn7JlnjTlYovF
        3+96Oet25Z9s41uEIgfXLGcJ7w==
X-Google-Smtp-Source: AK7set+j1ULehR/i9jv+Y4JWdBHrUcmN3ZqHfD02zBn/fcAhOm7oXsiAzVGmi+a3PxFXAKAZ5kwW/w==
X-Received: by 2002:a17:906:d210:b0:922:6bde:2530 with SMTP id w16-20020a170906d21000b009226bde2530mr3426520ejz.32.1678816043283;
        Tue, 14 Mar 2023 10:47:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id h1-20020a50c381000000b004c0c5864cc5sm1371885edf.25.2023.03.14.10.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 10:47:22 -0700 (PDT)
Message-ID: <4cdefb22-52ea-8f8f-12d2-7a07478f167c@linaro.org>
Date:   Tue, 14 Mar 2023 18:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: Add
 'hold-in-reset-in-suspend' property to goodix
Content-Language: en-US
To:     Jan Jasper de Kroon <jajadekroon@gmail.com>
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        broonie@kernel.org, alexandre.belloni@bootlin.com,
        kernel@undef.tools, linux-input@vger.kernel.org
References: <20230311134655.486973-1-jajadekroon@gmail.com>
 <20230312183106.551840-1-jajadekroon@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312183106.551840-1-jajadekroon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 12/03/2023 19:31, Jan Jasper de Kroon wrote:
> This patch adds a new optional property, 'hold-in-reset-in-suspend', to the

Do not use "This commit/patch", but imperative mood. See:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> Goodix touchscreen device tree binding. When set to true, the touchscreen
> controller will be held in reset mode during system suspend, reducing
> power consumption. If not present, the property defaults to false.
> 
> I am submitting this patch to the Device Tree mailing list to add a new

Drop the "I am ..." Same comment as above.

> property to the Goodix touchscreen device tree binding. This patch
> supplements a related patch sent to the linux-input mailing list, which
> updates the Goodix touchscreen driver to use this new property.

Anyway entire paragraph does not look related to commit msg. Drop it.

> The
> linux-input patch can be found at:
> https://lore.kernel.org/all/20230311131534.484700-1-jajadekroon@gmail.com/

Also this. It should be rather places under ---.

> 
> Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
> ---
> V1 -> V2:
> - Updated subject prefix to match subsystem
> - Added more detailed description of the change
> - Fixed formatting issues in commit message
>  .../devicetree/bindings/input/touchscreen/goodix.yaml  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> index 3d016b87c8df..cd4dd3d25364 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> @@ -56,6 +56,15 @@ properties:
>    touchscreen-size-y: true
>    touchscreen-swapped-x-y: true
>  
> +  hold-in-reset-in-suspend:

Missing vendor prefix.

> +    type: boolean
> +    default: false

Drop default.

> +    description: |
> +      When set to true, the touchscreen controller will be held in reset mode
> +      during system suspend. This can help reduce power consumption, but may
> +      cause the touchscreen to take longer to resume when the system is woken
> +      up from suspend. Defaults to false if not present.

Drop last sentence.

Anyway, the property does not look suitable for Devicetree. You describe
system policy - trade off between energy saving and responsivness to the
user. DT is not for policies. Use other interfaces for configuring it,
e.g. some user-space, existing PM interfaces or /sysfs (which is ABI and
needs its Documentation).


> +
>  additionalProperties: false
>  
>  required:
> @@ -75,6 +84,7 @@ examples:
>          interrupts = <0 0>;
>          irq-gpios = <&gpio1 0 0>;
>          reset-gpios = <&gpio1 1 0>;
> +        hold-in-reset-in-suspend;
>        };
>      };
>  

Best regards,
Krzysztof

