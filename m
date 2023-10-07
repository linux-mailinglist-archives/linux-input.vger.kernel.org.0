Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153F57BC899
	for <lists+linux-input@lfdr.de>; Sat,  7 Oct 2023 17:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343946AbjJGPXp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Oct 2023 11:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343893AbjJGPXp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Oct 2023 11:23:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0809B9
        for <linux-input@vger.kernel.org>; Sat,  7 Oct 2023 08:23:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832C8C433C7;
        Sat,  7 Oct 2023 15:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696692223;
        bh=9FvghTJx3n5zJscHtVU/mx4NrhT3yTXI6D36vN8bU9w=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=m6aZYe0E/NxsHBMhWo5vZPAFmMp/9ZbTe+uxADVYPJXpE4qfG09wNMPFYJihec30v
         xFUIxuruWES+8S1Q1FUzKpk5v3NUhXlfZSvUd/QePuK4VadTXJYPahQYhN/4goU85K
         eLbkMWU7UroC3LhuLYlWVXDaUOfjbUfiYXYsmofNp5FLS+jik5183XCMz+09N2RoQz
         863AEDvWrqsDV67Qo5EXrXb0ouCgbFKfvZcAB4nnnR2Uf+CklDPBvqvcDdvSkWf4Mk
         KV7BBS1XkVEN9o5LblvfzGdjQDYlh7InI6z/OSUtFAePvqLZgycwsqcJFstWqdkQaq
         IVKtrgZDVkCog==
Received: (nullmailer pid 2012352 invoked by uid 1000);
        Sat, 07 Oct 2023 15:23:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Anshul Dalal <anshulusr@gmail.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20231007144052.1535417-1-anshulusr@gmail.com>
References: <20231007144052.1535417-1-anshulusr@gmail.com>
Message-Id: <169669222125.2012336.4347656576097036742.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add bindings for Adafruit Seesaw
 Gamepad
Date:   Sat, 07 Oct 2023 10:23:41 -0500
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Sat, 07 Oct 2023 20:10:49 +0530, Anshul Dalal wrote:
> A simple driver for a mini gamepad that communicates over i2c, the gamepad
> has bidirectional thumb stick input and six buttons.
> 
> The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
> to transmit the ADC data for the joystick and digital pin state for the
> buttons. I have only implemented the functionality required to receive the
> thumb stick and button state.
> 
> Steps in reading the gamepad state over i2c:
>   1. Reset the registers
>   2. Set the pin mode of the pins specified by the `BUTTON_MASK` to input
>       `BUTTON_MASK`: A bit-map for the six digital pins internally
>        connected to the joystick buttons.
>   3. Enable internal pullup resistors for the `BUTTON_MASK`
>   4. Bulk set the pin state HIGH for `BUTTON_MASK`
>   5. Poll the device for button and joystick state done by:
>       `seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)`
> 
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
> 
> Tested on RPi Zero 2W
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
>  .../bindings/input/adafruit_seesaw.yaml       | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adafruit_seesaw.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/adafruit_seesaw.yaml:4:6: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/input/adafruit_seesaw.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/input/adafruit_seesaw.example.dts:20.13-26: Warning (reg_format): /example-0/seesaw_gamepad@50:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/input/adafruit_seesaw.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/adafruit_seesaw.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/adafruit_seesaw.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/adafruit_seesaw.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/adafruit_seesaw.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adafruit_seesaw.example.dtb: seesaw_gamepad@50: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231007144052.1535417-1-anshulusr@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

