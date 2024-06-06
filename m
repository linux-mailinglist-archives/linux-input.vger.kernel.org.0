Return-Path: <linux-input+bounces-4149-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F08FDB51
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 02:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B289B1F222EC
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 00:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4711C2E;
	Thu,  6 Jun 2024 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFDF40lB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70E1139D;
	Thu,  6 Jun 2024 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717633121; cv=none; b=VQyzxad7viDBLw2nl2xZgd2SPwVpNSB/ovD43IuiKXEccJ5gOl5Fa1yiZizeQUvJspahea/Zdq5tYPU8TXr7D06h0jivAesEdrPp2xFQ/aQZ8KAAIPuJX8QEPsm7TulMJ8AqoFO5H4BDWUOo/4a0oBaqeCo6BP5ChXEJGtI+v24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717633121; c=relaxed/simple;
	bh=mblhVWirUr1eRnHuQoM4IgKSVKcxPPkNZ0qMazWBDfc=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=eGbqBh2+myqghby3aVpyTiKIXWII2qgPvXHaQwxIrfOT53s1/UhmMJzTDOwxDtQmUHCwlelL3kTjNttfCl2+X8crOlfWd8hgpOQKWbs2JIx/zKVrVKzY4xKMifZI4QfWx9kHESFcCXBQ3SpBGZjgvOil2hZlWWnbOUFfx401cQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFDF40lB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6068C2BD11;
	Thu,  6 Jun 2024 00:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717633121;
	bh=mblhVWirUr1eRnHuQoM4IgKSVKcxPPkNZ0qMazWBDfc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=kFDF40lBbpcJXrmM67xxGFI9hGc1qaSSGXVx6lsTyoo3xGeo8q/S9ps8SKfIEYOa+
	 nV2VzNY2ibdVCzZ2gzg8kUOWL55K3cVPk1xRrrUWSCRRSOSIaFLrdz1SXUx1EmTigK
	 gVrLrYXJUXRFWK+XU31j1YvIe0mueM8gfUx/MUUdNyK9DCI1VHUH7F0JVoIdR3rS/V
	 e4a0aCXcZQjSJAty2Pp6N3UmkIAFMEjN01oSZi6jv4UoASpuUmBpo12nCS3bNflR+G
	 6yPK48pqWH5TmhLfR/ZOg6kxUaLO+OhLCjWz2hN1LJGlS//SQ2bP1alA+qyxpjLM08
	 bIBs5NStjYSKA==
Date: Wed, 05 Jun 2024 18:18:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: devicetree@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Ethan Twardy <ethan.twardy@plexus.com>, Jiri Kosina <jikos@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
In-Reply-To: <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>
Message-Id: <171763311836.3502220.17006956400358104259.robh@kernel.org>
Subject: Re: [PATCH v11 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge


On Wed, 05 Jun 2024 18:12:44 -0500, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
> ---
>  .../devicetree/bindings/i2c/silabs,cp2112.yaml     | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/i2c/silabs,cp2112.example.dts:41.13-29 Properties must precede subnodes
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/i2c/silabs,cp2112.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


