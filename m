Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 948C4720425
	for <lists+linux-input@lfdr.de>; Fri,  2 Jun 2023 16:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbjFBOTW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Jun 2023 10:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbjFBOTU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Jun 2023 10:19:20 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AD819B
        for <linux-input@vger.kernel.org>; Fri,  2 Jun 2023 07:19:18 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9745ba45cd1so169403966b.1
        for <linux-input@vger.kernel.org>; Fri, 02 Jun 2023 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685715557; x=1688307557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTa69TMDPmdaiXEQ8KHtyu73N8TtVWeb4hLxgfpprJA=;
        b=cSuMWqqt1llDOJJM3+DcVgcFSRbIhe6Spwn4rtD/UtpmOujurEuwLKNJTnJINmp0gP
         HW0wY5n2xkQ5np1e44OkNB49SfGf+0mxMaTJXXjBYgUH9LVvGTfLAVaWNMrTdHGEQdVV
         qCehqsPo5miz5GAs01G7io0ulfPR5sbwXtNY1aKsIZJWyrOop/XkPIMc5DAawILhtOSv
         tXkdKf6iOBYISEMD2WS0VCIyZVST5NG3Dpz+F8MV/bjBc2FPHKVaTrwTaxNRSPgiDYtb
         fwn4LEsHAHuNn1hYASKD4A7DntVa1WKblZoKKtL3UaIVpYn976jrIL1KZdFms0aYoasT
         8wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685715557; x=1688307557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTa69TMDPmdaiXEQ8KHtyu73N8TtVWeb4hLxgfpprJA=;
        b=RjzS7IX03mARK8Tm5Kol/eooT5nfu3MyLNgJYKWCmHXHhDruvMNpn78S8m0e4VsTw1
         GeKXEvTHo2HUOqDTf1LcEdpfQnE6QgGC4D/T9mDH0vT/4FujQmTRPUpjKdMe9uYysows
         el4/A/9RYHIIVmu4lwl64GfLRyL/ysUh4UKC9n8MTR1TUPOe64HWfN81kgoXQURhdfvS
         ef0aWmrdiJZ3PoTjmhGOQQNPwI6lYlvlNsbPVcq3ajD0Wa7LYK+Jx6txRackUTUiNN1w
         ELx6l1vPZ0LaRPU7JXVJupdFX2NqSTXDiney+6TH3BFHHREZSQ2ylrZlbjUxDMETMH/K
         +04Q==
X-Gm-Message-State: AC+VfDyrWNwH4WfDV6F/oBrgtIGI8o6t3D3uqJbFK5HcAi2eBPCKAOKr
        f5I3LpI0ytYxn29L07Wl6yM6CA==
X-Google-Smtp-Source: ACHHUZ4t/LypzBlEtLR9YZ+51hGCwZLTtLW9N/+gXiVyH9YZTyAJyhCZZ+QPEUZiHubr5H2XUOFZWw==
X-Received: by 2002:a17:906:9b83:b0:96f:ee6d:fed5 with SMTP id dd3-20020a1709069b8300b0096fee6dfed5mr10742995ejc.72.1685715557125;
        Fri, 02 Jun 2023 07:19:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906bc5400b009745b0cb326sm808244ejv.109.2023.06.02.07.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 07:19:16 -0700 (PDT)
Message-ID: <afd610cf-954f-afc2-00da-86da9fe4192d@linaro.org>
Date:   Fri, 2 Jun 2023 16:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: Add ilitek 9882T
 touchscreen chip
Content-Language: en-US
To:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dianders@chromium.org,
        hsinyi@google.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230602140948.2138668-1-yangcong5@huaqin.corp-partner.google.com>
 <20230602140948.2138668-2-yangcong5@huaqin.corp-partner.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602140948.2138668-2-yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02/06/2023 16:09, Cong Yang wrote:
> Add an ilitek touch screen chip ili9882t.
> 
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

There is no way this would work and if you test you will see error msg.
Feel free to ping if message is unclear.

> ---
>  .../bindings/input/elan,ekth6915.yaml         | 36 ++++++++++++++-----
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index 05e6f2df604c..73e94cb6c4e0 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -15,11 +15,15 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - const: elan,ekth6915
> +    oneOf:

It's not oneOf. Just enum

> +      - enum:
> +        - elan,ekth6915
> +        - ilitek,ili9882t
>  
>    reg:
> -    const: 0x10
> +    enum:
> +      - 0x10
> +      - 0x41
>  
>    interrupts:
>      maxItems: 1
> @@ -29,17 +33,31 @@ properties:
>  
>    vcc33-supply:
>      description: The 3.3V supply to the touchscreen.
> +                 If using ili9882t then this supply will not be needed.

Are you sure these are compatible devices then? What does it mean "not
needed"? Is the pin there or is not?

>  
>    vccio-supply:
>      description:
>        The IO supply to the touchscreen. Need not be specified if this is the
>        same as the 3.3V supply.
> -
> -required:
> -  - compatible
> -  - reg
> -  - interrupts
> -  - vcc33-supply
> +      If using ili9882t, the IO supply is required.
> +
> +  required:

NAK. Really. Test patches before sending.

Best regards,
Krzysztof

