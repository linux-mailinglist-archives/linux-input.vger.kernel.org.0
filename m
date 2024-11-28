Return-Path: <linux-input+bounces-8306-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F139DBD87
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 23:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A30A6164D4E
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 22:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482201C4635;
	Thu, 28 Nov 2024 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fha7O3jB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175D81C2DAE;
	Thu, 28 Nov 2024 22:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732832963; cv=none; b=p4CvjXFfkbH23sYG/R70QOENG+9zmjmr61bSj5nhxtgvbE3fpKUp2HL+IOcyBKOu7Q6peYelXI1BTiuFsDFF3ZQQHjQEHSqTUoR0xG7yMqC1gFz+w5g6bFs9EEpCkBFkZQ5LZKaEUDWSZBmE2VvELJkOGkAPmWPFpWTpRSWklck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732832963; c=relaxed/simple;
	bh=oe01/Ykp7CrABnRRYCE+rh9+IS7KDiWdmcELIniUmsg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LpA9JxO+0Ms9ztH9L1yWQqYwHVPW+DL9J9B/gl3kq2S9UBwNVNzaZJTriP4rUxrQd0/x2HtyzQ6xWWop9jOTkMUVwrOvH/zvEiLUGp2pu7NH4wbGhkGub3nax2JcT8RZgNgoLJRTkLTORcOdamv6cFvirzGr1NVMOsuisrdcXzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fha7O3jB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A95D7C4CECE;
	Thu, 28 Nov 2024 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732832962;
	bh=oe01/Ykp7CrABnRRYCE+rh9+IS7KDiWdmcELIniUmsg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fha7O3jBHKZQ/TMc6KKsXOiKETN9p37LTjJMCeRXGffD/S9wEpATUao9W3xfog/vx
	 wFJ3cV1vLzdLUQVYyn7mr0u4a3lk2AFvM+y7yfw2tE5sPIvNMlJhJ7hIVG8jau2bUA
	 yPR3mrd7xhGNrtna7NLPNOGYGLvm+03TLluK5W7Uq5MdsswsXyogOmpL2A65fITcDC
	 HG2rxKXHifF00R4VCb7P/noxiS3STNs7lYBCsXXKMMiNWazM99IbYC47vr+H9iGipB
	 aCYqPradO8Lexnx4Ae/mpoWEt6TePeMXND+8G6UYQ23iy8YZ4OzDttJoLdr6vCdoo9
	 upft09XNp/OAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A1FD70DEA;
	Thu, 28 Nov 2024 22:29:22 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] Driver for Apple Z2 touchscreens.
Date: Thu, 28 Nov 2024 23:29:15 +0100
Message-Id: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALvuSGcC/zWMQQrCMBBFr1JmbWQyxiKuvId0ESdjO2BbSSSoJ
 Xc3Lbh8n//eAkmiSoJzs0CUrEnnqQLtGuDBT70YDZWBkJy15MyXDKOl25FO4jFAPT6j3PW9Ra5
 d5UHTa46frZntuv71dtWzNWjYHdgxt4QYLv3o9bHneYSulPIDnpMJipQAAAA=
X-Change-ID: 20241124-z2-c012b528ea0d
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732832961; l=1917;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=oe01/Ykp7CrABnRRYCE+rh9+IS7KDiWdmcELIniUmsg=;
 b=QWGUNje+O0YI4L6uacMv3gCdhycX36kw+7OQPwVuFaDv7ROAUD8JL4y3TN+sqO/WSelEPv/HJ
 QF3jDo6TppbDr01ZAUfKJynJi79vHIby22PKFeS+8EQSFGwkYBUuwaU
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

 .../input/touchscreen/apple,z2-multitouch.yaml     |  69 ++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  26 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  20 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  24 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 458 +++++++++++++++++++++
 9 files changed, 627 insertions(+)
---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241124-z2-c012b528ea0d



