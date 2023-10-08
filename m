Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E4D7BCF88
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 20:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjJHSM5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 14:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjJHSM4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 14:12:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AE3AC
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 11:12:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AFEC433C7;
        Sun,  8 Oct 2023 18:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696788774;
        bh=E5/HWNcNVn0Vk+HqTyeYnqun/DSdOEEm7BiBOhqFxjM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=SkZlKBa2y8K766KbibYjcG0/p9UvOys1E4g9EJg8lvUR0oDqV620U8uRuEaPM5DA+
         l4zsZCD2EtAEc+WomzmI85obiUvE5YvjSmBr770mhVIqJlG6bJ0mAgpIkpm3Yf0Lmw
         Wu4IN1TdbKCdeGGjmoV2p3H+6z1GJ/ObaACp4jt61WHal7Ow7p3Nz/VJJolhO3DLHq
         AtsaDdELFins+0fCPf2OgEWFXieOiEe2cgnbyxPOE6ziQrpWUqQO9tx19ptKoulnZD
         eqAXvvf/Srkw938FP8rIFBJVQqamlwHqwTnN7rvrL6aH9MaiDE/JLH5+fvkr48g/bw
         RWNdsBgUfdPng==
Received: (nullmailer pid 52836 invoked by uid 1000);
        Sun, 08 Oct 2023 18:12:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Anshul Dalal <anshulusr@gmail.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20231008172435.2391009-1-anshulusr@gmail.com>
References: <20231008172435.2391009-1-anshulusr@gmail.com>
Message-Id: <169678877266.52804.3494265677857240747.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: bindings for Adafruit
 Seesaw Gamepad
Date:   Sun, 08 Oct 2023 13:12:52 -0500
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Sun, 08 Oct 2023 22:54:33 +0530, Anshul Dalal wrote:
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
> Changes for v2:
> - Renamed file to `adafruit,seesaw-gamepad.yaml`
> - Removed quotes for `$id` and `$schema`
> - Removed "Bindings for" from the description
> - Changed node name to the generic name "joystick"
> - Changed compatible to 'adafruit,seesaw-gamepad' instead of 'adafruit,seesaw_gamepad'
> 
>  .../input/adafruit,seesaw-gamepad.yaml        | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.example.dtb: joystick@50: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231008172435.2391009-1-anshulusr@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

