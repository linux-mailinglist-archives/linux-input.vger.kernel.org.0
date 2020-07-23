Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4186622A9DF
	for <lists+linux-input@lfdr.de>; Thu, 23 Jul 2020 09:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgGWHnd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jul 2020 03:43:33 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37076 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgGWHnc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jul 2020 03:43:32 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 686081A007F;
        Thu, 23 Jul 2020 09:43:30 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5A01B1A006F;
        Thu, 23 Jul 2020 09:43:30 +0200 (CEST)
Received: from fsr-ub1864-014.ea.freescale.net (fsr-ub1864-014.ea.freescale.net [10.171.95.219])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B5CEF202B6;
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
Subject: [PATCH v3 3/3] Input: snvs_pwrkey - only IRQ_HANDLED for our own events
Date:   Thu, 23 Jul 2020 10:43:14 +0300
Message-Id: <20200723074314.3304-4-horia.geanta@nxp.com>
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

The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.

This driver here should only return IRQ_HANDLED if the status register
indicates that the event we're handling in the irq handler was genuinely
intended for this driver. Otheriwse the interrupt subsystem will
assume the interrupt was handled successfully even though it wasn't
at all.

Signed-off-by: André Draszik <git@andred.net>
Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
---
 drivers/input/keyboard/snvs_pwrkey.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 382d2ae82c9b..980867886b34 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -82,7 +82,9 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	clk_enable(pdata->clk);
 
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
-	if (lp_status & SNVS_LPSR_SPO) {
+	lp_status &= SNVS_LPSR_SPO;
+
+	if (lp_status) {
 		if (pdata->minor_rev == 0) {
 			/*
 			 * The first generation i.MX[6|7] SoCs only send an
@@ -98,14 +100,14 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 			mod_timer(&pdata->check_timer,
 			          jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 		}
-	}
 
-	/* clear SPO status */
-	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
+		/* clear SPO status */
+		regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
+	}
 
 	clk_disable(pdata->clk);
 
-	return IRQ_HANDLED;
+	return lp_status ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static void imx_snvs_pwrkey_act(void *pdata)
-- 
2.17.1

