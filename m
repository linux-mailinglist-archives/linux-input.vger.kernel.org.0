Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D707BCFD0
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 21:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344512AbjJHTdK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 15:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344511AbjJHTdK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 15:33:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8AB2AC
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 12:33:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D429C433C7;
        Sun,  8 Oct 2023 19:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696793585;
        bh=7L4qZqJWK5WwSbCe/JMaRpshZZKeMr+g2ApwVhHBa7Q=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=dI+8ZdyJCGsMfIWOW4GBAv4/QFpr6TvPIO6u5k/abMlpEm/pyOAYlhzRYZvG3Ls4c
         6kLpC76ncFiP6GFzV4Vdjin+Aj+6m1y8O6yNMzoCrbI+7cl4nIA8tXXnn0jQtwBANL
         SJ4MVyDbykVOwzpeVF8Cxy6zgYwBPACn3RGN7IaeETgTkEOf4arzR+ojndq2pixSQo
         ceD1t6HA4wiZ484pWfh3k5gR/a5JXm2w8QWThzmUmsifxKWgaS55OBnDxpTyUF8UO1
         0DrEw18/VAeQrOmm28pGsYtSxV67sR3JzcPla7ImwXmsHVyIWzFmJqxK+BdJbZmNJn
         lGUad+jBvLupQ==
Received: (nullmailer pid 145625 invoked by uid 1000);
        Sun, 08 Oct 2023 19:33:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Anshul Dalal <anshulusr@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Conor Dooley <conor+dt@kernel.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231008185709.2448423-1-anshulusr@gmail.com>
References: <20231008185709.2448423-1-anshulusr@gmail.com>
Message-Id: <169679358403.145603.2546458624338403625.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: input: bindings for Adafruit
 Seesaw Gamepad
Date:   Sun, 08 Oct 2023 14:33:04 -0500
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Mon, 09 Oct 2023 00:27:06 +0530, Anshul Dalal wrote:
> A simple driver for a mini gamepad that communicates over i2c, the gamepad
> has bidirectional thumb stick input and six buttons.
> 
> The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
> to transmit the ADC data for the joystick and digital pin state for the
> buttons. I have only implemented the functionality required to receive the
> thumb stick and button state.
> 
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
> 
> For testing on a RPi Zero 2W, I utilized the following devicetree overlay:
> 
> /dts-v1/;
> /plugin/;
> / {
> 	compatible = "brcm,bcm2835";
> 	fragment@0 {
> 		target = <&i2c1>;
> 		__overlay__ {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 			joystick@50 {
> 				compatible = "adafruit,seesaw-gamepad";
> 				reg = <0x50>;
> 			};
> 		};
> 	};
> };
> 
> I used the above overlay as reference for writing this binding. Though the
> gamepad also has an interrupt pin that needs to be enabled explicitly (not
> currently implemented in driver). The pin triggers a rising edge when a
> button is pressed or joystick is moved which can be detected on a GPIO
> of the Microcontroller.
> 
> I wasn't sure how to represent that functionality in the binding so I have
> left it out for now.
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
> 
> Changes for v3:
> - Updated id field to reflect updated file name from previous version
> - Added `reg` property
> 
> Changes for v2:
> - Renamed file to `adafruit,seesaw-gamepad.yaml`
> - Removed quotes for `$id` and `$schema`
> - Removed "Bindings for" from the description
> - Changed node name to the generic name "joystick"
> - Changed compatible to 'adafruit,seesaw-gamepad' instead of 'adafruit,seesaw_gamepad'
> 
>  .../input/adafruit,seesaw-gamepad.yaml        | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/input/adafruit-seesaw.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231008185709.2448423-1-anshulusr@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

