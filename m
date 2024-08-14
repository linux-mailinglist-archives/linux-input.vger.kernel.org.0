Return-Path: <linux-input+bounces-5575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F15EA95231F
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 22:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7CA21F22A48
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 20:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DD71C379C;
	Wed, 14 Aug 2024 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtW62Slz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F53139D15;
	Wed, 14 Aug 2024 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666556; cv=none; b=ZbOFIHKY20JhaSBWpIRcMZfiyIwJGRi5UsX6GAta6kTF23PQTxYhtQ7u3k848565Q/ObXfDudOJ1h6JG7NqFngiHyfl9IVb+5SNz61t4qCYnZ0kecZcQlZ9i0xK2gxATDyrwzXnOIzXEkDKGUOcBoWE5oPIEyNQ2l4x4DVmbOS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666556; c=relaxed/simple;
	bh=3RgDHrozdUxsKGMFQl1iDEmmrsvMSKGNaMh75H2/m2A=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=X/Qju2wVTJoB5UpFsGxJZijSwoOn+C7pmMLL//y1Oq8e6TNLhk6Krv8u/DmBZnkhBgpRBQLXHERaIIPT74kssLxadZ9cPZnblt0T2n2Tl/JlFjz+duY7fnkvCElNTcS8dmL2Z7yk1DFaKqtjS78XbHp0htMVEjI81jSJXKvEupo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtW62Slz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DF5C4AF0F;
	Wed, 14 Aug 2024 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723666555;
	bh=3RgDHrozdUxsKGMFQl1iDEmmrsvMSKGNaMh75H2/m2A=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FtW62SlzOzezyi5Yk2yqYSgx4YAq097i367jtsTGs9ftkItFA5MoLw1sdSPizK3wE
	 I4qEQk7t65x4YK6GOJTeigIzFjmYjYGB0DY1AWMxTgQFcMDCdWslbgrMd+DZquqA/v
	 D+IJkL54I6zigUElPktQWrarP/MtM+GDoXy1Lfcbn25s8SscltQ+eUu3NrvRBIKbhZ
	 jvD5CBDQutg1yXkVGp+LfkZBPay4RowXNO8pBvAGTeE8ZhKx5rwKLc6ZXZidT2eBsg
	 y7EoIAYFkuYwdvAKZGam7KOXzWTW4xk0eoObgjqpTxzKOxPUKEUw4mCSURS73YbBxf
	 TQPZo+EThGw6Q==
Date: Wed, 14 Aug 2024 14:15:54 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Marek Vasut <marex@denx.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 imx@lists.linux.dev, Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240814185140.4033029-1-Frank.Li@nxp.com>
References: <20240814185140.4033029-1-Frank.Li@nxp.com>
Message-Id: <172366655490.3976071.6119398337115152529.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert
 ads7846.txt to yaml


On Wed, 14 Aug 2024 14:51:35 -0400, Frank Li wrote:
> Convert binding doc ads7846.txt to yaml format.
> Additional change:
> - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> - use common node name touchscreen.
> 
> Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> 	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> There are warning:
> Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 
> I don't know how to fix it. ti,x-plate-ohms is 16bit, but default it is
> uint32
> ---
>  .../bindings/input/touchscreen/ads7846.txt    | 107 -----------
>  .../input/touchscreen/ti,ads7843.yaml         | 170 ++++++++++++++++++
>  2 files changed, 170 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,y-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.example.dtb: touchscreen@48: ti,x-plate-ohms:0: size is 16, expected 32
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.example.dtb: touchscreen@48: ti,x-plate-ohms:1: size is 16, expected 32
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.example.dtb: touchscreen@0: ti,x-plate-ohms:0: size is 16, expected 32
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.example.dtb: touchscreen@0: ti,x-plate-ohms:1: size is 16, expected 32
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.example.dtb: touchscreen@0: ti,x-plate-ohms: 40 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
Documentation/devicetree/bindings/power/wakeup-source.txt: Documentation/devicetree/bindings/input/touchscreen/ads7846.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240814185140.4033029-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


