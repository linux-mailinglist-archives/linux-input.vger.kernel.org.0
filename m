Return-Path: <linux-input+bounces-12768-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BE4AD40F1
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5859178413
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 17:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B305242D96;
	Tue, 10 Jun 2025 17:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPUeLfcS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D21E8338;
	Tue, 10 Jun 2025 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577080; cv=none; b=s+dFVBKvO5sMw/oFmF8q+e60a1o0nvMwtm4wzdmNSf7/WhWibouQaDU8ZEp0qi13dl/DLBE6ERw/tMEAZTHq+h3F4r/ZTYReyyz+x+T5ieWy/cN9RQ5zRX3xqcfXU51EiRyu6P2XSHi6vb5nwMqJduvuVnTW0OQSE4JZtutJ04I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577080; c=relaxed/simple;
	bh=gFF9BJlSA/H9sl/j5u3RQFhLRU2Yd5MQ+SLQXrtUXRM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=i0Uhg75wDDBXSts9gfqad5mvhuenpFJYoThNkkTSIsMJ9xn+lkreDpcq/SfCpoxy4E2VkdhnFYJDM0bAt7fHC+vPOGujJqCsE6fH7hixrSOiPXnoAVT2/HfDYjpMRHy6WscR5RcIvlKT7DT42C2EZvqrI1fjHd+tdWaRjEkrUw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPUeLfcS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DD2C4CEED;
	Tue, 10 Jun 2025 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749577079;
	bh=gFF9BJlSA/H9sl/j5u3RQFhLRU2Yd5MQ+SLQXrtUXRM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dPUeLfcSk5BAh8ZCaTj8kA6V/bzy3aEkLwVqX/m6G1wPftjjgy3l0E4Hs02IzBrcF
	 XN8mlqNTWw2s8ZdFS8sscrVU5dCwXHg7FUtyldjERDY5yaBluA/fb54nHD4qiqYSKm
	 nZK/S++aioIKFCNU7DSOYe4d9NkBC4tgHHgHhKDl58+mFGwIBy3zAdO7eCjh+TKvWW
	 ocCIDgQ2S3fQDWOMgIvv8h0r7cuHm5T/Fvw28TXEwyuahSMHGtmnMqeWvBYzMxc3cL
	 z01SQfd1qb8Lm1b/r2Sa+QG0SSjZ/xmuqdUxT5we61wDLtAKExHqQmdIeYosNzN6iD
	 1EnCmXS89zZNQ==
Date: Tue, 10 Jun 2025 12:37:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dmitry.torokhov@gmail.com, krzk+dt@kernel.org
To: =?utf-8?q?Tom=C3=A1=C5=A1_Ju=C5=99ena?= <jurenatomas@gmail.com>
In-Reply-To: <20250610154609.1382818-1-jurenatomas@gmail.com>
References: <20250610154609.1382818-1-jurenatomas@gmail.com>
Message-Id: <174957707487.2226001.14497918275087340337.robh@kernel.org>
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation


On Tue, 10 Jun 2025 17:46:10 +0200, Tomáš Juřena wrote:
> From: Tomas Jurena <jurenatomas@gmail.com>
> 
> Adds support for instantiating the tca6416-keypad driver via
> Device Tree. If no platform data is present, the driver can now be
> probed based on OF bindings.
> 
> A corresponding Device Tree binding document is added at:
>   Documentation/devicetree/bindings/input/tca6416-keypad.yaml
> 
> This allows the driver to be used in systems that rely solely on the
> Device Tree for hardware description, such as embedded ARM platforms.
> 
> Tested on Toradex Ixora 1.3A board and Apalis imx8 SOM.
> 
> Signed-off-by: Tomas Jurena <jurenatomas@gmail.com>
> ---
>  .../bindings/input/tca6416-keypad.yaml        | 87 ++++++++++++++++++
>  drivers/input/keyboard/tca6416-keypad.c       | 88 +++++++++++++++++--
>  2 files changed, 170 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/tca6416-keypad.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/tca6416-keypad.yaml:9:13: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/tca6416-keypad.yaml: pinmask: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/tca6416-keypad.yaml: maintainers: None is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Error: Documentation/devicetree/bindings/input/tca6416-keypad.example.dts:35.40-41 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/input/tca6416-keypad.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250610154609.1382818-1-jurenatomas@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


