Return-Path: <linux-input+bounces-9158-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF745A0AB74
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 19:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EC023A5990
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C395A1C07D8;
	Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnzWlF9t"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAF53232;
	Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736707302; cv=none; b=QMkXG0Q3HaUglt/OZH+CPPy2ENhGlgiTpQQq4Kw2b+6YlH4R0LTpYUaUhPwtfKzHNn/PJVHFv7/6/zN+z2xjpEfV7mmulJBVsQTHwbO1BJq4+afzK15ZUds8CkhMqI1LXVPgw31J5i5ZPJPWfPzU4myjzj+f4sQzemGLCMMfV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736707302; c=relaxed/simple;
	bh=wdB68K3PeDbVcgvoTbIYxQc+n0FBFJF0guSndtGbyFQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y7+syVa5gr07c8g780dp/jgkmIoQAakfSHXbNUAm6GcbH7b2txLjni7Et6rGC9H8SYPTMnQA2aOANcO8jN+8Bpr/KuVqP7b/08HcCSo877b5x3ZOFUQb1CWU9tapkcYWV1xNdtq2Or2tRdhQErQMoDwH/TlzyYEldZ3I0+qBbUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnzWlF9t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1089AC4CEDF;
	Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736707302;
	bh=wdB68K3PeDbVcgvoTbIYxQc+n0FBFJF0guSndtGbyFQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mnzWlF9th1vklk/l3qj/a5bxD0PGwevQrvdX9A115AVFzwHvegQTzQAyVB9tUz1So
	 dRHePJ7f7V9PP/5HoYsBWZIDpN8ryAYLgDO0yELKnvPCEgK9gT2FVSxq2gFfmjh1HO
	 NRdiXd9MNBYdt5mObMWcxJvlp6yk7BKXDqjaMayEWlRSQbCPpTfTZGIlT27i9qG7p4
	 d+ibhEcgdRNvkJzzaDhI3An1OMPFyh40JS5KWxM/mrNcvRXNN/MhN9OTNRAf2mxdyr
	 zsqH46vKhypOgKi0SlbTR3JzZsk/VtbCfqYmbUMIShK0BIMTPlo9JEbyT3jpY4KtOL
	 5MfCdL3I46xbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2B9E77188;
	Sun, 12 Jan 2025 18:41:41 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v3 0/4] Driver for Apple Z2 touchscreens.
Date: Sun, 12 Jan 2025 19:41:31 +0100
Message-Id: <20250112-z2-v3-0-5c0e555d3df1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsMhGcC/03Myw6CMBCF4Vchs7amM5SLrnwP4wKGApPIJa1pV
 MK7W0hMWP6T+c4C3jqxHq7JAs4G8TKNMdJTAtxXY2eVNLGBNBlEMupLijVSnVFpK91AfJydbeW
 9j9wfsXvxr8l99s2A2/XP840HVFqxSdkw56R1c+uGSp5nngbYeKAjKXdCkRQ5c3ap6xaxOJJ1X
 X+r/8sNxwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736707300; l=2125;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=wdB68K3PeDbVcgvoTbIYxQc+n0FBFJF0guSndtGbyFQ=;
 b=dEUdX/RvzmYoZfDfumTur7xk31yF9c5dQuFoa97mpRXNIUQ6r1Ov8oBqjYqTlJWATxkTvu3PO
 G6uXmoYVayQBkeAR8QVXnMn96yA0Cf7a+InmBZ91xpIPJzr+/UB7oU6
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
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  23 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 463 +++++++++++++++++++++
 9 files changed, 632 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-z2-c012b528ea0d



