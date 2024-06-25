Return-Path: <linux-input+bounces-4611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9BD916AAB
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 16:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C156C1C20CEF
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 14:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18F216C696;
	Tue, 25 Jun 2024 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kOyxB3pT"
X-Original-To: linux-input@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB12116C685;
	Tue, 25 Jun 2024 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326396; cv=none; b=irX/mviwgVMCU9U93fLI//QtyD+rNyCkCXZpnTKg+15E7Him1ef1y/Q/EVXIT5GFWqEuCuyFEVwyA1oI/sCT5X5qFqGRfGCZQhtRkiyTa8AtByBZWXTGmhO5uOz01EIq3/UZ3Sasfy1cr07kuZxQuEZqhBxreepGnpTG9iK0EhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326396; c=relaxed/simple;
	bh=en/sRYnVyZg+dc2W5BHiqCQyiELoDY0ZAXnPw4Iocvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYcNTKW8IX3mZVZQqtbPTB+YIRU8PJFfuQbpXA3JjHTGgvXkZd8SGPZ2D3pRsZphTwzuCMxkj+XFvN2rS3x/xMotfjf5fEems82HkG5NveeOuyMVNKeatG0ig2NhGp+bAtURsLJMpA7jC8YLQl8H/3Uv442+K1tAvIc1vawyBB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kOyxB3pT; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AC3A40007;
	Tue, 25 Jun 2024 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719326392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zPnkx9b43HnSsm2wIVDr0iTt2JyGKIKneN2NUnjQtVM=;
	b=kOyxB3pT9Z4fEbn+o3stfyi0s/qVRzjCaAykolG5Ie82lMzSxx+jEIhMjid6KnecV/cJ6o
	uWP2aP10FV9zfh4GTqfaF5bv3ghod6ZUc3HPJeYY+I0Y/N7YnFOHMVwZ7jCWOSBFEjpFTS
	8b2BlcGjQoLkCg+CJw8ZmK8kh548ektE0EcwBCRvFMmOkFqeWVd5NHdXZpgrp+BmXa6nFh
	oOOiJCq42Bs/0pgscIgQpbhrZ4kdp4cBy0ZXR72HK59rjfTrNyN9V5hPEenDpxDZi+0chE
	DwpvQf7pBwSKOlkGtviUwbRqjOc1u3FGOYWgRIZQCpGHpqopShhVyG6N0/rSJA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>
Cc: catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v14 0/3] Input: Add TouchNetix axiom touchscreen driver
Date: Tue, 25 Jun 2024 16:39:45 +0200
Message-ID: <20240625143948.54452-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Add a new driver for the TouchNetix's axiom family of touchscreen
controller. This driver only support i2c and can be later adapted for
SPI and USB support.
--
Changes in v14:
 - Fix is_report/present as booleans
 - Add a comment to describe the boolean variable insert
 - Remove not needed packed attributed from struct axiom_cmd_header
 - Remove duplicate target event checking
 - Only emit ABS_MT_DISTANCE/ABS_MT_PRESSURE
 - Remove input_report_key() as a mean to indicate firs reported contact
 - Remove EV_REL only need for u46 aka debug data
 - Report only MT_TOOL_FINGER instead of MT_TOOL_MAX
 - Remove unused EV_REL
 - Remove emit BTN_TOUCH as a way to indicate first target report
 - Remove unjustified delay after read access
 - Remove falling back to polling mode when no irq acquired in ACPI/DT
 - Remove handle of u46 report as it's not used
 - Remove touchscreen_report_pos() call as it generates extra dummy events
 - Rebase on v6.10-rc5

Changes in v13:
 - Fix CRC16 not selected reported in:https://lore.kernel.org/oe-kbuild-all/202405311035.5QZSREJv-lkp@intel.com/
 - Rebase on v6.10-rc2

Changes in v12:
 - Fix REGMAP_I2C not selected
 - Rebase on v6.10-rc1

Changes in v11:
 - Fix regulators name to match dt-binding
 - Enable regulators before reset is asserted

Changes in v10:
 - Set regulators as required
 - Enable power supply before reset
 - Fix ref count due to regulator requested twice
 - Rebase on v6.9-rc4

Changes in v9:
 - Fix issue reported in https://lore.kernel.org/oe-kbuild-all/202402201157.BKo97uWl-lkp@intel.com/
 - Rebase on v6.8-rc2

Changes in v8:
 - Fix missing call to input_report_slot_state()
 - Fix issue reported in https://lore.kernel.org/oe-kbuild-all/202402020623.8T1Ah513-lkp@intel.com/

Changes in v7:
 - Remove startup time from dt-binding
 - Fix usage table not correctly populated

Changes in v6:
 - Fix missing unevaluatedProperties.in dt-binding
 - Use __le16 to correctly deal with device endianness
 - Use standart kernel types s/char/u8/
 - Use regmap api as driver might support spi later
 - Use get_unaligned_le16() for the sake of clarity
 - Use devm_regulator_enable_optional()

Changes in v5:
 - Fix wrong message constructed in axiom_i2c_read
 - Delay required between i2c reads is >= 250us
 - Do not split report reading in two phases as we'll
   have to wait 500us
 - Use lower-case in properties names
 - Make regulators properties are required in dt-binding
 - Fix bug report: https://lore.kernel.org/lkml/202312051457.y3N1q3sZ-lkp@intel.com/
 - Fix bug report: https://lore.kernel.org/lkml/6f8e3b64-5b21-4a50-8680-063ef7a93bdb@suswa.mountain/

Changes in v4:
 - Cleanup unused headers and macros
 - Use standard kernel type
 - Namespace structures and functions
 - Use packed struct when possible to avoid bitfield operators
 - Fix missing break when address is found in axiom_populate_target_address()
 - Split reads in two steps for the reports, first length then report
   itself so we only read required bytes
 - Get poll-interval from devicetree
 - Add VDDI/VDDA regulators
 - Add a startup delay of 110 ms required after VDDA/VDDI is applied
 - Remove axiom_i2c_write() as it is no more used

Changes in v3:
 - Remove irq-gpios property in dt-binding
 - Use a generic node name
 - Fix issues reported in https://lore.kernel.org/oe-kbuild-all/202310100300.oAC2M62R-lkp@intel.com/

Changes in v2:
 - Add device tree binding documentation
 - Move core functions in axiom_i2c as we only care about i2c support now
 - Use static function when required
 - Use syntax dev_err_probe()
 - Add an hardware based reset

Kamel Bouhara (3):
  dt-bindings: vendor-prefixes: Add TouchNetix AS
  dt-bindings: input: Add TouchNetix axiom touchscreen
  Input: Add TouchNetix axiom i2c touchscreen driver

 .../input/touchscreen/touchnetix,ax54a.yaml   |  62 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 drivers/input/touchscreen/Kconfig             |  14 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/touchnetix_axiom.c  | 616 ++++++++++++++++++
 6 files changed, 703 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
 create mode 100644 drivers/input/touchscreen/touchnetix_axiom.c

--
2.25.1


