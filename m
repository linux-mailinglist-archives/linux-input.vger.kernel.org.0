Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A049766193
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 00:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfGKWYL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jul 2019 18:24:11 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:44530 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfGKWYL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jul 2019 18:24:11 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45l9Zd1xNLz1rGSD;
        Fri, 12 Jul 2019 00:24:09 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45l9Zd14cGz1qqkC;
        Fri, 12 Jul 2019 00:24:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 5SN7f6_6QCNu; Fri, 12 Jul 2019 00:24:07 +0200 (CEST)
X-Auth-Info: YQDWIzJtbL+C3Qeg/dlsTCr6R97bL+Uvfw2kYiy0XWY=
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 12 Jul 2019 00:24:07 +0200 (CEST)
From:   Lukasz Majewski <lukma@denx.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2 2/3] input: touchscreen mc13xxx: Make platform data optional
Date:   Fri, 12 Jul 2019 00:23:45 +0200
Message-Id: <20190711222346.5245-3-lukma@denx.de>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190711222346.5245-1-lukma@denx.de>
References: <20190711222346.5245-1-lukma@denx.de>
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
---
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
2.11.0

