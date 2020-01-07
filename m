Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3426132DB2
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 18:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbgAGR40 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 12:56:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:58418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728266AbgAGR40 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jan 2020 12:56:26 -0500
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05C4D21744;
        Tue,  7 Jan 2020 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578419785;
        bh=sN3A/gVmvY08EVkOw02CCTJ8qQ4qt4GuWbnEiWDMlDk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ng9ynkCme5Wbdl2xJGlooU27pt9n+nw/miTwaeQS5XmjXZMt4dRfiqEnCrH06coxA
         f5Ey/oP/p9oZ71NEx7PKHifqNdmdi5K9YqLwLW1IKB+SdlP86vssJp28YYz7aT9IUk
         Cuc0Sf7FAO9wQNWwGe1ppbcUsPQg2HzXL8oWWOSs=
Received: by mail-qv1-f49.google.com with SMTP id o18so248376qvf.1;
        Tue, 07 Jan 2020 09:56:24 -0800 (PST)
X-Gm-Message-State: APjAAAW1EmKWH3LJwHqOFNaMvqgzpVHouwKzR1IqCC/tmGvS5bUeAtNf
        KRVuY18YS/Zb68Xue0aMNZrT3r0ihTvycWCqnQ==
X-Google-Smtp-Source: APXvYqzF/BfLHaaeTgK5EYiU4pH7Lg18L2BUarYIRmwIQvhvDK1mPGCkPRdU126f/Ll3H32W9ezOumk47Rv77DBA4es=
X-Received: by 2002:a05:6214:11ac:: with SMTP id u12mr577861qvv.85.1578419784123;
 Tue, 07 Jan 2020 09:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20200107130903.14421-1-benjamin.gaignard@st.com> <20200107130903.14421-3-benjamin.gaignard@st.com>
In-Reply-To: <20200107130903.14421-3-benjamin.gaignard@st.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 7 Jan 2020 11:56:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+7rnnaTA3MOVZPS70m8ESdFYZWtpCUtVZOX_g1S-bPNA@mail.gmail.com>
Message-ID: <CAL_Jsq+7rnnaTA3MOVZPS70m8ESdFYZWtpCUtVZOX_g1S-bPNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: touchscreen: Convert Goodix touchscreen
 to json-schema
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 7, 2020 at 7:09 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the Goodix binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/input/touchscreen/goodix.txt          | 50 ----------------
>  .../bindings/input/touchscreen/goodix.yaml         | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt b/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
> deleted file mode 100644
> index fc03ea4cf5ab..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Device tree bindings for Goodix GT9xx series touchscreen controller
> -
> -Required properties:
> -
> - - compatible          : Should be "goodix,gt1151"
> -                                or "goodix,gt5663"
> -                                or "goodix,gt5688"
> -                                or "goodix,gt911"
> -                                or "goodix,gt9110"
> -                                or "goodix,gt912"
> -                                or "goodix,gt927"
> -                                or "goodix,gt9271"
> -                                or "goodix,gt928"
> -                                or "goodix,gt967"
> - - reg                 : I2C address of the chip. Should be 0x5d or 0x14
> - - interrupts          : Interrupt to which the chip is connected
> -
> -Optional properties:
> -
> - - irq-gpios           : GPIO pin used for IRQ. The driver uses the
> -                         interrupt gpio pin as output to reset the device.
> - - reset-gpios         : GPIO pin used for reset
> - - AVDD28-supply       : Analog power supply regulator on AVDD28 pin
> - - VDDIO-supply                : GPIO power supply regulator on VDDIO pin
> - - touchscreen-inverted-x
> - - touchscreen-inverted-y
> - - touchscreen-size-x
> - - touchscreen-size-y
> - - touchscreen-swapped-x-y
> -
> -The touchscreen-* properties are documented in touchscreen.txt in this
> -directory.
> -
> -Example:
> -
> -       i2c@00000000 {
> -               /* ... */
> -
> -               gt928@5d {
> -                       compatible = "goodix,gt928";
> -                       reg = <0x5d>;
> -                       interrupt-parent = <&gpio>;
> -                       interrupts = <0 0>;
> -
> -                       irq-gpios = <&gpio1 0 0>;
> -                       reset-gpios = <&gpio1 1 0>;
> -               };
> -
> -               /* ... */
> -       };
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> new file mode 100644
> index 000000000000..05b52d359ac5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Goodix GT9xx series touchscreen controller Bindings
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt1151
> +      - goodix,gt5663
> +      - goodix,gt5688
> +      - goodix,gt911
> +      - goodix,gt9110
> +      - goodix,gt912
> +      - goodix,gt927
> +      - goodix,gt9271
> +      - goodix,gt928
> +      - goodix,gt967
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  irq-gpios:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  AVDD28-supply:
> +    description: Analog power supply regulator on AVDD28 pin
> +
> +  VDDIO-supply:
> +    description: GPIO power supply regulator on VDDIO pin
> +
> +additionalProperties: false

This doesn't work if you have any touchscreen properties as this
doesn't account for things referenced. You need add them in this
schema:

touchscreen-inverted-x: true

This serves 2 purposes. It prevents additional properties not defined
here and defines which of the common properties are valid for this
device.

Rob
