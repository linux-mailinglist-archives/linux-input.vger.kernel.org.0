Return-Path: <linux-input+bounces-10101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4400A38200
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 12:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80583B4F92
	for <lists+linux-input@lfdr.de>; Mon, 17 Feb 2025 11:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EE8219A73;
	Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uebqjMOO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77770218AD8;
	Mon, 17 Feb 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739792296; cv=none; b=GxShiFoHYaUIeMaBsQYg8OtwDagb8Ht8+8skS4m77c0NYw8neBP7oaj2atpargfz24RkKrrYMCIdQq4vEqZA1+WfclRU5wop+6XrUKFpzxCwRQkDkHli2EV1KhcOCCnMu7+2Zdc9eOPQphB4k17Zs8AGMaS7y3wssEFHkA7vNuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739792296; c=relaxed/simple;
	bh=EJ5uj+Lo5BxDKmeBIn1FiPC18dDjdUmxMUU2i+B+sco=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UZkLUWblexqDbXyXzzHdOK6+jN3qjTRlppDjPM89m7d6xylncY/n3zIcFFWLyhH/tiIij7LuisN83jOq1L72TG8ass8WAHvaoZXtzDeU5tnMeOcYhZByuHqNDoaUC0njxNmPeHGTdRQZS/ataGlsQI//v0Bfa3cE8JJR5OeXjLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uebqjMOO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D10C3C4CED1;
	Mon, 17 Feb 2025 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739792295;
	bh=EJ5uj+Lo5BxDKmeBIn1FiPC18dDjdUmxMUU2i+B+sco=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uebqjMOOJzAM2WdlGVHHaSSosbNrSzXA6unJWp47hJ2AT+5ywEi0Mz8wIEP4JJ7tr
	 3eZ1SCiEM1rRkeD+wFRz19HLixv2IL29psSYdGX7kCVx+39IerzxKXw4mSpnm61f9L
	 1Jzooh3N8D8fwp7t3Q6PorjFzZnp+3Btcku6GVDbG01N3czxAi2a7Dr314DBE96PVO
	 Emj07be8F6pbPIZRaVCYoPyPKcd0qr+BicC3Apq0HVkWaueea4/ELAEdKDCWG+OiOg
	 C1Fdi8dUXzGl/+Bj+LPbrMK3+mSqDamjYN4n88eN7TLci/R2CuW5Iy6ptv6Uu+poPp
	 01ncB68JovdHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCA5C021A0;
	Mon, 17 Feb 2025 11:38:15 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH RESEND v6 0/4] Driver for Apple Z2 touchscreens.
Date: Mon, 17 Feb 2025 12:38:00 +0100
Message-Id: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739792294; l=2640;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=EJ5uj+Lo5BxDKmeBIn1FiPC18dDjdUmxMUU2i+B+sco=;
 b=vwT0A6gkRH+Zl2/0CowLCLL+90Jxenq829Gs/+O0oAU3C+lsBUwoT/vLs+g93OYXbLJ5rOLz4
 n4dwit1+eC7Cb9YjC7CeL9B5B7deDtzj06OzMD+nxl1PYCFhcQpHCvv
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
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>



