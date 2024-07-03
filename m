Return-Path: <linux-input+bounces-4815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AAF926350
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 16:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B94E1C2163C
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 14:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C93117B425;
	Wed,  3 Jul 2024 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="efw1zff6"
X-Original-To: linux-input@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2632C1DFD1;
	Wed,  3 Jul 2024 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720016727; cv=none; b=fKj5IqjKJJOt5i3yMZoSBw9bJ4wAkyPOrLuFiKJlcMvWFwuDs1o9E0b8drGG7f/GvXdOHE1yxzOWwKTbcyXLDsal3MB6AMS6qVHd6zM8j0TAEpH6WmJv8rYXAdy5qa/rQvYTR7h+5cinWEYF4hjWhD9NMH2OgSidT3AA6MACFW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720016727; c=relaxed/simple;
	bh=8Vjl3YttzwHH2IsyM7t6WRqmidD0zMc9LqpB46m1uxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t9Dkc3fhW7zoo9/j9P5HtuLZYPOUr9KOCr4SjyAzMeoYpVuzb8AmiYcy56DPB+21NmSNVIsP8LCvD2bYdgOpkrvX+ykBCohYVY548mzjKI3Mlti+DigwsZml+b/ZeIPPgOsIDK9Q4vkHeX7VnA9VM+yVH9aazlKjfskIJkZFddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=efw1zff6; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3818C40005;
	Wed,  3 Jul 2024 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720016723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QDrB6n0exh4TdxMHPeUljoSu3UlZuOXj1a37x1NMQyo=;
	b=efw1zff6/mM4ToIHGLXq4pik4y9K5PRagdQwScUtXevMt4iBZccvfoQ43IsnA/R5gnOO15
	6uAfu0n2IILJDh60tHAHPdffOay49z+Gh5SRWVm7vQJcAqFs69xt8SAKZXd4JwukBZdbWC
	294jQyZ3K6HdYrcEIklapQmOXQ/nAsoxtvAMcNfuJM0zPKnJ1Vej299O7y0riOzml9YtUg
	iNhOrJ5RdDi2JmNts94QTwCVp5AFjqm97nQ0UMEkxwn5Xn1XKx33ESjVCtg3Tj00zMkhpH
	y9c0ci8ReWQeBWUNT1wY0KM27N37Uaj2xcy+6qioCsawhY/ZYUtFTnJVtPI39Q==
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
Subject: [PATCH v16 0/3] Input: Add TouchNetix axiom touchscreen driver
Date: Wed,  3 Jul 2024 16:25:15 +0200
Message-ID: <20240703142520.207066-1-kamel.bouhara@bootlin.com>
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
Changes in v16:
 - Fix bug report: https://lore.kernel.org/oe-kbuild-all/202406290709.X77lx18x-lkp@intel.com/
 - Remove leica from list of Maintainers
 - Rebase on v6.10-rc6

Changes in v15:
 - Fix report ABS_MT_TRACKING_ID after input_mt_slot

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
 MAINTAINERS                                   |   7 +
 drivers/input/touchscreen/Kconfig             |  14 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/touchnetix_axiom.c  | 616 ++++++++++++++++++
 6 files changed, 702 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
 create mode 100644 drivers/input/touchscreen/touchnetix_axiom.c

--
2.25.1


