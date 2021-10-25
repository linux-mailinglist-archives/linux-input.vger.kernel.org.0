Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186EA439E52
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 20:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbhJYSTa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 14:19:30 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:44957 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbhJYST0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 14:19:26 -0400
Received: by mail-oi1-f173.google.com with SMTP id y207so16749173oia.11;
        Mon, 25 Oct 2021 11:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=jBAmtPne42iUbiMZZnrXxItm/c1hWesTsw7A8PWDHYw=;
        b=i6bALQ+4dHI/N751xBsKp8WA1lpo5CU9EVw1GnTWFw0iEh/DOmlwnDJeGnT4FEh3ja
         poSMoF5mM+y4Pjc3Oem/u0T2jgvK7G5YPQVlCCVb1F5Qg1DS2OTT3JcJsXHV3ol0+tvY
         GNilHvVCOdWQ96SXceOTFmJKmqtfzRxgvcTXZcFh7vXx4YJuXHvAyLdEJz8G35QJ3o7A
         0Lq7YTQICzPLukmBMr3GxtukvBdY9d+50bILiCT++RzVSbeT0pcWqG+p6ohSYTBpUp20
         K0CucxXuzAWPkEhh/shdMMz8I6CfQe1Vta/Usx4R0faHhr1PqAvoxY/0/kRkQwi1kcxE
         DQtA==
X-Gm-Message-State: AOAM530AdQ7zACBumx4aM2OgUM8G+T/EDrF/1KABbm+iX3LLj2GafK4u
        fDhP4Xx73Fb3bXgBV3tEhQ==
X-Google-Smtp-Source: ABdhPJx+Gq/4i+TF8TqSgPGbJyhhAQrUJWS6HGuy4DOnqVz9mtooRFr2kIKmbmoxSY7gsxLTUpFWnw==
X-Received: by 2002:a05:6808:23ca:: with SMTP id bq10mr14147985oib.6.1635185823847;
        Mon, 25 Oct 2021 11:17:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bm43sm3702839oib.50.2021.10.25.11.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 11:17:03 -0700 (PDT)
Received: (nullmailer pid 824866 invoked by uid 1000);
        Mon, 25 Oct 2021 18:16:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andreas@kemnade.info, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, mylene.josserand@free-electrons.com,
        linus.walleij@linaro.org, rydberg@bitmath.org, alistair23@gmail.com
In-Reply-To: <20211025114214.44617-3-alistair@alistair23.me>
References: <20211025114214.44617-1-alistair@alistair23.me> <20211025114214.44617-3-alistair@alistair23.me>
Subject: Re: [PATCH 2/4] Documentation: DT: bindings: input: Add documentation for cyttsp5
Date:   Mon, 25 Oct 2021 13:16:53 -0500
Message-Id: <1635185813.751153.824865.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 25 Oct 2021 21:42:12 +1000, Alistair Francis wrote:
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
>  .../input/touchscreen/cypress,cyttsp5.yaml    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5.example.dts:29.35-36 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545697

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

