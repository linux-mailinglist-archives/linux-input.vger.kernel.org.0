Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C574B70E6
	for <lists+linux-input@lfdr.de>; Tue, 15 Feb 2022 17:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240283AbiBOPyy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Feb 2022 10:54:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbiBOPyy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Feb 2022 10:54:54 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE559E57A
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 07:54:43 -0800 (PST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3208D3F1BE
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644940482;
        bh=+QObaeMvuhGq3vTB+Qm78jkj+7kPIGMxNc28eGSrc+w=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FKtPHJvZkkKwj8a7wqDIjqcZN0bIokFQlpsxGFZzA9YpE17tECUT5vjgIUihVd8UG
         TOp2+oXvK9OjTDIEVCLLaOhCXZgBcrbqoqMga22ARDdIKpIBwNdEofwl8k9JUOYdJd
         5bLVN36ZsG4Fu0tLHCJfVZ+ByTsU4+qxeAGJHpPMyTwfrJ7L9z4KxFW+ih0V+DhubG
         vaC431GIMCw0T/bAQA8GpihnItFyWWJyMWmEB5qluONhHaOVwctBIzw/C+elyvzYzV
         INZPcGcdsykQxkpGlriaXxItf40G/ePJdcFYvAOGXBIW4g0/7uu7//FtnavuImHU/D
         mDVu60oiRXTig==
Received: by mail-wm1-f71.google.com with SMTP id u14-20020a05600c210e00b0037bddd0562eso734038wml.1
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 07:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+QObaeMvuhGq3vTB+Qm78jkj+7kPIGMxNc28eGSrc+w=;
        b=QcLoiWGvPS3gxEjUdIM46F9LGZQfVKMbKzQlTg9rI63KLiZxfTiCb1NLCA1vQSKqE4
         nTigAM95mO1V6JIdLeg/1wYItvgeXvwX1T63qwQF3dlxrhsofU6/iGw/K1kHrX+DCBjS
         1w3ZCRflZwZl16WTPLDrEe4rcHgtqKhIZVPXmwCalVTJLo1VRk4j+/zKzj/rmGghlrOz
         fk3VJ5E/6hYU0sSXbbtXnPf967dqj4vqjT306IdzE2R8dtWGUGOvtD4h8WESm+4Bwami
         kkzUnfKU42E+l2h1UMzMcEKWlk/xfJsvpBfy80uKbQcmIEP186ka1hxEDaSVDAaIMYCs
         065w==
X-Gm-Message-State: AOAM531z4PbqkmhwpwhQh55F19SUdxy4h/C1sKV1PodPnGTlw38p8ibS
        56Kh/YZDIf7Q3NKmnLGdSes5pQ/6YV3PBHD3pJqRVZ1OCTetr88XqoqvWRRzIqdvf+4RuCoADjY
        3XATyExm10NtJu4TJsvrrF31HKpiAGnkZ+VePJIgs
X-Received: by 2002:a5d:5983:: with SMTP id n3mr3851927wri.382.1644940481885;
        Tue, 15 Feb 2022 07:54:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoVBW/CLXsO/TypyE7MepwQ5iRogRbIei6GF1U49AerV7YaFDlihHa86IrATrYYtw77ahJ0A==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr3851917wri.382.1644940481649;
        Tue, 15 Feb 2022 07:54:41 -0800 (PST)
Received: from [192.168.0.109] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bk5sm20865734wrb.10.2022.02.15.07.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 07:54:41 -0800 (PST)
Message-ID: <0bb07d0a-838d-b772-91ca-aa31b57b2f3c@canonical.com>
Date:   Tue, 15 Feb 2022 16:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] dt-bindings: input/touchscreen: bindings for
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
References: <1644531943.391463.3262540.nullmailer@robh.at.kernel.org>
 <20220215151527.84634-1-markuss.broks@gmail.com>
 <20220215151527.84634-2-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220215151527.84634-2-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 15/02/2022 16:15, Markuss Broks wrote:
> This patch adds device-tree bindings for the Imagis
> IST3038C touch screen IC.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../input/touchscreen/imagis,ist3038c.yaml    | 75 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> new file mode 100644
> index 000000000000..7b127817e1f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> @@ -0,0 +1,75 @@
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
> +    pattern: "^touchscreen(@.*)?$"

reg is required, so @ is not optional:
^touchscreen@[0-9a-f]+$

> +
> +  compatible:
> +    items:

Do you expect here multiple compatibles? If not, the items are not needed.

> +      - enum:
> +          - imagis,ist3038c
> +
> +  reg:
> +    description: I2C address

You can skip description because it is fairly obvious, but instead you
need maxItems. Alternatively, a list (items) with description defines
max items.


Best regards,
Krzysztof
