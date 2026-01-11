Return-Path: <linux-input+bounces-16941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78451D0F3DE
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 16:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE286301CB4B
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 15:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573B31F3BA4;
	Sun, 11 Jan 2026 15:05:58 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A02D46D6
	for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768143958; cv=none; b=TxwKHkjwPqDOF5aSoMHuHGk3z8VhhLZio6WXZYu0oOnqWGmI6m9FurRndyXp6a/yGyuh+kvjPfskSVai0jKKyVfs3e1tPGEaUy+CiFGFbApq4JvK7ar2ge8AT63mQw72w9tbogmi8JZW9whScsPwAIxWeETbedGFOc7at5o0LuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768143958; c=relaxed/simple;
	bh=Z+UYuPcxwTAYn5fEGYu7PIC71ZOo+MFkrnH9AKsKs8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ARW2whwzitbD8DY4MSVIxx7NXUL4k0xKSwVPRH2gb4dA8jCaIIuMl8rS6i6qn4hIDEDWMHm71r2QtluTJmkLz/DOJPA08W9cAfSJZxfQb4qHD2Bmj8EOsv4Cy4PnCITvfbwDaJL7VWsE+STDyRD0rzg3bs0HzSaLPnRFDwecrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vex0q-0004rl-M7; Sun, 11 Jan 2026 16:05:52 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 0/4] Input: Add support for TouchNetix aXiom touchscreen
Date: Sun, 11 Jan 2026 16:05:43 +0100
Message-Id: <20260111-v6-10-topic-touchscreen-axiom-v5-0-f94e0ae266cb@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEe8Y2kC/4XPsWrEMAwG4Fc5PNdFcmwn7tT3KB0cR714qBPsn
 Ek58u5VAkeHHmQR/BJ8ku6iUI5UxNvlLjLVWOKUOJiXiwijT1eSceAsFCgNLWhZrUSQyzTHwPU
 WxhIyUZJ+jdM3j0xrkToERMHGnOkrrof/8cl5jGWZ8s+xruLePWREdCdyRQnSotJOmd612L3Pl
 K63JU8prq8DiZ2v6kEaMOqUVEx6Q0PPZ3sL8JRs/shO4RnZMOk0hEBkh943T0n9IC0g2DNS7yS
 53rrQ8ff2H7lt2y8GocLryAEAAA==
X-Change-ID: 20240704-v6-10-topic-touchscreen-axiom-105761e81011
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Kamel Bouhara <kamel.bouhara@bootlin.com>, 
 Marco Felsch <kernel@pengutronix.de>, Henrik Rydberg <rydberg@bitmath.org>, 
 Danilo Krummrich <dakr@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Hi,

this adds the support for the TouchNetix aXiom touchcontroller family.

The following features are added:
 - I2C communication
 - Input event handling
 - Touchcontroller firmware (AXFW or ALC) updates
 - Touchcontroller config (TH2CFGBIN) updates

Regards,
  Marco

Changes in v5:
- Link to v4: https://lore.kernel.org/r/20260106-v6-10-topic-touchscreen-axiom-v4-0-9e9b69c84926@pengutronix.de
- fix sysfs documentation description indentation and date

Changes in v4:
- Link to v3: https://lore.kernel.org/r/20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de
- rebased on top of v6.19-rc1
- collect r-b tags

Changes in v3:
- Link to v2: https://lore.kernel.org/r/20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de
- firmware: fix commit message (Russ)
- dt-bindings: Add ack from Krzysztof
- dt-bindings: make use of GPIO_ACTIVE_LOW (Krzysztof)
- dt-bindings: drop 'panel: true' property (Krzysztof)
- driver: make use of sysfs_emit (Greg)
- driver: s/WARN()/dev_warn()/ to not take down the system (Greg)
- driver: fix build dependency error by adding "depends on DRM || !DRM"
- driver: harmonize usage printing to u%02X

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de
- Rework the firmware-duplicate handling -> expose the error to the
  userspace
- Drop Krzysztof Kozlowski ACK and RB
- Add panel-follower support
- Add sysfs-driver-input-touchnetix-axiom documentation
- Add support for new firmware 4.8.9
- Add support to handle 2D and 3D firmware

---
Kamel Bouhara (2):
      dt-bindings: vendor-prefixes: Add TouchNetix AS
      dt-bindings: input: Add TouchNetix axiom touchscreen

Marco Felsch (2):
      firmware_loader: expand firmware error codes with up-to-date error
      Input: Add TouchNetix aXiom I2C Touchscreen support

 .../testing/sysfs-driver-input-touchnetix-axiom    |   81 +
 .../input/touchscreen/touchnetix,ax54a.yaml        |   62 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 drivers/base/firmware_loader/sysfs_upload.c        |    1 +
 drivers/input/touchscreen/Kconfig                  |   17 +
 drivers/input/touchscreen/Makefile                 |    1 +
 drivers/input/touchscreen/touchnetix_axiom.c       | 2974 ++++++++++++++++++++
 include/linux/firmware.h                           |    2 +
 lib/test_firmware.c                                |    1 +
 9 files changed, 3141 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20240704-v6-10-topic-touchscreen-axiom-105761e81011

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


