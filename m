Return-Path: <linux-input+bounces-5174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 099CB93E98C
	for <lists+linux-input@lfdr.de>; Sun, 28 Jul 2024 23:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA514281777
	for <lists+linux-input@lfdr.de>; Sun, 28 Jul 2024 21:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0375378281;
	Sun, 28 Jul 2024 21:18:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2003074E26;
	Sun, 28 Jul 2024 21:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722201504; cv=none; b=SQr1AJjzm7Htw1qUQWM/j+rT99Q283IRUyMXO1j9WfHioloZo1JWdqYp++m2gZi7D845sQzwzV5vBEdd40sR/vGNGMpcaxjn2dZT4sIaZREn/b0vM34ibioJWF5FHug788Zky1RWbb9qbcVmpvFErMN0et7fgSXd/9WBcAlmIwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722201504; c=relaxed/simple;
	bh=ZYGrFzPi2pxjX/oJDXS1AtwBl7Vn2z2wa5ciW9wKbco=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oZjUnUAIokGaxpeH+EwAL5Wl2r2dz9ffHi0cdPpjAHmAC8vafH42Dyoz3Kxocuztk0KmlmZ1in63Tijd69PeoyzmRK74rw2Rw+UEp5sAwVYmknIk3hVbNyhZSWJvJwBpQwtQtBqFo3ioQ/56a8HKtDg0tDCjT3F+SArrgCjRyFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86192c.versanet.de ([94.134.25.44] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sYBHD-0005yh-I0; Sun, 28 Jul 2024 23:17:59 +0200
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
Subject: [PATCH v2 0/7] Drivers to support the MCU on QNAP NAS devices
Date: Sun, 28 Jul 2024 23:17:44 +0200
Message-Id: <20240728211751.2160123-1-heiko@sntech.de>
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

changes in v2:
binding:
- rename to qnap,ts433-mcu.yaml (Krzysztof)
- drop "preserve formatting" indicator (Krzysztof)
- add Krzysztof's Review tag

mfd:
- fix checkpatch --strict CHECKs
- add a MAINTAINERS entry for all qnap-mcu-parts

hwmon:
address Guenter's review comments:
- fix checkpatch strict warnings
  I've kept the devm_thermal_of_cooling_device_register alignment,
  because that line is so long that aligning to the "(" would make
  things way too long and unreadable
- add hwmon documentation
- spelling corrections
- report actual pwm value, not last-set one
- make some cmd arrays static
- drop pwm_enable as the pwm-mode is not controllable
- actually handle error returns from mcu commands
- fix calculation of fan-rpm (I read my notes wrong)
- fix temperature calculation to return millicelsius as expected
- only bail at obviously wrong pwm values, but clamp to min,max
- only register cooling-device if cooling-levels are available


[0] https://github.com/geoffmeyers/interceptty

Heiko Stuebner (7):
  dt-bindings: mfd: add binding for qnap,ts433-mcu devices
  mfd: add base driver for qnap-mcu devices
  leds: add driver for LEDs from qnap-mcu devices
  Input: add driver for the input part of qnap-mcu devices
  hwmon: add driver for the hwmon parts of qnap-mcu devices
  arm64: dts: rockchip: hook up the MCU on the QNAP TS433
  arm64: dts: rockchip: set hdd led labels on qnap-ts433

 .../bindings/mfd/qnap,ts433-mcu.yaml          |  43 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/qnap-mcu-hwmon.rst        |  27 ++
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   |  58 +++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/qnap-mcu-hwmon.c                | 375 ++++++++++++++++++
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/qnap-mcu-input.c           | 156 ++++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-qnap-mcu.c                  | 247 ++++++++++++
 drivers/mfd/Kconfig                           |  10 +
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/qnap-mcu.c                        | 358 +++++++++++++++++
 include/linux/mfd/qnap-mcu.h                  |  28 ++
 18 files changed, 1352 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
 create mode 100644 Documentation/hwmon/qnap-mcu-hwmon.rst
 create mode 100644 drivers/hwmon/qnap-mcu-hwmon.c
 create mode 100644 drivers/input/misc/qnap-mcu-input.c
 create mode 100644 drivers/leds/leds-qnap-mcu.c
 create mode 100644 drivers/mfd/qnap-mcu.c
 create mode 100644 include/linux/mfd/qnap-mcu.h

-- 
2.39.2


