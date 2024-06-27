Return-Path: <linux-input+bounces-4679-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6291B20A
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 00:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8041C21B7D
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 22:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549E01A0B16;
	Thu, 27 Jun 2024 22:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJcrqOw3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B21A0B0F;
	Thu, 27 Jun 2024 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719526377; cv=none; b=JYrvHW4iHj1hRHgPz5/8OCrsF1FOVgg/pxyJkfVLiRBq3kj/mt4QQ/E24vrzl0g+O5Y5yxNoTW2fd+4SKL3R3Ztm6TPQ1qrOqFjRhuPMtbEa3BFkmjRCxSdsg22hAbiW2HKJ8HR39n4z7A+NMkAu+4wIyCPqHRXAXLNMdK7CgmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719526377; c=relaxed/simple;
	bh=zEU06ccxlSi4KJtjT+ATfMzZpKaukNTo70MyRTgbSaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0grgf2HReC+7+KPcEOMD9YPPhloVq3uhNz89z+s4b9czUCPYw9UgsoV4DZnjCFaQOkGfE1/Ra976p8atdMiP5diKOl2b+O1fKOyEcR38DIhHa0gIH8FPNt18CaEJaBgHTOWLi91i1N4dX6kkED3WFhjgO/fsK8uloAXhdJYbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJcrqOw3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8E0C2BBFC;
	Thu, 27 Jun 2024 22:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719526376;
	bh=zEU06ccxlSi4KJtjT+ATfMzZpKaukNTo70MyRTgbSaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJcrqOw3YtE/m++3cwXqHzHUknq9Flppdx6qaBv3/VpprcSaoeOE15oQoY4dhpKmu
	 ZM9mGAIZ6X8qGNYI/dYu3l6VxCQBRRX0CeUuN3lmMGGwQe76iE9J37+maLg2hFRCsB
	 L60iOfQ4rKQ/AACDLkQqpS0Z4k8g1zeSIVrHB9oSyZGj4pJz4aycVqRJVcnSD7kpWP
	 0CSTO5yXNX81IG6DVV20pCz929470AQ65HqXMKHSRDlr6DPIjP7ZVF7mHF+i43pllK
	 8HTTWJdjdMooADpIPNLu/piuVVS3LhDqkGdgKDcIYY8qISRFCDAVfM5eOrhTxXVFqc
	 mNk+NPbtQQWiQ==
Date: Thu, 27 Jun 2024 16:12:55 -0600
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/7] dt-bindings: panel: document Samsung AMB655X
Message-ID: <20240627221255.GA649980-robh@kernel.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>

On Mon, Jun 24, 2024 at 03:30:25AM +0200, Caleb Connolly wrote:
> Describe the Samsung AMB655X panel. It has three supplies.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  .../bindings/display/panel/samsung,amb655x.yaml    | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
> new file mode 100644
> index 000000000000..eb987d022a0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,amb655x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung AMB655X 1080x2400 120hz AMOLED panel
> +
> +maintainers:
> +  - Caleb Connolly <caleb@postmarketos.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,amb655x

'x' is not a wildcard is it? Those are generally not allowed.

> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: reset gpio, must be GPIO_ACTIVE_LOW

blank line

> +  vddio-supply: true
> +  vdd-supply: true
> +  avdd-supply: true
> +  enable-gpios: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - avdd-supply
> +  - vddio-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "samsung,ams495qa01";
> +            reg = <0>;
> +            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
> +            vdd-supply = <&vcc_3v3>;
> +
> +            port {
> +                mipi_in_panel: endpoint {
> +                  remote-endpoint = <&mipi_out_panel>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.45.0
> 

