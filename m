Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1459235C76D
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 15:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239982AbhDLNU3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 09:20:29 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:36704 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239497AbhDLNU1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 09:20:27 -0400
Received: by mail-ot1-f51.google.com with SMTP id i16-20020a9d68d00000b0290286edfdfe9eso2111500oto.3;
        Mon, 12 Apr 2021 06:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=dYxhQAY8YlcxGKlNHGF/hP5NWDkLdUTva1d6cdSahEY=;
        b=RyW1OLcORFyk5k4H5bBL4st9cPLVyFPMSEpFymWn8g77I0faz1cZRba8ztasKBgqge
         JR1hgcES5I4kHvZxtAjfW5Pn6Gdo8lQwqIThub37s4NCB5RUqrnSW21FOqQ3B+8kRfQF
         c3cjbDy1L0d3wLH5KFn+fhELMuuXXwRNo/Inx84JTPdMZH47kSwlge26hTX9CbuppavD
         zsZqzgO1nvIfY0rDVAwLuzHNCzDQhQJWUnR9jlTJtjO7MF89utsipO5J2a2TfuzvQNsD
         pLm8KaTbtc4Wm4LkRV3aNDJSFtd8sCfD79UkRjqRHzQTqBPRnVdxKcu61zuMLMM2zWE8
         ab4g==
X-Gm-Message-State: AOAM532sCPCyyOoHTT4c9wh5/OMN7EugYAfy5gIq68mybTs1WFbFAswk
        LxT94wUJqLqidpGy6GQK5A==
X-Google-Smtp-Source: ABdhPJxhxoL8CK12YPgvZCZL8xP6K9HKbNKbkGZlmCfJuRRPe+eQJYpjJcVShovdD/GLmYsW+QKVOQ==
X-Received: by 2002:a9d:6a91:: with SMTP id l17mr23666160otq.297.1618233608236;
        Mon, 12 Apr 2021 06:20:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x13sm56421otg.57.2021.04.12.06.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:20:07 -0700 (PDT)
Received: (nullmailer pid 3757976 invoked by uid 1000);
        Mon, 12 Apr 2021 13:20:00 -0000
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
In-Reply-To: <20210411114804.151754-3-giulio.benetti@benettiengineering.com>
References: <20210408202137.GA1890401@robh.at.kernel.org> <20210411114804.151754-1-giulio.benetti@benettiengineering.com> <20210411114804.151754-3-giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Mon, 12 Apr 2021 08:20:00 -0500
Message-Id: <1618233600.204061.3757975.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 11 Apr 2021 13:48:03 +0200, Giulio Benetti wrote:
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> As suggested by Rob Herring:
> * fixed $id: address
> * added "hycon," in front of every custom property
> * changed all possible property to boolean type
> * removed proximity-sensor-switch property since it's not handled in driver
> V2->V3:
> As suggested by Jonathan Neuschäfer:
> * fixed some typo
> * fixed description indentation
> * improved boolean properties descriptions
> * improved hycon,report-speed description
> V3->V4:
> * fixed binding compatible string in example as suggested by Jonathan Neuschäfer
> V4->V5:
> As suggested by Rob Herring:
> * drop hycon- prefix from compatible
> * use Hertz unit suffix for hycon,report-speed instead of u32
> * set hycon,report-speed minimum to 1Hz, 0Hz make controller to do nothing
> * change hycon,power-noise-enable property name to hycon,noise-filter-enable
> * improve hycon,filter-data property description
> * use generic touchscreen node name in example
> ---
>  .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml: properties:hycon,report-speed: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('minimum', 'maximum' were unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml: properties:hycon,report-speed: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml: properties:hycon,report-speed: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml: ignoring, error in schema: properties: hycon,report-speed
warning: no schema found in file: ./Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.example.dt.yaml:0:0: /example-0/i2c/touchscreen@1c: failed to match any schema with compatible: ['hycon,hy4633']

See https://patchwork.ozlabs.org/patch/1464803

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

