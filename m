Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BBA2A89EC
	for <lists+linux-input@lfdr.de>; Thu,  5 Nov 2020 23:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732293AbgKEWe0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Nov 2020 17:34:26 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42596 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKEWeZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Nov 2020 17:34:25 -0500
Received: by mail-ot1-f65.google.com with SMTP id h62so2955306oth.9;
        Thu, 05 Nov 2020 14:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NZNfsOcdklE5BeSQFl10NmWCLQ7iwxRcWvHpOOpxQck=;
        b=g9SC1KvD3H68uqRXZ5a9OX9wRRPGFCJlrOouA5eG6ckvvIWlxR7GxrHU8ORYE98C8H
         COKyiOVo2n5eAnjYH9+oxK9OTk7I+bxoJ//alzNdTnqa53HJtPem2ThJbtOc/E9K3OxL
         yfnsPMcMsq1wJ3aBTib2YInPgDKsnppT3oHmmjB1dCb/YFMcejGA5gIJFL6VxmVajOHx
         n8NixyamGBrMZOMuK05DP4SHTJ6bjN5Wz1XZOg/f2ymZu+TxgO+tkiGYYkFkSRkOOZ+J
         BKCOqQYFWQwtfVxLQE4q9n+KjBvzUGp4xNhpD3lpInt4KAX3bFT5NUrAd50f1ZAbLmoT
         P0qw==
X-Gm-Message-State: AOAM530WDXjyVNR1lBfzUGcVlVFrpKukqz7APULSua9sEPooW5u0A4N9
        HKda+i7zE6yG4sbsBJhNtQ==
X-Google-Smtp-Source: ABdhPJyRySDAlfyV/yMDEfl5GnOm2KZmSBQk4mKmDB5uYrYmStvZdCZk7uE5+m21Q12+6lESsVfwGA==
X-Received: by 2002:a9d:340b:: with SMTP id v11mr3269659otb.180.1604615663497;
        Thu, 05 Nov 2020 14:34:23 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 186sm677180ooe.20.2020.11.05.14.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:34:22 -0800 (PST)
Received: (nullmailer pid 1923496 invoked by uid 1000);
        Thu, 05 Nov 2020 22:34:21 -0000
Date:   Thu, 5 Nov 2020 16:34:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, swboyd@chromium.org,
        andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        hdegoede@redhat.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: HID: i2c-hid: Introduce bindings for
 the Goodix GT7375P
Message-ID: <20201105223421.GA1918760@bogus>
References: <20201104012929.3850691-1-dianders@chromium.org>
 <20201103172824.v4.3.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103172824.v4.3.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 03, 2020 at 05:29:28PM -0800, Douglas Anderson wrote:
> This adds new bindings for the Goodix GT7375P touchscreen.  While this
> touchscreen's communications are based on the generic "i2c-over-hid"
> protocol, it needs special power sequencing and thus gets its own
> compatible and bindings.

'dt-bindings: input: ...' for the subject.

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Removed Benjamin as a maintainer.
> - Fixed compatible in example.
> - Updated description.
> 
> Changes in v2:
> - ("dt-bindings: HID: i2c-hid: Introduce bindings for the Goodix GT7375P") new in v2.
> 
>  .../bindings/input/goodix,gt7375p.yaml        | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> new file mode 100644
> index 000000000000..15a38516e594
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Goodix GT7375P touchscreen
> +
> +maintainers:
> +  - Douglas Anderson <dianders@chromium.org>
> +
> +description:
> +  Supports the Goodix GT7375P touchscreen.

Perhaps mention hid over i2c here given that's only captured in the 
commit message.

With those nits addressed.

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: goodix,gt7375p
> +
> +  reg:
> +    enum:
> +      - 0x5d
> +      - 0x14
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    true
> +
> +  vdd-supply:
> +    description: The 3.3V supply to the touchscreen.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      ap_ts: touchscreen@5d {
> +        compatible = "goodix,gt7375p";
> +        reg = <0x5d>;
> +
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +
> +        reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +        vdd-supply = <&pp3300_ts>;
> +      };
> +    };
> -- 
> 2.29.1.341.ge80a0c044ae-goog
> 
