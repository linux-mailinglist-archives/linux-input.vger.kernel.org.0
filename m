Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBBBA53AF07
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 00:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiFAUzx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 16:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiFAUzg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 16:55:36 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052131F576D;
        Wed,  1 Jun 2022 13:55:23 -0700 (PDT)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 228F4D0BB8;
        Wed,  1 Jun 2022 19:45:25 +0000 (UTC)
Received: (Authenticated sender: contact@artur-rojek.eu)
        by mail.gandi.net (Postfix) with ESMTPA id 4394B60006;
        Wed,  1 Jun 2022 19:44:43 +0000 (UTC)
MIME-Version: 1.0
Date:   Wed, 01 Jun 2022 21:44:43 +0200
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        maccraft123mc@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: adc-joystick: bindings for
 adc-joystick-polled
In-Reply-To: <20220601191730.29721-2-macroalpha82@gmail.com>
References: <20220601191730.29721-1-macroalpha82@gmail.com>
 <20220601191730.29721-2-macroalpha82@gmail.com>
Message-ID: <db2795c639cc092e54980de6f3af3b01@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022-06-01 21:17, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>

Hi Chris,

> 
> Add devicetree bindings for adc-joystick-polled.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/input/adc-joystick.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> index 2ee04e03bc22..a9d2ac157322 100644
> --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> @@ -12,11 +12,15 @@ maintainers:
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
> -    const: adc-joystick
> +    enum:
> +      - adc-joystick
> +      - adc-joystick-polled

There is no need to create a new compatible for your functionality. 
Instead, just add a new (optional) property.

cheers,
Artur

> 
>    io-channels:
>      minItems: 1
