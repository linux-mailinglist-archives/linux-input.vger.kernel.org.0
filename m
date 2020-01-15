Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E7013BCE9
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 10:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbgAOJ5D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jan 2020 04:57:03 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42191 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729504AbgAOJ5D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jan 2020 04:57:03 -0500
Received: by mail-vs1-f65.google.com with SMTP id b79so10071604vsd.9
        for <linux-input@vger.kernel.org>; Wed, 15 Jan 2020 01:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o56000SPWNtNfLS/UOhvjIjcXffjJW9nLc5ULePZ0jA=;
        b=JrH3yMVM8562bX2/6XqoOwrSuuo6qJTMbhiK+o13In/riqnO/f/Z9la6qh57xv2UUc
         jLXXAjF/88N2pn3dsnnQ0I2d3tzuNx/QYTo4WERSKnN5H3PgLNTZPR6ToKFZSVk1pW9e
         Kk4G6thADhgL2VrGL4BNWE8kxiXK8/XCoU/gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o56000SPWNtNfLS/UOhvjIjcXffjJW9nLc5ULePZ0jA=;
        b=hqrYjWzIxWpFD2Ecfxxg8jeqLyHjWtVy6Db6CRr/hxyUvwWQXFVUuR7LUCgxaVEjmJ
         kEy0FagudMSDgX/V4QtewlgmQgcrM9EGipijf6uc1Rvs+7S1L6O7b1gKaH/iHC8gcG3U
         yW7FZpW2JcZOmQHPHv2HASev5lgsErn/g0NYGz/Rv/2yD6C4UWkbwayBb3eiEq6iNxt/
         4nf2AoNINwugRhOdWy12aDUBxbpfM+0hPWsVHkfjLSpUVQJQAgyPOfxCr1xTc5G5JHCg
         81wkp9dcu4uaCN6Hx3TnkKxnPTncdMkqepYv6l7n0dhi0x2VzsU0roBQVSQj6pqh9yFA
         gz7Q==
X-Gm-Message-State: APjAAAVhnv6qtoCUQPaGFgHaLKQoukzRA1zu3Kh4/CcrOu5L5DeCZHnp
        qV4hylgb12y1eDb27rjpDANtuX1YsrfJSSwcfVDhPA==
X-Google-Smtp-Source: APXvYqynIeAqmxnZJPVrUBX0HL4mFe2i1csabok42yOPSoE47RkIe1URyWw7Hs5Tsysc1003S9Ir62lLft7SIrvKOsY=
X-Received: by 2002:a67:fd4e:: with SMTP id g14mr3950334vsr.182.1579082222132;
 Wed, 15 Jan 2020 01:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20200114021934.178057-1-ikjn@chromium.org> <ad5b6728-2435-9f97-870a-7107f5cc805b@collabora.com>
In-Reply-To: <ad5b6728-2435-9f97-870a-7107f5cc805b@collabora.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 15 Jan 2020 17:56:51 +0800
Message-ID: <CAATdQgDNqPtYRsStvbQsy7M7S_TMShGELwuKg8AjARDi_KN6Pg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

<snip>
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > ---
> >  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ----------
> >  .../devicetree/bindings/mfd/cros-ec.yaml      | 138 ++++++++++++++++++
>
> This is not an mfd binding anymore, the old binding is in the wrong place,
> please move to devicetree/bindings/chrome/google,cros-ec.yaml
>
I think creating a new 'chrome' subdirectory should involve more
discussions as there are
other chrome related things in dt-binding.
I'd like to convert the format first before moving forward.

<snip>
> > +description: |
> > +  Google's ChromeOS EC is a Cortex-M device which talks to the AP and
> > +  implements various function such as keyboard and battery charging.
>
> I am not English native but I guess there are some typos. Lets take this
> opportunity to rewrite fix some parts, please feel free to ignore them if I am
> wrong.
>
yeah, I'm not too. Honestly, there was nothing strange for me before
you point out. :-)
anyway I'm trying my best to fix those things mentioned (typos,
removing LPC, rpmsg examples)
and do some generalizations (e.g. Cortex --> microcontroller). send v2
patch soon.

Thanks!

> typo: functions?
>
> > +  The EC can be connect through various means (I2C, SPI, LPC, RPMSG)
>
> typo: 'connected' or 'is connected'
>
>
> I'd add '(I2C, SPI and others)' where other is RPMSG, ISHP, and future transport
> layers.
>
> > +  and the compatible string used depends on the interface.
>
> on the communication interface?
>
> > +  Each connection method has its own driver which connects to the
> > +  top level interface-agnostic EC driver. Other Linux driver
> > +  (such as cros-ec-keyb for the matrix keyboard) connect to the
> > +  top-level driver.
>
> Not sure this part is clear an accurate to the reality, I'd just remove it.

ACK

>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description:
> > +          For implementations of the EC is connected through I2C.
>
> s/is/are connected/?
>
> And the same change applies below.
>
> > +        const: google,cros-ec-i2c
> > +      - description:
> > +          For implementations of the EC is connected through SPI.
> > +        const: google,cros-ec-spi
>
> > +      - description:
> > +          For implementations of the EC is connected through LPC.
> > +        const: google,cros-ec-lpc
>
> This does not exist in mainline so remove it.

ACK

<snip>
> +        google,cros-ec-spi-pre-delay:
> +          description: |
> +            Some implementations of the EC need a little time to wake up
> +            from sleep before they can receive SPI transfers
> +            at a high clock rate. This property specifies the delay,
> +            in usecs, between the assertion of the CS to the start of
> +            the first clock pulse.
> +        google,cros-ec-spi-msg-delay:
> +          description: |
> +            Some implementations of the EC require some additional
> +            processing time in order to accept new transactions.
> +            If the delay between transactions is not long enough
> +            the EC may not be able to respond properly to
> +            subsequent transactions and cause them to hang.
> +            This property specifies the delay, in usecs,
> +            introduced between transactions to account for the
> +            time required by the EC to get back into a state
> +            in which new data can be accepted.

I will remove some details here ('some implementations need something' parts).

<snip>

> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: google,cros-ec-lpc
> > +    then:
> > +      properties:
> > +        reg:
> > +          description: |
> > +            List of (IO address, size) pairs defining the interface uses
> > +      required:
> > +        - reg
> > +
>
> Remove the LPC part.

ACK

>
> > +examples:
> > +  - |+
> > +    // Example for I2C
>
> Use c style comments I guess

Okay, I will use '#' outside of example context in v2.

>
> > +    i2c@12ca0000 {
>
> i2c0 {
>
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
>
> nit: Add an empty line here

ACK

>
> > +        cros-ec@1e {
> > +            reg = <0x1e>;
> > +            compatible = "google,cros-ec-i2c";
>
> The compatible on top
>
> > +            interrupts = <14 0>;
> > +            interrupt-parent = <&wakeup_eint>;
> > +            wakeup-source;
> > +        };
>
> Just let's use an upstream example, i.e the snow one:
>
>    cros-ec@1e {
>         compatible = "google,cros-ec-i2c";
>         reg = <0x1e>;
>         interrupts = <6 IRQ_TYPE_NONE>;
>         interrupt-parent = <&gpx1>;
>    };
>
> > +    };
> > +  - |+
> > +    // Example for SPI
> > +    spi@131b0000 {
>
> spi0 {
>
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
>
> nit: Add an empty line here

ACK

>
> > +        ec@0 {
>
> Use cros-ec@0, same name as before to be coherent
>
> > +            compatible = "google,cros-ec-spi";
> > +            reg = <0x0>;
> > +            interrupts = <14 0>;
> > +            interrupt-parent = <&wakeup_eint>;
>
> What about selecting a more simple example, without the controller-data to not
> confuse the reader.
>
> > +            wakeup-source;
> > +            spi-max-frequency = <5000000>;
> > +            controller-data {
> > +                cs-gpio = <&gpf0 3 4 3 0>;
> > +                samsung,spi-cs;
> > +                samsung,spi-feedback-delay = <2>;
> > +            };
> > +        };
> > +    };
> > +
>
> I propose the veyron one.
>
>         cros-ec@0 {
>
>                 compatible = "google,cros-ec-spi";
>                 reg = <0>;
>                 google,cros-ec-spi-pre-delay = <30>;
>                 interrupt-parent = <&gpio7>;
>                 interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
>                 spi-max-frequency = <3000000>;
>         };
>
> > +...
> >
>

Okay, but I will use interrupts = <99 0> instead of <RK_XXX IRQ_XXX>
in here. :-)

> Could we have a RPMSG example too?

Okay

>
> Thanks,
>  Enric
