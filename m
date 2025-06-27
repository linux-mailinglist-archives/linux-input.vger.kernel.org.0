Return-Path: <linux-input+bounces-13150-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EDAAEC0FA
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 22:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DEEC1C470E9
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 20:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFA8214A8B;
	Fri, 27 Jun 2025 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DW6A2IY6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED842CCA9;
	Fri, 27 Jun 2025 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056240; cv=none; b=ljq4y2WxQReu9koTGZ2sFoCAlrOd0aZ4CMPBEALmc34MBDuS8YPTUBNF3TqfhAGb7UvZY2v9eFnhQjEwThae5mQxX6ADL349R31CVDCyWE2/OrPzaKuiPUInW9RQmUETwh6HdO8HjNfljGZoqhyQdU4rKTdhE8/I26z1euXdEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056240; c=relaxed/simple;
	bh=ZRuA5FMG1fIGDnIRCHe0RknMG0RoBJNOiEM0pkknFxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OO0tjZsxvNZ12FuqGcxoUQIQS4ynrYnptyDPGpmR1p5Qg0iT69FVoaTZj6+9AwpCykoj3hrMyhig+RPn50HKUfLVYdTlLebtz38iyPHym+apjQZJ48zmRWj/E7lptXqAHZo7rfBSxcaY+2dQNMNgnz5iOc0U/QX8DKy2GPthK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DW6A2IY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0702AC4CEE3;
	Fri, 27 Jun 2025 20:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056240;
	bh=ZRuA5FMG1fIGDnIRCHe0RknMG0RoBJNOiEM0pkknFxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DW6A2IY6Cq5WEpCi7hTOaITjU49A5NzkZsFPsLrwR/Vp9YmwbcR3DfkkUk6Mi9rPm
	 qyOnqmt41wshOgswFOLQVtARgCCg/CvR+Y/3QlVXQZVnEsCEjKZ5oRvzYgOaBBKW0C
	 zB1yFLDLt3Ht37ebtrmdpG/PLgB7VmEDtY/KBTbdkgZfVJ3rBvKl2SJXciN0zw9tpx
	 pHVyWycqja9w8QIO/vxZ87nP6w2pRRLYV96aNtdVSZdbAH0g0c5CFvvRc2VDGc9N6C
	 xYKwuPdTwBAR2qIJa5OzHtlBEGn9hlkaviZSwCDqMoUFaT6hZ+CjyWN42Zyonaneh7
	 ljI328wopW8DQ==
Date: Fri, 27 Jun 2025 15:30:39 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: convert lpc32xx-key.txt to yaml
 format
Message-ID: <20250627203039.GA30239-robh@kernel.org>
References: <20250624200659.2514584-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624200659.2514584-1-Frank.Li@nxp.com>

On Tue, Jun 24, 2025 at 04:06:58PM -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/input/lpc32xx-key.txt | 34 ----------
>  .../bindings/input/nxp,lpc3220-key.yaml       | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
>  create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/lpc32xx-key.txt b/Documentation/devicetree/bindings/input/lpc32xx-key.txt
> deleted file mode 100644
> index 2b075a080d303..0000000000000
> --- a/Documentation/devicetree/bindings/input/lpc32xx-key.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -NXP LPC32xx Key Scan Interface
> -
> -This binding is based on the matrix-keymap binding with the following
> -changes:
> -
> -Required Properties:
> -- compatible: Should be "nxp,lpc3220-key"
> -- reg: Physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: The interrupt number to the cpu.
> -- clocks: phandle to clock controller plus clock-specifier pair
> -- nxp,debounce-delay-ms: Debounce delay in ms
> -- nxp,scan-delay-ms: Repeated scan period in ms
> -- linux,keymap: the key-code to be reported when the key is pressed
> -  and released, see also
> -  Documentation/devicetree/bindings/input/matrix-keymap.txt
> -
> -Note: keypad,num-rows and keypad,num-columns are required, and must be equal
> -since LPC32xx only supports square matrices
> -
> -Example:
> -
> -	key@40050000 {
> -		compatible = "nxp,lpc3220-key";
> -		reg = <0x40050000 0x1000>;
> -		clocks = <&clk LPC32XX_CLK_KEY>;
> -		interrupt-parent = <&sic1>;
> -		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
> -		keypad,num-rows = <1>;
> -		keypad,num-columns = <1>;
> -		nxp,debounce-delay-ms = <3>;
> -		nxp,scan-delay-ms = <34>;
> -		linux,keymap = <0x00000002>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> new file mode 100644
> index 0000000000000..5ab6cefd35fa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nxp,lpc3220-key.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP LPC32xx Key Scan Interface
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>

You need a $ref to matrix-keymap.yaml

> +
> +properties:
> +  compatible:
> +    const: nxp,lpc3220-key
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  keypad,num-rows:
> +    maximum: 4
> +
> +  keypad,num-columns:
> +    maximum: 4
> +
> +  nxp,debounce-delay-ms:
> +    description: Debounce delay in ms
> +
> +  nxp,scan-delay-ms:
> +    description: Repeated scan period in ms
> +
> +  linux,keymap: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - nxp,debounce-delay-ms
> +  - nxp,scan-delay-ms
> +  - linux,keymap
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/lpc32xx-clock.h>
> +
> +    key@40050000 {
> +        compatible = "nxp,lpc3220-key";
> +        reg = <0x40050000 0x1000>;
> +        clocks = <&clk LPC32XX_CLK_KEY>;
> +        interrupt-parent = <&sic1>;
> +        interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
> +        keypad,num-rows = <1>;
> +        keypad,num-columns = <1>;
> +        nxp,debounce-delay-ms = <3>;
> +        nxp,scan-delay-ms = <34>;
> +        linux,keymap = <0x00000002>;
> +    };
> -- 
> 2.34.1
> 

