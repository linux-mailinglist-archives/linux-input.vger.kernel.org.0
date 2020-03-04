Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5222D179538
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 17:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbgCDQ2p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Mar 2020 11:28:45 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33361 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgCDQ2p (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Mar 2020 11:28:45 -0500
Received: by mail-ot1-f65.google.com with SMTP id a20so2620074otl.0;
        Wed, 04 Mar 2020 08:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+P2BiR6p4RRzrkIJTMMxLD6lhu3jeQ4dIZb2WkNXQV4=;
        b=uER1D/Sae8FqFH1zZ/cANzOmz3Zyx2hqNbCbJxxbqvGHsW3W6LO+ZWFpcyPdfTHqmz
         gPH/Oa5kcb4xqT0YAEp2PL3nsHr30lXbrsGQBk38tEQ+VamZ8J8ECpbXYYichK9yj9Vl
         XgjjbcEWsy2tU9tyR/Tbhg5YN5avCh8HEcKOCqAdUpYLjtFkhae7lh+n3MGoQWVj2yWX
         I5ro7vbRzMbTglL5hilBp+Ap/0d0gstXfVGsRIMjV/PxSBvoKexG8nhOf75P+75gdfJ/
         /nzPvItSNz943MdmNb12OArTai2coh6L409OGaNJ8nZE8LSnlYp3weSdi6t+l+xRsYqC
         I+Iw==
X-Gm-Message-State: ANhLgQ3kBgiHjPrxoXyrDS7P35ckrPw9CqEbylvYDssJ2u67JVHF7JnP
        xnpHHB3vO3S3rr/qUp0SVw==
X-Google-Smtp-Source: ADFU+vsfxAK2xLlsY0GEfirEiPHXT54FqTEXa1chNQLQEv7ZSBlmagCgyS7GoKB1Oz84c/9GUh2e5w==
X-Received: by 2002:a05:6830:1e14:: with SMTP id s20mr3089070otr.322.1583339323691;
        Wed, 04 Mar 2020 08:28:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n16sm9201098otk.25.2020.03.04.08.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 08:28:43 -0800 (PST)
Received: (nullmailer pid 12004 invoked by uid 1000);
        Wed, 04 Mar 2020 16:28:41 -0000
Date:   Wed, 4 Mar 2020 10:28:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
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
Subject: Re: [PATCH v5] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200304162841.GA30676@bogus>
References: <20200226031009.164703-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226031009.164703-1-ikjn@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 26, 2020 at 11:10:09AM +0800, Ikjoon Jang wrote:
> Convert the ChromeOS EC bindings to json-schema.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> v5: unset additionalProperties
> v4: text reflows, add type references, and fix examples
> v3: node name changed in rpmsg example
> v2: cleanup description, fix typos, remove LPC, and add RPMSG example
> 
> some properties defined under allOf/if/compatible/google,cros-ec-spi
> are recongnized as additional properties by dt-validate.
> 
> Is there more cleaner ways to handle this? (property depending on
> another one)

See below.

> ---
>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ----------
>  .../devicetree/bindings/mfd/cros-ec.yaml      | 140 ++++++++++++++++++
>  2 files changed, 140 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml


> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.yaml b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> new file mode 100644
> index 000000000000..8416a1299321
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/cros-ec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS Embedded Controller
> +
> +maintainers:
> +  - Benson Leung <bleung@chromium.org>
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +  - Guenter Roeck <groeck@chromium.org>
> +
> +description:
> +  Google's ChromeOS EC is a microcontroller which talks to the AP and
> +  implements various functions such as keyboard and battery charging.
> +  The EC can be connected through various interfaces (I2C, SPI, and others)
> +  and the compatible string specifies which interface is being used.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description:
> +          For implementations of the EC is connected through I2C.
> +        const: google,cros-ec-i2c
> +      - description:
> +          For implementations of the EC is connected through SPI.
> +        const: google,cros-ec-spi
> +      - description:
> +          For implementations of the EC is connected through RPMSG.
> +        const: google,cros-ec-rpmsg
> +
> +  google,has-vbc-nvram:
> +    description:
> +      Some implementations of the EC include a small nvram space used to
> +      store verified boot context data. This boolean flag is used to specify
> +      whether this nvram is present or not.
> +    type: boolean
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: google,cros-ec-i2c
> +    then:
> +      properties:
> +        reg:
> +          description: I2C slave address
> +          maxItems: 1

No need for defining 'reg' here.

> +
> +      required:
> +        - reg

The SPI and I2C bus schemas make 'reg' required, so you don't really 
need this part either.

> +  - if:
> +      properties:
> +        compatible:
> +          const: google,cros-ec-spi
> +    then:
> +      properties:
> +        reg:
> +          description: SPI chip select
> +          maxItems: 1
> +
> +        google,cros-ec-spi-pre-delay:
> +          description:
> +            This property specifies the delay in usecs between the
> +            assertion of the CS and the first clock pulse.
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/uint32
> +            - default: 0
> +            - minimum: 0
> +
> +        google,cros-ec-spi-msg-delay:
> +          description:
> +            This property specifies the delay in usecs between messages.
> +          allOf:
> +            - $ref: /schemas/types.yaml#/definitions/uint32
> +            - default: 0
> +            - minimum: 0

I'd just move these 2 to the main section and be done with it. It 
doesn't really hurt to have these in the I2C or RPMSG case as they are 
just ignored. The way you would express it is:

if:
  properties:
    compatible:
      contains:
        enum:
          - google,cros-ec-i2c
          - google,cros-ec-rpmsg
then:
  properties:
    google,cros-ec-spi-pre-delay: false
    google,cros-ec-spi-msg-delay: false

Rob
