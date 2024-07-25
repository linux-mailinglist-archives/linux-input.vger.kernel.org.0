Return-Path: <linux-input+bounces-5153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F03A293C8FD
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 21:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7435DB22401
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 19:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AA213E3EA;
	Thu, 25 Jul 2024 19:46:16 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3BA768EC;
	Thu, 25 Jul 2024 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936776; cv=none; b=FHYhQ5lUljeiCSt7NuqgmsksJZ2O1zPsve8qAQZ75tffqDR5u/EvGJ0iBpXXwCx0/zwjXndrX2bhiEZ0n0pO0uhzZeRpLs9lpfcqcK2lJIU+s6F4p2ozGY49hx0IPZ5/ir9oYi5n1CYlHlirIzeHsQc6wDwofIXLM9cTVs+PtCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936776; c=relaxed/simple;
	bh=PwOHSuXwXja0mNgYGH2EcNlFeXFHwyvrdGGEYegbbzU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lU3qUx63vJsYJTElc4Wv7Ufom+Io88U9TOI+FsELafQ0gcEKS84sGS/ZWRfW5N/oTws0mz0PGaVxL2qQaMFz8jVEVoLra2vGhh8Nltnz77VxpOGtYmfKN6j3Ywu3P5d+/RppoxlCASxVO6b3UlSMBPYqbYVopJPLQ7kv/vssm9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e860cdd.versanet.de ([94.134.12.221] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sX4PN-0001rD-GO; Thu, 25 Jul 2024 21:45:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 0/7] Drivers to support the MCU on QNAP NAS devices
Date: Thu, 25 Jul 2024 21:45:32 +0200
Message-Id: <20240725194539.1780790-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This implements a set of drivers for the MCU used on QNAP NAS devices.

Of course no documentation for the serial protocol is available, so
thankfully QNAP has a tool on their rescue-inird to talk to the MCU and
I found interceptty [0] to listen to what goes over the serial connection.

In general it looks like there are two different generations in general,
an "EC" device and now this "MCU" - referenced in the strings of the
userspace handlers for those devices.

For the MCU "SPEC3" and "SPEC4" are listed which is configured in
the model.conf of the device. When setting the value from SPEC4 to
SPEC3 on my TS433, the supported commands change, but the command
interface stays the same and especially the version command is the
same.

The binding also does not expose any interals of the device that
might change, so hopefully there shouldn't be big roadblocks to
support different devices, apart from possibly adapting the commands.


[0] https://github.com/geoffmeyers/interceptty

Heiko Stuebner (7):
  dt-bindings: mfd: add binding for qnap,mcu devices
  mfd: add base driver for qnap-mcu devices
  leds: add driver for LEDs from qnap-mcu devices
  Input: add driver for the input part of qnap-mcu devices
  hwmon: add driver for the hwmon parts of qnap-mcu devices
  arm64: dts: rockchip: hook up the MCU on the QNAP TS433
  arm64: dts: rockchip: set hdd led labels on qnap-ts433

 .../devicetree/bindings/mfd/qnap,mcu.yaml     |  43 +++
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   |  58 +++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/qnap-mcu-hwmon.c                | 352 +++++++++++++++++
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/qnap-mcu-input.c           | 156 ++++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-qnap-mcu.c                  | 247 ++++++++++++
 drivers/mfd/Kconfig                           |  10 +
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/qnap-mcu.c                        | 356 ++++++++++++++++++
 include/linux/mfd/qnap-mcu.h                  |  28 ++
 15 files changed, 1290 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qnap,mcu.yaml
 create mode 100644 drivers/hwmon/qnap-mcu-hwmon.c
 create mode 100644 drivers/input/misc/qnap-mcu-input.c
 create mode 100644 drivers/leds/leds-qnap-mcu.c
 create mode 100644 drivers/mfd/qnap-mcu.c
 create mode 100644 include/linux/mfd/qnap-mcu.h

-- 
2.39.2


