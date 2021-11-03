Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0A3444B40
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 00:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhKCXKj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 19:10:39 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:37524 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhKCXKi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Nov 2021 19:10:38 -0400
Received: by mail-oi1-f171.google.com with SMTP id o83so6177890oif.4;
        Wed, 03 Nov 2021 16:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WLuVuAYOP3Qwoy+azSFg/EZlpahDAhqD21l4wQ3l8XI=;
        b=JOP/UUiCM6ltd4PdXnuPKqh9m3nEuqmfM6zAF1Yd4L7IyoSVRJJ2S/a2AO9MWcyXEk
         C0jXSaTk8IOwmdA+zhJpLlVp+0zRL31c2y5kY6/CkTfUzlXYgIfNfRAF5SSglgQsLXh/
         v0Dk90gMB6Gv4qpRdjlJ8xOAnuxdcGLW5bSA6Mp0H3tcA7hgSVbPnGB1dGiZ58qTJ07n
         LWuyRGs2qOXyC4otBPD7KegIn7Yugd4fZi+AL2k41saoTSRywlhIvOspILuyfILgMLUD
         IczIoQLfrKxMBWzuTAZTVfG6zHaPj919zqpxVGjK3vcOrOUOvNfnB/5z0EuOEh+NFVyg
         RuhA==
X-Gm-Message-State: AOAM532Xq2NUIAm1xsL30rX4J8lza8xeoWNjWfPQkwJO0TmQ39oYF4Gx
        dX22HgSsQ1Ku8lemdkeBqTVF2nWaOQ==
X-Google-Smtp-Source: ABdhPJw4sVaiqSveYzsN2BnL3m300eMWJQg6pmuG4SixypC7Kx3qEJ9i6nd6n5e83pvMvIwwnqlULw==
X-Received: by 2002:a05:6808:23d4:: with SMTP id bq20mr14026296oib.112.1635980880825;
        Wed, 03 Nov 2021 16:08:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 62sm896752ooa.47.2021.11.03.16.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:08:00 -0700 (PDT)
Received: (nullmailer pid 1941684 invoked by uid 1000);
        Wed, 03 Nov 2021 23:07:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        alistair23@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, mylene.josserand@free-electrons.com,
        andreas@kemnade.info
In-Reply-To: <20211103114830.62711-3-alistair@alistair23.me>
References: <20211103114830.62711-1-alistair@alistair23.me> <20211103114830.62711-3-alistair@alistair23.me>
Subject: Re: [PATCH v2 2/4] Documentation: DT: bindings: input: Add documentation for cyttsp5
Date:   Wed, 03 Nov 2021 18:07:59 -0500
Message-Id: <1635980879.208363.1941683.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 03 Nov 2021 21:48:28 +1000, Alistair Francis wrote:
> From: Mylène Josserand <mylene.josserand@free-electrons.com>
> 
> Add the Cypress TrueTouch Generation 5 touchscreen device tree bindings
> documentation. It can use I2C or SPI bus.
> This touchscreen can handle some defined zone that are designed and
> sent as button. To be able to customize the keycode sent, the
> "linux,code" property in a "button" sub-node can be used.
> 
> Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
> Message-Id: <20170529144538.29187-3-mylene.josserand@free-electrons.com>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../input/touchscreen/cypress,tt21000.yaml    | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/input/touchscreen/cypress,tt21000.yaml#
Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.example.dts:37.26-39.19: Warning (unit_address_vs_reg): /example-0/i2c/touchscreen@24/button@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.example.dts:41.26-43.19: Warning (unit_address_vs_reg): /example-0/i2c/touchscreen@24/button@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.example.dts:45.26-47.19: Warning (unit_address_vs_reg): /example-0/i2c/touchscreen@24/button@2: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/input/touchscreen/cypress,tt21000.example.dt.yaml:0:0: /example-0/i2c/touchscreen@24: failed to match any schema with compatible: ['cypress,tt2100']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1550218

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

