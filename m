Return-Path: <linux-input+bounces-11901-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC9A9535C
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 17:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32A6E16CD68
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 15:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A67A1E22FC;
	Mon, 21 Apr 2025 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr3TZhNv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BF1E1E06;
	Mon, 21 Apr 2025 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248062; cv=none; b=BNuffJVraBlK0PRjh1NyPUsZYQkAq9mRdi5lCCxTT+j/ZqYcHAryk9x4a5EQXhQXtp4jyRpYI2uMUPD0/txU1tB1TqXSxITKu/2Q+ETBYHVOnv5E4edL02NiuwUcBKw2xT1vkDIu0GA5Zw1rym+NmKNyavDsS6nuQ6hlbmPmRRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248062; c=relaxed/simple;
	bh=lc5bcB2qS+BayGAd67CTq4rDRW3vovdCcVtSqCmpb44=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VVMcG12Kr8V4uiUJ6mJx3ylnXiyydyp/O9JEX49II93zV9cdY5mb7ll6gBIPCBPpx00l6aJ4rIaeS4xeyWd/OLAve5w0GYyxbBBdGeAHedIDD3NCAvr18iFnrKApcDJGgW/jrsiBeTepGmTQGFr611Jq8nfNkXiRRUWSJumO1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr3TZhNv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE09C4CEEA;
	Mon, 21 Apr 2025 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745248061;
	bh=lc5bcB2qS+BayGAd67CTq4rDRW3vovdCcVtSqCmpb44=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Cr3TZhNvwmMUJ/5U8n99+jGNWC4DSKVZNDIWmg+ISk8Fek2esnCH3kqwdOVmqiD4o
	 BcLniD9UC/zRaQNBCbPnn2+1i2DatdPiaqH0ykCfZeYknmwEcXHHB13FCNigg6vc4Y
	 IIEm5an35XL3v5/XTiFx8mvbz3puSfnNR6Hsw9JHMARMsTurT2cMLMLCoIfwEyKVq3
	 +Kbo5z5xkNS5GUWDvBCusCmx2kCXjFVcx5u6sIMVSMOS5sz2hoI5oWdPmkKKLu5JyR
	 5gERLoA2lbr1oCfGx5LfpxQLKcoQVEK+20y/EaXrgX2SUG7bJFhB7CYLEXyak/guC9
	 A5BkryMbnmpeQ==
Date: Mon, 21 Apr 2025 10:07:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Douglas Anderson <dianders@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
 chrome-platform@lists.linux.dev
To: Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Message-Id: <174524752509.2425965.7536195118424945972.robh@kernel.org>
Subject: Re: [PATCH v2 0/8] arm64: mediatek: mt8186-corsola: Consolidate
 and add new devices


On Mon, 21 Apr 2025 18:12:38 +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v2 of my "component probe for Corsola devices" series.
> 
> Changes since v1:
> - Reworded commit message for Elan I2C-HID binding change
> - Dropped I2C address constraint from Elan I2C-HID binding completely
> - Dropped enum from new compatible string entry in Elan I2C-HID binding
> - Picked up Rob's ack on two binding changes
> - Rebased onto next-20250417, resolving conflicts with "spherion
>   component prober" changes
> - Link to v1:
>   https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/
> 
> Here's a follow up series of the I2C component probers for Chromebooks.
> This series enables the component prober for the Corsola series of
> devices, combines the two existing Voltorb SKUs, and adds a new
> device, codename Squirtle.
> 
> Patch 1 adds a new HID-over-I2C touchscreen from Elan.
> 
> Patch 2 merges the Voltorb entries in the device tree bindings into one.
> 
> Patch 3 adds a new entry for the Squirtle device to the bindings.
> 
> Patch 4 fixes up the existing device trees for the component prober to
> be active.
> 
> Patch 5 merges the device trees for the Voltorb device.
> 
> Patch 6 adds a device tree file for the Squirtle device, with I2C
> components ready to be probed by the prober.
> 
> Patch 7 enables the prober to probe trackpads on some devices in the
> Corsola family.
> 
> Patch 8 enables the prober to probe touchscreens on Squirtle.
> 
> Please take a look.
> 
> 
> Thanks
> ChenYu
> 
> 
> Chen-Yu Tsai (8):
>   dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
>   dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
>   dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
>   arm64: dts: mediatek: mt8186-steelix: Mark second source components
>     for probing
>   arm64: dts: mediatek: mt8186: Merge Voltorb device trees
>   arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
>   platform/chrome: of_hw_prober: Support trackpad probing on Corsola
>     family
>   platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
>  .../bindings/input/elan,ekth6915.yaml         |  12 +-
>  arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
>  .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
>  .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
>  .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
>  .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
>  .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
>  ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
>  .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
>  11 files changed, 167 insertions(+), 33 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
>  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
>  rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)
> 
> --
> 2.49.0.805.g082f7c87e0-goog
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250417 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250421101248.426929-1-wenst@chromium.org:

arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#






