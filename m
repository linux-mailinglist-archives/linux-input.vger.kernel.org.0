Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8604422DE
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 22:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbhKAVoB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 17:44:01 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:46829 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhKAVoA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Nov 2021 17:44:00 -0400
Received: by mail-oi1-f177.google.com with SMTP id bd30so7227788oib.13;
        Mon, 01 Nov 2021 14:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A6FxAXBsKZP0yj/RpBLDVTK9cKXs6Qez6TJZQFcJ8oQ=;
        b=1T9qQbSXSrf+mfuszihUIWgUkgdHlkIWfhc2sKWm6aZBOAKDTPYn7s1hJLNoulbA90
         CkA5UArl3EKqShrwHJOxll7tPbb4mWdGMPTx1hd3hpbO0w33suUcgtuWePSK9/EGCWjJ
         DvO07FmO0Rz/9p+CVY2fMJBAIK51C9Cpq9om4FXWIUV3TL6cbLG1ChLfB279XdIab+c3
         hPEppRj/rLFCwyhDjzPb/bNvVO0ijsVoP3tle4u/y/Sm89r8T/I1nHW+84WqW2vrCO+4
         QL1ZctEgCvveX1JaBM4v1b3+tkuAvfRaozEXHsbNIIkwqSdYxYT9jFBi/vOIFN/kDSal
         ewoQ==
X-Gm-Message-State: AOAM532P1LUBLT2cSdlVtlztR8+8eiAfrz9uZUvhCXnwwrwTpAaTy7Zt
        P5tv4yYPelW1rkxGqqiEug==
X-Google-Smtp-Source: ABdhPJxh3uBAXCXUynE5eHGoL97bZpj7QVPk/IqAMdi9E7+iRjtcVWi3uuMxehReUu8yHtVJ2uMqMg==
X-Received: by 2002:a54:4f0d:: with SMTP id e13mr1433818oiy.110.1635802886245;
        Mon, 01 Nov 2021 14:41:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j3sm3479888oig.15.2021.11.01.14.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 14:41:25 -0700 (PDT)
Received: (nullmailer pid 1117584 invoked by uid 1000);
        Mon, 01 Nov 2021 21:41:24 -0000
Date:   Mon, 1 Nov 2021 16:41:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     dmitry.torokhov@gmail.com, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 5/6] dt-bindings: input: zinitix: Document touch-keys
 support
Message-ID: <YYBfBHGgKkGFhD50@robh.at.kernel.org>
References: <20211027181350.91630-1-nikita@trvn.ru>
 <20211027181350.91630-6-nikita@trvn.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027181350.91630-6-nikita@trvn.ru>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 27, 2021 at 11:13:49PM +0500, Nikita Travkin wrote:
> In some configrations the touch controller can support the touch-keys.
> Doucument the linux,keycodes property that enables those keys and
> specifies the keycodes that should be used to report the key events.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>  .../bindings/input/touchscreen/zinitix,bt400.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
> index b4e5ba7c0b49..40b243c07fd4 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
> @@ -79,6 +79,14 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [1, 2]
>  
> +  linux,keycodes:
> +    description: |
> +      This property specifies an array of keycodes assigned to the
> +      touch-keys that can be present in some touchscreen configurations.
> +    $ref: /schemas/input/input.yaml#/properties/linux,keycodes

Instead, reference input.yaml at the top-level.

> +    minItems: 1
> +    maxItems: 8
> +
>    touchscreen-size-x: true
>    touchscreen-size-y: true
>    touchscreen-fuzz-x: true
> -- 
> 2.30.2
> 
> 
