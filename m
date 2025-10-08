Return-Path: <linux-input+bounces-15300-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC35BC37ED
	for <lists+linux-input@lfdr.de>; Wed, 08 Oct 2025 08:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 352634E6450
	for <lists+linux-input@lfdr.de>; Wed,  8 Oct 2025 06:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BBE2E8E0E;
	Wed,  8 Oct 2025 06:45:35 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8616E2BF017;
	Wed,  8 Oct 2025 06:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759905935; cv=none; b=cpuUB465rtkCRaHrHL5q1/etTL6eCXncKPMOEOvIQfki3B4/FfL64QWjaLTxlwJ8TwQTVR3Cjv8ZmQ1GokZMcJHZEgM4+FUBMTIb4UgD6Q96QUbwDpBTKGy/xoIXN1kpv0WMj9fB4MlfiIo86A/otVGUAUwRtwnaXhKRiMheUfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759905935; c=relaxed/simple;
	bh=1PBcx97QcA6OXN0v6RXHNk2Bipq2hx6B8aZ8M0Ghlvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QVKHKhNFqM/8qkD0KdFxvMxz7Gnho/ryUZ8o3CSM2GIGqRVcO0fjxj1cEC63nzxIXXhUnNEdNI2RAiAURIGWRdOazixwMVcCcmGXyLaMkxf249fMrJ5pN00MNSrOlys5XZQWJixW6P1XFgUT4spNsA7ZaByF2DUgmwsIYJktIdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 5986i27V013906;
	Wed, 8 Oct 2025 06:44:02 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 5986i25D013905;
	Wed, 8 Oct 2025 06:44:02 GMT
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
Subject: [PATCH v5 0/5] Fix, extend and support OF to mc13xxx pwrbutton
Date: Wed,  8 Oct 2025 06:43:56 +0000
Message-Id: <20251008064401.13863-1-akurz@blala.de>
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

Changes in v5:
- Link to v4: https://lore.kernel.org/linux-input/20250914193723.10544-1-akurz@blala.de/
- Rebase to current to include already merged dt-schema patches and
  a different mc13xxx related patch.
- Drop patch to use devm_mfd_add_devices and devm_regmap_add_irq_chip -
  won't like to do the proposed mutex-cleanup now.
- While adding OF support, remove the platform_data configuration
  interface as proposed by Dmitry Torokhov. Also drop the change
  to use module_platform_driver_probe.

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

Alexander Kurz (5):
  Input: mc13783-pwrbutton: use managed resources
  Input: mc13783-pwrbutton: fix irq mixup and use resources
  Input: mc13783-pwrbutton: convert pdata members to array
  Input: mc13783-pwrbutton: enable other mc13xxx PMIC
  Input: mc13783-pwrbutton: add OF support and drop platform_data

 drivers/input/misc/Kconfig             |   4 +-
 drivers/input/misc/mc13783-pwrbutton.c | 278 ++++++++++++++-----------
 drivers/mfd/mc13xxx-core.c             |  49 ++++-
 drivers/mfd/mc13xxx.h                  |   2 +
 include/linux/mfd/mc13783.h            |   4 +-
 include/linux/mfd/mc13892.h            |   1 +
 include/linux/mfd/mc13xxx.h            |  20 +-
 7 files changed, 207 insertions(+), 151 deletions(-)

-- 
2.39.5


