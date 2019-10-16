Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32FE5D8AFF
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 10:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732272AbfJPIba (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Oct 2019 04:31:30 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44530 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730669AbfJPIba (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Oct 2019 04:31:30 -0400
Received: by mail-ot1-f67.google.com with SMTP id 21so19402351otj.11
        for <linux-input@vger.kernel.org>; Wed, 16 Oct 2019 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TaAko0rHRb4gyBH2lBWVYnJuZHP/kcOSHoWKD/0YW+0=;
        b=uqwzsV6OK3KphoWbeGbFhcWhYjV9Jubd8rt5VmBD5qSpRmrGE/3/lstncLn/ole9qk
         j0iwCAs3bdFZeO79+dh2d+v1jLnSkh4ZqDXFOWimb6GQP4pQ4fMiIvbDciukoNihRaIz
         44kzIDO1nkMbOK9JHJ7CQkkvLHFqk3sXb7/swrQqkv6ZPZvrz6dMvy2Q6FaIRTDOUo7H
         cNpQD2NKK3jyfPuZUa0bxTCVNQYQlw2zhBKt0kuIOExdefo7hkSiof5+XpOu/aY/Tdck
         D2gERzMdFQrJsrqYbmF+uudNRJkZHa8oNdDBCU0SQUs9Oi5t6fQTSoA9oWl57XDqapqE
         Ivjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TaAko0rHRb4gyBH2lBWVYnJuZHP/kcOSHoWKD/0YW+0=;
        b=itErml3NEVSl4cVhZNJOxZRKrx+ZXGpMD4mNkFAMCb9hAJLL6R2QdClbl4uzgAglS6
         o/aA0cY0Fz3wObML+cvpMhZmD8KEpbJEcv15T1EcpSBMAP57bgo1YiNoPbnoQaLWj7eK
         v9ZEm8mtqKCn7bjHejAvf97EvNNru+15AjTMZY5VwBAY2SZ1ZQmfJh/QFhxnS/eIGY4Q
         OuD60hhINglizVVdbIjVqpBl/8smpezR5rVEfQMMd8+W27ozin3slKU1eKUI3uAHffbv
         075YEo9zJR3BvL9eekjSy+jA/Wk5ws+WYLbxbycIHB8vW+agBhPxRhvaAXhaplXiiEd3
         yc5Q==
X-Gm-Message-State: APjAAAWXNQT7bq6I6Zh4sXtkVshxvgcmfnRrbAThjZDgovpxMbEA753x
        kDc0hTQgZR6TIcfFEotgbnSUU6hNcnQ7TwuQGzSGgQ==
X-Google-Smtp-Source: APXvYqzjLLdNQ3WjVdvOT/4N0uavAJR6Mv4Jgxn5lrygES8vBTMlSZ0M5fHGe1wdjBwZwcW06xlKs32f4hJ3sJgiAfQ=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr33650170otb.85.1571214688147;
 Wed, 16 Oct 2019 01:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191015162300.22024-1-brgl@bgdev.pl> <20191015162300.22024-5-brgl@bgdev.pl>
 <20191015191837.jd6lbk3qbsmzuwfu@earth.universe>
In-Reply-To: <20191015191837.jd6lbk3qbsmzuwfu@earth.universe>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 16 Oct 2019 10:31:17 +0200
Message-ID: <CAMpxmJXH6k7PqEE_VfRZ-k1eL+7NSPRuZY8yP8XbYzgVdOAvJQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: power: max77650: convert the binding
 document to yaml
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-pm <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

wt., 15 pa=C5=BA 2019 o 21:18 Sebastian Reichel <sre@kernel.org> napisa=C5=
=82(a):
>
> Hi,
>
> On Tue, Oct 15, 2019 at 06:22:58PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Convert the binding document for MAX77650 charger module to YAML.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
>
> Looks sensible to me. Assuming this goes through Rob:
>
> Acked-by: Sebastian Reichel <sre@kernel.org>

Oops, I added your ack for v1 to the leds patch in v2 by mistake.
There'll be a v3 though so no worries.

Thanks!
Bart

>
> -- Sebastian
>
> >  .../power/supply/max77650-charger.txt         | 29 +------------
> >  .../power/supply/max77650-charger.yaml        | 42 +++++++++++++++++++
> >  2 files changed, 43 insertions(+), 28 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/power/supply/max7=
7650-charger.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/power/supply/max77650-ch=
arger.txt b/Documentation/devicetree/bindings/power/supply/max77650-charger=
.txt
> > index e6d0fb6ff94e..fbab7d3ac8e3 100644
> > --- a/Documentation/devicetree/bindings/power/supply/max77650-charger.t=
xt
> > +++ b/Documentation/devicetree/bindings/power/supply/max77650-charger.t=
xt
> > @@ -1,28 +1 @@
> > -Battery charger driver for MAX77650 PMIC from Maxim Integrated.
> > -
> > -This module is part of the MAX77650 MFD device. For more details
> > -see Documentation/devicetree/bindings/mfd/max77650.txt.
> > -
> > -The charger is represented as a sub-node of the PMIC node on the devic=
e tree.
> > -
> > -Required properties:
> > ---------------------
> > -- compatible:                Must be "maxim,max77650-charger"
> > -
> > -Optional properties:
> > ---------------------
> > -- input-voltage-min-microvolt:       Minimum CHGIN regulation voltage.=
 Must be one
> > -                             of: 4000000, 4100000, 4200000, 4300000,
> > -                             4400000, 4500000, 4600000, 4700000.
> > -- input-current-limit-microamp:      CHGIN input current limit (in mic=
roamps). Must
> > -                             be one of: 95000, 190000, 285000, 380000,
> > -                             475000.
> > -
> > -Example:
> > ---------
> > -
> > -     charger {
> > -             compatible =3D "maxim,max77650-charger";
> > -             input-voltage-min-microvolt =3D <4200000>;
> > -             input-current-limit-microamp =3D <285000>;
> > -     };
> > +This file was moved to max77650-charger.yaml.
> > diff --git a/Documentation/devicetree/bindings/power/supply/max77650-ch=
arger.yaml b/Documentation/devicetree/bindings/power/supply/max77650-charge=
r.yaml
> > new file mode 100644
> > index 000000000000..9dd0dad0f948
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/supply/max77650-charger.y=
aml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/supply/max77650-charger.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Battery charger driver for MAX77650 PMIC from Maxim Integrated.
> > +
> > +maintainers:
> > +  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +
> > +description: |
> > +  This module is part of the MAX77650 MFD device. For more details
> > +  see Documentation/devicetree/bindings/mfd/max77650.txt.
> > +
> > +  The charger is represented as a sub-node of the PMIC node on the dev=
ice tree.
> > +
> > +properties:
> > +  compatible:
> > +    const: maxim,max77650-charger
> > +
> > +  input-voltage-min-microvolt:
> > +    description:
> > +      Minimum CHGIN regulation voltage.
> > +    enum: [ 4000000, 4100000, 4200000, 4300000,
> > +            4400000, 4500000, 4600000, 4700000 ]
> > +
> > +  input-current-limit-microamp:
> > +    description:
> > +      CHGIN input current limit (in microamps).
> > +    enum: [ 95000, 190000, 285000, 380000, 475000 ]
> > +
> > +required:
> > +  - compatible
> > +
> > +examples:
> > +  - |
> > +    charger {
> > +        compatible =3D "maxim,max77650-charger";
> > +        input-voltage-min-microvolt =3D <4200000>;
> > +        input-current-limit-microamp =3D <285000>;
> > +    };
> > --
> > 2.23.0
> >
