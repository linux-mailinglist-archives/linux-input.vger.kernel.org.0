Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4487D3179
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 21:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfJJTkj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 15:40:39 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46012 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJTki (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 15:40:38 -0400
Received: by mail-oi1-f195.google.com with SMTP id o205so5953513oib.12;
        Thu, 10 Oct 2019 12:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=st9hPfBALp9jrv4N2g6WyBQ3PLHnROkTnnBslJBn4aE=;
        b=XJjCoSd78lVDunHEIIHs6QgxtYJ+9+M1E3gq6P6J+10WcvwVwZRVrhu0gZVG8ywnYL
         KNYPpJ3zDS/bz315f0fEEscDmuGj13TQDSZ5GC3Sc1CIm5y5WRS+dMpkoRIt2hmyV+jZ
         cHkeF28g4pF+DFaQCzCclAFRNjh2vB8oiXllZN/hHA/4IZN6OSmYiuA4GrUsGYraPOOq
         mHjofkKHr6Nz5/09HyuJYqTTyyQIPATvr/Pi1mwriBB2Hqgf4OoUn6GHV33JpYBS7yQm
         0c2bR8Mm7bWVqvxPSPr09aUlbtueDS5h1BMOmJcGCkKPcFkSdNoPCISfhw2/4mL/Re7E
         8DbA==
X-Gm-Message-State: APjAAAUgRzi33SrDQZ+x1/wM8rEn0JZtJlflF1K+kOi9YGVd7jEjqQiB
        RzFJhA4QjJxLcZphfdAFrg==
X-Google-Smtp-Source: APXvYqya+uuUcP5DdEFuamLT6rgraYoCD9fcVQ3iT+9YnlTNY1pMRCd7a5TtS6Jmjj6UVZw43v/yog==
X-Received: by 2002:aca:6701:: with SMTP id z1mr8757280oix.64.1570736437692;
        Thu, 10 Oct 2019 12:40:37 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t10sm1887226oib.49.2019.10.10.12.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 12:40:37 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:40:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: input: Add poll-interval property
Message-ID: <20191010194036.GA16869@bogus>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-4-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1570083176-8231-4-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 03, 2019 at 08:12:54AM +0200, Michal Vokáč wrote:
> Add an option to periodicaly poll the device to get state of the inputs
> as the interrupt line may not be used on some platforms.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Changes since v2:
>  - None
> 
> Changes since v1:
>  - Use poll-interval instead of linux,poll-interval.
>  - Place the poll-interval binding into the common schema.
>  - Properly describe that either interrupts or poll-interval property is
>    required.
>  - Fix the example to pass validation.
> 
>  .../bindings/input/fsl,mpr121-touchkey.yaml        | 25 +++++++++++++++++++++-
>  Documentation/devicetree/bindings/input/input.yaml |  4 ++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> index c6fbcdf78556..035b2fee4491 100644
> --- a/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> +++ b/Documentation/devicetree/bindings/input/fsl,mpr121-touchkey.yaml
> @@ -17,6 +17,10 @@ description: |
>  allOf:
>    - $ref: input.yaml#
>  
> +oneOf:

It should be valid to have both properties present, right? The h/w 
description can't know what the OS supports. In that case, we should use 
'anyOf' here instead.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +  - required: [ interrupts ]
> +  - required: [ poll-interval ]
> +
>  properties:
>    compatible:
>      const: fsl,mpr121-touchkey
> @@ -41,12 +45,12 @@ properties:
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
>      i2c {
>          #address-cells = <1>;
> @@ -64,3 +68,22 @@ examples:
>                               <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
>          };
>      };
> +
> +  - |
> +    // Example with polling
> +    #include "dt-bindings/input/input.h"
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mpr121@5a {
> +            compatible = "fsl,mpr121-touchkey";
> +            reg = <0x5a>;
> +            poll-interval = <20>;
> +            autorepeat;
> +            vdd-supply = <&ldo4_reg>;
> +            linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
> +                             <KEY_4>, <KEY_5>, <KEY_6>, <KEY_7>,
> +                             <KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
> index ca8fe84a2e62..6d519046b3af 100644
> --- a/Documentation/devicetree/bindings/input/input.yaml
> +++ b/Documentation/devicetree/bindings/input/input.yaml
> @@ -24,6 +24,10 @@ properties:
>            minimum: 0
>            maximum: 0xff
>  
> +  poll-interval:
> +    description: Poll interval time in milliseconds.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>    power-off-time-sec:
>      description:
>        Duration in seconds which the key should be kept pressed for device to
> -- 
> 2.1.4
> 
