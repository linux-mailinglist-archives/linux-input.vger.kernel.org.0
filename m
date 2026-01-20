Return-Path: <linux-input+bounces-17207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8885D3BD59
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 02:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97E33303E67F
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 01:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DC8246774;
	Tue, 20 Jan 2026 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewrE0n4i"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5619D071;
	Tue, 20 Jan 2026 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768874269; cv=none; b=ufre8PnmNQ8Zo+6HkHAbyuBUt0OHXEBLL2foWYuAGXTaxzXCLQv6dCGjybqz+AGBPIBvw7L1NHKIY+uOJkbJsXMqbtt823iIPckAja0mmYurJszfSBDPFJqoQi1v8PwjwRnjWZC9ERBW0lEsBfDEJwj8UqswuGnMQ6fRpK8syZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768874269; c=relaxed/simple;
	bh=NXn23f/rzxC3vQjUhfEShCoK+q3JfWeY+OcZLLkAT/o=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KjCBGLMX2NEFIWI8BmZVeTosEFbogLpfQBnN2OLfXnEOi59O8VSuqgYyuLt8doErcNuj5x2aNFfp1el0w3gx+MmGFnyrLVIA7K3PbUGIrPGgAXDjAlO3JIPHnuYzMcAGRtzIhH8+6PezqqrZcP82nSq9AjC8WLEG+iUn9dNLglc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewrE0n4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF28C116C6;
	Tue, 20 Jan 2026 01:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768874269;
	bh=NXn23f/rzxC3vQjUhfEShCoK+q3JfWeY+OcZLLkAT/o=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=ewrE0n4iNCn5vsnIIGv1IiOwR/h+wxPXYnyD3isWEPoLJ/MF1CiQ5E4M2aBbLacFN
	 Bpjy/ARvBD9LIbkmLNf7sKPXGoVaJvMIOJ9tRTjGK4U6AEf9/CA5VdZweE5uZKrMld
	 +KsUP0KDldvW+PW6bhGJMwJ7YrFoaa5PVaDQWqPGFSkevpWNKRyUWFeYDmsgJDXuB6
	 1fSZSmRceUF4dIV7EqKIHk1yW92DF8q7v3oqr3CHt1IAyQZJUGGIZh4PpooFNSu1yf
	 VyWIIqySN3zMiKhreskOMYOLnV83bpVkhJwbjQe/Gcio2NJOELam1CwK9c3VqyOdlD
	 7/J0upW0a05XA==
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Jan 2026 19:57:48 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Yedaya Katsman <yedaya.ka@gmail.com>
In-Reply-To: <20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com>
References: <20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com>
Message-Id: <176887409321.799867.15185739103671631449.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Support FT3518 touchscreen in xiaomi-laurel


On Sun, 18 Jan 2026 22:29:39 +0200, Yedaya Katsman wrote:
> Adds support for the touchscreen in the Xiaomi Mi A3 (xiaomi-laurel)
>  smartphone, FocalTech FT3518
> 
> Original tree was here:
>  Link: https://gitlab.postmarketos.org/SzczurekYT/linux/-/commits/laurel
> 
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
> Changes in v3:
> - Rename regulator node and reorder nodes
> - Add gpio pin configuration for pmx_ts_* in sm6125, and reference in the
>   touchscreen configuration as pinctrl-*. Doesn't have configuration for
>   the gpio 83 pin since it isn't documented downstream.
> - Link to v2: https://lore.kernel.org/r/20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com
> 
> Changes in v2:
> - Fixed name and email in signoffs
> - Link to v1: https://lore.kernel.org/r/20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com
> 
> ---
> Yedaya Katsman (3):
>       dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
>       drivers: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
>       arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT3518 touchscreen
> 
>  .../bindings/input/touchscreen/edt-ft5x06.yaml     |   1 +
>  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 113 +++++++++++++++++++++
>  drivers/input/touchscreen/edt-ft5x06.c             |   6 ++
>  3 files changed, 120 insertions(+)
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260113-touchscreen-patches-beb2526bd5fb
> 
> Best regards,
> --
> Yedaya Katsman <yedaya.ka@gmail.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: b71e635feefc852405b14620a7fc58c4c80c0f73 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


Warnings in base: 429
Warnings after series: 431

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com:

arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: pinctrl@500000 (qcom,sm6125-tlmm): Unevaluated properties are not allowed ('pmx_ts_int_active', 'pmx_ts_int_suspend', 'pmx_ts_release', 'pmx_ts_reset_active', 'pmx_ts_reset_suspend' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6125-tlmm.yaml






