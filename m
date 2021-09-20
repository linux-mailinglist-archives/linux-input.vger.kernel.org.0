Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928174117CC
	for <lists+linux-input@lfdr.de>; Mon, 20 Sep 2021 17:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241087AbhITPIV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Sep 2021 11:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29166 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241077AbhITPIV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Sep 2021 11:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632150414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R/46laoGj07JSU4BdG14N/hMkT+YQ7QTyVPDxleTXZw=;
        b=TXhA1kcXuQmyjT++oqBUR9qfYEGqQItQ7QKz31DafHpmXJB88ShmMjv6LCh0e/Mmz2WRj7
        CrGSax1sCxPrtSsNuBNQ8Hb1tyFiUqoZMT+bjiqQfSOAg26jTQA2ANlZXxgFh6elwiosK1
        r6A/yq74lAs4g1THbNJj+hcHfZDhxeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-Xb9SjyvDNBq8Y8pQ0CKGtg-1; Mon, 20 Sep 2021 11:06:52 -0400
X-MC-Unique: Xb9SjyvDNBq8Y8pQ0CKGtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D7F11007913;
        Mon, 20 Sep 2021 15:06:51 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.118])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 746F45C1BB;
        Mon, 20 Sep 2021 15:06:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 4/6] Input: goodix - Push error logging up into i2c_read and i2c_write helpers
Date:   Mon, 20 Sep 2021 17:06:41 +0200
Message-Id: <20210920150643.155872-5-hdegoede@redhat.com>
In-Reply-To: <20210920150643.155872-1-hdegoede@redhat.com>
References: <20210920150643.155872-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make the goodix_i2c_read() and goodix_i2c_write*() helpers log errors
themselves. This allows removing all the error logging from their callers.

This already results in a nice cleanup with the current code and it also
helps to make the upcoming support for controllers without flash cleaner.

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 68 ++++++++++++------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 7ab4a19fb2bf..2205ebb9325e 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -172,7 +172,13 @@ int goodix_i2c_read(struct i2c_client *client, u16 reg, u8 *buf, int len)
 	msgs[1].buf   = buf;
 
 	ret = i2c_transfer(client->adapter, msgs, 2);
-	return ret < 0 ? ret : (ret != ARRAY_SIZE(msgs) ? -EIO : 0);
+	if (ret >= 0)
+		ret = (ret == ARRAY_SIZE(msgs) ? 0 : -EIO);
+
+	if (ret)
+		dev_err(&client->dev, "Error reading %d bytes from 0x%04x: %d\n",
+			len, reg, ret);
+	return ret;
 }
 
 /**
@@ -203,8 +209,15 @@ int goodix_i2c_write(struct i2c_client *client, u16 reg, const u8 *buf, int len)
 	msg.len = len + 2;
 
 	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret >= 0)
+		ret = (ret == 1 ? 0 : -EIO);
+
 	kfree(addr_buf);
-	return ret < 0 ? ret : (ret != 1 ? -EIO : 0);
+
+	if (ret)
+		dev_err(&client->dev, "Error writing %d bytes to 0x%04x: %d\n",
+			len, reg, ret);
+	return ret;
 }
 
 int goodix_i2c_write_u8(struct i2c_client *client, u16 reg, u8 value)
@@ -244,13 +257,9 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	 */
 	max_timeout = jiffies + msecs_to_jiffies(GOODIX_BUFFER_STATUS_TIMEOUT);
 	do {
-		error = goodix_i2c_read(ts->client, addr, data,
-					header_contact_keycode_size);
-		if (error) {
-			dev_err(&ts->client->dev, "I2C transfer error: %d\n",
-					error);
+		error = goodix_i2c_read(ts->client, addr, data, header_contact_keycode_size);
+		if (error)
 			return error;
-		}
 
 		if (data[0] & GOODIX_BUFFER_STATUS_READY) {
 			touch_num = data[0] & 0x0f;
@@ -260,10 +269,8 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 			if (touch_num > 1) {
 				addr += header_contact_keycode_size;
 				data += header_contact_keycode_size;
-				error = goodix_i2c_read(ts->client,
-						addr, data,
-						ts->contact_size *
-							(touch_num - 1));
+				error = goodix_i2c_read(ts->client, addr, data,
+							ts->contact_size * (touch_num - 1));
 				if (error)
 					return error;
 			}
@@ -373,9 +380,7 @@ static irqreturn_t goodix_ts_irq_handler(int irq, void *dev_id)
 	struct goodix_ts_data *ts = dev_id;
 
 	goodix_process_events(ts);
-
-	if (goodix_i2c_write_u8(ts->client, GOODIX_READ_COOR_ADDR, 0) < 0)
-		dev_err(&ts->client->dev, "I2C write end_cmd error\n");
+	goodix_i2c_write_u8(ts->client, GOODIX_READ_COOR_ADDR, 0);
 
 	return IRQ_HANDLED;
 }
@@ -500,11 +505,9 @@ int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg, int len)
 		return error;
 
 	error = goodix_i2c_write(ts->client, ts->chip->config_addr, cfg, len);
-	if (error) {
-		dev_err(&ts->client->dev, "Failed to write config data: %d",
-			error);
+	if (error)
 		return error;
-	}
+
 	dev_dbg(&ts->client->dev, "Config sent successfully.");
 
 	/* Let the firmware reconfigure itself, so sleep for 10ms */
@@ -890,8 +893,6 @@ static void goodix_read_config(struct goodix_ts_data *ts)
 	error = goodix_i2c_read(ts->client, ts->chip->config_addr,
 				ts->config, ts->chip->config_len);
 	if (error) {
-		dev_warn(&ts->client->dev, "Error reading config: %d\n",
-			 error);
 		ts->int_trigger_type = GOODIX_INT_TRIGGER;
 		ts->max_touch_num = GOODIX_MAX_CONTACTS;
 		return;
@@ -922,10 +923,8 @@ static int goodix_read_version(struct goodix_ts_data *ts)
 	char id_str[GOODIX_ID_MAX_LEN + 1];
 
 	error = goodix_i2c_read(ts->client, GOODIX_REG_ID, buf, sizeof(buf));
-	if (error) {
-		dev_err(&ts->client->dev, "read version failed: %d\n", error);
+	if (error)
 		return error;
-	}
 
 	memcpy(id_str, buf, GOODIX_ID_MAX_LEN);
 	id_str[GOODIX_ID_MAX_LEN] = 0;
@@ -951,13 +950,10 @@ static int goodix_i2c_test(struct i2c_client *client)
 	u8 test;
 
 	while (retry++ < 2) {
-		error = goodix_i2c_read(client, GOODIX_REG_ID,
-					&test, 1);
+		error = goodix_i2c_read(client, GOODIX_REG_ID, &test, 1);
 		if (!error)
 			return 0;
 
-		dev_err(&client->dev, "i2c test failed attempt %d: %d\n",
-			retry, error);
 		msleep(20);
 	}
 
@@ -1178,10 +1174,8 @@ static int goodix_ts_probe(struct i2c_client *client,
 	}
 
 	error = goodix_read_version(ts);
-	if (error) {
-		dev_err(&client->dev, "Read version failed.\n");
+	if (error)
 		return error;
-	}
 
 	ts->chip = goodix_get_chip_data(ts->id);
 
@@ -1249,10 +1243,8 @@ static int __maybe_unused goodix_suspend(struct device *dev)
 
 	usleep_range(5000, 6000);
 
-	error = goodix_i2c_write_u8(ts->client, GOODIX_REG_COMMAND,
-				    GOODIX_CMD_SCREEN_OFF);
+	error = goodix_i2c_write_u8(ts->client, GOODIX_REG_COMMAND, GOODIX_CMD_SCREEN_OFF);
 	if (error) {
-		dev_err(&ts->client->dev, "Screen off command failed\n");
 		goodix_irq_direction_input(ts);
 		goodix_request_irq(ts);
 		return -EAGAIN;
@@ -1293,12 +1285,8 @@ static int __maybe_unused goodix_resume(struct device *dev)
 	if (error)
 		return error;
 
-	error = goodix_i2c_read(ts->client, ts->chip->config_addr,
-				&config_ver, 1);
-	if (error)
-		dev_warn(dev, "Error reading config version: %d, resetting controller\n",
-			 error);
-	else if (config_ver != ts->config[0])
+	error = goodix_i2c_read(ts->client, ts->chip->config_addr, &config_ver, 1);
+	if (!error && config_ver != ts->config[0])
 		dev_info(dev, "Config version mismatch %d != %d, resetting controller\n",
 			 config_ver, ts->config[0]);
 
-- 
2.31.1

