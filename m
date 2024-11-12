Return-Path: <linux-input+bounces-8041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6679F9C612C
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 20:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2AE9B62E56
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 18:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2854E21621F;
	Tue, 12 Nov 2024 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CoDagJq8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED774213125;
	Tue, 12 Nov 2024 18:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435954; cv=none; b=Y2VA27qB+6QRW3tqQ15Fpm6NmkP5NfuKTbKQbKcCqv1eYbYs10U70wK9ypUba2Zdcy6cqZru0n89dfGsoP4BQ3ad9zg/ZLFSy+PMW8YaJXbTv4sWYXMy3PZtj3JSsQ6n09y6t3+al/S7WxRDG4Dxl8NGXngQRH0XkeO66b905CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435954; c=relaxed/simple;
	bh=yrKfGOXX98/cELtVgxzNSD4kt98nETX3Dt/9ZDr29SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP2S1kPS3POSgLJf4OjvALRhamQSKV20fifenapFS97eqPJiRyRon32vapJc+oQd//ulmYxyJqJoaY0Rd0XF1tvtwwG+WjKDqHNstSDKIiWhwu2aphboqMrGmKngt+EOecxLVcKsBj8iP+maeSRGY5b5amITBOpFTUC+Dw6QAJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CoDagJq8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E44C4CED6;
	Tue, 12 Nov 2024 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731435953;
	bh=yrKfGOXX98/cELtVgxzNSD4kt98nETX3Dt/9ZDr29SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CoDagJq8V8BhywiH9SWUK9yNn+wPEqeK4ep/tpSx9d4zgCLn4J2J/KOTGBGKSCyjR
	 RaGXkCY7VTGOe0uJeNJw5YAa49bnrjfEXxkQA7hND6OCiNGeYyXTpi+iFo2Xhu29O+
	 lL/pMvTJXMKzka+Yyg2UhibCZBinnXLlNQamr+ljIF4zrPM4GNJRk+09omulpyVsAV
	 dBgV4M9obIbNtfBnxYps/ByfZyxA6KjakZ/aB6wql2w+5Sh45yUjEX5foogA+gEv+W
	 TFse51KJP5S+RATFTHiIKIPToMPonHImABDcJmVqiR7itg79pmiX+yd9MFwoTWj1kn
	 eM5fQ+cOrvoZg==
Date: Tue, 12 Nov 2024 12:25:51 -0600
From: Rob Herring <robh@kernel.org>
To: mjchen <mjchen0829@gmail.com>
Cc: dmitry.torokhov@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	sudeep.holla@arm.com, peng.fan@nxp.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <20241112182551.GA1394330-robh@kernel.org>
References: <20241112053059.3361-1-mjchen0829@gmail.com>
 <20241112053059.3361-2-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112053059.3361-2-mjchen0829@gmail.com>

On Tue, Nov 12, 2024 at 05:30:58AM +0000, mjchen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: mjchen <mjchen0829@gmail.com>
> ---
>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..71debafc3890
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Keypad
> +
> +maintainers:
> +  - Ming-jen Chen <mjchen0829@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-kpi
> +
> +  debounce-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192]
> +    description: |
> +      Key debounce period select, specified in terms of keypad IP clock cycles.
> +      Valid values include 0 (no debounce) and specific clock cycle values:
> +      8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.

No need to list the values twice.

We already have a bunch of debounce time properties. Don't add more. If 
you have the clock frequency, then you can use the existing 
"debounce-delay-ms" and convert to register values.

> +
> +  nuvoton,key-scan-time:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Set the time it takes to scan each key in the keypad, in clock cycles of the IP.
> +      This parameter controls how frequently the keypad is scanned, adjusting the response time.
> +      The valid range is from 1 to 256 clock cycles.
> +    minimum: 1
> +    maximum: 256
> +
> +  nuvoton,key-scan-time-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Set a divider that adjusts the scan time for each key.
> +      This value scales the time it takes to scan each key
> +      by multiplying the key-scan-time by the specified factor.
> +      For example, if you set key-scan-time to 64 cycles and configure key-scan-time-div to 2,
> +      the scan time for each key will be increased to 128 cycles (64 cycles * 2). time.
> +    minimum: 1
> +    maximum: 256

Again, we have existing properties such as scan-interval, 
scan-interval-ms, and scan-delay. How is this different? 

With a single property in time units, you can solve for how many clock 
cycles.


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
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - linux,keymap
> +  - debounce-period
> +  - nuvoton,key-scan-time
> +  - nuvoton,key-scan-time-div
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad@404A0000 {
> +      compatible = "nuvoton,ma35d1-kpi";
> +      reg = <0x404A0000 0x10000>;
> +      interrupts = <79>;
> +      clocks = <&clk>;

> +      keypad,num-rows = <2>;
> +      keypad,num-columns = <2>;

Surely these should be required?

> +
> +      linux,keymap = <
> +         MATRIX_KEY(0, 0, KEY_ENTER)
> +         MATRIX_KEY(0, 1, KEY_ENTER)
> +         MATRIX_KEY(1, 0, KEY_SPACE)
> +         MATRIX_KEY(1, 1, KEY_Z)
> +      >;
> +
> +      debounce-period = <8>;
> +      nuvoton,key-scan-time = <1>;
> +      nuvoton,key-scan-time-div = <24>;
> +    };
> -- 
> 2.25.1
> 

