Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C02A54B8550
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 11:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbiBPKNE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 05:13:04 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbiBPKNE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 05:13:04 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657132A39E5
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 02:12:52 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D67C83F1AD
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645006365;
        bh=wCaJzKBNjd94VDAGdI4W+Ww4APWOyvEWc/qTbStSTaU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=T/g7ng7kp59MieYZoYwJUvs/cyp2snSH0Fl39LQj5x9qG1SfZAxWp224/kAUfSUIa
         zyMuE9E0kQzDUJ/X61N/gqjblyRHY3+NIQsheHYt9eMSyfZHXm9w5Oz6s1PtnQVWKI
         ET2wNRwA8QbWMfBIa05l1jUNb3KOTh/JwxXZxGNvQ7FHCSDLRJYdCYERhon4AngVDe
         FPVdEXjyWnE7CnqdqPDR/ig4txC5Z7bjVyNqJGdHKIMtQftZ+d/IDvxcfIbfb+WdFC
         KlZ285HjeprSdwooheE1gNxjKnTm0QG9kgFoaWsWdCp7hqA5gJ1whigGvQMydgSfqz
         otkA1M78pbQUg==
Received: by mail-ej1-f70.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso601273eje.20
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 02:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wCaJzKBNjd94VDAGdI4W+Ww4APWOyvEWc/qTbStSTaU=;
        b=M/v4liYe9Pmg+a5k8D8MeBbHQgcVl+PqG8nYlmFfgZvQnFtf5VXDJOxh24TkL/+2Zu
         GFm+vYzvrb0an4dHMxOjHfdGUZ9/UlkJI4oYQDhWNZfMRqF3pw4n7MIMdnKPa+dFpq+h
         sBRd7tU851W3s7kl+mTq0sfIRu/0uIIeXXHv8/oB+irIKw9bNNoHwCkT5EA6Q7wfEqjC
         H2v6nN+siv/yuUtw7xCEY7VUXlZl2h28ts9vDs8hNfWRuDtUuHCU11umGakKb4yPuoXH
         EHLpvAfuBL7LsAan9ydApYMczGlPbCF3wceSERnPgj9ssYI7bOKHn3i6IrjLdo+Xrfcm
         yTWg==
X-Gm-Message-State: AOAM5317WcVKs2wT9mG0OzS1Omp4cz4PynSXfE0QauBzO/Fbsn9ksRg4
        KLf45iRVGdgU1HWvNZSgXa+p95RoJ8yJKGfudx44vaSbiAPFHKA1R4zfEgaw/zCsLMIk1Qh9eEV
        m/wLhjBjNP+gphMWDcIIi45V2MPFJjCIJIdi3Y/6k
X-Received: by 2002:a17:906:1188:b0:6ce:f315:21df with SMTP id n8-20020a170906118800b006cef31521dfmr1649675eja.591.1645006365514;
        Wed, 16 Feb 2022 02:12:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFu3ZIcGVwlCyzC/7X5mFw001hnaSynx6a8cfVN417f5jmgKVCWYEUWtyjMNimqQbfS56JIw==
X-Received: by 2002:a17:906:1188:b0:6ce:f315:21df with SMTP id n8-20020a170906118800b006cef31521dfmr1649657eja.591.1645006365327;
        Wed, 16 Feb 2022 02:12:45 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id y9sm1354703edj.108.2022.02.16.02.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 02:12:44 -0800 (PST)
Message-ID: <8cbbc565-738c-1e73-07b5-dc67ca55e920@canonical.com>
Date:   Wed, 16 Feb 2022 11:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/2] dt-bindings: input/touchscreen: bindings for
 Imagis
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <20220215205153.57966-1-markuss.broks@gmail.com>
 <20220215205153.57966-2-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215205153.57966-2-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/02/2022 21:51, Markuss Broks wrote:
> This patch adds device-tree bindings for the Imagis
> IST3038C touch screen IC.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../input/touchscreen/imagis,ist3038c.yaml    | 74 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> new file mode 100644
> index 000000000000..f98e5dfa2bc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagis IST30XXC family touchscreen controller bindings
> +
> +maintainers:
> +  - Markuss Broks <markuss.broks@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^touchscreen@[0-9a-f]+$"
> +
> +  compatible:
> +    - enum:

This does not work. Please test your changes. "compatible:" does not
list, so "enum" should not be an item. Drop the "-".

> +        - imagis,ist3038c
> +


Best regards,
Krzysztof
