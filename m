Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B60053B66E
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 11:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiFBJ4P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Jun 2022 05:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbiFBJ4O (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Jun 2022 05:56:14 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9A52A78A5
        for <linux-input@vger.kernel.org>; Thu,  2 Jun 2022 02:56:13 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id er5so5538985edb.12
        for <linux-input@vger.kernel.org>; Thu, 02 Jun 2022 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Tvm8Ct4OSbCTOjbG3mrDSmmOZgQzkhb+beLpD2QfNSc=;
        b=JdKoydIZWs4azTUW2CEKLFR6r18U4Ba+cCp9JUD3atTesXpya50HtNzF+xBLwMT1Ik
         SV9xbwsZFcPgVMMv675D0NMrXSPwBQn95HFuddypEBTE4MpwBtPh+oDL1Sv58/8j1x8M
         DyVVDbezLYpxVgYgwWLVmwqofjo4kmdjQ1Gh6WHv88Wr4OY3uPZIgsg/ypos/MYP16/X
         vKuCDM+sAzSSGlgJVK6lybxGdRWh+/THGETMSxZksLlpagOw5KalAqnqhkK6FaLg8tyj
         QV/ccRpnSp3ML5kt7NL3Cl+aDHj2/py+EQLJ7kwXSCqXE8oH/+j48IV8oaTWWG+jDZFC
         PULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Tvm8Ct4OSbCTOjbG3mrDSmmOZgQzkhb+beLpD2QfNSc=;
        b=0VaPx4S6/IPLC5vsvzIg/ax97NR3DWoQvwlEiH1vcnGb5ZgXP/COpmI2kplr71NUvj
         HN3O55vak12Iga9mXUCzgEtRqMP5YjkWwvQ0ZXnU6qjOVkB8S/OI8oD53qqZO3vaYDVL
         tnQs8jO3eM9yz5c90HulKiE0bGfdhpGM4/Wg7Pq34+XqAXLCSDE0zBX54xMgKY9FORx+
         eLgsf/TXSrZmGrSWn+Cmaj+BAS5ot5xZks5wzo/+vsl01BMnhk8UVCulbjnBaTwaKuB3
         0FHVd7CiQbYpze6vDOO0cAkC4WtBSnA5GLSwK3Ywn1mDUguJrhSiuUYvKkJ2N0NOasRd
         aAIw==
X-Gm-Message-State: AOAM530sBL5pMpoUQDlGT/07P5atCQY0M6Zjg0ZrTJcHhUyMmNSX9cEE
        tp3DqZb7nbVPz5dPOxGiMKhQPA==
X-Google-Smtp-Source: ABdhPJzJfOf/jNpE4O6fklBhW5BdQjUH/UGFbYDiVQ1fh+Iu4cgSNlYWJDkc6lXVsZQ8AH/QkA0SNg==
X-Received: by 2002:aa7:cdd5:0:b0:42d:b87a:6d7 with SMTP id h21-20020aa7cdd5000000b0042db87a06d7mr4411887edw.91.1654163771733;
        Thu, 02 Jun 2022 02:56:11 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a4-20020a1709065f8400b006f3ef214dfesm1562656eju.100.2022.06.02.02.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 02:56:11 -0700 (PDT)
Message-ID: <12a65f1d-4f3a-417f-3c90-5461870abe2a@linaro.org>
Date:   Thu, 2 Jun 2022 11:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/3] dt-bindings: adc-joystick: add adc-joystick,polled
 option
Content-Language: en-US
To:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
 <20220601204927.10256-2-macroalpha82@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601204927.10256-2-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 01/06/2022 22:49, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for adc-joystick,polled. New device-tree properties
> have been added.
> 
> - adc-joystick,polled: A boolean value noting the joystick device
> 		       should be polled rather than use a triggered
> 		       buffer.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/input/adc-joystick.yaml          | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> index 2ee04e03bc22..4f49a1a5772e 100644
> --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> @@ -12,12 +12,19 @@ maintainers:
>  
>  description: >
>    Bindings for joystick devices connected to ADC controllers supporting
> -  the Industrial I/O subsystem.
> +  the Industrial I/O subsystem. Supports both polled devices where no
> +  iio trigger is available and non-polled devices which are triggered
> +  by iio.
>  
>  properties:
>    compatible:
>      const: adc-joystick
>  
> +  adc-joystick,polled:
> +    type: boolean
> +    description:
> +      If the device does not support triggered buffers and needs to be polled.

You described desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and it's description to match actual hardware
capabilities/features/configuration etc.


Best regards,
Krzysztof
