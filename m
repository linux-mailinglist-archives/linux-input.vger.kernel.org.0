Return-Path: <linux-input+bounces-14511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FDB4608F
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 19:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C014F3AE339
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 17:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D52374293;
	Fri,  5 Sep 2025 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzyi46qJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570737428F;
	Fri,  5 Sep 2025 17:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094306; cv=none; b=WAUxAYy/siq8PNBylqd3IvJ/cJQaxL6NijLq5Ivs1x/GrplDNaeU9u49k/5EJSUvS53rcSELLBbWRS5rfokx+vvcipTjY0JUViXmkvbJe7oqDllNIq5DIU2d8Jz5k5TeKADzzd/OPy99QXr4gchvQFjUcoIRV4PXPRGLnDFPmSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094306; c=relaxed/simple;
	bh=IPNf+uj9SwG7V/HqvpgImlpeKFozAwz0O2IbujFna2o=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jOqxKDS9R0sEhA/Jf/LJMBRQjtZcVN7+jq5ygzrNe/o7PPIRUENTQN6YoznuAhnVa7v9E3XN4EHFhJn5AAfaRAYfQkn9SEP07MptSwh6vxLIXRxLmYpDeKvBpyHZc0dyBte1MUsTPFSIteKaldhyagBOWkDf1y28Mvd3J4UQ4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzyi46qJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACB9C4CEF4;
	Fri,  5 Sep 2025 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757094305;
	bh=IPNf+uj9SwG7V/HqvpgImlpeKFozAwz0O2IbujFna2o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lzyi46qJ8z8SSmnuN6eSFC8fsENvLGZKQIoz3l+oZiQ5zbEpeW87DXlg8+fL9b5m/
	 D6ESW9bnIXtEHHE30zNZFn7OwHzHmbbh11k/5dxyaS8X4NpG93WouApo6/080orBsG
	 8sg1Kqn8mxcCjJqoKlD+iqWTOr2Pb92pBGmtclgNav4M2zDPGeoNrCVvOgpuzLGZbr
	 ClWh/jRUICF5GjHRSaxmSAqfP6auKs6ipL+M9ifKtlpoF1EB2wa7lbqgTDs9L0ZoA7
	 Djc6lZKFUiHLk16YphYGbxj3ztUC1TObz/wLtgaYlXmXtJsj965Wj8wE5dHh5Nv9g1
	 EMlzwLJWdvDVg==
Date: Fri, 05 Sep 2025 12:45:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org
To: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
Message-Id: <175709416307.988711.14636876024281997557.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Radxa NIO 12L: Add GPIO keys and LED support


On Fri, 05 Sep 2025 13:51:57 +0200, Julien Massot wrote:
> This patchset adds support for the GPIO-connected red and blue LEDs,
> as well as the various hardware buttons present on the Radxa NIO 12L
> board.
> 
> It also includes a fix for the missing release (key-up) interrupt
> handling for PMIC-managed GPIO keys.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
> Changes in v3:
> Patch 3/3: drop the deprecated LEDs label property
> - Link to v2: https://lore.kernel.org/r/20250826-radxa-nio-12-l-gpio-v2-0-7f18fa3fbfc8@collabora.com
> 
> Changes in v2:
> PATCH 1/3
> - Add Fixes tag
> - Drop Angelo's Reviewed-By since I'm now introducing the
> 'key_release_irq' member that was missing in v1.
> - Link to v1: https://lore.kernel.org/r/20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com
> 
> ---
> Julien Massot (3):
>       Input: mtk-pmic-keys - MT6359 has a specific release irq
>       arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
>       arm64: dts: mediatek: mt8395-nio-12l: add support for blue and red LEDs
> 
>  .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 65 ++++++++++++++++++++++
>  drivers/input/keyboard/mtk-pmic-keys.c             |  5 +-
>  2 files changed, 69 insertions(+), 1 deletion(-)
> ---
> base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
> change-id: 20250801-radxa-nio-12-l-gpio-54f208c25333
> 
> Best regards,
> --
> Julien Massot <julien.massot@collabora.com>
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
 Base: using specified base-commit 6c68f4c0a147c025ae0b25fab688c7c47964a02f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com:

arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: gpio-leds (gpio-leds): 'rgb-blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#






