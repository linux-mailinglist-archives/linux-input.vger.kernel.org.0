Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A074643D0CB
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 20:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbhJ0SgV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 14:36:21 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:34964 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231672AbhJ0SgV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 14:36:21 -0400
Received: from g550jk.localnet (ip-213-127-63-241.ip.prioritytelecom.net [213.127.63.241])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id F4168C6CC0;
        Wed, 27 Oct 2021 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1635359634; bh=UIcFCudTxF6hG2HuR7YgfuD/23JAbfuvo/Ai0U9+vXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=frALwLf6m3i6RKnEnchtAOM25UHxWPVa923QnkhgzicSilAu/c4USwO32/Cno+nU6
         1RKzVwQs6c/VMovboxwnItlpBKT6kk2rZUJtikXz0v5NSVS2w+YXqG7Kan0qI0Timk
         6bW6WHEhucSz6kGH7HNnuP1MG+N0uC4fMlR4Uucw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     dmitry.torokhov@gmail.com, ~postmarketos/upstreaming@lists.sr.ht
Cc:     robh+dt@kernel.org, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikita@trvn.ru>,
        Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH 5/6] dt-bindings: input: zinitix: Document touch-keys support
Date:   Wed, 27 Oct 2021 20:33:53 +0200
Message-ID: <4350691.LvFx2qVVIh@g550jk>
In-Reply-To: <20211027181350.91630-6-nikita@trvn.ru>
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-6-nikita@trvn.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nikita,

On Mittwoch, 27. Oktober 2021 20:13:49 CEST Nikita Travkin wrote:
> In some configrations the touch controller can support the touch-keys.
> Doucument the linux,keycodes property that enables those keys and
> specifies the keycodes that should be used to report the key events.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>  .../bindings/input/touchscreen/zinitix,bt400.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
> b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
> index b4e5ba7c0b49..40b243c07fd4 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
> +++
> b/Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml @@
> -79,6 +79,14 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [1, 2]
> 
> +  linux,keycodes:
> +    description: |
> +      This property specifies an array of keycodes assigned to the
> +      touch-keys that can be present in some touchscreen configurations.
> +    $ref: /schemas/input/input.yaml#/properties/linux,keycodes
> +    minItems: 1

I think this would suggest all devices using the driver must have at least 
keycode declared which doesn't seem to be the desired behavior?

Regards,
Luca

> +    maxItems: 8
> +
>    touchscreen-size-x: true
>    touchscreen-size-y: true
>    touchscreen-fuzz-x: true




