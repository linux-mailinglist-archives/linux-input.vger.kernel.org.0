Return-Path: <linux-input+bounces-4737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4335591D394
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 21:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9607B20AB8
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 19:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A418155A21;
	Sun, 30 Jun 2024 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTZ+hc2W"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBF237169;
	Sun, 30 Jun 2024 19:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719777326; cv=none; b=YHifo6tyEhLflyGAX7DOKa/1DDZRodhVGtXOmJwa3Y83pHNpVPtjQ3tzXKnB+g+kA0wyARYub5Va//NzcC44boY6xZUqBaCOqN5pBP0IqanOFlFw3TvN60X4teCVoz2nKuncXlVeMoNawneBUO7ulsUspaEh5NnZE+lfwSxtsi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719777326; c=relaxed/simple;
	bh=t0kMkB/WeZM4FC6XXyefVXL1YStBOqisgBin5mqjQ+k=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=QJEVm3z5n5TE1bRy2MpZ4/dhKqIoj5fjaLedTdoQtaOv4NBdp72KzeFR7y/c+DqJR3RW2jtHRgrr0XhhgBo42edg628Yrj/y7lrB8zySd27Ahcl5tKaY0UZPuTnrZuJqzgsL4xoDH3XA88E0ZP4vxDMnD1XdW/5k0dsVsvA9WI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTZ+hc2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB70C32781;
	Sun, 30 Jun 2024 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719777325;
	bh=t0kMkB/WeZM4FC6XXyefVXL1YStBOqisgBin5mqjQ+k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RTZ+hc2WOo66gCpTZi1xjIb+Qgiav0F44CotgM/U+cp2gYp2+R63IxXn/0WDkZWHc
	 qXYxtT9vtV5iVYr8IzYUv4cwyA25Z2iQa1zaJ4P1dQXRJMMx/FNdPB/V/5V3UVOoQ5
	 dZsalutIjxzZbzNZlTABB2TGJ2qKAaiemKC2iZFvuIK+XSpd54MjX1ts2Nayq57fQQ
	 SWXtqIT7AtsMf+eqWK1rusCDQFkHYuDcijlGTGxIjXRQvR8rHrc5sohQ1Dggw1z32p
	 pGI7bRRW3ZlcsRZIhGnSyQQl5JpzqiMsXz+DjB1FfuI+0aD+xmuqKF3zkcdvPqHnQf
	 MxGgurq3HPmng==
Date: Sun, 30 Jun 2024 13:55:24 -0600
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
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>, linux-arm-msm@vger.kernel.org, 
 linux-input@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20240630-oneplus8-v2-1-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-1-c4a1f8da74f1@postmarketos.org>
Message-Id: <171977732454.1979597.10634226835672850966.robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: panel: document Samsung AMB655X


On Sun, 30 Jun 2024 20:36:24 +0200, Caleb Connolly wrote:
> Describe the Samsung AMB655X panel. It has three supplies.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  .../bindings/display/panel/samsung,amb655x.yaml    | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/samsung,amb655x.example.dts:20.11-21: Warning (reg_format): /example-0/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/display/panel/samsung,amb655x.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/samsung,amb655x.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/samsung,amb655x.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/samsung,amb655x.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/samsung,amb655x.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240630-oneplus8-v2-1-c4a1f8da74f1@postmarketos.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


