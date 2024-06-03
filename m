Return-Path: <linux-input+bounces-4047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F48D8638
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 17:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E89CB2337D
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 15:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE140132110;
	Mon,  3 Jun 2024 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KT8IO7EZ"
X-Original-To: linux-input@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3767A12DD95;
	Mon,  3 Jun 2024 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717429239; cv=none; b=lJ4qG/CP/Q6ZMrdZ7n2+OL78v1vAwSGkOgCI6/pAWFkR/nKtF7V3B5utVtRcpRiF5SM2XIzgd81LzG25HWbqCoaC6exLZZh0ZE+I+adoRXRxj0gZse/z0+sscSCEHfFWgtCb5AxBf4N14lQBc5h4NHye4M+h/npsxVwMVAXeBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717429239; c=relaxed/simple;
	bh=QMKBERARQh+aEmyxPKqRKzXoqlEfVpsBXidX22h4xRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEEBlCMa44edR666n2eO0kN5lhYl9QDqblAPTWc6saRYGxMB6pciQ7jeAxJOgRXiNT9RKRg13qUmjt9okNiNXyfpQ/z8uqXGaEpNY5XOBfYeORTscoZDCr6xw/Igba07nIKLdjdlFlcTAknALi9GGUjSz9PJMgKVjdGz7ZV8trs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KT8IO7EZ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB1FA1C0004;
	Mon,  3 Jun 2024 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717429228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FkFl+MFpTJonp1P30dypjdjGMEjZ4vm1ME+Y9uPEE/c=;
	b=KT8IO7EZyntx5Ag6iNsJs8KOR7RPyZdoQR4BrpftccXo5lQ8Ti2V/alL1m7tLwgJvHUrpV
	k8ycifSragZ2x3FWWvHitHXu6ILnIIg2GCijlQeD6A+bqDYBtoO3zOnjmbsIwdTiUNpPRY
	GJtxlrySV1tc4TOo56gSulZ4wopFs82u455cVJM46hs6MlbrIrw8H2a59kBpkBDWGq3YlN
	p5hAU86NxzMn5FowBYSO1OMGt1gjLTL9KqJfCrIDtUbJdog2mL9K+27mKyKY0CLZ7GpfEI
	V4f+nDGhOK6UO5479khttcY9h7zveAvdr5H8ltKJCq4dfbBeTO3ubMSr8TfMDA==
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
Subject: [PATCH v13 0/3] Input: Add TouchNetix axiom touchscreen driver
Date: Mon,  3 Jun 2024 17:39:22 +0200
Message-ID: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
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
 drivers/input/touchscreen/touchnetix_axiom.c  | 657 ++++++++++++++++++
 6 files changed, 744 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
 create mode 100644 drivers/input/touchscreen/touchnetix_axiom.c

--
2.25.1


