Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670A1440F88
	for <lists+linux-input@lfdr.de>; Sun, 31 Oct 2021 17:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhJaQv6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 31 Oct 2021 12:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhJaQv5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 31 Oct 2021 12:51:57 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FB0C061570;
        Sun, 31 Oct 2021 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=aVTDOe/YUeynXWH5Tc1lXgdCvtmKqzq8Qx0YAnSIre4=; b=JeI0M0wZWD8dEyRi1G2qGd8xbf
        4yiV4avZV68IsLtYNYKAjcgjhvG+Qe2aHnJ8btzfMkBrObb53Du4HDin8qF6twtE7zbk+2QERtk7B
        E5DQozCkp/RcQqVAyNezBM7iE0vrLtJIMTl3zqU9ExiJf6Je9IF/fhzEULixiFCZGBb4=;
Received: from p200300ccff0896001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff08:9600:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mhE1G-0004Kw-9u; Sun, 31 Oct 2021 17:49:18 +0100
Date:   Sun, 31 Oct 2021 17:49:17 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        alistair23@gmail.com, dmitry.torokhov@gmail.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, rydberg@bitmath.org,
        mylene.josserand@free-electrons.com
Subject: Re: [PATCH 2/4] Documentation: DT: bindings: input: Add
 documentation for cyttsp5
Message-ID: <20211031174917.289ef018@aktux>
In-Reply-To: <20211025114214.44617-3-alistair@alistair23.me>
References: <20211025114214.44617-1-alistair@alistair23.me>
        <20211025114214.44617-3-alistair@alistair23.me>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, 25 Oct 2021 21:42:12 +1000
Alistair Francis <alistair@alistair23.me> wrote:

> From: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com>
>=20
> Add the Cypress TrueTouch Generation 5 touchscreen device tree bindings
> documentation. It can use I2C or SPI bus.
> This touchscreen can handle some defined zone that are designed and
> sent as button. To be able to customize the keycode sent, the
> "linux,code" property in a "button" sub-node can be used.
>=20
> Signed-off-by: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.com>
> Message-Id: <20170529144538.29187-3-mylene.josserand@free-electrons.com>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../input/touchscreen/cypress,cyttsp5.yaml    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/c=
ypress,cyttsp5.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,=
cyttsp5.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,=
cyttsp5.yaml
> new file mode 100644
> index 000000000000..0bddbd76a0c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cyttsp5=
.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/cypress,cyttsp5.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cypress cyttsp touchscreen controller, generation 5
> +
> +maintainers:
> +  - Alistair Francis <alistair@alistair23.me>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: cypress,cyttsp5
> +

you use buttons later, so it should be specified somewhere here.

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Regulator for voltage.
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  linux,code:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: EV_ABS specific event code generated by the axis.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - vdd-supply
> +
> +additionalProperties: false
If you want to allow things from touchscreen.yaml, you should use
unevaluatedProperties: false.
> +
> +examples:
> +  - |

some includes are missing for the constants below here.
> +    i2c {

Regards,
Andreas
