Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1FDD39745B
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 15:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbhFANem (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 09:34:42 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:35714 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbhFANeS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 09:34:18 -0400
Received: by mail-ot1-f51.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so14139944otg.2;
        Tue, 01 Jun 2021 06:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=636I1E6EI0UDLxa5GgqxStRaCYirepHXi6qSCpou1R4=;
        b=LP4NsBafCRbrOIe42oOAOMq96vf6m2uZXqRHPT+X/0tj9u4wPTf4soUNfC9doUFoce
         /DDq2po2FNOXzQWGLPnlq9CX93S+MWeChBqxpSMMGgV6SaidG52egO39bX4YGns3x7GW
         0M812e6+fG4XeCXUDJM1Qk8EdHebM3J2wx92f5IMor8lMwRVwLhrlEc/g2yf0JUh1fJz
         YZaR/sWwtxIj2volG7IuHyC4sOXGlz3CZ5RseT9pe2njuJZEgZLWwZaB9apVJVaK2W+c
         2s6e2FuN0JVSROLPg0tIBg9iQ/nx56yqh+3/VhPj2KBSQvpJMCUh8M+VAp6uGf08STrt
         lm/w==
X-Gm-Message-State: AOAM533Tt8/uvH86cUXYFPqwT3jorl4birCAEKkbObKGW3RTgLTxn6Cu
        XnS1VUEWVCT/lipYf2aBgQ==
X-Google-Smtp-Source: ABdhPJz7Zikdb9VuMbD+KUFyCeTE7Pn5JbiIUzlOHS92hW+vH53XwAkuY1u4UbgfpWJw+IDBTp+4Zw==
X-Received: by 2002:a9d:1d21:: with SMTP id m30mr22255856otm.145.1622554356142;
        Tue, 01 Jun 2021 06:32:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w186sm2180506oib.58.2021.06.01.06.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:32:34 -0700 (PDT)
Received: (nullmailer pid 242369 invoked by uid 1000);
        Tue, 01 Jun 2021 13:32:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Jiri Kosina <jikos@jikos.cz>
In-Reply-To: <20210531133243.9488-1-oleg@kaa.org.ua>
References: <20210531133243.9488-1-oleg@kaa.org.ua>
Subject: Re: [PATCH] input: add SparkFun Qwiic Joystick driver
Date:   Tue, 01 Jun 2021 08:32:10 -0500
Message-Id: <1622554330.059878.242368.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 31 May 2021 16:32:43 +0300, Oleh Kravchenko wrote:
> A simple analog joystick built on Low Power ATtiny85 Microcontroller.
> Directional movements are measured with two 10 kΩ potentiometers
> connected with a gimbal mechanism that separates the horizontal and
> vertical movements. This joystick also has a select button that is actuated
> when the joystick is pressed down.
> 
> Input events polled over the I2C bus.
> 
> Product page:
> https://www.sparkfun.com/products/15168
> Firmware and hardware sources:
> https://github.com/sparkfun/Qwiic_Joystick
> 
> Tested on RPi4B and O4-iMX-NANO boards.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Device Tree mailing list <devicetree@vger.kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jiri Kosina <jikos@jikos.cz>
> Cc: Patchwork Bot <patchwork-bot@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../bindings/input/qwiic-joystick.yaml        |  31 ++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  drivers/input/joystick/Kconfig                |   9 +
>  drivers/input/joystick/Makefile               |   1 +
>  drivers/input/joystick/qwiic-joystick.c       | 169 ++++++++++++++++++
>  5 files changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qwiic-joystick.yaml
>  create mode 100644 drivers/input/joystick/qwiic-joystick.c
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/input/qwiic-joystick.example.dts:21.13-26: Warning (reg_format): /example-0/qwiic@20:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/input/qwiic-joystick.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/qwiic-joystick.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/qwiic-joystick.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/qwiic-joystick.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/qwiic-joystick.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/qwiic-joystick.example.dt.yaml: example-0: qwiic@20:reg:0: [32] is too short
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/qwiic-joystick.example.dt.yaml: qwiic@20: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/qwiic-joystick.yaml

See https://patchwork.ozlabs.org/patch/1485677

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

