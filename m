Return-Path: <linux-input+bounces-13409-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D95AFBDA2
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 23:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 967DA7AD3A3
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 21:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC8C288CB9;
	Mon,  7 Jul 2025 21:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3vv44Dd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27A12882AF;
	Mon,  7 Jul 2025 21:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924247; cv=none; b=IvCoBFWHK8Ej8rJlHvMQ66Gxw8cXeytlprcMJyBPpsM+7xpb2GUVs+FXDr0sZ1GCsMhvTtIoZ2kpHUIFhexUVKtc/4EhOOPm4OHyMFJO3MYUWxqGx5H9QnuQjHg2VPFfJDMWECW9vY49a3RKF9J2UVVslvGIUVPilfkmOyv0ZCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924247; c=relaxed/simple;
	bh=9nGbV5pz1KaNqlzP8COliGl9Au+D7xMYCmJAgqDzN90=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZzGxJ8qn6Hc846mbm/NbIjvr7I4Dfghlb7YVo+Be5NVr33t0+branApyx6xjQpFBAvcO/FB806948/ENPPmg+GAHD2BJToz6SNVHCBgqgMHhPSfPNo6Nze1ecmsaKSDg/OfuKaPeF1AbAE+d7+I8/OKhGFCz6Jh9XR1qUQ85Ezc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3vv44Dd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49849C4CEE3;
	Mon,  7 Jul 2025 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751924246;
	bh=9nGbV5pz1KaNqlzP8COliGl9Au+D7xMYCmJAgqDzN90=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=B3vv44DdXDXnwownFa8Vmqic9It5ZMyousUo6Y5TFOWstCVATZ0fjjMi3ty9xt/zl
	 dWspC0vDViuTzp9myMz1twHSrTyF3UIuhLy9hVvuz7v75Zhj4IbVRFZMhKUXYyu2m4
	 DLPo7OSxPtsbgWCBpHZtL8yJTBV1cd3vG6GbSMOEAdRNe8CXsD5tRhyG1ToLYpVD6Y
	 SGjSKcShyHeeEY8qfeEsR93C2DU7Gh8x77ai7PEg1bzy3xwXFkqNHZLwl9TE8nj/5A
	 boKRjWP9Ni0dd0jGsMfo7LRcdhO1o3LZ2U2vTLcs/jYJEwGzK0TilRZJ3q74/a26Le
	 kqJhqeJy9z4Fw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34700C8303C;
	Mon,  7 Jul 2025 21:37:26 +0000 (UTC)
From: Samuel Kayode via B4 Relay <devnull+samuel.kayode.savoirfairelinux.com@kernel.org>
Subject: [PATCH v8 0/6] add support for pf1550 PMIC MFD-based drivers
Date: Mon, 07 Jul 2025 17:37:19 -0400
Message-Id: <20250707-pf1550-v8-0-6b6eb67c03a0@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8+bGgC/33OTWrDMBAF4KsYrasw+hk7zqr3KFnI0qgRNHYiO
 SIh+O5VHXBNoV6+4fHNe7JEMVBih+rJIuWQwtCXsH+rmD2Z/pN4cCUzCRIBZcMvXiACdxqEBwd
 NtwdWypdIPtxn6OP4ypGut+KNryPrTCJuh/M5jIcq1zuB7Kd4Cmkc4mMekNXc/PsrKw5co69bj
 co6FO/J5CFEb0Kkr9Df7rvizlrWv0INahF0ETrvPAoibK3dEHAlCFgELAI5cC0pY4xtNoR6LYh
 FqIugtJfOeQKNtCE0a0EuQlMEINWqDrxG99+GaZq+AWxBktbYAQAA
X-Change-ID: 20250527-pf1550-d401f0d07b80
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Sebastian Reichel <sre@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-pm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
 Abel Vesa <abelvesa@linux.com>, Robin Gong <b38343@freescale.com>, 
 Robin Gong <yibin.gong@nxp.com>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Samuel Kayode <samuel.kayode@savoirfairelinux.com>, 
 Abel Vesa <abelvesa@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751924244; l=6606;
 i=samuel.kayode@savoirfairelinux.com; s=20250527;
 h=from:subject:message-id;
 bh=9nGbV5pz1KaNqlzP8COliGl9Au+D7xMYCmJAgqDzN90=;
 b=/ZFl5h3DXjhAPD2gyLJp3KP8KK8XAYzST2sa8y9XSHqPFFPaW+9uOmOIEu5L8KaIGIykhUA1o
 nGyoNdGAmthA9opsdJmbgYmdOjazTRqBrSeu7UFGYxt7AAH5jSdjHUY
X-Developer-Key: i=samuel.kayode@savoirfairelinux.com; a=ed25519;
 pk=TPSQGQ5kywnnPyGs0EQqLajLFbdDu17ahXz8/gxMfio=
X-Endpoint-Received: by B4 Relay for
 samuel.kayode@savoirfairelinux.com/20250527 with auth_id=412
X-Original-From: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
Reply-To: samuel.kayode@savoirfairelinux.com

This series adds support for pf1550 PMIC. It provides the core driver and a
three sub-drivers for the regulator, power supply and input subsystems.

Patch 1 adds the DT binding document for the PMIC. Patches 2-5 adds the
pertinent drivers. Last patch adds a MAINTAINERS entry for the drivers.

The patches 3-5 depend on the core driver provided in patch 2.

Changes since v1:
   - DT bindings for all devices included
   - Add onkey driver
   - Add driver for the regulators
   - Ensure charger is activated as some variants have it off by default
   - Update mfd and charger driver per feedback from eballetbo@gmail.com
   - Add myself as maintainer for these drivers
   - Link to v1: https://lore.kernel.org/1523974819-8711-1-git-send-email-abel.vesa@nxp.com/

Changes since v2:
   - Rebase on recent mainline kernel v6.15
   - Single yaml file containing dt bindings for all pf1550 devices
   - irq mapping done in MFD driver as suggested by Dmitry Torokhov
   - Drop unnecessary includes in drivers
   - Replace dev_err with dev_err_probe in probe method of drivers
   - Drop compatible string from drivers of the sub-devices
   - Remove dependency on OF from drivers of the sub-devices
   - onkey: move driver from input/keyboard into input/misc
   - onkey: remove dependency on OF
   - onkey: use onkey virqs instead of central irq
   - onkey: fix integer overflow for regmap_write when unmasking
     interrupts during pf1550_onkey_resume
   - charger: add support for monitored-battery which is used in setting
     a constant voltage for the charger.
   - Address other feedback from Dmitry Torokhov and Krzysztof Kozlowski
   - Link to v2: https://lore.kernel.org/cover.1747409892.git.samuel.kayode@savoirfairelinux.com/

Changes since v3:
   - Update manufacturer from Freescale to NXP in compatible,
     dt-binding and Kconfigs
   - Use C++ style comments for SPDX license in .c code
   - Add portions copyright to source code
   - irqs are defined as struct resource in mfd cell such that
     platform_get_irq is used in the sub-devices
   - Make struct pf1550_dev of type const in sub-device driver
   - irq variable dropped from sub-device driver struct
   - EXPORT_SYMBOL of global pf1550_read_otp function for use in
     regulator driver
   - Drop unneeded info in driver_data when defining device table id
   - regulator: validate ramp_delay
   - regulator: report overcurrent and over temperature events
   - onkey: drop unnecessary keycode variable
   - onkey: change wakeup variable to type bool
   - onkey: replace (error < 0) with error in if statement when possible
   - onkey: use pm_sleep_ptr when defining driver.pm
   - charger: finish handling of some interrupts in threaded irq handler
   - Link to v3: https://lore.kernel.org/20250527-pf1550-v3-0-45f69453cd51@savoirfairelinux.com/

Changes since v4:
   - Use top level interrupt to minimize number of registers checked on
     each interrupt
   - Fix bad offset for temperature interrupts of regulator irq chip
   - Address Krzysztof's comments for dt-binding
   - regulator: add comments to clarify difference in its interrupts
   - regulator: issue warn event for _LS interrupt and error event for
     _HS interrupt
   - regulator: validate maximum and minimum ramp_delay
   - charger: drop lock in battery and charger delayed_work
   - charger: more conservative locking for vbus delayed_work
   - charger: apply lock when setting power_supply type during register
     intialization
   - Link to v4: https://lore.kernel.org/r/20250603-pf1550-v4-0-bfdf51ee59cc@savoirfairelinux.com

Changes since v5:
   - Ensure lowercase when assigning hex values
   - Add imx@lists.linux.dev to relevant mailing list in MAINTAINERS file
   - Use GENMASK macro
   - Drop unused chips variable
   - Read the OTP in the mfd driver probe for new dvs_enb variable
   - Hardcode IRQ flags in pf1550_add_child function
   - charger: drop the mutex entirely
   - charger: reverse christmas tree style local variable definition in
     probe
   - Link to v5: https://lore.kernel.org/r/20250610-pf1550-v5-0-ed0d9e3aaac7@savoirfairelinux.com

Changes since v6:
   - Use reverse christmas tree order
   - Drop 0 in table id's driver data
   - charger: store virq to avoid reinvoking platform_get_irq in ISR
   - Link to v6: https://lore.kernel.org/r/20250611-pf1550-v6-0-34f2ddfe045e@savoirfairelinux.com

Changes since v7:
  - Thanks everyone for the reviews
  - Use C++ comment only for SPDX license header in core, charger and
    onkey drivers
  - Drop filenames from comments
  - Rename pf1550_dev to pf1550_ddata
  - Define OTP register for accessing status of DVS
  - core: rename from `mfd driver` to `core driver`
  - core: add child devices in a cleaner manner
  - charger: define two power supplies: battery and external power
  - charger: use devm_delayed_work_autocancel
  - Link to v7: https://lore.kernel.org/r/20250612-pf1550-v7-0-0e393b0f45d7@savoirfairelinux.com

Signed-off-by: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
---
Samuel Kayode (6):
      dt-bindings: mfd: add pf1550
      mfd: pf1550: add core driver
      regulator: pf1550: add support for regulator
      input: pf1550: add onkey support
      power: supply: pf1550: add battery charger support
      MAINTAINERS: add an entry for pf1550 mfd driver

 .../devicetree/bindings/mfd/nxp,pf1550.yaml        | 137 +++++
 MAINTAINERS                                        |  11 +
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/pf1550-onkey.c                  | 183 ++++++
 drivers/mfd/Kconfig                                |  16 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/pf1550.c                               | 365 ++++++++++++
 drivers/power/supply/Kconfig                       |  11 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/pf1550-charger.c              | 632 +++++++++++++++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/pf1550-regulator.c               | 360 ++++++++++++
 include/linux/mfd/pf1550.h                         | 266 +++++++++
 15 files changed, 2006 insertions(+)
---
base-commit: 0a4b866d08c6adaea2f4592d31edac6deeb4dcbd
change-id: 20250527-pf1550-d401f0d07b80

Best regards,
-- 
Samuel Kayode <samuel.kayode@savoirfairelinux.com>



