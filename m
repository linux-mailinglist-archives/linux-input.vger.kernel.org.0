Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABC0A14A7C3
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 17:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbgA0QFc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 11:05:32 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36871 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729583AbgA0QFc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 11:05:32 -0500
Received: by mail-oi1-f193.google.com with SMTP id z64so7140176oia.4;
        Mon, 27 Jan 2020 08:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tnHQjnYrmFz0tbYvOfYCLbTvLa+9l1AP/RJAXijvqrk=;
        b=IKxXUKHf9mEnX6c6RieFywfOJcyd7kctQI/qJlT51kD96+VdfJF0WS7mYfO+5mWifw
         QlrSKJ0QdRGdJcnQurBs4uVKhqNmZiUTFC/9mbKLau0KLgSfz+izPNtL/7jedp2LPqXN
         qOitZZF23af9G1KxLEdDGX4vRbKBzeVTClIAXbOC7z+kf28jIQJfFvLGbM1LLdLbbIx1
         BiIR1kcIbVbjCf/X0IA4O3Ekkr2dTv0PgX8IbRQZ4Cn/hop3mMvW7Pv1hHpLgcUwKKSj
         FDlmvPRUir6AZUUKyr39BwTbR0XUh59d5J0vqT9D9geAbHjpDCxWW9GslxS1rzVHg4rz
         oXxA==
X-Gm-Message-State: APjAAAVNcwJx+umiBW+4aOkQqNoSme2xYrQClgLidBZWP+Pp+nY/epWy
        uE+YLbe4+QOf9p//EuGq3Q==
X-Google-Smtp-Source: APXvYqy44XSUdwnIIrnFAycEN/rReWxePvuFDn1uyMAxmbWChcJiTQEPH0UghmFg3xzhZ4tiZnyCfg==
X-Received: by 2002:aca:a997:: with SMTP id s145mr7983028oie.71.1580141131513;
        Mon, 27 Jan 2020 08:05:31 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm5673129otp.14.2020.01.27.08.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 08:05:30 -0800 (PST)
Received: (nullmailer pid 8855 invoked by uid 1000);
        Mon, 27 Jan 2020 16:05:29 -0000
Date:   Mon, 27 Jan 2020 10:05:29 -0600
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
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200127160529.GA30843@bogus>
References: <20200114021934.178057-1-ikjn@chromium.org>
 <20200121074727.35893-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121074727.35893-1-ikjn@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 21, 2020 at 03:47:27PM +0800, Ikjoon Jang wrote:
> Convert the ChromeOS EC bindings to json-schema.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> v3: node name changed in rpmsg example
> v2: cleanup description, fix typos, remove LPC, add add RPMSG example
> ---
>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ------------
>  .../devicetree/bindings/mfd/cros-ec.yaml      | 111 ++++++++++++++++++
>  2 files changed, 111 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml

> -Required properties (LPC):
> -- compatible: "google,cros-ec-lpc"
> -- reg: List of (IO address, size) pairs defining the interface uses

Where did this go?


> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.yaml b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> new file mode 100644
> index 000000000000..6a5b87cebcfa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.yaml
> @@ -0,0 +1,111 @@
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
> +description: |
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
> +    description: |

You can drop '|' if there's no formatting to maintain. And you should 
reflow this.

> +      Some implementations of the EC include a small
> +      nvram space used to store verified boot context data.
> +      This boolean flag is used to specify whether this nvram is
> +      present or not.
> +    type: boolean
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
> +      required:
> +        - reg
> +  - if:
> +      properties:
> +        compatible:
> +          const: google,cros-ec-spi
> +    then:
> +      properties:
> +        reg:
> +          description: SPI chip select
> +          maxItems: 1
> +        google,cros-ec-spi-pre-delay:
> +          description: |
> +            This property specifies the delay in usecs between the
> +            assertion of the CS and the first clock pulse.

Needs a type reference at a minumum and ideally some constraints.

> +        google,cros-ec-spi-msg-delay:
> +          description: |
> +            This property specifies the delay in usecs between messages.

Same here.

> +      required:
> +        - reg
> +

Add:
additionalProperties: false

> +examples:
> +  # Example for I2C
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cros-ec@1e {
> +            compatible = "google,cros-ec-i2c";
> +            reg = <0x1e>;
> +            interrupts = <6 0>;

Not documented.

> +            interrupt-parent = <&gpx1>;
> +        };
> +    };
> +  # Example for SPI
> +  - |
> +    spi0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        cros-ec@0 {
> +            compatible = "google,cros-ec-spi";
> +            reg = <0x0>;
> +            google,cros-ec-spi-msg-delay = <30>;
> +            interrupts = <99 0>;
> +            interrupt-parent = <&gpio7>;
> +            spi-max-frequency = <5000000>;
> +        };
> +    };
> +  # Example for RPMSG
> +  - |
> +    scp0 {
> +        cros-ec@0 {
> +            compatible = "google,cros-ec-rpmsg";
> +        };
> +    };
> +...
> -- 
> 2.25.0.341.g760bfbb309-goog
> 
