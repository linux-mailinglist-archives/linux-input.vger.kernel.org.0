Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF4B36D6BB
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 13:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhD1LrC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 07:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24620 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229600AbhD1LrB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 07:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619610376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+VMPhpM+kD1eKiFEqc6yvPwWl9AHxFMalz6mohFvY1o=;
        b=Ds2F2ITVBVnb/KzENtmbslTSjRN5mxzK4w6HnGHBA8I1E1aU8Puve4T/pbKzFr6NqhRTbM
        d/UOWpdT5V++aABchgJiyi6+wRhiDTJ14/W8B8ZIB47F2iP0h1DPL1+g0lCuPHFs94DRLB
        nQZFx66A9YF5K6HMDuDafj44P2z0o+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-wTICPe7WMi-XtDsTC1WldA-1; Wed, 28 Apr 2021 07:46:14 -0400
X-MC-Unique: wTICPe7WMi-XtDsTC1WldA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B02521898296;
        Wed, 28 Apr 2021 11:46:13 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BEE625F729;
        Wed, 28 Apr 2021 11:46:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/7] Input: goodix - Refactor reset handling
Date:   Wed, 28 Apr 2021 13:46:04 +0200
Message-Id: <20210428114608.101795-4-hdegoede@redhat.com>
In-Reply-To: <20210428114608.101795-1-hdegoede@redhat.com>
References: <20210428114608.101795-1-hdegoede@redhat.com>
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 46 +++++++++++++++++++-----------
 drivers/input/touchscreen/goodix.h |  1 +
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 76e93bc8389a..f0fe8960e3df 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -640,56 +640,74 @@ int goodix_int_sync(struct goodix_ts_data *ts)
 
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
@@ -1195,10 +1213,8 @@ static int goodix_ts_probe(struct i2c_client *client,
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
@@ -1340,10 +1356,8 @@ static int __maybe_unused goodix_resume(struct device *dev)
 
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

