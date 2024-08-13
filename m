Return-Path: <linux-input+bounces-5543-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 066B9950359
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 13:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B809E287165
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 11:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2958198A2F;
	Tue, 13 Aug 2024 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDko4rdU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9260EC4;
	Tue, 13 Aug 2024 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723547524; cv=none; b=ZkHDUOo59+OBLxE+XtTiQdj7t6XCo42aqKQCN1BgREcqMaN2PATFZl6XRzUVgZSSMH4c4ibM2oQj5BK2DBsyOQGiSXKKK3axE7feXaTekpvUTqUpQTr5ERVkXDiX6zgVAistGTqY3D93+bc77xbjZHk/ssX8KBhHYp4M1LLlRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723547524; c=relaxed/simple;
	bh=q/BYpNAcIZekIKxSVC4OgrS7MA7S3fwGwMg28nu8F4A=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Dfp7EWxwEezYKZzmDQvXFETkOFioCBp4pQs3dsrfGJLybX1dQryflWP6/O5xyAY19tEFOyyVpVIFM8OJcJdM+4rgXmwupbGUqVrChcKSp4IYxRXKTT9o0yQrmsmbjQg33QdtxHgbjTh6Pkxcsto+qucBRyJqLZ+ojrsdYIR2Nb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDko4rdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C481AC4AF09;
	Tue, 13 Aug 2024 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723547524;
	bh=q/BYpNAcIZekIKxSVC4OgrS7MA7S3fwGwMg28nu8F4A=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QDko4rdUaDGuHL4tlZDBJugI2IbtfZdSZwzEQ6QB3t3JeOLwodxdvDXSQejy8SpdI
	 9p2pDNG6YvcN/bK7Q1vIb3CFlmlYEy9YIrFDkbTt7+3dVzu14VybO3B/x6ySLvUNqm
	 mN2D2tupIeUcR9zefHYKm/O/H4yJjlr7UyokgZwoeJX4RFM70vah2vef3Hy6JJ0HrB
	 VyP9+dV8HPthpbUToD3xRKxUl6kKltj+DkS4lL0IjKysI1KW0gVG4zQP0AMVXxMdmX
	 9ngKLjnzepNgfTt1TCuQ1hgU9/M2MJRKiWoKs+Vijwwtax7a2FfP+Ll7gJG/oMnDGY
	 ZYzbJYpjdr/SA==
Date: Tue, 13 Aug 2024 05:12:02 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Utsav Agarwal <utsav.agarwal@analog.com>
Cc: devicetree@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Oliver Gaskell <oliver.gaskell@analog.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, linux-kernel@vger.kernel.org, 
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20240813-adp5588_gpio_support-v10-3-aab3c52cc8bf@analog.com>
References: <20240813-adp5588_gpio_support-v10-0-aab3c52cc8bf@analog.com>
 <20240813-adp5588_gpio_support-v10-3-aab3c52cc8bf@analog.com>
Message-Id: <172354752239.384988.5705833300903132689.robh@kernel.org>
Subject: Re: [PATCH v10 3/3] dt-bindings: input: pure gpio support for
 adp5588


On Tue, 13 Aug 2024 10:51:33 +0100, Utsav Agarwal wrote:
> Adding software support for enabling the pure gpio capability of the
> device - which allows all I/O to be used as GPIO. Previously, I/O
> configuration was limited by software to partial GPIO support only.
> 
> When working in a pure gpio mode, the device does not require the
> certain properties and hence, the following are now made optional:
> 	- interrupts
> 	- keypad,num-rows
> 	- keypad,num-columns
> 	- linux,keymap
> 
> However, note that the above are required to be specified when
> configuring the device as a keypad, for which dependencies have been added
> such that specifying either one requires the remaining as well.
> 
> Also, note that interrupts are made optional, but required when the device
> has either been configured in keypad mode or as an interrupt controller.
> This has been done since they may not necessarily be used when leveraging
> the device purely for GPIO.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  .../devicetree/bindings/input/adi,adp5588.yaml     | 40 ++++++++++++++++++----
>  1 file changed, 34 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adi,adp5588.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: could not find expected ':'
make[2]: *** Deleting file 'Documentation/devicetree/bindings/input/adi,adp5588.example.dts'
Documentation/devicetree/bindings/input/adi,adp5588.yaml:140:1: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/input/adi,adp5588.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240813-adp5588_gpio_support-v10-3-aab3c52cc8bf@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


