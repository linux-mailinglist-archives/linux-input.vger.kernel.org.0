Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CA04B7693
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 21:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238416AbiBOQ7u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Feb 2022 11:59:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242048AbiBOQ7u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Feb 2022 11:59:50 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACF9106CAA
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 08:59:40 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8DBD13F1E3
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 16:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644944378;
        bh=FL5EtCjgTQtxo/nskqCSYLzpR6iBfpcAoCDcKWnA4rc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VtaSwsh1zL7qHrJjd3nkapRYfitdR1L+jnixdBPt9K32P1bN5nMX7H7LAiLeRyS7h
         XySidLxQ91EeyHMfDnedERuM5dXVV1htAbYb19OmjR2OuBfLcjbSVyKx8/WKIorNsE
         RDcKFF/u3ZzXUYRQn+x09L4ha/iWQteRF9RnC6Dn92WPekYPAmDG4kAHTlK8Etisb5
         1Z3rUNJIIZ/QZE4kv7aCI5fHetG3HsuZsfhZcAQnupjunU5SLHwqixTh+FWcke8IPp
         dcZ0bIjHV7FVOmwjxBIh5fj4708RVhobSonJqfxsOcY8K2zh4Scg+/PtAryiZkDWkb
         SEiQVMjRH3x1w==
Received: by mail-ej1-f72.google.com with SMTP id la22-20020a170907781600b006a7884de505so7598598ejc.7
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 08:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FL5EtCjgTQtxo/nskqCSYLzpR6iBfpcAoCDcKWnA4rc=;
        b=DO+mFmtOxz1htO/NcY1cHth99dAD6wEeZnrIcWR51tVsLc0eSphExtxkBEUzk6TxdH
         IsIF4Kij+mRDnWdbBrv+at3Y98wGuXV7mVuTUtGIZE/OK5gD+/tVBan9jILyDDmkne3P
         elNl4WMAO2K4SsT4yqFBqt0P9PRuKwaq15niFuRCf442tyez4mGeoSy5F82x0k1HHYGn
         klSLMdUiSW87YjxIbNmljCSKDd9xnAVIzmdGuSpdYb53Hbhe68Ke8roqCm/xzdjQQefv
         akaDPJWiL9wKbKmBqK45p5pKuqwd7PSTw6xWTadXOLJuTZ7WzaV6trZbz12AOUoKqtrW
         xkig==
X-Gm-Message-State: AOAM532+tsBCZyPrLEhMtTn/X0TKFbNeHFovp+THUfoJysuRyJ5Mmnr/
        f89pc959N5sQJY0kl3G++WQmNeRCdWMBYkWd9mURNL1hjiTXtLa73FVEZzHzSRDqX8xnTqIAnZA
        YjT0mDvAouETZbnT/7LnQyF1XPDWVrsMdx4TyFFYh
X-Received: by 2002:a05:6402:280f:: with SMTP id h15mr5000773ede.113.1644944377597;
        Tue, 15 Feb 2022 08:59:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtKBWHE7uchxkl/D+rN9SzCiJARcsI6wN3uHsBSXLCHXRsGcvWYNMeLBSSPz2R2d7Z87D0mw==
X-Received: by 2002:a05:6402:280f:: with SMTP id h15mr5000747ede.113.1644944377385;
        Tue, 15 Feb 2022 08:59:37 -0800 (PST)
Received: from [192.168.0.109] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id y11sm184136edc.1.2022.02.15.08.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 08:59:36 -0800 (PST)
Message-ID: <b6003ead-e3b4-a803-b92d-c08fc731a654@canonical.com>
Date:   Tue, 15 Feb 2022 17:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: ps2-gpio: convert binding to json-schema
Content-Language: en-US
To:     Danilo Krummrich <danilokrummrich@dk-develop.de>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org
References: <20220215165113.52659-1-danilokrummrich@dk-develop.de>
 <20220215165113.52659-2-danilokrummrich@dk-develop.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215165113.52659-2-danilokrummrich@dk-develop.de>
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

On 15/02/2022 17:51, Danilo Krummrich wrote:
> Convert the ps2-gpio dt-binding documentation to DT schema format using
> the json-schema.
> 
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
> ---
>  .../devicetree/bindings/serio/ps2-gpio.txt    | 23 --------
>  .../devicetree/bindings/serio/ps2-gpio.yaml   | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serio/ps2-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/serio/ps2-gpio.yaml
> 

Please version your patches in the subject. You can achieve it manually
or with `git format-patch -v2`. I think lack of v2 confuses b4 diff
("ERROR: Could not auto-find previous revision
").

> diff --git a/Documentation/devicetree/bindings/serio/ps2-gpio.yaml b/Documentation/devicetree/bindings/serio/ps2-gpio.yaml
> new file mode 100644
> index 000000000000..41e43d797651
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serio/ps2-gpio.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/serio/ps2-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for GPIO based PS/2
> +
> +maintainers:
> +  - Danilo Krummrich <danilokrummrich@dk-develop.de>
> +
> +properties:
> +  compatible:
> +    const: ps2-gpio
> +
> +  data-gpios:
> +    description:
> +      the gpio used for the data signal
> +    maxItems: 1
> +
> +  clk-gpios:
> +    description:
> +      the gpio used for the clock signal
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      The given interrupt should trigger on the falling edge of the clock line.
> +    maxItems: 1
> +
> +  write-enable:
> +    type: boolean
> +    description:
> +      Indicates whether write function is provided to serio device. Possibly
> +      providing the write function will not work, because of the tough timing
> +      requirements.
> +
> +required:
> +  - compatible
> +  - data-gpios
> +  - clk-gpios
> +  - interrupts
> +
> +additionalProperties: true
> +

I missed this part (lack of) in your v1. This has to be false.

Best regards,
Krzysztof
