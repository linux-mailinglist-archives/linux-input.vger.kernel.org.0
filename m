Return-Path: <linux-input+bounces-14391-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABEDB3C39A
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 22:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ED9D7C4876
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 20:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FE0252292;
	Fri, 29 Aug 2025 20:10:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1E1238171;
	Fri, 29 Aug 2025 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756498222; cv=none; b=NDouchGEHKGZNKGOFpE2ab9mu9C9gIu15gyBF3DoujiJVZ/M1WcNStVKjTNnySliPFjSghuvdX9oh6MTGALV+1XI5RF0/5IhG4i4jTeevfIsqraqSGow+SYPuEkjldx0dXXekMjN/oA6MXo/A3G3tGwbeHSHaQ1tfR8/vM/C57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756498222; c=relaxed/simple;
	bh=9TRcTWzRNNqFqyLL0fhxlFhQ4FTBBHTXpufL0KAG85M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GYdKJ+nixJa/IAUd1+CTqFRW4B6mBSYrjRpMneeuSTS/k4XfqytyK+bzj9txeYE1QOQ//cWUv8xSpWLb3zhRj/jRECElaCZGlyjlTcA2utcjs7MzhiX4ktc0e3axVoJvF+UJ6IWvhWr4Z/GcyCjJlwyirh2gM0wojXD2u+CS1Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 57TKFIEV015417;
	Fri, 29 Aug 2025 20:15:18 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 57TKFIDH015416;
	Fri, 29 Aug 2025 20:15:18 GMT
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
Subject: [PATCH v3 0/7] Fix, extend and support OF to mc13xxx pwrbutton
Date: Fri, 29 Aug 2025 20:15:10 +0000
Message-Id: <20250829201517.15374-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Goal of this patch series is to make the mc13892 PWRON1 button usable,
found e.g. on amazon kindle D01100/D01200/EY21 readers.
A ten-year-old IRQ issue needed a fix, mc13783-pwrbutton had to be
extended to the other to mc13xxx PMIC as well (keeping the mc13892
PWRON3 key unsupported for simplicity) and adding OF support.
The implementation has been tested on amazon kindle D01100 and D01200
readers using PWRON1 of a mc13892.

Changes in v3:
- Link to v2: https://lore.kernel.org/linux-input/20250823144441.12654-1-akurz@blala.de/
- Undo all changes to led-control (rename to fsl,led-control), thanks Rob
- Restructured the new buttons node for unevaluatedProperties: false
- Various other remarks from Rob
- Rebase to current state

Changes in v2:
- Link to v1: https://lore.kernel.org/linux-input/20250817102751.29709-1-akurz@blala.de/
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

Alexander Kurz (7):
  Input: mc13783-pwrbutton: fix irq mixup
  Input: mc13783-pwrbutton: use managed resources
  Input: mc13783-pwrbutton: convert pdata members to array
  Input: mc13783-pwrbutton: enable other mc13xxx PMIC
  dt-bindings: mfd: fsl,mc13xxx: convert txt to DT schema
  dt-bindings: mfd: fsl,mc13xxx: add buttons node
  Input: mc13783-pwrbutton: add OF support

 .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 288 ++++++++++++++++++
 .../devicetree/bindings/mfd/mc13xxx.txt       | 156 ----------
 drivers/input/misc/Kconfig                    |   4 +-
 drivers/input/misc/mc13783-pwrbutton.c        | 235 ++++++++++----
 include/linux/mfd/mc13783.h                   |   4 +-
 include/linux/mfd/mc13xxx.h                   |  10 +-
 6 files changed, 472 insertions(+), 225 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mc13xxx.txt

-- 
2.39.5


