Return-Path: <linux-input+bounces-10287-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9152A41BE4
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 12:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D043E171A83
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 11:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1272580C3;
	Mon, 24 Feb 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcvClc0M"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4524500B;
	Mon, 24 Feb 2025 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394877; cv=none; b=Tdy66yXjNn9DLKr7tMxDrlOzl/wvW+7ef+oPXL7PhGxOXbmKb/JbzEjFAwJhfjN6JVDMDCazwhmOTyySqlSy05vOSqQZ/lUkY5MTLoclnC6bhFgOzfTc8jf0/5/07MbvZqMegaDN2b92ykbVFXGm+xVW6uK1LdjZt1TOd96sqps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394877; c=relaxed/simple;
	bh=IRBOBjOupyewlrDGtPHlu0OHXgrrC2CpFC42RCnOQDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n4RFRpktDH8XCnhe8PR4s8skTrTVhwR4hQe9cXKonmIu+6jnrsr2dXFBDtyljsKdL3R85NdcZgUKrnVmnM2KZLp6T1QSJuVgrUtC12H9bAoLZ2BsYZk/J1K7lxCPCt8XCJT32NJHEAqPCJMHZlRPQWy1nAgckWHdRVpR82q25qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcvClc0M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF051C4CED6;
	Mon, 24 Feb 2025 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740394876;
	bh=IRBOBjOupyewlrDGtPHlu0OHXgrrC2CpFC42RCnOQDE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qcvClc0MEi8wMe+Rwou+0c+/zWq6CShV0abErzYBLVxp9jw0LhvpLSDBfQo8aYm/r
	 7i1tb6UXPF272N5VNMLOFbklT6ASG5KYs9+SwBcRm5FZfyvF8nXFx+d6QY18UbNUXx
	 0cl5s9oybhxeeCeRTgcGl8iBz6zTlgKZYrg6upplER6yCDJL4ICitw5HTL7ngXtoW5
	 bfMayWgRzt4U/M47UW6Le3Iz43gGmKa1joVczp3aL3kO2x3YkMRwi2KeCVRtBQ1QZD
	 JkpT18qnxFT2iuY27xgIBAYuwsqaNhlrOWs/Do5Of3bXiwKq9W9Lf2xjKbpY9HFH5G
	 m8wBx1UWuXutA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF87EC021A4;
	Mon, 24 Feb 2025 11:01:16 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v7 0/4] Driver for Apple Z2 touchscreens.
Date: Mon, 24 Feb 2025 12:01:08 +0100
Message-Id: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHRRvGcC/13PzU7DMAwH8FeZcibIdmK348R7IA6Nk26R2IpaV
 AFT350000TV49/yzx83M6Uxp8m8HG5mTHOe8nAtoXk6GD1311OyOZZsCMgjkre/ZBWQAlObOoi
 mNH6Oqc/fdcjbe8nnPH0N40+dOeNafXBZ+YwWrHqnXlUIIL6eLl3+eNbhYlY+05a0lVAhjajyM
 YQesdkT9yAMxVTiCmGFxMzRxR73xG8JV+ILiY0T7AJK6GBPeEvuh3EhEl0biFtCOe6J/BOC+xZ
 Z31cBDSlh5LAly7L8AbWoL1aTAQAA
X-Change-ID: 20241124-z2-c012b528ea0d
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740394875; l=2765;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=IRBOBjOupyewlrDGtPHlu0OHXgrrC2CpFC42RCnOQDE=;
 b=FJOVBRwuAD8k0F5ggHNq+YETM0cbGKs7+eewX3jq6+WWMtPjJpWcJBEFZEgKLsV1iTpN8MLuT
 ltMNgXuBQ2eATILFiJU6bjscMI2ilQ+B90otPxPOj1+8PfHch7EWwhz
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

Hi.

This series adds support for Apple touchscreens using the Z2 protocol.
Those are used as the primary touchscreen on mobile Apple devices, and for the
touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
in charge of speaking Z2 to the touchbar).

Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
The changes since then mostly address the review feedback, but also
add another machine that has this specific controller.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v7:
- Added a dependency on ARCH_APPLE to prevent potential confusion on x86
- Link to v6: https://lore.kernel.org/r/20250205-z2-v6-0-cc60cbee1d5b@gmail.com

Changes in v6:
- Went back to build_cal_blob returning an allocated buffer, other fixes.
- Link to v5: https://lore.kernel.org/r/20250118-z2-v5-0-6d38b2582169@gmail.com

Changes in v5:
- Added missing \ns, removed 4kb-ish of wasted ram
- Link to v4: https://lore.kernel.org/r/20250115-z2-v4-0-d7361ab16ba0@gmail.com

Changes in v4:
- Dropped another allocation, other fixes.
- Link to v3: https://lore.kernel.org/r/20250112-z2-v3-0-5c0e555d3df1@gmail.com

Changes in v3:
- Tx/Rx buffers used in interrupt handler are now allocated in probe and reused
- Other various style fixes
- Link to v2: https://lore.kernel.org/r/20241128-z2-v2-0-76cc59bbf117@gmail.com

Changes in v2:
- In a separate patch, fixed an issue that prevented the SPI controller
  from using GPIO CS, and as such, moved the hardware quirk to there
- Went back to uploading the firmware in probe() instad of open()
- Other changes addressing the review feedback
- Link to v1: https://lore.kernel.org/r/20241126-z2-v1-0-c43c4cc6200d@gmail.com

---
Sasha Finkelstein (4):
      dt-bindings: input: touchscreen: Add Z2 controller
      input: apple_z2: Add a driver for Apple Z2 touchscreens
      arm64: dts: apple: Add touchbar digitizer nodes
      MAINTAINERS: Add entries for Apple Z2 touchscreen driver

 .../input/touchscreen/apple,z2-multitouch.yaml     |  70 +++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  27 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  19 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  23 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 473 +++++++++++++++++++++
 9 files changed, 642 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-z2-c012b528ea0d



