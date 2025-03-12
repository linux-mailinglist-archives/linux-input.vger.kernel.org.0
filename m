Return-Path: <linux-input+bounces-10740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D25A5DD5D
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 14:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1242217A3F5
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 13:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B78245017;
	Wed, 12 Mar 2025 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/WGy8Jn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3236224500B;
	Wed, 12 Mar 2025 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741784855; cv=none; b=htR2FP0dgSJCsErAB74lvYTpis39q4QMWhCBsCHshj3tseVxMN6L5uRyXWIjL5Jd2cCOPOsvV0llfVCfe82VAsXeeOqFuoboY/AgWrfNb3CCrNvA5joiDoCnOo9NtCJjfL+EY/vXLfTPKoSFJx5rvHqK9WrVn1nKqOpiDPmecpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741784855; c=relaxed/simple;
	bh=iRfFeBANOM2hUL7E2zRHWps4ofaq4IOnHQTovW0eFT4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=DcjtaWZLhJ7dQY3fhmxYqy1Uqe5HSpRd3azwRHD+zSRHg2WflPtjXJjPkeMx726ljk5oXq5mh4Osnn+DGUDwufN2HIHUj9V9eloGX2NaaiaFE97TzNzeyT4HN9B1X1MeoD9lm1OxRoNT0Z30Op2iKZ7vPr9dOvtqR0fNDJw+Jx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/WGy8Jn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72C2C4CEED;
	Wed, 12 Mar 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741784855;
	bh=iRfFeBANOM2hUL7E2zRHWps4ofaq4IOnHQTovW0eFT4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u/WGy8JnzjgFARu4QTlrYLqVyiB8cF/sKPT0p04wm36qe3i6b7f7akjITsx+I5Xzp
	 wbOj1rjzZel+YvlZ6r5q7nUOOSqCGTby3jTOz2VrCmmTPv61XK/VTh03l8rqNfBnzn
	 7Zg3h3LVbqFMaL1xtvMHR08zeTMcjmN24tuYl4ULZ5QMF0AiFVubjVat2RHPU1M+oI
	 akiRsF4UFhQZFTewvZr6xMUytcmyLdXMfRfJlzqadOjJ0zOgtVZp/hRkJ6Jf+Bmggd
	 P0W0zvneMf4QIUbj6sS12e6399Un3lAh+tcHwn259+Mlyuib2E+HZdPaoPQrGFgy+M
	 pduEKQWW4NXQg==
Date: Wed, 12 Mar 2025 08:07:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 chrome-platform@lists.linux.dev
To: Chen-Yu Tsai <wenst@chromium.org>
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
Message-Id: <174178473613.434362.5052831169970866580.robh@kernel.org>
Subject: Re: [PATCH 0/8] arm64: mediatek: mt8186-corsola: Consolidate and
 add new devices


On Wed, 12 Mar 2025 18:43:34 +0800, Chen-Yu Tsai wrote:
> Hi everyone,
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
>  .../bindings/input/elan,ekth6915.yaml         |  29 ++++-
>  arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
>  .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
>  .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
>  .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
>  .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
>  .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
>  ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
>  .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
>  11 files changed, 185 insertions(+), 32 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
>  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
>  rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)
> 
> --
> 2.49.0.rc0.332.g42c0ae87b1-goog
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250312104344.3084425-1-wenst@chromium.org:

arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#






