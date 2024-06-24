Return-Path: <linux-input+bounces-4585-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B044914099
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 04:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A218B2251A
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 02:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764EC4C96;
	Mon, 24 Jun 2024 02:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+bggn3J"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B904683;
	Mon, 24 Jun 2024 02:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719196954; cv=none; b=g3v7ziymorPcBvuLZJVOTlAlx7qcecgCAFt6pyvK6Yq40rraJu7cg7pMGlNSbSz2dZYxJVNuNikheEflnH2DIBsI2WESWExg1DULESLXwn7mpqJuFRd3rTfu6DrMWw8GYu8h+ohp8WxbsvfX7NkwWG1bFzdurNRvaPSs0jW08PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719196954; c=relaxed/simple;
	bh=BhEPmtvoGFbzDlcg+EoT7Fa6jIBTcLhA3xu45eC5JO0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=AXfWryuws/xLgpohf3MSb/ieoMAVsWL3gYfCglZMnvhc4+F+IKl+h4i9qlcpt1Ctn1aGPkQkHvcPAzPmnbULhtmK7tzDuWzaddVaXFP1hcgbfB+mBvfVYpvQKb8aWvXI8EC5tPACbickDww+aRkCnJouQH+bWomR8YiErNBrmSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+bggn3J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890DFC2BD10;
	Mon, 24 Jun 2024 02:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719196953;
	bh=BhEPmtvoGFbzDlcg+EoT7Fa6jIBTcLhA3xu45eC5JO0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=W+bggn3JNCC7H1mCW18DntAimW3vQ5n/EaLXYwIwl99hNjLirQexiqVf5kgrrJY2Q
	 eZhfhBAlHFGaISZ25HhtkUxN4wBjk/xrO5N2dincFhK/PDWGd1MOvBaEbkZY+QnTaD
	 MStr3I8fu6D1NL7pGRSoDMG+beqU2hK3vV5lJpR3M/k26TNpMbHA2PR/M9eYOgrnOe
	 354LNeSqqB1f6pwQRLwrKbBfo65XjQ7NjlfK0cyNqgQRyYlIdv2T9k7Hc2pqsHQsIf
	 ueFraeJEjy3KpcX7qXpBmzg5QRFXkQfw4474vA0NR6nT698viwKvbsyT49HFrjpNSD
	 C04d8KjmEaqRA==
Date: Sun, 23 Jun 2024 20:42:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: devicetree@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-input@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20240624-oneplus8-v1-2-388eecf2dff7@postmarketos.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-2-388eecf2dff7@postmarketos.org>
Message-Id: <171919695228.1438647.2034109134791668408.robh@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: input: touchscreen: document
 synaptics TCM oncell


On Mon, 24 Jun 2024 03:30:26 +0200, Caleb Connolly wrote:
> Document the Synaptics TCM oncell series of touchscreens, starting with
> the s3908.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  .../input/touchscreen/syna,tcm-oncell.yaml         | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/input/touchscreen/syna,s3908.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dts:27.13-26: Warning (reg_format): /example-0/i2c/touchscreen@4b:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dts:21.13-36.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dts:21.13-36.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dts:25.26-35.13: Warning (avoid_default_addr_size): /example-0/i2c/touchscreen@4b: Relying on default #address-cells value
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dts:25.26-35.13: Warning (avoid_default_addr_size): /example-0/i2c/touchscreen@4b: Relying on default #size-cells value
Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240624-oneplus8-v1-2-388eecf2dff7@postmarketos.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


