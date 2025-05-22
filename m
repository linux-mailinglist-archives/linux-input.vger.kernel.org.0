Return-Path: <linux-input+bounces-12517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C966FAC020C
	for <lists+linux-input@lfdr.de>; Thu, 22 May 2025 04:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 896074A7448
	for <lists+linux-input@lfdr.de>; Thu, 22 May 2025 02:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E22935953;
	Thu, 22 May 2025 02:04:37 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE63F9FB;
	Thu, 22 May 2025 02:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879477; cv=none; b=qKmiikhGRSKcPHHT2EkVvyjoEAAJ0y752fyKlu6L6kdJNBOA/pGe8T++9Twk/lPNdmcL1crk0+RZuhc3mOxrrtLFYUu/onyx/GLuVlT8+WxQ86TdRQBhThEwH7vOu9xB7cC2Az6Tq/Q9tG8mP+QRXoPlLqLGWs6R+irX11sB/HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879477; c=relaxed/simple;
	bh=Tw63bFmFn0FFWrm5mLvFp6MI3iHzKF8pEwyLlMb4ETk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NBKF+ERrYX9p++O9ULubMiDn23Y2uKTO7ZMkrS9tDy2lCquLXmAMR5w0XloMDVdOHQOe70AWQGLlo+Y+5aGwofkHGg85jXHRUMDU2AmJT0i5vnR6Ur826f58FzoCl+xn6ryS2eJAswif2FigdapIHRsmLct/PaYsP4eRPbe97cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 17B451A0A8A;
	Thu, 22 May 2025 04:04:27 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D1DC11A0A67;
	Thu, 22 May 2025 04:04:26 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 50CD01800089;
	Thu, 22 May 2025 10:04:25 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
To: Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org (open list:GOODIX TOUCHSCREEN),
	linux-kernel@vger.kernel.org (open list)
Cc: qijian.guo@nxp.com,
	haibo.chen@nxp.com,
	justin.jiang@nxp.com
Subject: [PATCH v3] LF-15225 input: goodix: add poll mode for goodix touchscreen
Date: Thu, 22 May 2025 11:04:18 +0900
Message-Id: <20250522020418.1963422-1-qijian.guo@nxp.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

goodix touchscreen only support interrupt mode by default.
Some panels like waveshare panel which is widely used on raspeberry pi
don't have interrupt pins and only work on i2c poll mode.
The waveshare panel 7inch panel use goodix gt911 touchscreen chip.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
---
Change from v1 to v2
- Remove unused variable in goodix_ts_data struct
- Use polling infrastructure
---
Change from v2 to v3
- Modify goodix_request_irq to make less diff
---
 drivers/input/touchscreen/goodix.c | 43 +++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index aaf79ac50004..8e72174f486d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -47,6 +47,7 @@
 #define RESOLUTION_LOC		1
 #define MAX_CONTACTS_LOC	5
 #define TRIGGER_LOC		6
+#define GOODIX_POLL_INTERVAL_MS		17	/* 17ms = 60fps */
 
 /* Our special handling for GPIO accesses through ACPI is x86 specific */
 #if defined CONFIG_X86 && defined CONFIG_ACPI
@@ -497,6 +498,14 @@ static void goodix_process_events(struct goodix_ts_data *ts)
 	input_sync(ts->input_dev);
 }
 
+static void goodix_ts_work_i2c_poll(struct input_dev *input)
+{
+	struct goodix_ts_data *ts = input_get_drvdata(input);
+
+	goodix_process_events(ts);
+	goodix_i2c_write_u8(ts->client, GOODIX_READ_COOR_ADDR, 0);
+}
+
 /**
  * goodix_ts_irq_handler - The IRQ handler
  *
@@ -523,13 +532,29 @@ static irqreturn_t goodix_ts_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void goodix_enable_irq(struct goodix_ts_data *ts)
+{
+	if (ts->client->irq)
+		enable_irq(ts->client->irq);
+}
+
+static void goodix_disable_irq(struct goodix_ts_data *ts)
+{
+	if (ts->client->irq)
+		disable_irq(ts->client->irq);
+}
+
 static void goodix_free_irq(struct goodix_ts_data *ts)
 {
-	devm_free_irq(&ts->client->dev, ts->client->irq, ts);
+	if (ts->client->irq)
+		devm_free_irq(&ts->client->dev, ts->client->irq, ts);
 }
 
 static int goodix_request_irq(struct goodix_ts_data *ts)
 {
+	if (!ts->client->irq)
+		return 0;
+
 	return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
 					 NULL, goodix_ts_irq_handler,
 					 ts->irq_flags, ts->client->name, ts);
@@ -1229,6 +1254,18 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 		return error;
 	}
 
+	input_set_drvdata(ts->input_dev, ts);
+
+	if (!ts->client->irq) {
+		error = input_setup_polling(ts->input_dev, goodix_ts_work_i2c_poll);
+		if (error) {
+			dev_err(&ts->client->dev,
+				 "could not set up polling mode, %d\n", error);
+			return error;
+		}
+		input_set_poll_interval(ts->input_dev, GOODIX_POLL_INTERVAL_MS);
+	}
+
 	error = input_register_device(ts->input_dev);
 	if (error) {
 		dev_err(&ts->client->dev,
@@ -1435,7 +1472,7 @@ static int goodix_suspend(struct device *dev)
 
 	/* We need gpio pins to suspend/resume */
 	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
-		disable_irq(client->irq);
+		goodix_disable_irq(ts);
 		return 0;
 	}
 
@@ -1479,7 +1516,7 @@ static int goodix_resume(struct device *dev)
 	int error;
 
 	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
-		enable_irq(client->irq);
+		goodix_enable_irq(ts);
 		return 0;
 	}
 
-- 
2.34.1


