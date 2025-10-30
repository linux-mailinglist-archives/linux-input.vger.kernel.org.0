Return-Path: <linux-input+bounces-15819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E30C2215B
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 20:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F1011A244B4
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 19:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BCC32F76B;
	Thu, 30 Oct 2025 19:51:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EE23016F6;
	Thu, 30 Oct 2025 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853915; cv=none; b=ppojtjcFXOxqKy8/TM8+r30VADJpE05lIRmzQetQGXH4IWnB6Zbbqq2alkf1oOHLD0/1AIRd7IogpjACLHYEtCl6lkrsXMg9qLYtGsw15AbJcfX6Z5GE7i6dAKMmU9hHc4qJ20Pq70DYLfjOrgC/Fbho8wxSw77acXKrYF0n5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853915; c=relaxed/simple;
	bh=5n07oj67Je80NH7aQ3GWzRhlJBRKFCiudjajpUFfZAI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dytma1noPWYppiPllktCf4HRmhnNEE4r3GJGeSe/n2PMS+WGlp1+30uBSqGBgDUHM6OIzjoJfbUdlzVXzdBa/ZetoYmghmZRBmbB8Kd6MNAtDWWSPLHmBbJW+zj7N5hxTnXks/6ez0cApEUHSgkg4f+/UCGurQgl4expHIRj4Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59UJvB6B020191;
	Thu, 30 Oct 2025 19:57:11 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59UJvBpT020190;
	Thu, 30 Oct 2025 19:57:11 GMT
From: Alexander Kurz <akurz@blala.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Dr . David Alan Gilbert" <linux@treblig.org>,
        Job Sava <jsava@criticallink.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v6 0/6] Fix, extend and support OF to mc13xxx pwrbutton
Date: Thu, 30 Oct 2025 19:56:48 +0000
Message-Id: <20251030195654.20142-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Goal of this patch series is to make mx13xxx power buttons usable
on DT based systems.
A ten-year-old IRQ issue needed a fix, mc13783-pwrbutton had to be
extended to the other to mc13xxx PMIC as well and adding OF support.
The implementation has been tested with PWRON1 on mc13892 found e.g.
in amazon kindle D01100/D01200/EY21 readers and also in on mc34708
in the imx53-qsrb "i.MX53 Quick start board".

Changes in v6:
- Link to v5: https://lore.kernel.org/linux-input/20251008064401.13863-1-akurz@blala.de/
- Rebase to v6.18-rc1
- Add a imx53-qsrb dts patch to enable the "power" button on the
  i.MX53 Quick start board.

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

Alexander Kurz (6):
  Input: mc13783-pwrbutton: use managed resources
  Input: mc13783-pwrbutton: fix irq mixup and use resources
  Input: mc13783-pwrbutton: convert pdata members to array
  Input: mc13783-pwrbutton: enable other mc13xxx PMIC
  Input: mc13783-pwrbutton: add OF support and drop platform_data
  ARM: dts: imx53: add imx53-qsrb PMIC power button

 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts |  12 +
 drivers/input/misc/Kconfig               |   4 +-
 drivers/input/misc/mc13783-pwrbutton.c   | 278 +++++++++++++----------
 drivers/mfd/mc13xxx-core.c               |  49 +++-
 drivers/mfd/mc13xxx.h                    |   2 +
 include/linux/mfd/mc13783.h              |   4 +-
 include/linux/mfd/mc13892.h              |   1 +
 include/linux/mfd/mc13xxx.h              |  20 +-
 8 files changed, 219 insertions(+), 151 deletions(-)

-- 
2.39.5


