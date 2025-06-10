Return-Path: <linux-input+bounces-12746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D9AD2B0F
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 02:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 257531706AD
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 00:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC6C1519A0;
	Tue, 10 Jun 2025 00:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ttJZQEtM";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="P9glIRHG"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389F151985;
	Tue, 10 Jun 2025 00:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749516920; cv=none; b=jLq+iZ2iwAg8Oz332NLOTdvvVZFnjtQONoTHuvMpDy8CPttAgdNntyw2J2zhw5AbexcdbXHxGnmDidAbeHj08x76G4yPhUbA7KuFDiz+IyW8bROkBUW+kjgHOEGlCdUTqnlcD+L6CWtZ07IqY6HEKRtdaBSPB58o59agHb+1u1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749516920; c=relaxed/simple;
	bh=4IC+0RznDsQfg947HHCRZQy3sy0QM/YAwzgVjDX7VY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUnlAwKlftncF8+Etr7gPqWyYouUM8A4aUfuzp4SiNu/Iol15d5rFL+ahlGTnphFz+Vb45NQvD+6Q4EMlv1d5RtWSgtBsMXE62JWeVJYaPQ8Z+CvFP5kIAVpWg/Qkibw5pPpBNPfuG9UmcZy+M4qDcs39OJYpjJSbw8GTjUZFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ttJZQEtM; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=P9glIRHG; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bGVh42ZHSz9t00;
	Tue, 10 Jun 2025 02:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749516916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X74FY2y0hU5iurRHZ/0ahZMLJD9IT1RKZd0mC0LWjYM=;
	b=ttJZQEtMsYFlQFdDMCUwXmC3sM8qgUGxQFlyY+q4QzoTEzkJ5iJOjDDpz8paWnAKfMfi65
	JyP9fWj9fq3Xp88ZhlFcnVJvJ72rsVUYES3gNsuhg2wZTJK316xwxpOi873OtGp4xFmjEt
	NRIMXh7WkQt5UIfrWfUzGXUKiJbop8QHOwvJiaIluQxwG4nEQRzI0sZ9PkIFVzV6NbaB5L
	shg8/VmEzxKvIuZPLq3nrpVuYzb2J20THctT8NHXYNP2YzJKUAYwL+N8PNJxbujMPh2P+J
	lxe036/AWafWFqLt5ohi0hc/f0Cn3rcDnNueKP3pSse/asT5pgwOJZUfXcm9IA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749516914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X74FY2y0hU5iurRHZ/0ahZMLJD9IT1RKZd0mC0LWjYM=;
	b=P9glIRHGARe84/CnIymgYAG+bb0dr9dReCgKiMAWy4RILrl0h3OgRyn7lMNS0hrkCqfq1c
	Hre7HcvRnhCmI9JSlKTQ7RGmB99R1pxNAOSk8y6xYZRGu4mP0uaozEQvAa3vBZv4Fsa1ZU
	V7gwLwTfxGlKTpGLAN0w3sv5uc4QC2CRHk4w+MrICUVa+QG/zF78Rk5KXD/TEYkUPudiJR
	Q1F8ZK8zQMBvK3NIBy66Xo3tAV1sdHD8It2RZX3a2HbQsDWzLO4ok09vaTaiDJvV2i62d6
	XGEEqi3CLYQBAyu3d0e+9d3LUUo94skmraX6VnQWVA5vHYdRpxTHSEBhwHe9TA==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] Input: goodix - add support for polling on devices without IRQ line
Date: Tue, 10 Jun 2025 02:54:12 +0200
Message-ID: <20250610005458.126842-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b83bd63a96d321c3a5c
X-MBO-RS-META: s7qtf83ggwb5ceux9tk53tfd1peinssf
X-Rspamd-Queue-Id: 4bGVh42ZHSz9t00

Add the capability of polling the touch controller for events every
16ms, which is useful on hardware that did integrate this touch
controller, but did not integrate the IRQ line, like the RasPi .

Make use of the generic input poller code. Factor out the code
from goodix_ts_irq_handler() into generic goodix_ts_handler(), so
it can be used both by the IRQ handler and poller callback.

Use of_client->irq to find out whether the interrupt line is present
or not, independent of whether this is OF or ACPI system. It is not
possible to register poller in case request_irq() fails, because the
request_irq() in this driver is deliberately called after the input
device was registered, and registering the generic poller at that point
is too late already.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
This is a rework of https://github.com/raspberrypi/linux 3756b7801f3e ("input: goodix: Add option to poll instead of relying on IRQ line")
---
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/input/touchscreen/goodix.c | 57 ++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index a3e8a51c9144..91b7d244301d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -48,6 +48,9 @@
 #define MAX_CONTACTS_LOC	5
 #define TRIGGER_LOC		6
 
+/* Polling interval (ms) , 16 ms ~= 60 FPS */
+#define POLL_INTERVAL		16
+
 /* Our special handling for GPIO accesses through ACPI is x86 specific */
 #if defined CONFIG_X86 && defined CONFIG_ACPI
 #define ACPI_GPIO_SUPPORT
@@ -497,6 +500,12 @@ static void goodix_process_events(struct goodix_ts_data *ts)
 	input_sync(ts->input_dev);
 }
 
+static void goodix_ts_handler(struct goodix_ts_data *ts)
+{
+	goodix_process_events(ts);
+	goodix_i2c_write_u8(ts->client, GOODIX_READ_COOR_ADDR, 0);
+}
+
 /**
  * goodix_ts_irq_handler - The IRQ handler
  *
@@ -507,24 +516,57 @@ static irqreturn_t goodix_ts_irq_handler(int irq, void *dev_id)
 {
 	struct goodix_ts_data *ts = dev_id;
 
-	goodix_process_events(ts);
-	goodix_i2c_write_u8(ts->client, GOODIX_READ_COOR_ADDR, 0);
+	goodix_ts_handler(ts);
 
 	return IRQ_HANDLED;
 }
 
+static void goodix_ts_poll(struct input_dev *input_dev)
+{
+	struct goodix_ts_data *ts = input_get_drvdata(input_dev);
+
+	goodix_ts_handler(ts);
+}
+
 static void goodix_free_irq(struct goodix_ts_data *ts)
 {
-	devm_free_irq(&ts->client->dev, ts->client->irq, ts);
+	if (ts->client->irq > 0)
+		devm_free_irq(&ts->client->dev, ts->client->irq, ts);
 }
 
 static int goodix_request_irq(struct goodix_ts_data *ts)
 {
+	/* The interrupts property is not present in DT, use poller */
+	if (ts->client->irq <= 0)
+		return 0;
+
+	/* The interrupts property is present in DT, use IRQs */
 	return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
 					 NULL, goodix_ts_irq_handler,
 					 ts->irq_flags, ts->client->name, ts);
 }
 
+static int goodix_request_poller(struct goodix_ts_data *ts)
+{
+	struct device *dev = &ts->client->dev;
+	int error;
+
+	/* The interrupts property is present in DT, use IRQs */
+	if (ts->client->irq > 0)
+		return 0;
+
+	/* The interrupts property is not present in DT, use poller */
+	error = input_setup_polling(ts->input_dev, goodix_ts_poll);
+	if (error) {
+		dev_err(dev, "Unable to set up polling: %d\n", error);
+		return error;
+	}
+
+	input_set_poll_interval(ts->input_dev, POLL_INTERVAL);
+
+	return 0;
+}
+
 static int goodix_check_cfg_8(struct goodix_ts_data *ts, const u8 *cfg, int len)
 {
 	int i, raw_cfg_len = len - 2;
@@ -1219,6 +1261,15 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 		return error;
 	}
 
+	input_set_drvdata(ts->input_dev, ts);
+
+	error = goodix_request_poller(ts);
+	if (error) {
+		dev_err(&ts->client->dev,
+			"Failed to initialize poller: %d", error);
+		return error;
+	}
+
 	error = input_register_device(ts->input_dev);
 	if (error) {
 		dev_err(&ts->client->dev,
-- 
2.47.2


