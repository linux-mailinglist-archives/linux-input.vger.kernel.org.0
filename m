Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746D054BF6A
	for <lists+linux-input@lfdr.de>; Wed, 15 Jun 2022 03:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344972AbiFOBuq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jun 2022 21:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbiFOBup (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jun 2022 21:50:45 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6BF49909;
        Tue, 14 Jun 2022 18:50:44 -0700 (PDT)
Received: (Authenticated sender: contact@artur-rojek.eu)
        by mail.gandi.net (Postfix) with ESMTPA id 31D161BF206;
        Wed, 15 Jun 2022 01:50:40 +0000 (UTC)
MIME-Version: 1.0
Date:   Wed, 15 Jun 2022 03:50:40 +0200
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        maccraft123mc@gmail.com, heiko@sntech.de,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: adc-joystick: add
 adc-joystick,no-hardware-trigger
In-Reply-To: <20220613192353.696-2-macroalpha82@gmail.com>
References: <20220613192353.696-1-macroalpha82@gmail.com>
 <20220613192353.696-2-macroalpha82@gmail.com>
Message-ID: <a1deee0f1c8293b41f47ce2c6e988fd4@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022-06-13 21:23, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for adc-joystick,no-hardware-trigger. New device-tree
> properties have been added.
> 
> - adc-joystick,no-hardware-trigger: A boolean value noting the joystick
> 				    device should be polled rather than
> 				    use a triggered buffer.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../devicetree/bindings/input/adc-joystick.yaml          | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> index 2ee04e03bc22..627cc6c40191 100644
> --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> @@ -12,12 +12,19 @@ maintainers:
> 
>  description: >
>    Bindings for joystick devices connected to ADC controllers 
> supporting
> -  the Industrial I/O subsystem.
> +  the Industrial I/O subsystem. Supports both polled devices where no
> +  iio trigger is available and non-polled devices which are triggered
> +  by iio.
> 
>  properties:
>    compatible:
>      const: adc-joystick
> 
> +  adc-joystick,no-hardware-trigger:
I'm against using Device Tree for this functionality. See my reply to 
patch 2/3 for details.
But in case we do end up going DT way, I would much prefer going with 
Rob's suggestion of using the existing `poll-interval` input property.

Cheers,
Artur
> +    type: boolean
> +    description:
> +      If the device does not support triggered buffers and needs to be 
> polled.
> +
>    io-channels:
>      minItems: 1
>      maxItems: 1024
