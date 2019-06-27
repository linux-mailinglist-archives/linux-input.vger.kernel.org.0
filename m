Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B28E576F2
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2019 02:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbfF0AmH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 20:42:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:45816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727136AbfF0AmH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 20:42:07 -0400
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B56FF21881;
        Thu, 27 Jun 2019 00:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561596125;
        bh=zv5ArkQNzKVhkr4KOuXcuxsIBaZHqAmilWoFbD4Feso=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V9n2K3bblpLgGAOc3DnVnN6sTbPwk+nj+1/mdc6YSknF4Q3GKOtl5qN5sAE8YYtLi
         53cqLUjr7k34WvR3ae0cVrQHdh+OL9V5p4XG5citrywyxYGv59dIzZtWYtrOm2/glB
         Oy/FKoTNJ/FdnMeNF/Fyj8FqoGOAIG3MsxC9ex9U=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Anson Huang <anson.huang@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 12/21] Input: imx_keypad - make sure keyboard can always wake up system
Date:   Wed, 26 Jun 2019 20:41:12 -0400
Message-Id: <20190627004122.21671-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627004122.21671-1-sashal@kernel.org>
References: <20190627004122.21671-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Anson Huang <anson.huang@nxp.com>

[ Upstream commit ce9a53eb3dbca89e7ad86673d94ab886e9bea704 ]

There are several scenarios that keyboard can NOT wake up system
from suspend, e.g., if a keyboard is depressed between system
device suspend phase and device noirq suspend phase, the keyboard
ISR will be called and both keyboard depress and release interrupts
will be disabled, then keyboard will no longer be able to wake up
system. Another scenario would be, if a keyboard is kept depressed,
and then system goes into suspend, the expected behavior would be
when keyboard is released, system will be waked up, but current
implementation can NOT achieve that, because both depress and release
interrupts are disabled in ISR, and the event check is still in
progress.

To fix these issues, need to make sure keyboard's depress or release
interrupt is enabled after noirq device suspend phase, this patch
moves the suspend/resume callback to noirq suspend/resume phase, and
enable the corresponding interrupt according to current keyboard status.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/keyboard/imx_keypad.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 2165f3dd328b..842c0235471d 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -530,11 +530,12 @@ static int imx_keypad_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused imx_kbd_suspend(struct device *dev)
+static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct imx_keypad *kbd = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = kbd->input_dev;
+	unsigned short reg_val = readw(kbd->mmio_base + KPSR);
 
 	/* imx kbd can wake up system even clock is disabled */
 	mutex_lock(&input_dev->mutex);
@@ -544,13 +545,20 @@ static int __maybe_unused imx_kbd_suspend(struct device *dev)
 
 	mutex_unlock(&input_dev->mutex);
 
-	if (device_may_wakeup(&pdev->dev))
+	if (device_may_wakeup(&pdev->dev)) {
+		if (reg_val & KBD_STAT_KPKD)
+			reg_val |= KBD_STAT_KRIE;
+		if (reg_val & KBD_STAT_KPKR)
+			reg_val |= KBD_STAT_KDIE;
+		writew(reg_val, kbd->mmio_base + KPSR);
+
 		enable_irq_wake(kbd->irq);
+	}
 
 	return 0;
 }
 
-static int __maybe_unused imx_kbd_resume(struct device *dev)
+static int __maybe_unused imx_kbd_noirq_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct imx_keypad *kbd = platform_get_drvdata(pdev);
@@ -574,7 +582,9 @@ static int __maybe_unused imx_kbd_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(imx_kbd_pm_ops, imx_kbd_suspend, imx_kbd_resume);
+static const struct dev_pm_ops imx_kbd_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_kbd_noirq_suspend, imx_kbd_noirq_resume)
+};
 
 static struct platform_driver imx_keypad_driver = {
 	.driver		= {
-- 
2.20.1

