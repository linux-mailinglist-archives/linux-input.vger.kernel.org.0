Return-Path: <linux-input+bounces-14847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9D9B84F51
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 16:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AADC57C145D
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 14:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1549922173F;
	Thu, 18 Sep 2025 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="IZSdG+40";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fRDbCS9J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44457220F2A;
	Thu, 18 Sep 2025 14:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204288; cv=none; b=rjbDMtNfHvVjhfilHi5oB39y42kk5frMsA02vg93+gKbOVTu8LBw0UaPye83odKfPS169d54ZDU9Y27+M+sqCB8LDealXgqbtS4goVxOtO1yLshbKbxc6qUSb0TJcdaUelYK66OMnk30VtAR8Wlo8PaXSDMfQ3xTzweUdTfnp+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204288; c=relaxed/simple;
	bh=dcjxOavMGHgQ/ZDKoyFf1gQdlWass6V8HkK2ihugu5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KzfxbtFToXWrwPIOkGw+7yZB84pzNZekGL7f9rYpp+WeCz8qAQjzLMbQwxaRLbypfFDtf/mnyQAYhy52sIF7zw/vEi1Gi6DRc1aSTRpSOJ1FfOC/r6MV59WyIneWW1csrspvNXzY69WOoN4gR7fHIi3d8h4kqu66w5adUPEIEDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=IZSdG+40; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fRDbCS9J; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758204199; bh=S4KftfhKBQKLNO3bKcTgYMK
	rSy7pw0JGg9a5lwSE9kg=; b=IZSdG+40xZfFVqHAV0J4W9rmoOlmzervXLEZVqOnOVcyMZ1i0B
	pB/1mKvnaOEry9g0FT+cc/fCMe73VaOlnjfcQKv2Pehy3vmE6aPpltUJTy9OY08Ur9eLT5tRiaj
	R/BfARoHE98J9ar7fEmFEYWkD+saVPiTwysfzMWCkUCbLG/LHt8gjSM48uXd242c/DxcdDkH1qH
	TgH95T5rVGNv8goXhSJDZa16gMmxUuUPXjp2vUnn1rM6IyGjkCUJgOHFE7lpTaSgMrPyK4yCkAT
	FflAoyKGy4WViX0XxOHVn7mX52YEbca4d2MSXJ7ia4RJcaqcHr7EfXJYIZTIXpEEgMg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758204199; bh=S4KftfhKBQKLNO3bKcTgYMK
	rSy7pw0JGg9a5lwSE9kg=; b=fRDbCS9Jk95nv/zFxLjKNNQqZ8nm2ojUGLiWTFMRuTfu8d2viV
	xw+9khN6y/bpm2SRloL+cQmpKfu/mzxCi8Bw==;
From: Jens Reidel <adrian@mainlining.org>
Subject: [PATCH RFC 0/3] Input: add initial support for Goodix GTX8
 touchscreen ICs
Date: Thu, 18 Sep 2025 16:02:47 +0200
Message-Id: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAcRzGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0ML3fSSCgtdU8tEU4Pk5BRzi0RTJaDSgqLUtMwKsDHRSkFuzkqxtbU
 A8YG7SVsAAAA=
X-Change-ID: 20250918-gtx8-59a50ccd78a5
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Jens Reidel <adrian@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2080; i=adrian@mainlining.org;
 h=from:subject:message-id; bh=dcjxOavMGHgQ/ZDKoyFf1gQdlWass6V8HkK2ihugu5I=;
 b=owGbwMvMwCWmfPDpV6GDysyMp9WSGDLOCKqdF2dtWSX/JoVzzffMvFN6zOvEr2x4s3jO/8mv2
 lrS5/Nqd5SyMIhxMciKKbLU30gwuWr97dD8fJvVMHNYmUCGMHBxCsBE2p0YGX5qJIrMP+deVtgR
 /qGea/ZUtnObvpZem9916p7v5744neeMDN/TjmjwTz33U4p5QlLwr+XVxz8+3DyBKeP5xvbz9nx
 rongA
X-Developer-Key: i=adrian@mainlining.org; a=openpgp;
 fpr=7FD86034D53BF6C29F6F3CAB23C1E5F512C12303

These ICs support SPI and I2C interfaces, up to 10 finger touch, stylus
and gesture events.

This driver is derived from the Goodix gtx8_driver_linux available at
[1] and only supports the GT9886 and GT9896 ICs present in the Xiaomi
Mi 9T and Xiaomi Redmi Note 10 Pro smartphones.

The current implementation only supports Normandy and Yellowstone type
ICs, aka only GT9886 and GT9896. It is also limited to I2C only, since I
don't have a device with GTX8 over SPI at hand. Adding support for SPI
should be fairly easy in the future, since the code uses a regmap.

Support for advanced features like:
- Firmware updates
- Stylus events
- Gesture events
- Nanjing IC support
is not included in current version.

The current support requires a previously flashed firmware to be
present.

As I did not have access to datasheets for these ICs, I extracted the
addresses from a couple of config files using a small tool [2]. The
addresses are identical for the same IC families in all configs I
observed, however not all of them make sense and I stubbed out firmware
request support due to this.

[1] https://github.com/goodix/gtx8_driver_linux
[2] https://github.com/sm7150-mainline/goodix-cfg-bin

Signed-off-by: Jens Reidel <adrian@mainlining.org>
---
Jens Reidel (3):
      dt-bindings: input: document Goodix GTX8 Touchscreen ICs
      Input: add support for Goodix GTX8 Touchscreen ICs
      MAINTAINERS: add an entry for Goodix GTX8 Touchscreen driver

 .../bindings/input/touchscreen/goodix,gt9886.yaml  |  71 +++
 MAINTAINERS                                        |   7 +
 drivers/input/touchscreen/Kconfig                  |  15 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/goodix_gtx8.c            | 562 +++++++++++++++++++++
 drivers/input/touchscreen/goodix_gtx8.h            | 137 +++++
 6 files changed, 793 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-gtx8-59a50ccd78a5

Best regards,
-- 
Jens Reidel <adrian@mainlining.org>


