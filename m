Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0804A513AE6
	for <lists+linux-input@lfdr.de>; Thu, 28 Apr 2022 19:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350422AbiD1Ra2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Apr 2022 13:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350428AbiD1Ra2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Apr 2022 13:30:28 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 699A43B000;
        Thu, 28 Apr 2022 10:27:12 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16D841474;
        Thu, 28 Apr 2022 10:27:12 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C58143F774;
        Thu, 28 Apr 2022 10:27:10 -0700 (PDT)
Date:   Thu, 28 Apr 2022 18:27:08 +0100
From:   Andre Przywara <andre.przywara@arm.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 05/11] dt-bindings: serio: add Arm PL050 DT schema
Message-ID: <20220428182708.0c1065f8@donnerap.cambridge.arm.com>
In-Reply-To: <55574426-df20-cdd7-c97d-092726981a42@linaro.org>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
        <20220427112528.4097815-6-andre.przywara@arm.com>
        <55574426-df20-cdd7-c97d-092726981a42@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 28 Apr 2022 09:07:53 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi Krzysztof,

many thanks for having a look and your comments (here and on the other
patches). I will fix them and send a new version ASAP.
One thing below:

> On 27/04/2022 13:25, Andre Przywara wrote:
> > The Arm PL050 "Keyboard/Mouse Interface" is an Arm system IP providing a
> > PS/2 compatible serial interface.
> > 
> > Add a simple DT schema binding, based on the TRM[1], the existing DTs and
> > the Linux driver.
> > 
> > [1] https://developer.arm.com/documentation/ddi0143/latest
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../devicetree/bindings/serio/amba-pl050.yaml | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/serio/amba-pl050.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/serio/amba-pl050.yaml b/Documentation/devicetree/bindings/serio/amba-pl050.yaml
> > new file mode 100644
> > index 0000000000000..9732a84550098
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/serio/amba-pl050.yaml  
> 
> Filename: vendor,device
> 
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/serio/amba-pl050.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Arm Ltd. PrimeCell PL050 PS/2 Keyboard/Mouse Interface
> > +
> > +maintainers:
> > +  - Andre Przywara <andre.przywara@arm.com>
> > +
> > +description:
> > +  The Arm PrimeCell PS2 Keyboard/Mouse Interface (KMI) is an AMBA compliant
> > +  peripheral that can be used to implement a keyboard or mouse interface that
> > +  is IBM PS2 or AT compatible.
> > +
> > +# We need a select here so we don't match all nodes with 'arm,primecell'
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: arm,pl050
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: arm,pl050
> > +      - const: arm,primecell
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: KMI reference clock, used to generate the bus timing
> > +      - description: APB register access clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: KMIREFCLK  
> 
> lowercase letters only

I am afraid this ship has sailed: the various DTs in the kernel tree use
it in that way, and the Linux driver insists on that spelling. So by
changing this we would break both the existing DT's compliance and also
existing Linux kernels.
So is lowercase something that is mandated by DT schema, or can we just
make an exception here?

Cheers,
Andre

> > +      - const: apb_pclk
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    kmi@70000 {  
> 
> Generic node names, so "serio".
> 
> > +            compatible = "arm,pl050", "arm,primecell";
> > +            reg = <0x070000 0x1000>;
> > +            interrupts = <8>;
> > +            clocks = <&mb_clk24mhz>, <&soc_smc50mhz>;
> > +            clock-names = "KMIREFCLK", "apb_pclk";
> > +    };
> > +
> > +...  
> 
> 
> Best regards,
> Krzysztof

