Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC40EA7BA2
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2019 08:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfIDGXe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Sep 2019 02:23:34 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:43455 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725267AbfIDGXd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Sep 2019 02:23:33 -0400
Received: from troy.prtnl (troy.prtnl [192.168.224.29])
        by sparta (Postfix) with ESMTP id DF3DC44A0022;
        Wed,  4 Sep 2019 08:25:30 +0200 (CEST)
From:   Robin van der Gracht <robin@protonic.nl>
To:     robin@protonic.nl
Cc:     "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        RobinGong <yibin.gong@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3] input: keyboard: snvs_pwrkey: Send key events for i.MX6 S, DL and Q
Date:   Wed,  4 Sep 2019 06:23:29 +0000
Message-Id: <20190904062329.97520-1-robin@protonic.nl>
X-Mailer: git-send-email 2.19.1
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

Changes v2 -> v3:
 - Drop alt compatible string for identifying first revision snvs hardware,
   read minor revision from register instead.
 - Drop imx6qdl.dtsi modification and device-tree binding documentation.
 - Add an additional input_sync() to create 2 seperate input reports for press
   and release.

 drivers/input/keyboard/Kconfig       |  2 +-
 drivers/input/keyboard/snvs_pwrkey.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

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
index 5342d8d45f81..828580eee0d2 100644
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
@@ -45,6 +47,20 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
 	struct input_dev *input = pdata->input;
 	u32 state;
 
+	if (pdata->minor_rev == 0) {
+		/*
+		 * The first generation i.MX6 SoCs only sends an interrupt on
+		 * button release. To mimic power-key usage, we'll prepend a
+		 * press event.
+		 */
+		input_report_key(input, pdata->keycode, 1);
+		input_sync(input);
+		input_report_key(input, pdata->keycode, 0);
+		input_sync(input);
+		pm_relax(input->dev.parent);
+		return;
+	}
+
 	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
 	state = state & SNVS_HPSR_BTN ? 1 : 0;
 
@@ -67,13 +83,17 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 {
 	struct platform_device *pdev = dev_id;
 	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
+	unsigned long expire = jiffies;
 	u32 lp_status;
 
 	pm_wakeup_event(pdata->input->dev.parent, 0);
 
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
-	if (lp_status & SNVS_LPSR_SPO)
-		mod_timer(&pdata->check_timer, jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
+	if (lp_status & SNVS_LPSR_SPO) {
+		if (pdata->minor_rev > 0)
+			expire = jiffies + msecs_to_jiffies(DEBOUNCE_TIME);
+		mod_timer(&pdata->check_timer, expire);
+	}
 
 	/* clear SPO status */
 	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
@@ -94,6 +114,7 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	struct input_dev *input = NULL;
 	struct device_node *np;
 	int error;
+	u32 vid;
 
 	/* Get SNVS register Page */
 	np = pdev->dev.of_node;
@@ -123,6 +144,9 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
+	pdata->minor_rev = vid & 0xff;
+
 	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
 
 	/* clear the unexpected interrupt before driver ready */
-- 
2.20.1

