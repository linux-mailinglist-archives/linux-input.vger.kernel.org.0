Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAB422A9DA
	for <lists+linux-input@lfdr.de>; Thu, 23 Jul 2020 09:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgGWHnc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jul 2020 03:43:32 -0400
Received: from inva021.nxp.com ([92.121.34.21]:33812 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgGWHnc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jul 2020 03:43:32 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B9EB5200024;
        Thu, 23 Jul 2020 09:43:29 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AAE93200A42;
        Thu, 23 Jul 2020 09:43:29 +0200 (CEST)
Received: from fsr-ub1864-014.ea.freescale.net (fsr-ub1864-014.ea.freescale.net [10.171.95.219])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D995202B6;
        Thu, 23 Jul 2020 09:43:29 +0200 (CEST)
From:   =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Robin Gong <yibin.gong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v3 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Date:   Thu, 23 Jul 2020 10:43:13 +0300
Message-Id: <20200723074314.3304-3-horia.geanta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723074314.3304-1-horia.geanta@nxp.com>
References: <20200723074314.3304-1-horia.geanta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: André Draszik <git@andred.net>

At the moment, enabling this driver without the SNVS RTC driver
being active will hang the kernel as soon as the power button
is pressed.

The reason is that in that case the SNVS isn't enabled, and
any attempt to read the SNVS registers will simply hang forever.

Ensure the clock is enabled (during the interrupt handler) to
make this driver work.

Also see commit 7f8993995410 ("drivers/rtc/rtc-snvs: add clock support")
and commit edb190cb1734
("rtc: snvs: make sure clock is enabled for interrupt handle")
for similar updates to the snvs rtc driver.

Signed-off-by: André Draszik <git@andred.net>
Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
---
 drivers/input/keyboard/snvs_pwrkey.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 2f5e3ab5ed63..382d2ae82c9b 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -16,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
+#include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
@@ -38,6 +39,7 @@ struct pwrkey_drv_data {
 	int wakeup;
 	struct timer_list check_timer;
 	struct input_dev *input;
+	struct clk *clk;
 	u8 minor_rev;
 };
 
@@ -47,7 +49,10 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
 	struct input_dev *input = pdata->input;
 	u32 state;
 
+	clk_enable(pdata->clk);
 	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
+	clk_disable(pdata->clk);
+
 	state = state & SNVS_HPSR_BTN ? 1 : 0;
 
 	/* only report new event if status changed */
@@ -74,11 +79,13 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 
 	pm_wakeup_event(input->dev.parent, 0);
 
+	clk_enable(pdata->clk);
+
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
 	if (lp_status & SNVS_LPSR_SPO) {
 		if (pdata->minor_rev == 0) {
 			/*
-			 * The first generation i.MX6 SoCs only sends an
+			 * The first generation i.MX[6|7] SoCs only send an
 			 * interrupt on button release. To mimic power-key
 			 * usage, we'll prepend a press event.
 			 */
@@ -96,6 +103,8 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	/* clear SPO status */
 	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
 
+	clk_disable(pdata->clk);
+
 	return IRQ_HANDLED;
 }
 
@@ -140,6 +149,23 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return -EINVAL;
 
+	pdata->clk = devm_clk_get_optional(&pdev->dev, "snvs-pwrkey");
+	if (IS_ERR(pdata->clk))
+		return PTR_ERR(pdata->clk);
+
+	error = clk_prepare(pdata->clk);
+	if (error) {
+		dev_err(&pdev->dev, "failed to prepare the snvs clock\n");
+		return error;
+	}
+	error = devm_add_action_or_reset(&pdev->dev,
+			(void(*)(void *))clk_unprepare,
+			pdata->clk);
+	if (error) {
+		dev_err(&pdev->dev, "failed to add reset action on 'snvs-pwrkey'");
+		return error;
+	}
+
 	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
 	pdata->minor_rev = vid & 0xff;
 
-- 
2.17.1

