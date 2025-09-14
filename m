Return-Path: <linux-input+bounces-14699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84802B569B9
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 16:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D7A3BA394
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 14:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A77B1F7575;
	Sun, 14 Sep 2025 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIpd0AB2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D935949;
	Sun, 14 Sep 2025 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757859868; cv=none; b=r6o84LxeYvv51LNnpSCxByNop7qNxUZMA3RzpmTn7c9v+/ESV5jnQNugUooxkZ6ebmMWd4WMKkQHkbWsAGekWD2elujOafU/tiIDpRTwipeF6HDTVL980DultoAUh402hPNGnt69hlx/XqQqZ3V1J17izT3FZ5/6z0xe9nwea78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757859868; c=relaxed/simple;
	bh=Sfx4QXafuRHlGko82oAUy9i/VeAeMfX/h5ATJQNUnZg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=f1A1JuEh7RG3EQlnW8h2ceziwIkJLCYe2TTskruRTfiwR5FJo6gI3y68pO6wtiXQUbXSo5m26FEOFxZVQvRveX3ZcjzCTbL25MvkhZlxgrimy5zW0R8WrBhpLpqHEpPf/T2FlgdaJtcFGY71q7N1BrILxkKnOqfh0ignZuqZgAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIpd0AB2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86559C4CEF0;
	Sun, 14 Sep 2025 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757859867;
	bh=Sfx4QXafuRHlGko82oAUy9i/VeAeMfX/h5ATJQNUnZg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WIpd0AB27Ab4KH4RxsLbYkzBAw4CPwxBAw9j2l+FS04nSeISV7vZCSquTpnBAzHGL
	 brT5FiNknFi2VakGjHXr4lw/AILvOfeGFbwMa0Gw6ixWSXtLXn2ViPjP8jtMO6M2Qd
	 n/yNtsTjpWSSrKF9DCL4aplqttgMFrdmohlpaEsCfaDMZlW2MIiDMo5uOtI2jGa1hn
	 6SyIh6s7oVf5LXQEorkiMNk0mnYk9cUUo6waI+6/t8afxF28pDYPZYjN8iPjoLd4RV
	 D60KuuLDpKmmT/un/RnwZ5Qktoxm+m6mgv5/+SdYTEYhYBdYRd8vOvY7OLWvqWHOCT
	 3I0gStVWzGy3g==
Date: Sun, 14 Sep 2025 09:24:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amarula@amarulasolutions.com, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250913092707.1005616-3-dario.binacchi@amarulasolutions.com>
References: <20250913092707.1005616-1-dario.binacchi@amarulasolutions.com>
 <20250913092707.1005616-3-dario.binacchi@amarulasolutions.com>
Message-Id: <175785980651.1915009.6987347922143634218.robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: touchscreen: convert
 raspberrypi,firmware-ts bindings to json schema


On Sat, 13 Sep 2025 11:26:53 +0200, Dario Binacchi wrote:
> Convert Raspberry Pi firmware 7" touchscreen controller device tree
> binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v2:
> - Added in v2
> 
>  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 -----------
>  .../touchscreen/raspberrypi,firmware-ts.yaml  | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.example.dtb: firmware-rpi (raspberrypi,bcm2835-firmware): 'touchscreen' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,firmware-ts.example.dtb: firmware-rpi (raspberrypi,bcm2835-firmware): compatible: ['raspberrypi,bcm2835-firmware'] is too short
	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250913092707.1005616-3-dario.binacchi@amarulasolutions.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


