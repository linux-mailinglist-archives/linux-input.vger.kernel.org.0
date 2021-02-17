Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C165131E02D
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 21:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbhBQUZg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 15:25:36 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:43586 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbhBQUZf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 15:25:35 -0500
Received: by mail-ot1-f47.google.com with SMTP id l23so13207179otn.10;
        Wed, 17 Feb 2021 12:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Uld+x1RRhvGducDSCqzBqnBqxjyypyGBIFsh5LfxpwQ=;
        b=o1Crgoxpv53j0MnF2ZQcPwqEcTCTAGAWDztlfcnib5DMJ81iO9Q7RcfmuJ+6gbKw5T
         1mhzZbyAywsC8mUqpqozlVA2X5UmAYM18novL1xbecd5qH5IwS/18ppdjm533RP1+OpP
         t0M9EKiLxGfVewRimZA0Lcs9q6u8fW8rfu8Rr8me/20d18x1btQOmI6cYJt+M2QiSuw1
         i2scE4YUiPcZfRI16G20g1t6GfCrgYF8RcRida487eS1sr/PzJfkQEJA2rowMLhP8LZG
         ua5vgBG8k6j56niiPMRUOjCXDi1Hm9qVRfLVbUezNeD27tVUJcJ4+1FHOGBo97BvAKNF
         A00A==
X-Gm-Message-State: AOAM5339ZYQsQ1Ki8Hs6D1idTax+lsGRH/WgcyzSG7cazUmcL8gpUmLs
        uAgv/kcgrb8RM8FB9OGHJw==
X-Google-Smtp-Source: ABdhPJym6m1ydxfrcWw1M5K9w/FGTRkxucBEwnnYd++RyoPNdmnRBnfMKukqYyTZ/Gwkf6MnkY9phQ==
X-Received: by 2002:a9d:151:: with SMTP id 75mr614290otu.279.1613593494808;
        Wed, 17 Feb 2021 12:24:54 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i22sm606786oot.3.2021.02.17.12.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:24:53 -0800 (PST)
Received: (nullmailer pid 2681065 invoked by uid 1000);
        Wed, 17 Feb 2021 20:24:51 -0000
From:   Rob Herring <robh@kernel.org>
To:     Joe Hung <joe_hung@ilitek.com>
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, robh+dt@kernel.org,
        luca_hsu@ilitek.com
In-Reply-To: <20210217064155.126173-1-joe_hung@ilitek.com>
References: <20210217064155.126173-1-joe_hung@ilitek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c: Add bindings
Date:   Wed, 17 Feb 2021 14:24:51 -0600
Message-Id: <1613593491.484171.2681064.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 17 Feb 2021 14:41:54 +0800, Joe Hung wrote:
> Add binding documentation for ILITEK touch devices.
> 
> Signed-off-by: Joe Hung <joe_hung@ilitek.com>
> ---
> Changes in v2:
>   - Convert bindings file to DT schema format
>   - Using interrupts instead of irq-gpios
> 
>  .../input/touchscreen/ilitek_ts_i2c.yaml      | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.example.dts:28.45-46 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.example.dt.yaml] Error 1
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1441181

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

