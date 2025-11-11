Return-Path: <linux-input+bounces-15985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC97CC4B384
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 03:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C89854E71CD
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 02:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BECF347FDE;
	Tue, 11 Nov 2025 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEpdfLZ5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA1E3054CE;
	Tue, 11 Nov 2025 02:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762828285; cv=none; b=EVjHNLlt8nsch/KdbHmfr9CIUCZeS5oX6kUG9reCSjTT2M0Vjffy8SnAZZv1/mfdNha0dinpWGWHFse/J7ZrZB2Dxx3eAIELf3Nd66QH0AliMl6KgdP4E+GqqbL5Ag1wgfjcDPtleHr3l8rwqgC8MxOMptzemkaHD+dI65d5L8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762828285; c=relaxed/simple;
	bh=IS6C6wNPv5uaZiVZqfJg8GnUvDAPgN7kUTq7DQhwLtg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=sGV7i/7N3gb+RpZRPfiREZ8KG1XBU/P+jjGfe9xBauMyO6a2xslKEmKJfx7l6C1mY74m2H/sr3PluCxMZEVedOsoeTHTIsA9P3FEiS+rpvSn66URI8sR6Wx+FVQZG9lUIn4EdjNhO6NriHTaciOosny9VYpsH3tVa9mKk4hvedQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEpdfLZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A34C116B1;
	Tue, 11 Nov 2025 02:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762828284;
	bh=IS6C6wNPv5uaZiVZqfJg8GnUvDAPgN7kUTq7DQhwLtg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iEpdfLZ5zGQ1xzW0xT82A2p1lELSA0L9VWxRMD5xj9UCHM9/1/6qKWif4iRqIK1hi
	 zMgCdSKHVRwgSdrgoB3Zc4JTc3AV0ro6/mYYEeKnpWdIWE23Iv5UDC034ryWsBh1HP
	 O2qX9eqRcQlu7cRWlM2Gf3E1rg4MkkOUROJrJiJ9qGMwT4ajh4YKmIkmWOCJix5Kr3
	 1bZ3wRHVc/NVlfXwZYnJLl7iTMtnmK+qKHy/ruEtwV532sKXcrmb/zI+rikqetScuB
	 w/4GtNGYws8ixTWPejpKhL3h0En8FrFXcqcJO1VCc2Or/3Hk0r5jIxFYuPFmP4LUZt
	 KEY0anfY2wTiQ==
Date: Mon, 10 Nov 2025 20:31:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
 Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: daniel_peng@pegatron.corp-partner.google.com
In-Reply-To: <20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
References: <20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
Message-Id: <176282828282.1500650.453785854206330008.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: HID: i2c-hid: elan: Introduce
 FocalTech FT8112


On Tue, 11 Nov 2025 09:34:57 +0800, daniel_peng@pegatron.corp-partner.google.com wrote:
> From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> 
> The FocalTech FT8112 touch screen chip same as Ilitek ili2901 controller
> has a reset gpio. The difference is that they have different
> post_gpio_reset_on_delay_ms.
> FocalTech FT8112 also uses 3.3V power supply.
> 
> Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> ---
> 
>  .../bindings/input/focaltech,ft8112.yaml      | 66 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/input/focaltech,ft8112.example.dts:36.31-33 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/input/focaltech,ft8112.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1547: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251111093426.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


