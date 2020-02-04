Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79CCD151720
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 09:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgBDIjv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 03:39:51 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44230 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgBDIjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 03:39:51 -0500
Received: by mail-vs1-f65.google.com with SMTP id p6so10778135vsj.11
        for <linux-input@vger.kernel.org>; Tue, 04 Feb 2020 00:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JdACrWI5vpsKlW8g7CbCx4APcl8wQGsCUNfkqtOAUqY=;
        b=ZoTry6ifrXYZ8NRpb4uFD6f8WFpGkP1CXTPfFBVnloLaIWSa7gZ+buv7s86HWwnxs/
         M12XR6tin65nLhbuNc/o+4+qbt5ruCZys/maCffFMoxrDNT0KQ4n/dey147sgi9U/B9t
         3Lc7xnftI3HMCCyCCMU1azLJfdD3iTNbF2pWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JdACrWI5vpsKlW8g7CbCx4APcl8wQGsCUNfkqtOAUqY=;
        b=QPoaQk9ieTH9J+3MngS+Q6tuxbWmRHpJ8iakTh64iMbJDmjjr89ArrmBCFI71l9bkT
         +kKZmDtcuQF695iaPadur9iZhTnTQr0VbUEtMMvw3zS5riBVh0BbGD1AZ+30D0ys77Dl
         siq/avcSxktRZY85ShJNdOYPwtqsAiHDIbo/h1SyvbFSolFKgrej1xChjpQ4OW6UXovF
         eZx5A+MllY1Ube9sCJchY1uhWP/x7rGxjHrpJxxAVTEOhzuptgBMkpC/sBdlwZMe9MZ5
         XFz1Y/uaqPRMgPsVmeVOwdaOB/crg2LM1E2O75DdSFSrhXSNzen/ACuJy4yHA2CJSQlT
         I2sw==
X-Gm-Message-State: APjAAAW/zvKbqstT05U38jpqzlfOJAbFGeAJTqhqodYbh3Vcvp9aOQwG
        isycnJ9FgsHWUOUp/KxsIrpWd08POkhucR5YDRqtXQ==
X-Google-Smtp-Source: APXvYqzm6bymaLptiCwaALgQxa/dXLU/xksVDThtHsJkaE+BEyd84+Ci1h/y9Kiw/5Sf5kCjVQl5T9ZFrWSe8P1XwVs=
X-Received: by 2002:a67:ecd5:: with SMTP id i21mr17903723vsp.166.1580805589999;
 Tue, 04 Feb 2020 00:39:49 -0800 (PST)
MIME-Version: 1.0
References: <20200114021934.178057-1-ikjn@chromium.org> <20200121074727.35893-1-ikjn@chromium.org>
 <20200127160529.GA30843@bogus>
In-Reply-To: <20200127160529.GA30843@bogus>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 4 Feb 2020 16:39:39 +0800
Message-ID: <CAATdQgDW6H_jM5UV-jqB98ep93fSh-zTNE8agkoU4XbgSWj0TQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert ChromeOS EC bindings to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 28, 2020 at 12:05 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 21, 2020 at 03:47:27PM +0800, Ikjoon Jang wrote:
> > Convert the ChromeOS EC bindings to json-schema.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > ---
> > v3: node name changed in rpmsg example
> > v2: cleanup description, fix typos, remove LPC, add add RPMSG example
> > ---
> >  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ------------
> >  .../devicetree/bindings/mfd/cros-ec.yaml      | 111 ++++++++++++++++++
> >  2 files changed, 111 insertions(+), 76 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> >  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml
>
> > -Required properties (LPC):
> > -- compatible: "google,cros-ec-lpc"
> > -- reg: List of (IO address, size) pairs defining the interface uses
>
> Where did this go?

I'm not sure about the details or future plans on LPC interface,
but I guess LPC has been just a future plan without any usages, so removed it.

>
>
> > diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.yaml b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> > new file mode 100644
> > index 000000000000..6a5b87cebcfa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> > @@ -0,0 +1,111 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/cros-ec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ChromeOS Embedded Controller
> > +
> > +maintainers:
> > +  - Benson Leung <bleung@chromium.org>
> > +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > +  - Guenter Roeck <groeck@chromium.org>
> > +
> > +description: |
> > +  Google's ChromeOS EC is a microcontroller which talks to the AP and
> > +  implements various functions such as keyboard and battery charging.
> > +  The EC can be connected through various interfaces (I2C, SPI, and others)
> > +  and the compatible string specifies which interface is being used.
> > +

I will drop | here also.

> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description:
> > +          For implementations of the EC is connected through I2C.
> > +        const: google,cros-ec-i2c
> > +      - description:
> > +          For implementations of the EC is connected through SPI.
> > +        const: google,cros-ec-spi
> > +      - description:
> > +          For implementations of the EC is connected through RPMSG.
> > +        const: google,cros-ec-rpmsg
> > +
> > +  google,has-vbc-nvram:
> > +    description: |
>
> You can drop '|' if there's no formatting to maintain. And you should
> reflow this.

Okay,

>
> > +      Some implementations of the EC include a small
> > +      nvram space used to store verified boot context data.
> > +      This boolean flag is used to specify whether this nvram is
> > +      present or not.
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: google,cros-ec-i2c
> > +    then:
> > +      properties:
> > +        reg:
> > +          description: I2C slave address
> > +          maxItems: 1
> > +      required:
> > +        - reg
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: google,cros-ec-spi
> > +    then:
> > +      properties:
> > +        reg:
> > +          description: SPI chip select
> > +          maxItems: 1
> > +        google,cros-ec-spi-pre-delay:
> > +          description: |
> > +            This property specifies the delay in usecs between the
> > +            assertion of the CS and the first clock pulse.
>
> Needs a type reference at a minumum and ideally some constraints.

Got it, I will add a type reference here,
and for the constraints, these spi transaction delay cannot be bound.
I will just add default: 0 here.

>
> > +        google,cros-ec-spi-msg-delay:
> > +          description: |
> > +            This property specifies the delay in usecs between messages.
>
> Same here.
>
> > +      required:
> > +        - reg
> > +
>
> Add:
> additionalProperties: false

Ack.

>
> > +examples:
> > +  # Example for I2C
> > +  - |
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        cros-ec@1e {
> > +            compatible = "google,cros-ec-i2c";
> > +            reg = <0x1e>;
> > +            interrupts = <6 0>;
>
> Not documented.

Sorry but I can't understand this part, can you elaborate on here?
Do you mean adding comments here? or
need more documentation on cros-ec-i2c?

>
> > +            interrupt-parent = <&gpx1>;
> > +        };
> > +    };
> > +  # Example for SPI
> > +  - |
> > +    spi0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        cros-ec@0 {
> > +            compatible = "google,cros-ec-spi";
> > +            reg = <0x0>;
> > +            google,cros-ec-spi-msg-delay = <30>;
> > +            interrupts = <99 0>;
> > +            interrupt-parent = <&gpio7>;
> > +            spi-max-frequency = <5000000>;
> > +        };
> > +    };
> > +  # Example for RPMSG
> > +  - |
> > +    scp0 {
> > +        cros-ec@0 {
> > +            compatible = "google,cros-ec-rpmsg";
> > +        };
> > +    };
> > +...
> > --
> > 2.25.0.341.g760bfbb309-goog
> >
