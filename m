Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D499F1091B5
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 17:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbfKYQTr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 11:19:47 -0500
Received: from D57E315A.static.ziggozakelijk.nl ([213.126.49.90]:52127 "EHLO
        protonic.nl" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728827AbfKYQTq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 11:19:46 -0500
X-Greylist: delayed 357 seconds by postgrey-1.27 at vger.kernel.org; Mon, 25 Nov 2019 11:19:44 EST
Received: from erd987.prtnl (erd987.prtnl [192.168.237.3])
        by sparta (Postfix) with ESMTP id A6E5944A00C3;
        Mon, 25 Nov 2019 17:13:45 +0100 (CET)
From:   Robin van der Gracht <robin@protonic.nl>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        RobinGong <yibin.gong@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>,
        Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v4] input: keyboard: snvs_pwrkey: Send key events for i.MX6 S, DL and Q
Date:   Mon, 25 Nov 2019 17:12:10 +0100
Message-Id: <20191125161210.8275-1-robin@protonic.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The first generation i.MX6 processors does not send an interrupt when the
power key is pressed. It sends a power down request interrupt if the key is
released before a hard shutdown (5 second press). This should allow
software to bring down the SoC safely.

For this driver to work as a regular power key with the older SoCs, we need
to send a keypress AND release when we get the power down request irq.

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---

Changes v3 -> v4:
 * The key release irq handler is now emitting the press and release
   events directly, instead of the debounce timer handler.

 drivers/input/keyboard/Kconfig       |  2 +-
 drivers/input/keyboard/snvs_pwrkey.c | 28 +++++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 7c4f19dab34f..937e58da5ce1 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -436,7 +436,7 @@ config KEYBOARD_SNVS_PWRKEY
 	depends on OF
 	help
 	  This is the snvs powerkey driver for the Freescale i.MX application
-	  processors that are newer than i.MX6 SX.
+	  processors.
 
 	  To compile this driver as a module, choose M here; the
 	  module will be called snvs_pwrkey.
diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 5342d8d45f81..4888e137cc5d 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -19,6 +19,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
+#define SNVS_HPVIDR1_REG 0xF8
 #define SNVS_LPSR_REG	0x4C	/* LP Status Register */
 #define SNVS_LPCR_REG	0x38	/* LP Control Register */
 #define SNVS_HPSR_REG	0x14
@@ -37,6 +38,7 @@ struct pwrkey_drv_data {
 	int wakeup;
 	struct timer_list check_timer;
 	struct input_dev *input;
+	u8 minor_rev;
 };
 
 static void imx_imx_snvs_check_for_events(struct timer_list *t)
@@ -67,13 +69,29 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 {
 	struct platform_device *pdev = dev_id;
 	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
+	struct input_dev *input = pdata->input;
 	u32 lp_status;
 
-	pm_wakeup_event(pdata->input->dev.parent, 0);
+	pm_wakeup_event(input->dev.parent, 0);
 
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
-	if (lp_status & SNVS_LPSR_SPO)
-		mod_timer(&pdata->check_timer, jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
+	if (lp_status & SNVS_LPSR_SPO) {
+		if (pdata->minor_rev == 0) {
+			/*
+			 * The first generation i.MX6 SoCs only sends an
+			 * interrupt on button release. To mimic power-key
+			 * usage, we'll prepend a press event.
+			 */
+			input_report_key(input, pdata->keycode, 1);
+			input_sync(input);
+			input_report_key(input, pdata->keycode, 0);
+			input_sync(input);
+			pm_relax(input->dev.parent);
+		} else {
+			mod_timer(&pdata->check_timer,
+			          jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
+		}
+	}
 
 	/* clear SPO status */
 	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
@@ -94,6 +112,7 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	struct input_dev *input = NULL;
 	struct device_node *np;
 	int error;
+	u32 vid;
 
 	/* Get SNVS register Page */
 	np = pdev->dev.of_node;
@@ -123,6 +142,9 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
+	pdata->minor_rev = vid & 0xff;
+
 	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
 
 	/* clear the unexpected interrupt before driver ready */
-- 
2.20.1

