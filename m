Return-Path: <linux-input+bounces-14715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C75EB56BC1
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 21:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05E33B91E5
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCBF2E0B60;
	Sun, 14 Sep 2025 19:35:50 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC52E0930;
	Sun, 14 Sep 2025 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878550; cv=none; b=Rnajj02AKWNVm3bQ+N7nk+IrBOlmVNSqHlogfiNmxJevpFZxmIfdi6sTpfnRo1GHMT+UuXjbutj+ieJ1cTiTxZxyMOx6q1omfjz19cbt2jDtN/J/51kU/vYXuQ2VMT36O9AqNry8M5MH+xqzDHSpUx9Mbmpt/j2BlT6I0Gqv0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878550; c=relaxed/simple;
	bh=zlWgZH9zO2fLw1wk5QTBk4v7aohrG9ecRNMhu0kyeAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V5nFHOWvZJrnC7tM+cXv/XS+fhkrtmZejfiUcCLXpVuZq4mV5BNwr73jeFS9/I/fZv0Dm5ZL0A1z0eDvgbgIJXT+jJcnfOVjQiE03hS/ASfpkNrCpDzf43SwHRQs7gbe9Kq8oS6jQvEH04yNy0+WX95MF5d62KA/sF7bNT95PdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 58EJbPnI010587;
	Sun, 14 Sep 2025 19:37:25 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 58EJbOCa010586;
	Sun, 14 Sep 2025 19:37:24 GMT
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
Subject: [PATCH v4 0/8] Fix, extend and support OF to mc13xxx pwrbutton
Date: Sun, 14 Sep 2025 19:37:15 +0000
Message-Id: <20250914193723.10544-1-akurz@blala.de>
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
extended to the other to mc13xxx PMIC as well and adding OF support.
The implementation has been tested only with PWRON1 on an mc13892.

Changes in v4:
- Link to v3: https://lore.kernel.org/linux-input/20250829201517.15374-1-akurz@blala.de/
- Rebase to git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
  tags/ib-mfd-input-rtc-v6.18 in order to include a different mc13xxx
  related patch (sorry for that).
- Re-ordered commits since dt-bindings changes already go reviewes by
  Rob Herring.
- Following Dmitrys suggestions, resources for irq are now passed from
  mfd to input allowing a more simple implementation. Work on other mfd
  cells with irq usage might still be a future project.
- Input-related differences between the mc13xxx variants are encoded
  in data structures, making the implementation of mc13892 PWRON3 a
  simple task.

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

Alexander Kurz (8):
  dt-bindings: mfd: fsl,mc13xxx: convert txt to DT schema
  dt-bindings: mfd: fsl,mc13xxx: add buttons node
  Input: mc13783-pwrbutton: use managed resources
  mfd: mc13xxx: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
  Input: mc13783-pwrbutton: fix irq mixup and use resources
  Input: mc13783-pwrbutton: convert pdata members to array
  Input: mc13783-pwrbutton: enable other mc13xxx PMIC
  Input: mc13783-pwrbutton: add OF support

 .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 288 ++++++++++++++++++
 .../devicetree/bindings/mfd/mc13xxx.txt       | 156 ----------
 drivers/input/misc/Kconfig                    |   4 +-
 drivers/input/misc/mc13783-pwrbutton.c        | 276 +++++++++--------
 drivers/mfd/mc13xxx-core.c                    |  62 +++-
 drivers/mfd/mc13xxx.h                         |   2 +
 include/linux/mfd/mc13783.h                   |   4 +-
 include/linux/mfd/mc13892.h                   |   1 +
 include/linux/mfd/mc13xxx.h                   |  10 +-
 9 files changed, 503 insertions(+), 300 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mc13xxx.txt

-- 
2.39.5


