Return-Path: <linux-input+bounces-6347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A6971433
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 11:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02DF1B25D98
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 09:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251C11B5817;
	Mon,  9 Sep 2024 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0FnGanT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E792F1B580C;
	Mon,  9 Sep 2024 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725875116; cv=none; b=CsSsLsYS5rg3P/cRK4/xCLHoFyw1ZYUPS067UekFIt5ajU+E/WZgAD8+1gJyHKoCLaUN/bh5O9+X9qidCCNT//YXoQZc33B3vUNnWEgxPqS8xnsrvYbRcXqBDB+0Jkj+kgpdRZrZDfEGgRtdKd/3AXjxtCHDISNbSd5rWXqYr8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725875116; c=relaxed/simple;
	bh=ceArjcGYsq3z1p+osPTN+7TxR4F/n7BCCsTLHifo3n8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=g8nirmJzhxhm3FVhRy8fOxFftBDpnyjbZ43OUUqv5pJa0RznKjzxPdxyEZv1peeudpyHApoSMACzCYuw2hlCUWiL43A3kBfUe++o8wVMUtWgZq/PA+Kc3hk+vWuErgQezxpCfin9iegSOMCjR33v9FYbj21zDwWBePY7z/CopAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0FnGanT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517EBC4CEC5;
	Mon,  9 Sep 2024 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725875115;
	bh=ceArjcGYsq3z1p+osPTN+7TxR4F/n7BCCsTLHifo3n8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q0FnGanT93iur8ODEw141Mi0/ZGuRnJruupcJvkO0sjfqfaOHzmmkkyL4tHAsk+Gt
	 X3sPUJccSjbI0+iKiRG0KkQuXPv8gQVEhICbrtiUCkQGd/BXikV1+AsAUmS2HBTWFY
	 t6h/iHjz0XkrawteBwtHkCfc6NP2yM+j5gTR/5LR3eUeoav1O/8Wa4y4dT9XyxDVDb
	 grOYzgd6Jj4UXvXtz9O47jisSQaaG+yxgwIcqqfN7mIlz1lkgRg6VoOTEch8iuNsMl
	 +qlRRHBfZzdGcOLhsH9wH2FWatt735b9Dz6RDUfadLy6LbfdYVQKI7uw4zA0QC5zaL
	 r7FgqnGiP59ew==
Date: Mon, 09 Sep 2024 04:45:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 linux-input@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org
In-Reply-To: <20240909-ep93xx-v12-22-e86ab2423d4b@maquefel.me>
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
 <20240909-ep93xx-v12-22-e86ab2423d4b@maquefel.me>
Message-Id: <172587510454.3289288.3686389738563355045.robh@kernel.org>
Subject: Re: [PATCH v12 22/38] dt-bindings: input: Add Cirrus EP93xx keypad


On Mon, 09 Sep 2024 11:10:47 +0300, Nikita Shubin wrote:
> Add YAML bindings for ep93xx SoC keypad.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/input/cirrus,ep9307-keypad.yaml       | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pwm/cirrus,ep9301-pwm.example.dts:18:18: fatal error: dt-bindings/clock/cirrus,ep9301-syscon.h: No such file or directory
   18 |         #include <dt-bindings/clock/cirrus,ep9301-syscon.h>
make[2]: *** [scripts/Makefile.lib:442: Documentation/devicetree/bindings/pwm/cirrus,ep9301-pwm.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240909-ep93xx-v12-22-e86ab2423d4b@maquefel.me

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


