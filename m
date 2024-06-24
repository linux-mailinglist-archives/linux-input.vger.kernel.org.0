Return-Path: <linux-input+bounces-4584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5A914017
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 03:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B3151C21C71
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 01:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3340138E;
	Mon, 24 Jun 2024 01:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Ll26nM+O"
X-Original-To: linux-input@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18D139D
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192794; cv=none; b=sO7fS/TKd1l873HdbWMtnUqWhDYk1r3BxgGLlcC1bS6qVveI9d4wjZvXn89YwuNKdIrqTda6DX8qEOv2lmNgf5BemUujCzbTPnHpVEfw3Kv0yByptVmqwytZ42TEqX+vpsvtmCnbbnbVTU5o9PoFdxa4KIJlVxPlZaQgJfvYHHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192794; c=relaxed/simple;
	bh=dDJRiAhpKv1HJdOZBoV2P4igH5mVMt/9OD5J41J1Qd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1YT3o8hRGgdEc0pcXEN9XVmvgJLtRCsdBZb6JpDGt8NMHFRfr6utmLKk2/hW0YhcF8dlyvHM4m8Mp3XrYYNgxJEl+ogYMvjQ3uygcaYeOTMef4kMCJA0DGTjC17XsAJhvmBq9aM7BoLy7luw7YMjBaNxlRUCOyDHNTGOaj6rto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Ll26nM+O; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: neil.armstrong@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719192790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LLs5/P6imD3Eg31wP9mnGF+u0sBO9Oudl7DrswTJIPU=;
	b=Ll26nM+OHJGwrtTUSv4sS2rlIUVyHcDQx8x0RRhTS+n/90Y6MyxCxe3yciHYdGkrasMJXw
	ut+PysMARwV+yqq3y+6najst29S6THNDKZNksPC/jGkY/y9PjaHDYfa94Y8YAF0giqqIY5
	6SW+IT1Nk0rptrNAATIo+0uVX0Tf/B2C44pIrVzRBgj3RsQbbetkrgY4223gzVlfzeP1xY
	jGDgTnF4FBqJxWXKTSY+PexngX0mjh5w4eiyr2BJ5Hif/HlukBiGwk/9My1VoSL9mUSDYc
	4PaCuoLz1zO+EwJaznKr5/1ECJGyVmI1RAhVFXqT8rGE6aNPdPiTh16sod17Aw==
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
Message-ID: <bcc5bb54-f959-4ea9-98f9-2dfd7b41454b@postmarketos.org>
Date: Mon, 24 Jun 2024 03:33:06 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: panel: document Samsung AMB655X
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
In-Reply-To: <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 24/06/2024 03:30, Caleb Connolly wrote:
> Describe the Samsung AMB655X panel. It has three supplies.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>   .../bindings/display/panel/samsung,amb655x.yaml    | 59 ++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
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
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: reset gpio, must be GPIO_ACTIVE_LOW
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

I clearly need a comb with finer teeth... Will fix this example for v2.
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

