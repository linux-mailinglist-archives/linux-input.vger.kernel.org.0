Return-Path: <linux-input+bounces-5862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5695E533
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 22:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FD121C20A43
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 20:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5FE1714D8;
	Sun, 25 Aug 2024 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EkopoRdv"
X-Original-To: linux-input@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E92E15B56E;
	Sun, 25 Aug 2024 20:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724617978; cv=none; b=g5t/UKw0D5mZJhjxLQBmJyUqjYPCeTQvankIozsIRfZ43b/EEgxxCSotGnf0Fm4aBS5mVksXw0a/UdKdWPDo8LizJJSWXefp5hdksKWssUosR8eIq4CHkqwyNfsrUUB8RYFO1pfVpWMIanoPrP2RQA26Qk7zhYtC2dhtC56cAV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724617978; c=relaxed/simple;
	bh=/1+6VeXf8rNwgGAEiYJ5GjrKUCNPTo+uMwqH4dYh5vg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQxNKRIjdvnyc6NNuYdzunY48KEUPL28GowVo0VzT/v5VNhD24yKG1TFD9DFUHf+jlT7yFT1Rj34wFvzwcSgb+Mv3rk7ldjz9NOIzuZHXVMRIyqYLRE9n+nXQDxrr2usyqfNsB3/jVBGvvrtkH6nNVJDvvjA0vXoxjbAzsEhZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EkopoRdv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FVhOtaDAlhZmOBGkDX28xSMYNRN47hu06Q4HLYH7Fmk=; b=EkopoRdvmvatG55uYY5miQyxzP
	T7X6jekdTHBt2n7modi/75c38/gaibPndTZiY9Q5jca2RGmw9p1vLp4ZI8AVWdPs44ftlPec8cN77
	6i87RMzhdZdo5zj8McOK30m8uz4xiCGTogCcw80tsx9q7DGnJJ9Vn3S1j09UMJoAUmaM+GftE7+ik
	V0q61DyJYcJRbTiy/ZblIt3sjuG3QYXE+TK4DAaqGjO40w9PSz8W1ctJbHtpvYbeS9wh+dFiIrOsn
	aswZBBAktqdLQO7uYaU7HdurMNdBiWT36MOlfKiEZN2DELg/jkAvHAbZTVnLTyNsc9ALN6ypccnU/
	dfewzS9w==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1siJui-0001cM-Fa; Sun, 25 Aug 2024 22:32:40 +0200
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
Subject: [PATCH v6 0/7] Drivers to support the MCU on QNAP NAS devices
Date: Sun, 25 Aug 2024 22:32:28 +0200
Message-ID: <20240825203235.1122198-1-heiko@sntech.de>
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

changes in v6:
- format mcu commands arrays in single lines (Lee)

mfd:
- drop obsolete remain kdoc for the removed
  reply_lock (kernel test robot)


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
 drivers/hwmon/qnap-mcu-hwmon.c                | 364 ++++++++++++++++++
 drivers/input/misc/Kconfig                    |  12 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/input/misc/qnap-mcu-input.c           | 153 ++++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-qnap-mcu.c                  | 226 +++++++++++
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/qnap-mcu.c                        | 339 ++++++++++++++++
 include/linux/mfd/qnap-mcu.h                  |  27 ++
 18 files changed, 1302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qnap,ts433-mcu.yaml
 create mode 100644 Documentation/hwmon/qnap-mcu-hwmon.rst
 create mode 100644 drivers/hwmon/qnap-mcu-hwmon.c
 create mode 100644 drivers/input/misc/qnap-mcu-input.c
 create mode 100644 drivers/leds/leds-qnap-mcu.c
 create mode 100644 drivers/mfd/qnap-mcu.c
 create mode 100644 include/linux/mfd/qnap-mcu.h

-- 
2.43.0


