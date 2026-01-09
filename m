Return-Path: <linux-input+bounces-16885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53175D070B1
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 04:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62713303179E
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 03:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F864287257;
	Fri,  9 Jan 2026 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="cfN1UWHV"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBA78F3E;
	Fri,  9 Jan 2026 03:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767930727; cv=none; b=pLgnK4NuNO7aUYnt0JPDnQAg+8VcXsqV/IPAsV3AOw/2v4X4Mu4/8iq1IwGsVRjwLJuaaUwUxXAfcX8wkLPZY12k7SK6t9X4P7Gr4CFWfKFEue52eWQigQD6ov9mWL8OXd81MlZ6d2nbDOvgjSxEsCuNqXUZbMQuOYGY3yK9n4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767930727; c=relaxed/simple;
	bh=uxZ3CkpEy15TnQ1ULYwy+Wmf8O36xPliaR075t0g1DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPP2aP/Hbndya9I47h58BYZfpPVunO3FQWTqdHLzcDUYdl3HPXUO4vmfripa5U2uugboLOoOT38UDZds8389BvE0zMuDooVGaEnsakXUXIOq1t2+OzA0YyouwUa4ArWeX6vn7/HazHeaOBPX0atqxXjVhL1gJi2e/2cnCWSogd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=cfN1UWHV; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 819AD10DBD7;
	Fri,  9 Jan 2026 04:51:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767930717; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZpmuA+wL4dOmKwenCzLLh4lsrXSWeFNsxnoNBZWAah0=;
	b=cfN1UWHV+gu5+pJ8ggnB/YhQs/jQta/5YGRwGmjz+cuTE0bhWh+65wPLlLl5vGMnR6w4c1
	0rPfUO+VlyRsvdTeqhY7wz3laFAFTRhTaTL+muPBf672IP4AGfVh/CCa9zPh3ItsH1ZNaD
	v3IHC9EqQPB4q6SWM1DiZsu6rOKwCWkIhHEkaDsz+okm2ai50A06thm1uCCgsaeoOohAxg
	sHxG45nX5V80MVpyUnvMuuXbrAIuxOjiz5t0+CiA19HJvwpNJEA1fLP6ZYfr/pRehqcHTQ
	Qha4tMMqpas3KJhvT2Pv9VRx61pTybuSXZFTAiLR6cm504nUV/1oJce0b4EWOQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jens Reidel <adrian@mainlining.org>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: edt-ft5x06 - add support for polling mode
Date: Fri,  9 Jan 2026 04:51:45 +0100
Message-ID: <20260109035149.1341931-2-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260109035149.1341931-1-marex@nabladev.com>
References: <20260109035149.1341931-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

There are designs incorporating EDT ETM touch controller that do not
connect interrupt pin, for example Raspberry Pi. To support such systems
use polling mode for the input device when I2C client does not have
interrupt assigned to it.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jens Reidel <adrian@mainlining.org>
Cc: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/input/touchscreen/edt-ft5x06.c | 74 ++++++++++++++++++--------
 1 file changed, 53 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 9a0add3d39159..a16bf93243976 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -69,6 +69,7 @@
 #define TOUCH_EVENT_RESERVED		0x03
 
 #define EDT_NAME_LEN			23
+#define EDT_POLL_INTERVAL_MS		17 /* msec */
 #define EDT_SWITCH_MODE_RETRIES		10
 #define EDT_SWITCH_MODE_DELAY		5 /* msec */
 #define EDT_RAW_DATA_RETRIES		100
@@ -295,9 +296,9 @@ static const struct regmap_config edt_M06_i2c_regmap_config = {
 	.write = edt_M06_i2c_write,
 };
 
-static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
+static void edt_ft5x06_ts_process_events(struct edt_ft5x06_ts_data *tsdata,
+					 bool poll)
 {
-	struct edt_ft5x06_ts_data *tsdata = dev_id;
 	struct device *dev = &tsdata->client->dev;
 	u8 rdbuf[63];
 	int i, type, x, y, id;
@@ -307,9 +308,13 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 	error = regmap_bulk_read(tsdata->regmap, tsdata->tdata_cmd, rdbuf,
 				 tsdata->tdata_len);
 	if (error) {
-		dev_err_ratelimited(dev, "Unable to fetch data, error: %d\n",
-				    error);
-		goto out;
+		if (!poll) {
+			/* Polling may result in no data. */
+			dev_err_ratelimited(dev,
+					    "Unable to fetch data, error: %d\n",
+					    error);
+		}
+		return;
 	}
 
 	for (i = 0; i < tsdata->max_support_points; i++) {
@@ -341,11 +346,24 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 
 	input_mt_report_pointer_emulation(tsdata->input, true);
 	input_sync(tsdata->input);
+}
+
+static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
+{
+	struct edt_ft5x06_ts_data *tsdata = dev_id;
+
+	edt_ft5x06_ts_process_events(tsdata, false);
 
-out:
 	return IRQ_HANDLED;
 }
 
+static void edt_ft5x06_work_i2c_poll(struct input_dev *input)
+{
+	struct edt_ft5x06_ts_data *tsdata = input_get_drvdata(input);
+
+	edt_ft5x06_ts_process_events(tsdata, true);
+}
+
 struct edt_ft5x06_attribute {
 	struct device_attribute dattr;
 	size_t field_offset;
@@ -613,7 +631,8 @@ static int edt_ft5x06_factory_mode(struct edt_ft5x06_ts_data *tsdata)
 		return -EINVAL;
 	}
 
-	disable_irq(client->irq);
+	if (client->irq)
+		disable_irq(client->irq);
 
 	if (!tsdata->raw_buffer) {
 		tsdata->raw_bufsize = tsdata->num_x * tsdata->num_y *
@@ -656,7 +675,8 @@ static int edt_ft5x06_factory_mode(struct edt_ft5x06_ts_data *tsdata)
 	kfree(tsdata->raw_buffer);
 	tsdata->raw_buffer = NULL;
 	tsdata->factory_mode = false;
-	enable_irq(client->irq);
+	if (client->irq)
+		enable_irq(client->irq);
 
 	return error;
 }
@@ -697,7 +717,8 @@ static int edt_ft5x06_work_mode(struct edt_ft5x06_ts_data *tsdata)
 	tsdata->raw_buffer = NULL;
 
 	edt_ft5x06_restore_reg_parameters(tsdata);
-	enable_irq(client->irq);
+	if (client->irq)
+		enable_irq(client->irq);
 
 	return 0;
 }
@@ -1331,17 +1352,26 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 		return error;
 	}
 
-	irq_flags = irq_get_trigger_type(client->irq);
-	if (irq_flags == IRQF_TRIGGER_NONE)
-		irq_flags = IRQF_TRIGGER_FALLING;
-	irq_flags |= IRQF_ONESHOT;
+	input_set_drvdata(input, tsdata);
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, edt_ft5x06_ts_isr, irq_flags,
-					  client->name, tsdata);
-	if (error) {
-		dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
-		return error;
+	if (client->irq) {
+		irq_flags = irq_get_trigger_type(client->irq);
+		if (irq_flags == IRQF_TRIGGER_NONE)
+			irq_flags = IRQF_TRIGGER_FALLING;
+		irq_flags |= IRQF_ONESHOT;
+
+		error = devm_request_threaded_irq(&client->dev, client->irq,
+						  NULL, edt_ft5x06_ts_isr, irq_flags,
+						  client->name, tsdata);
+		if (error) {
+			dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
+			return error;
+		}
+	} else {
+		error = input_setup_polling(input, edt_ft5x06_work_i2c_poll);
+		if (error)
+			return dev_err_probe(&client->dev, error, "Unable to set up polling.\n");
+		input_set_poll_interval(input, EDT_POLL_INTERVAL_MS);
 	}
 
 	error = input_register_device(input);
@@ -1394,7 +1424,8 @@ static int edt_ft5x06_ts_suspend(struct device *dev)
 	 * settings. Disable the irq to avoid adjusting each host till the
 	 * device is back in a full functional state.
 	 */
-	disable_irq(tsdata->client->irq);
+	if (tsdata->client->irq)
+		disable_irq(tsdata->client->irq);
 
 	gpiod_set_value_cansleep(reset_gpio, 1);
 	usleep_range(1000, 2000);
@@ -1456,7 +1487,8 @@ static int edt_ft5x06_ts_resume(struct device *dev)
 		msleep(300);
 
 		edt_ft5x06_restore_reg_parameters(tsdata);
-		enable_irq(tsdata->client->irq);
+		if (tsdata->client->irq)
+			enable_irq(tsdata->client->irq);
 
 		if (tsdata->factory_mode)
 			ret = edt_ft5x06_factory_mode(tsdata);
-- 
2.51.0


