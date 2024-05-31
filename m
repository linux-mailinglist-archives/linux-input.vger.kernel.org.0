Return-Path: <linux-input+bounces-3976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D8D8D5833
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 03:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078CC1F21430
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 01:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13EB2869B;
	Fri, 31 May 2024 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0BexmJa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846062D7B8;
	Fri, 31 May 2024 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717119369; cv=none; b=fpASYeLqfBnDlvxv1ga/rqSjzphl1bX5EdabkVosJPk4Joeol67j58Ufgss3aBGAjGI1tS2uLZaH6MvC6McqbuWWlUH7krByI1dhAM4ssuA2MZuOznGeu8EN8Z6a1YJRs7kkeU9LGuVZOnwFWJh8QefHEPRwbd9Gf9PvJe5bUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717119369; c=relaxed/simple;
	bh=yJBuR6bIVxGlNAFlMMWwvgbcjFar6UC2gGWKayrnt8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2CQ+Ig7wmdspa0bYK1zgsfJ+7wuF8UNdCnsVhbKF4Wp6JhB31PK2ldVBZImOgUODCSilSPrD5EQQc5FWJTQdNgmUN5CSgF9A6l4NYvC5YKb1rQ4RersQZc8JprfjEAvDLBx/w5dIh+93oVZGfBss9HEk88556iQZNeANIrt75A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0BexmJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D178AC2BBFC;
	Fri, 31 May 2024 01:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717119369;
	bh=yJBuR6bIVxGlNAFlMMWwvgbcjFar6UC2gGWKayrnt8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0BexmJaExgl1ZplrCjGz0HjNtHSFPWVzNrtfWSaQf1fKKYJsnyg8Wx3VHuCUb32O
	 XWDtg2icUwyUQZ5FESl7On5ww4KndEIm8IQpJ+fPGc9aI5vcIIjrPwiMPe4kDQWj2O
	 oK3vZSaaZbos0jnC3e0/kwhHg7u1gF1lS5LhJ4LonBoxWTQnRjl61sHLvxdPoYp5Fo
	 TFX7qoijrqnuI4XhqITNKW6RS608E5JLHffsI/4tBT+AsQunRwEH1GkabRZV8A9Uzp
	 QiL65ARGdwZ/PRQUiJBV4tfoUeR9EMI8ZExdknqrm3O7Vw/TBIjDaG301YeMCo0R4S
	 1F6ui8LIwaMFg==
Date: Thu, 30 May 2024 20:36:07 -0500
From: Rob Herring <robh@kernel.org>
To: wangshuaijie@awinic.com
Cc: dmitry.torokhov@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	jeff@labundy.com, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	liweilei@awinic.com, kangjiajun@awinic.com
Subject: Re: [PATCH V1 1/5] dt-bindings: input: Add YAML to Awinic sar sensor.
Message-ID: <20240531013607.GA3665090-robh@kernel.org>
References: <20240529130608.783624-1-wangshuaijie@awinic.com>
 <20240529130608.783624-2-wangshuaijie@awinic.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529130608.783624-2-wangshuaijie@awinic.com>

On Wed, May 29, 2024 at 01:06:04PM +0000, wangshuaijie@awinic.com wrote:
> From: shuaijie wang <wangshuaijie@awinic.com>
> 
> Add the awinic,aw_sar.yaml file to adapt to the awinic sar sensor driver.
> 
> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
> ---
>  .../bindings/input/awinic,aw_sar.yaml         | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
> new file mode 100644
> index 000000000000..ed4ec29c9b4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/awinic,aw_sar.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic sar sensor driver family
> +
> +maintainers:
> +  - Shuaijie Wang <wangshuaijie@awinic.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - awinic,aw_aw96103
> +      - awinic,aw_aw96105
> +      - awinic,aw_aw96303
> +      - awinic,aw_aw96305
> +      - awinic,aw_aw96308
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  sar-num:

Custom properties need vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      set the index of the sar sensor.

What is 'sar'? It's never defined.

How is the index determined? We generally don't do indexes in DT unless 
there is some correlation to the h/w.

> +
> +  vcc0-supply:
> +    description:
> +      Optional regulator for chip, 1.7V-3.6V.
> +
> +  channel_use_flag:

vendor prefix needed plus use '-' rather than '_'. Here and elsewhere.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The flag of channels used.
> +      Configure according to the specific chip channel used.
> +      Bit[31:0] Each bit represents a channel.

So a mask rather than a flag.

Up to 32 channels possible? If not, add constraints.

> +      If the customer uses ch0 and ch2, then channel_use_flag=<0x05>
> +
> +  aw_sar,update_fw:
> +    type: boolean
> +    description:
> +      Choose if you want to update the firmware.

DT is mostly fixed. So someone would want to update the firmware every 
time?

> +
> +  aw_sar,monitor_esd:
> +    type: boolean
> +    description:
> +      Choose if you want to monitor ESD.
> +
> +  aw_sar,pin_set_inter_pull-up:
> +    type: boolean
> +    description:
> +      Choose if you want to set the interrupt pin to internal pull-up.
> +
> +  aw_sar,using_pm_ops:
> +    type: boolean
> +    description:
> +      Choose if you want to use suspend and resume related function.

OS configuration. Doesn't belong in DT.

> +
> +  aw_sar,use_plug_cail:
> +    type: boolean
> +    description:
> +      Choose If you want to perform calibration when plugging and unplugging the charger.
> +
> +  start-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      When connecting to aw963xx, select the location where the firmware starts.
> +      set 0 if start in rom.
> +      set 1 if start in ram

Looks like constraints.

> +
> +  irq-mux:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      set csx as irq pin. config this field when connect to aw96308/aw96305BFOR

Constraints? Can you imply this based on the compatible?

> +
> +required:
> +  - compatible
> +  - reg
> +  - sar-num
> +  - interrupts
> +  - channel_use_flag
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        awinic_sar@12 {
> +            compatible = "awinic,aw_sar";
> +            reg = <0x12>;
> +            sar-num = < 0 >;
> +            interrupt-parent = < &tlmm >;
> +            interrupts = <72 0>;
> +            //vcc0-supply = <&pm660l_l4>;

Why commented?

> +            channel_use_flag = <0xff>;
> +            aw_sar,update_fw;
> +            //aw_sar,monitor_esd;
> +            start-mode = < 1 >;
> +            irq-mux = < 2 >;
> +        };
> +    };
> -- 
> 2.45.1
> 

