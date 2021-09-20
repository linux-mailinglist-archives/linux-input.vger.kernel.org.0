Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC23B4117CD
	for <lists+linux-input@lfdr.de>; Mon, 20 Sep 2021 17:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241094AbhITPIW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Sep 2021 11:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21625 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241079AbhITPIV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Sep 2021 11:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632150414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3hR1tDFMuIFltP1q+0lEzxeesFwC06U8AU70AA+qLCk=;
        b=ZG9WdUA6yQEujlcdHtd/auaneAqq2xkxqQ4HgEknUp+lIlMB+Yod62MpShdsdtIr/7g/Py
        Jd2xYAKgSqCOuOTLopJO67qZ0reDQfLIBrnFFbZhX5m3un6Uxww4+zQ28GMdA9Axk+pQOJ
        w7nryJixrg95ZFEikrs1WTywynqS6E0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-WWRLz3vgPmGALgU1LiXIlw-1; Mon, 20 Sep 2021 11:06:51 -0400
X-MC-Unique: WWRLz3vgPmGALgU1LiXIlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FA61007912;
        Mon, 20 Sep 2021 15:06:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.118])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E505B5F706;
        Mon, 20 Sep 2021 15:06:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 3/6] Input: goodix - Refactor reset handling
Date:   Mon, 20 Sep 2021 17:06:40 +0200
Message-Id: <20210920150643.155872-4-hdegoede@redhat.com>
In-Reply-To: <20210920150643.155872-1-hdegoede@redhat.com>
References: <20210920150643.155872-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Refactor reset handling a bit, change the main reset handler
into a new goodix_reset_no_int_sync() helper and add a
goodix_reset() wrapper which calls goodix_int_sync()
separately.

Also push the dev_err() call on reset failure into the
goodix_reset_no_int_sync() and goodix_int_sync() functions,
so that we don't need to have separate dev_err() calls in
all their callers.

This is a preparation patch for adding support for controllers
without flash, which need to have their firmware uploaded and
need some other special handling too.

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 46 +++++++++++++++++++-----------
 drivers/input/touchscreen/goodix.h |  1 +
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index ecd2e4dcaf53..7ab4a19fb2bf 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -595,56 +595,74 @@ int goodix_int_sync(struct goodix_ts_data *ts)
 
 	error = goodix_irq_direction_output(ts, 0);
 	if (error)
-		return error;
+		goto error;
 
 	msleep(50);				/* T5: 50ms */
 
 	error = goodix_irq_direction_input(ts);
 	if (error)
-		return error;
+		goto error;
 
 	return 0;
+error:
+	dev_err(&ts->client->dev, "Controller irq sync failed.\n");
+	return error;
 }
 
 /**
- * goodix_reset - Reset device during power on
+ * goodix_reset_no_int_sync - Reset device, leaving interrupt line in output mode
  *
  * @ts: goodix_ts_data pointer
  */
-static int goodix_reset(struct goodix_ts_data *ts)
+int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
 {
 	int error;
 
 	/* begin select I2C slave addr */
 	error = gpiod_direction_output(ts->gpiod_rst, 0);
 	if (error)
-		return error;
+		goto error;
 
 	msleep(20);				/* T2: > 10ms */
 
 	/* HIGH: 0x28/0x29, LOW: 0xBA/0xBB */
 	error = goodix_irq_direction_output(ts, ts->client->addr == 0x14);
 	if (error)
-		return error;
+		goto error;
 
 	usleep_range(100, 2000);		/* T3: > 100us */
 
 	error = gpiod_direction_output(ts->gpiod_rst, 1);
 	if (error)
-		return error;
+		goto error;
 
 	usleep_range(6000, 10000);		/* T4: > 5ms */
 
 	/* end select I2C slave addr */
 	error = gpiod_direction_input(ts->gpiod_rst);
 	if (error)
-		return error;
+		goto error;
 
-	error = goodix_int_sync(ts);
+	return 0;
+error:
+	dev_err(&ts->client->dev, "Controller reset failed.\n");
+	return error;
+}
+
+/**
+ * goodix_reset - Reset device during power on
+ *
+ * @ts: goodix_ts_data pointer
+ */
+static int goodix_reset(struct goodix_ts_data *ts)
+{
+	int error;
+
+	error = goodix_reset_no_int_sync(ts);
 	if (error)
 		return error;
 
-	return 0;
+	return  goodix_int_sync(ts);
 }
 
 #ifdef ACPI_GPIO_SUPPORT
@@ -1143,10 +1161,8 @@ static int goodix_ts_probe(struct i2c_client *client,
 	if (ts->reset_controller_at_probe) {
 		/* reset the controller */
 		error = goodix_reset(ts);
-		if (error) {
-			dev_err(&client->dev, "Controller reset failed.\n");
+		if (error)
 			return error;
-		}
 	}
 
 	error = goodix_i2c_test(client);
@@ -1288,10 +1304,8 @@ static int __maybe_unused goodix_resume(struct device *dev)
 
 	if (error != 0 || config_ver != ts->config[0]) {
 		error = goodix_reset(ts);
-		if (error) {
-			dev_err(dev, "Controller reset failed.\n");
+		if (error)
 			return error;
-		}
 
 		error = goodix_send_cfg(ts, ts->config, ts->chip->config_len);
 		if (error)
diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
index cdaced4f2980..0b88554ba2ae 100644
--- a/drivers/input/touchscreen/goodix.h
+++ b/drivers/input/touchscreen/goodix.h
@@ -69,5 +69,6 @@ int goodix_i2c_write(struct i2c_client *client, u16 reg, const u8 *buf, int len)
 int goodix_i2c_write_u8(struct i2c_client *client, u16 reg, u8 value);
 int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg, int len);
 int goodix_int_sync(struct goodix_ts_data *ts);
+int goodix_reset_no_int_sync(struct goodix_ts_data *ts);
 
 #endif
-- 
2.31.1

