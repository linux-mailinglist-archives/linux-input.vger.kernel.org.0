Return-Path: <linux-input+bounces-9255-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D916A12E67
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 23:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76EFC18865FB
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 22:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D9B1DC9B6;
	Wed, 15 Jan 2025 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHvyptkx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E666415D5C5;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981173; cv=none; b=mVhyrgaF35zynQejLCzVnVOBdOb6mXrupNTupuXjdrDnZt67Oauf1o1BBDvY+UkaFhDkFDez/tjoGfg9ZT6rEEcv++4UuJ4VkKlqjFpyolfYSSLIRYiGTSI/Wag9RVqOkK/Ti16KeVDeEojStTAuqkkorT1S2EGJ4smH8fvwGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981173; c=relaxed/simple;
	bh=Knr0caKO3pB1buKxJm1DtsDZu8Tt8G4u0XclRVx/eiY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mHnk7h3ncTUSpvi2eTtONx3hlbfNBGSVUzDVMgCAMcNWN3EyULIGF2UhEZ5H0z898Mf4oDeF8kviOXJZf8hM4lV89LUu8bJ2CqufXQ3nS+3JyVUj1HtmhT6Bh4nEEkQJuto7TkrI1sY2PUNF9dujp3+8Tn4/g6/m3FP1Fsm52gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHvyptkx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71CF5C4CED1;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736981172;
	bh=Knr0caKO3pB1buKxJm1DtsDZu8Tt8G4u0XclRVx/eiY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hHvyptkxeJIKlykbQRTbV46izk/P5LJUMqfYZsFlHiD/JaNoE9odF9u92+ZOjJrmv
	 QnIYf56QC6hf+ib1dbb1ww5AQtStimDzhFIRgHBVaGvbL6jLMjND4nLrgdVTlu0tG1
	 8MFNGHx0h9N3uO8QzNMKKtiXnmJ1ATZfK9yS737kmlhMkYC4RTSqYB66UCkP3INTtw
	 k92c4qzo4OKnRzMEMsAbK/pGxU7FR7R80Qw0fywD0JQFmS1iTe5S5MFeUg5cey33nS
	 hb04YSqHyZtrO8s8kMo2/LJ9irOzUw6I+7MAS7IpVduE+jMTx6sZuSG/aQ9/dhdyXC
	 S5NhOJgz4jKmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63509C02180;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v4 0/4] Driver for Apple Z2 touchscreens.
Date: Wed, 15 Jan 2025 23:46:04 +0100
Message-Id: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKw6iGcC/13MQQ6CMBCF4auQrq3pTFtAV97DuIBpgSYipjWNS
 ri7pQkJcflP5nszC9Y7G9i5mJm30QU3PVKoQ8FoaB695c6kZihQAaDiX+QkAFuNtW2EYenx6W3
 n3nnkeks9uPCa/CdvRlivGy9XHoELTkqSIipRCHPpx8bdjzSNbOUR96TOBBOpSiJ9atsOoPonc
 iNaJJOJTESTsFprI00He7Isyw8zFY11+gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736981170; l=2269;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=Knr0caKO3pB1buKxJm1DtsDZu8Tt8G4u0XclRVx/eiY=;
 b=6zM0bJw99JTimTeE7zFuZxaj7GgP7UA/B7bfcVXNRcVFEcW8vpRFkZHU8DvH+JyEfuNnnP/QA
 yZxSuCnnfgHBrQk4A4sgXIH+x3IELa4v7W//ulON6ujaRXRUiL/cozE
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

 .../input/touchscreen/apple,z2-multitouch.yaml     |  70 ++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  27 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  19 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  23 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 454 +++++++++++++++++++++
 9 files changed, 623 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-z2-c012b528ea0d



