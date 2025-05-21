Return-Path: <linux-input+bounces-12488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6CABEA1D
	for <lists+linux-input@lfdr.de>; Wed, 21 May 2025 04:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDCAF7A2A8D
	for <lists+linux-input@lfdr.de>; Wed, 21 May 2025 02:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DDC220681;
	Wed, 21 May 2025 02:59:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F0B12E5D;
	Wed, 21 May 2025 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747796347; cv=none; b=XFEMKB9F1t1EICsxcQAa8jy9stzpE85wuiJR7lWWbowkKbLKiqCY+iOCWWDos4FPRSUXVjGFtZuoOPXfNPNyVmBTXEFQyoyySv0YN4NfrRlOzR+caSPcRYqsrRmbsiIqp1j9RS/WtYEg8ccrfH3GhWCxjaavmizhBGsLtgIoHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747796347; c=relaxed/simple;
	bh=f/Xp+DkIPojq0Dv4wAjMCrLOyVDzuADRaucbFUhvr+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B5q4AkLNYEt8lTSvZWwOV3mSBUkzy63WYpz9vU62tvBjdk0i/sF3X9vxXoKwA82czCupYVsijyzN8kzrukmA9kRkTHCDtV8MZWfXorXZMiJLT+nhsUXV0A4UxDKMYY/O9cRXEa7ubMX+RGksj74RlDoQfaMXZGdMHKd+ai7rTGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 642812005C1;
	Wed, 21 May 2025 04:50:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2B64F2005BF;
	Wed, 21 May 2025 04:50:34 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9BC881800087;
	Wed, 21 May 2025 10:50:32 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
To: Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org (open list:GOODIX TOUCHSCREEN),
	linux-kernel@vger.kernel.org (open list)
Cc: qijian.guo@nxp.com,
	haibo.chen@nxp.com,
	justin.jiang@nxp.com
Subject: [PATCH] input: goodix: add poll mode for goodix touchscreen
Date: Wed, 21 May 2025 11:50:11 +0900
Message-Id: <20250521025011.887562-1-qijian.guo@nxp.com>
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
 drivers/input/touchscreen/goodix.c | 50 ++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index aaf79ac50004..58e49e5cf148 100644
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
@@ -523,16 +532,33 @@ static irqreturn_t goodix_ts_irq_handler(int irq, void *dev_id)
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
-	return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
-					 NULL, goodix_ts_irq_handler,
-					 ts->irq_flags, ts->client->name, ts);
+	if (ts->client->irq) {
+		return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
+						 NULL, goodix_ts_irq_handler,
+						 ts->irq_flags, ts->client->name, ts);
+		}
+	else
+		return 0;
 }

 static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8 *cfg, int len)
@@ -1229,6 +1255,18 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
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
@@ -1435,7 +1473,7 @@ static int goodix_suspend(struct device *dev)

 	/* We need gpio pins to suspend/resume */
 	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
-		disable_irq(client->irq);
+		goodix_disable_irq(ts);
 		return 0;
 	}

@@ -1479,7 +1517,7 @@ static int goodix_resume(struct device *dev)
 	int error;

 	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_NONE) {
-		enable_irq(client->irq);
+		goodix_enable_irq(ts);
 		return 0;
 	}

--
2.34.1


