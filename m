Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD53AE059
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2019 23:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391865AbfIIVpE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Sep 2019 17:45:04 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:54111 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfIIVpE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Sep 2019 17:45:04 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46S1sp6MKWz1s5l4;
        Mon,  9 Sep 2019 23:45:02 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46S1sp63JMz1qqkC;
        Mon,  9 Sep 2019 23:45:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id sncZ18zW4FqX; Mon,  9 Sep 2019 23:45:01 +0200 (CEST)
X-Auth-Info: 19V4OdvUc0SRvdsWsaLyf12pbobBcmDq27s6owue0HA=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  9 Sep 2019 23:45:01 +0200 (CEST)
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v5 2/3] input: touchscreen mc13xxx: Make platform data optional
Date:   Mon,  9 Sep 2019 23:44:39 +0200
Message-Id: <20190909214440.30674-3-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190909214440.30674-1-lukma@denx.de>
References: <20190909214440.30674-1-lukma@denx.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sascha Hauer <s.hauer@pengutronix.de>

The platform data once was optional, make it optional again. This
is a first step towards device tree support for the mc13xxx touchscreen
driver.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Lukasz Majewski <lukma@denx.de>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---
Changes for v5:
- None

Changes for v4:
- Add Dmitry's Acked-by:

Changes for v3:
- None

Changes for v2:
- None

Changes from the original patch:
- Commit message typo fixes
---
 drivers/input/touchscreen/mc13783_ts.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/mc13783_ts.c b/drivers/input/touchscreen/mc13783_ts.c
index ae0d978c83bf..edd49e44e0c9 100644
--- a/drivers/input/touchscreen/mc13783_ts.c
+++ b/drivers/input/touchscreen/mc13783_ts.c
@@ -35,7 +35,8 @@ struct mc13783_ts_priv {
 	struct mc13xxx *mc13xxx;
 	struct delayed_work work;
 	unsigned int sample[4];
-	struct mc13xxx_ts_platform_data *touch;
+	u8 ato;
+	bool atox;
 };
 
 static irqreturn_t mc13783_ts_handler(int irq, void *data)
@@ -125,7 +126,7 @@ static void mc13783_ts_work(struct work_struct *work)
 
 	if (mc13xxx_adc_do_conversion(priv->mc13xxx,
 				mode, channel,
-				priv->touch->ato, priv->touch->atox,
+				priv->ato, priv->atox,
 				priv->sample) == 0)
 		mc13783_ts_report_sample(priv);
 }
@@ -169,6 +170,7 @@ static void mc13783_ts_close(struct input_dev *dev)
 static int __init mc13783_ts_probe(struct platform_device *pdev)
 {
 	struct mc13783_ts_priv *priv;
+	struct mc13xxx_ts_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct input_dev *idev;
 	int ret = -ENOMEM;
 
@@ -180,11 +182,10 @@ static int __init mc13783_ts_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&priv->work, mc13783_ts_work);
 	priv->mc13xxx = dev_get_drvdata(pdev->dev.parent);
 	priv->idev = idev;
-	priv->touch = dev_get_platdata(&pdev->dev);
-	if (!priv->touch) {
-		dev_err(&pdev->dev, "missing platform data\n");
-		ret = -ENODEV;
-		goto err_free_mem;
+
+	if (pdata) {
+		priv->atox = pdata->atox;
+		priv->ato = pdata->ato;
 	}
 
 	idev->name = MC13783_TS_NAME;
-- 
2.20.1

