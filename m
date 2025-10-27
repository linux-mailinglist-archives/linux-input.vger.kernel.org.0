Return-Path: <linux-input+bounces-15766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B7CC120EE
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 00:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A3A8501127
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 23:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ACE32E15F;
	Mon, 27 Oct 2025 23:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzG7dIlp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57D2DF142;
	Mon, 27 Oct 2025 23:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761607855; cv=none; b=VukC+Y9QMxrrgPX13UQ9yr/UDaM0TNHwS/4pmJKbHp+OH+IE9+ZopFxwxRL56LdlYCNcy0lyWXfW9VhXpJY9uriZfR6iAMydFi3CWEA8afatl0D4oTxj+FInaE4JJONalBfj999n+i+8wMbkWfJqF297bSeLX2ulcLPw1fXCTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761607855; c=relaxed/simple;
	bh=DZtb8nMuR4LRUryhRIxP3SPx7YfdAW9zS2Vt0rWR0q0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Unq/pi6XYDEJC1BD+lHloirC8foUx1lvu/gni/WFhHiFUahpLBARZojoWelTp5Oru0ovD8nxyX4JHjMCYc4Cz0U8BytTuKqdrLiV7gvzClZjIMDgV0cavEDG4Th4au5b+DQlQT3NsPu49YtPv+acKrDnwaFUsyCI79mHjAniqck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzG7dIlp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC8FC4CEF1;
	Mon, 27 Oct 2025 23:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761607855;
	bh=DZtb8nMuR4LRUryhRIxP3SPx7YfdAW9zS2Vt0rWR0q0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JzG7dIlpFXzdRRKUnGr7y3ZLsZMYiN5SbzVqR0nTq1Iq1EjWjw560Exh/nHCIooMw
	 UOjOe2FL262VFOWlAi7PDGwlskuz6jZ1QUhD6sRZcFdzFfYvJOx/meNxbdKsb8sHbT
	 d1ruuBKjUITMnCvGm2kKYtAn8TDCjyYkOG5vdfGYcP+roXU/ONpdiAqMd5HMUsph/p
	 +6wFeXsBwmanHIzwT+iqg+ioO+pgMaAhdo6ZkQexOQYMXKB2v0S4TRfWJUVOcLyFAg
	 FQ9JmWP7H5vwl30r95wEieehoniuyFCQies2ik2nE6I9vX8z/O54fWDt3w6ToLKcwO
	 z/bIXWHO8E6Ig==
Date: Mon, 27 Oct 2025 18:30:53 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hendrik Noack <hendrik-noack@gmx.de>
In-Reply-To: <20251027212535.4078-1-hendrik-noack@gmx.de>
References: <20251027164050.113623-1-hendrik-noack@gmx.de>
 <20251027212535.4078-1-hendrik-noack@gmx.de>
Message-Id: <176160785382.1849306.4204971054170991705.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Input: Add Wacom W9000-series
 penabled touchscreens


On Mon, 27 Oct 2025 22:25:34 +0100, Hendrik Noack wrote:
> Add bindings for two Wacom W9007 variants which can be found in tablets.
> 
> Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
> ---
>  .../input/touchscreen/wacom,w9000-series.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,w9000-series.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/input/touchscreen/wacom,w9000-series.example.dtb: /example-0/i2c/digitizer@56: failed to match any schema with compatible: ['wacom,wacom,w9007a_v1']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251027212535.4078-1-hendrik-noack@gmx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


