Return-Path: <linux-input+bounces-5669-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F706956DA9
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 16:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E9B5B251C4
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D9017C988;
	Mon, 19 Aug 2024 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="O1odHTw4"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2171617334E;
	Mon, 19 Aug 2024 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724078423; cv=none; b=oYfuuRQDP4KPWOUfrwLsbK18ME/P3jpBel68KuV90UK57dP44KIZSfDGO9+JoMLF3saHDDZmjbrTQITHvSqGdxZNg1iopT9LBUfcl/N6aoGms9/dSF9a99t+GuQLFYssySWExZ7CojSpLGO8PmsNnhKgNRnykPhtHKP9RCial34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724078423; c=relaxed/simple;
	bh=NcrO4Grs6TfTvVO+Cf7rQUx8Jh+Jzii1EfSP/7I/rRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UpW3ypJ56v1+zV6wWjpp9fyZz8UdAXM3hQRaFoNXgqPHd7gt4sr/P19qASDV/X+rhBWi+RM3RbvFu6nKtjMJ/Yrl/F2TJfxZury63wgMriUqWBOyimJX3XC1YOkTkRTSLb2rF9TCusUkdgqvySbAC1kfRHPFazesyGqaKCRPM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=O1odHTw4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JYfnsdSfufBFWalo3qeLrTgSHYvAlQbPuIY9pVOLl4s=; b=O1odHTw4TlpciIDsdNuq8lkqi9
	83yWv4jl32w/tBZeUJuEEchtzF/kcUoxY4BOG7W9nlJTuNWOvmuRi7RqGTyCNVs/F+1UFP3M4/c90
	8EFP/4Vlj85Er6TpRqr+ME3loC0K/G85Goo7e9OmwuZzS/5oRF3/xWz1MzV64ErdQuoepuDEPIsbY
	tE6zZLr0a2g4c6peL/2jD5iXaVbdZ8zWngDSqFMejkqh0+f9NxyGEqnDYpyoo+HqRekikXDGakYew
	OtXCeDdPFzgQdgeqxyLvWYsBygW4jy2ReBti14yYKCn1gwp9wXTJxECME9weakeMdljV50bpDhIrY
	PFPoF8WQ==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sg3YB-00014n-R0; Mon, 19 Aug 2024 16:40:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	heiko@sntech.de,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v5 0/7] Drivers to support the MCU on QNAP NAS devices
Date: Mon, 19 Aug 2024 16:39:53 +0200
Message-ID: <20240819144000.411846-1-heiko@sntech.de>
X-Mailer: git-send-email 2.43.0
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

changes in v5:
binding:
- add Conor's Reviewed-by

mfd:
Address comments from Lee
- improve commit message
- improve Kconfig help text
- sort headers alphabetical
- style and spelling improvements
- constants for magic numbers
- drop reply assignment, the mcu only replies to commands sent to it,
  so there should only ever be one command in fligth.

hwmon:
Add Acked-by from Guenter and address some remarks
  - don't allow empty fan subnode
  - use num var directly when getting cooling levels, without using ret
    intermediate
  - use dev_err_probe in thermal init function


changes in v4:
binding:
- move cooling properties into a fan subnode and reference
  fan-common.yaml (Rob)
- dropped Krzysztof's Ack because of this

mfd:
- use correct format-string for size_t (kernel test robot)

input:
- added Dmitry's Ack

hwmon:
- adapted to fan-subnode when reading cooling properties
- dropped Guenter's Ack because of this


changes in v3:
mfd
- use correct power-off priority: default
- constify the cmd-data array in command functions (Dmitry)

leds:
- don't point to temporary buffers for cdev->name (Florian Eckert)

hwmon:
- use clamp_val(), don't try to reimplement (Guenter)
- add Guenter's Ack

input:
address Dmitry's comments
- constify some cmd arrays
- add input-close callback to cancel beep worker
- drop initial input event report


changes in v2:
binding:
- rename to qnap,ts433-mcu.yaml (Krzysztof)
- drop "preserve formatting" indicator (Krzysztof)
- add Krzysztof's Review tag

mfd:
- fix checkpatch --strict CHECKs
- add a MAINTAINERS entry for all qnap-mcu-parts

Heiko Stuebner (7):
  dt-bindings: mfd: add binding for qnap,ts433-mcu devices
  mfd: add base driver for qnap-mcu devices
  leds: add driver for LEDs from qnap-mcu devices
  Input: add driver for the input part of qnap-mcu devices
  hwmon: add driver for the hwmon parts of qnap-mcu devices
  arm64: dts: rockchip: hook up the MCU on the QNAP TS433
  arm64: dts: rockchip: set hdd led labels on qnap-ts433

 .../bindings/mfd/qnap,ts433-mcu.yaml          |  42 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/qnap-mcu-hwmon.rst        |  27 ++
 MAINTAINERS                                   |   9 +
 .../boot/dts/rockchip/rk3568-qnap-ts433.dts   |  61 +++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/qnap-mcu-hwmon.c                | 383 ++++++++++++++++++
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/qnap-mcu-input.c           | 161 ++++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-qnap-mcu.c                  | 247 +++++++++++
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/qnap-mcu.c                        | 347 ++++++++++++++++
 include/linux/mfd/qnap-mcu.h                  |  27 ++
 18 files changed, 1358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
 create mode 100644 Documentation/hwmon/qnap-mcu-hwmon.rst
 create mode 100644 drivers/hwmon/qnap-mcu-hwmon.c
 create mode 100644 drivers/input/misc/qnap-mcu-input.c
 create mode 100644 drivers/leds/leds-qnap-mcu.c
 create mode 100644 drivers/mfd/qnap-mcu.c
 create mode 100644 include/linux/mfd/qnap-mcu.h

-- 
2.43.0


