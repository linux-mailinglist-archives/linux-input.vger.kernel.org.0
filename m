Return-Path: <linux-input+bounces-14267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7ABB32953
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 16:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E683A1B610C8
	for <lists+linux-input@lfdr.de>; Sat, 23 Aug 2025 14:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B56F262FDC;
	Sat, 23 Aug 2025 14:40:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838A81E9B37;
	Sat, 23 Aug 2025 14:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755960001; cv=none; b=hJ/dAdsVvdriaYwS67cFyzwWUXM4fScA/+1wXqxuVJiaa7H+6+qmrDNAudnc3PGBApKbHQeR0pP0o7f78HKPSxSRyNg26Sroayq+/TFA5FQQNNR1JwddG6X5BE/JHTas+utEh8/qPQdKYPPEetQW4+27HZYBkigDt8Wo+2FS5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755960001; c=relaxed/simple;
	bh=n4sdfey+tTi2oj/zLd0U8WbAxCvs6PmVfQkn7X3MUD0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iC8EXxNG+etXGUsz790Gm4xM3S/kX9LZ0fvmz0Zes+iM2to1Ag2PQGfwzsMcbkt7pLfGd6uBnDYXX4dxspp9IM2jEYol050QxBn3QRt7hdMWT6XH/IRlxMX5VpgjjS0Bj+9dBpcykfy9fN0OJWdeWHXBPfHFBeKNRzVQARKpEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57NEito4012699;
	Sat, 23 Aug 2025 14:44:55 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57NEishN012698;
	Sat, 23 Aug 2025 14:44:54 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v2 0/9] Fix, extend and support OF to mc13xxx pwrbutton
Date: Sat, 23 Aug 2025 14:44:32 +0000
Message-Id: <20250823144441.12654-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Goal of this patch series is to make the mc13892 PWRON1 button usable,
found e.g. on amazon kindle D01100/D01200 readers.
A ten-year-old IRQ issue needed a fix, mc13783-pwrbutton had to be
extended to the other to mc13xxx PMIC as well (keeping the mc13892
PWRON3 key unsupported for simplicity) and adding OF support.
The implementation has been tested on amazon kindle D01100 and D01200
readers using PWRON1 of a mc13892.

V2:
- Convert dt-bindings from txt to fsl,mc13xxx.yaml and add vendor prefix
  to led-control property, causing changes in dts and driver.
- Change node name from pwrbuttons to buttons
- Change property debounce-delay-value to debounce-delay-ms
- Fixed a section mismatch error
- Fixed https://lore.kernel.org/r/202508210551.VzAtE5re-lkp@intel.com/
  (wrong index used when converting to array access)
- Usage of generic device properties API in mc13783-pwrbutton.c
- Provide chip-specific max button id via platform_device_id, therefore
  swap patches 3 and 4.

Thanks in advance for the review effords,
Cheers, Alexnder

Alexander Kurz (9):
  Input: mc13783-pwrbutton: fix irq mixup
  Input: mc13783-pwrbutton: use managed resources
  Input: mc13783-pwrbutton: convert pdata members to array
  Input: mc13783-pwrbutton: enable other mc13xxx PMIC
  dt-bindings: mfd: fsl,mc13xxx: convert txt to DT schema
  dt-bindings: mfd: fsl,mc13xxx: add buttons node
  ARM: dts: imx: Use fsl,led-control as mc13xxx node name
  leds: mc13783: use fsl,led-control as node name
  Input: mc13783-pwrbutton: add OF support

 .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 272 ++++++++++++++++++
 .../devicetree/bindings/mfd/mc13xxx.txt       | 156 ----------
 .../dts/nxp/imx/imx27-phytec-phycore-som.dtsi |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts  |   2 +-
 .../boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts  |   2 +-
 .../boot/dts/nxp/imx/imx51-zii-scu3-esb.dts   |   2 +-
 drivers/input/misc/Kconfig                    |   4 +-
 drivers/input/misc/mc13783-pwrbutton.c        | 235 +++++++++++----
 drivers/leds/leds-mc13783.c                   |   2 +-
 include/linux/mfd/mc13783.h                   |   4 +-
 include/linux/mfd/mc13xxx.h                   |  10 +-
 11 files changed, 461 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mc13xxx.txt

-- 
2.39.5


