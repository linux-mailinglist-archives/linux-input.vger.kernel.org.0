Return-Path: <linux-input+bounces-12632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28EAC73AB
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 00:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062EB9E6650
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 22:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B2F1E98E3;
	Wed, 28 May 2025 22:08:50 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85FF1DE89B
	for <linux-input@vger.kernel.org>; Wed, 28 May 2025 22:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470130; cv=none; b=g9hWf9HQgUJSkq7kDIWNJtrRzuiZrXIC5jAy8II6LqI3VuVp4eyzJO+HUC1+UNiGCjctjq1XYZ3Ga1NMGllE9jUypbJr7LABdXOSiP6sNX2OI3MNJ/2m4GtMcd6ia+T0vQpeCUUiydqlMLsHAyJPCaLXnnXP6y5y/MIVna69Pu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470130; c=relaxed/simple;
	bh=FTrdQ3hMx7DZNBFQbA81Ry3nFSdnYhAy4VPAaZM23gI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iGZ62Ep7f6IzYDNZ704qhKSkfm2FvqiY/7ZeWCx90KURNuf3b7KmCgRt1NnnaDTBk/ckbYJMFaFGqQVNQkA+iC5DJIR+QbYMW/ozhIRvLMKic5zELuGm+5OPDG8w3gIW1YraenMuOr+VyEs5LYBbeaxfMjtobgyc0aUM1ivk4E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uKOx2-0003CA-ND; Thu, 29 May 2025 00:08:44 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 0/4] Input: Add support for TouchNetix aXiom touchscreen
Date: Thu, 29 May 2025 00:08:41 +0200
Message-Id: <20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmJN2gC/4WNSw6DMAxEr4K8rqs44ttV71GxoMEFL5qgJERUi
 Ls35QLdjPRmpDc7BPbCAW7FDp6TBHE2g74UYObBTowyZgatdKkaVWKqkRRGt4jJuZo5GM9scdj
 EvfNUNTVxS4oIsmPx/JLt9D/6zLOE6PznvEv0a08zEXV/zIlQYU267HT17Bpq7wvbaY3eWdmuI
 0N/HMcXEpcHmc8AAAA=
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
 Danilo Krummrich <dakr@redhat.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>
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

---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de
- Rework the firmware-duplicate handling -> expose the error to the
  userspace
- Drop Krzysztof Kozlowski ACK and RB
- Add panel-follower support
- Add sysfs-driver-input-touchnetix-axiom documentation
- Add support for new firmware 4.8.9
- Add support to handle 2D and 3D firmware

To: Luis Chamberlain <mcgrof@kernel.org>
To: Russ Weight <russ.weight@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rafael J. Wysocki <rafael@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Marco Felsch <kernel@pengutronix.de>
To: Henrik Rydberg <rydberg@bitmath.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: kernel@pengutronix.de

---
Kamel Bouhara (2):
      dt-bindings: vendor-prefixes: Add TouchNetix AS
      dt-bindings: input: Add TouchNetix axiom touchscreen

Marco Felsch (2):
      firmware_loader: expand firmware error codes with skip error
      Input: Add TouchNetix aXiom I2C Touchscreen support

 .../testing/sysfs-driver-input-touchnetix-axiom    |   74 +
 .../input/touchscreen/touchnetix,ax54a.yaml        |   64 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 drivers/base/firmware_loader/sysfs_upload.c        |    1 +
 drivers/input/touchscreen/Kconfig                  |   15 +
 drivers/input/touchscreen/Makefile                 |    1 +
 drivers/input/touchscreen/touchnetix_axiom.c       | 2974 ++++++++++++++++++++
 include/linux/firmware.h                           |    2 +
 lib/test_firmware.c                                |    1 +
 9 files changed, 3134 insertions(+)
---
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
change-id: 20240704-v6-10-topic-touchscreen-axiom-105761e81011

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


