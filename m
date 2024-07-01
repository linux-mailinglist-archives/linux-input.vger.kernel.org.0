Return-Path: <linux-input+bounces-4773-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC0991E553
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 18:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29CB81C216C4
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 16:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0071E16D9DB;
	Mon,  1 Jul 2024 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZVpENhn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D316D9BB;
	Mon,  1 Jul 2024 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719851276; cv=none; b=RtW1QMh1edQwsFJEmWi+w3fuDon8/S2B88SIZuaDeaGb99QV1QHZQRhShhkN2xYLVCagGmxOgNNm5UMCpAUVzlSHunwKm3x1YPw2z7J8pOg4tnuESjc93Rr72YM4NfVH0KdKC7/49AQv2bzjI0hHDF3BlQJCLI6keTCqJoRduQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719851276; c=relaxed/simple;
	bh=T9N55Sy9vgeKjovgVjRuhJdy1MWnsGAQzGF/aEfGShI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=U7qCnXkiyxmVzvmmsCTTgZQVvOSpPgdII8jgk1Vg2I3oZHzTsGXDGHByYCDxVqEOLzD8cGud0fCPOFOok9sZQ46OJ3PXAiNfIYcMHTYtjGRqFCpsC4zFFGN7MzJO6fj79EILZnQSarghcSrChZD9mzd577wkS8D0UDzx8AiXD8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZVpENhn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34258C116B1;
	Mon,  1 Jul 2024 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719851276;
	bh=T9N55Sy9vgeKjovgVjRuhJdy1MWnsGAQzGF/aEfGShI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nZVpENhnp0fm6gmdzXfDscS/c1vtV/+MEARmXq9EQAcoCdh5r7EJPOhV/xUURDqyg
	 xRUmaqgGKB+bSH+5/Yfrx/3yNl13ObU/a+V+YD8o7LI1f2WSclqNuNAx9LUIQEhMP8
	 nWbp7aZ4xd7qMIXo9EZ1Fi9bn6hQtPDmS3gZjbKa7uIK2msTaby+PLBJjmQLPcge5R
	 zc+/0UG1PTf9PzJvdeyLDHtHi62bzhPiltxYqXp2uItk86u7bvDor6zOapHVxDXpnh
	 x2WOiuzK2LHJuRulSRA9gQnweW5JYh5IxWZXWQeWTXKPgVm7y6DgALFfBj+dgXPPZV
	 TEHfJLqYZD9qw==
Date: Mon, 01 Jul 2024 10:27:55 -0600
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
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, 
 Arturs Artamonovs <arturs.artamonovs@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Oliver Gaskell <oliver.gaskell@analog.com>, linux-input@vger.kernel.org
In-Reply-To: <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
 <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
Message-Id: <171985127498.58137.18371204131413728327.robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for
 adp5588


On Mon, 01 Jul 2024 16:04:51 +0100, Utsav Agarwal wrote:
> Updating dt bindings for adp5588. Following properties are now made
> optional:
> 	- interrupts
> 	- keypad,num-rows
> 	- keypad,num-columns
> 	- linux,keymap
> The proposed new property "gpio-only" has been added as an optional
> property with an additional example.
> 
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  .../devicetree/bindings/input/adi,adp5588.yaml     | 28 ++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/adi,adp5588.yaml: gpio-only: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


