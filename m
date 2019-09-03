Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA13A6223
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 09:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfICHB1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 03:01:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38273 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfICHB1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 03:01:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id l11so7328121wrx.5;
        Tue, 03 Sep 2019 00:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=x1nbu8LDMNKcL3wRyPaoJ6E/qOL+OZWGIE7xa+JmlVM=;
        b=DZshqXdw6qr/vxh43/Z8XDTOMmhr39W1d1qbhaK7JWyBLbjGOpNvpIayiJF6wCSOhz
         o7LStLr5oJhoML26ZOI2Zs64PwBIGEVROne/5YkIOnCWQMd6m9Ym5jTXHPi2syEq6t+I
         o2maCiJLhuVHjtoioMdndFkLT1l/fXVbBBfQb8SnsigQSK3wJfpKiSNzSWkJw4L0wsV4
         oV7ShwClD7hzIGEOTL6SPxP4PiMuM9PN2o4RVvHAgo/q5Q/u9eoJKpVsmksk/E8emvKU
         vIFnCBAiufWqakI7qUEOBzZKwtf7w6nijlA4g15eGSdUFJIHYP+m5XbFasaSZoMaHU7G
         kHrw==
X-Gm-Message-State: APjAAAVOkO4f1N3WwH4cNnFv22oVjVJNtIAOpWpgDao4jJhefr5aMq+K
        hUDxgc1X6atHaSBQPXcZFQ==
X-Google-Smtp-Source: APXvYqx0KeVWDUUvgESpHFrFHI6UucSx3ohlZN4CR7baTIqD8tau/T0Nm42AoaeCSI5Lf5QLqkTnkQ==
X-Received: by 2002:adf:b1cc:: with SMTP id r12mr15262176wra.250.1567494084729;
        Tue, 03 Sep 2019 00:01:24 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id j20sm25672716wre.65.2019.09.03.00.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 00:01:24 -0700 (PDT)
Date:   Tue, 3 Sep 2019 08:01:23 +0100
From:   Rob Herring <robh@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH input-next 2/4] dt-bindings: input: mpr121: Add
 poll-interval property
Message-ID: <20190903070123.GA15981@bogus>
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
 <1567424417-3914-3-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1567424417-3914-3-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 02, 2019 at 01:40:15PM +0200, Michal Vokáč wrote:
> Add an option to periodicaly poll the device to get the buttons states
> as the interrupt line may not be used on some platforms.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> I am not sure how to propperly handle this.
> Either interrupt or linux,poll-interval is required, but not both.

Add this at the top level:

oneOf:
  - required: [ interrupts ]
  - required: [ linux,poll-interval ]

> 
>  .../bindings/input/fsl,mpr121-touchkey.yaml          | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> index c463c1c81755..2b3073a3c9f4 100644
> --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> @@ -34,6 +34,10 @@ properties:
>      minItems: 1
>      maxItems: 12
>  
> +  linux,poll-interval:
> +    description: Poll interval time in milliseconds.
> +    maxItems: 1

We already have 'poll-interval' in several bindings. Use that.

This should have a type definition and you don't need maxItems:

$ref: /schemas/types.yaml#/definitions/uint32

Really this should go in a common input schema doc.
> +
>    wakeup-source: Use any event on keypad as wakeup event.
>      type: boolean
>  
> @@ -44,12 +48,12 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
>    - vdd-supply
>    - linux,keycodes
>  
>  examples:
>    - |
> +    // Example with interrupts
>      #include "dt-bindings/input/input.h"
>      touchkey: mpr121@5a {
>          compatible = "fsl,mpr121-touchkey";
> @@ -62,3 +66,17 @@ examples:
>                           <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
>                           <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
>      };
> +
> +  - |
> +    // Example with polling
> +    #include "dt-bindings/input/input.h"
> +    touchkey: mpr121@5a {
> +        compatible = "fsl,mpr121-touchkey";
> +        reg = <0x5a>;
> +        linux,poll-interval = <20>;
> +        autorepeat;
> +        vdd-supply = <&ldo4_reg>;
> +        linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
> +                         <KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
> +                         <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
> +    );
> -- 
> 2.1.4
> 
