Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9664346B870
	for <lists+linux-input@lfdr.de>; Tue,  7 Dec 2021 11:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbhLGKLd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Dec 2021 05:11:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24382 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234745AbhLGKLd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Dec 2021 05:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638871682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YW1bm/84roETMKTnu6IKP4ABN1i754N2fjwVSRpRLVk=;
        b=CnjbnqK6PISMej9MU7a4xDV3wUpSa221uwfctcji3gRf/RhJxXmNfOYaifXwz0TUDJA6f4
        A35oAfQMN+mEYWMAjU9shRQL5gz9vVwiDvi17QSuxJUDrgI2pzO7/q1VxBPHNJaGobW/ws
        tRsN8ERtEQPIk84RH04gEmvZPIMoUdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-rLUrHhOnP4G_IN5B1rIfVg-1; Tue, 07 Dec 2021 05:08:01 -0500
X-MC-Unique: rLUrHhOnP4G_IN5B1rIfVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93ACE18C8C00;
        Tue,  7 Dec 2021 10:08:00 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.249])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F27B10023AA;
        Tue,  7 Dec 2021 10:07:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 3/3] Input: goodix - Add pen support
Date:   Tue,  7 Dec 2021 11:07:54 +0100
Message-Id: <20211207100754.31155-3-hdegoede@redhat.com>
In-Reply-To: <20211207100754.31155-1-hdegoede@redhat.com>
References: <20211207100754.31155-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Goodix touchscreens have support for a (Goodix) active pen, add
support for this. The info on how to detect when a pen is down and to
detect when the stylus buttons are pressed was lifted from the out
of tree Goodix driver with pen support written by Adya:
https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/

Since there is no way to tell if pen support is present, the registering
of the pen input_dev is delayed till the first pen event is detected.

This has been tested on a Trekstor Surftab duo W1, a Chuwi Hi13 and
a Cyberbook T116 tablet.

Link: https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=202161
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204513
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 122 ++++++++++++++++++++++++++++-
 drivers/input/touchscreen/goodix.h |   1 +
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 6e71d5c732af..60874ff5a7f1 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -298,6 +298,107 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	return -ENOMSG;
 }
 
+static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
+{
+	struct device *dev = &ts->client->dev;
+	struct input_dev *input;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return NULL;
+
+	input_alloc_absinfo(input);
+	if (!input->absinfo) {
+		input_free_device(input);
+		return NULL;
+	}
+
+	input->absinfo[ABS_X] = ts->input_dev->absinfo[ABS_MT_POSITION_X];
+	input->absinfo[ABS_Y] = ts->input_dev->absinfo[ABS_MT_POSITION_Y];
+	__set_bit(ABS_X, input->absbit);
+	__set_bit(ABS_Y, input->absbit);
+	input_set_abs_params(input, ABS_PRESSURE, 0, 255, 0, 0);
+
+	input_set_capability(input, EV_KEY, BTN_TOUCH);
+	input_set_capability(input, EV_KEY, BTN_TOOL_PEN);
+	input_set_capability(input, EV_KEY, BTN_STYLUS);
+	input_set_capability(input, EV_KEY, BTN_STYLUS2);
+	__set_bit(INPUT_PROP_DIRECT, input->propbit);
+	/*
+	 * The resolution of these touchscreens is about 10 units/mm, the actual
+	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
+	 * Userspace wants something here though, so just set it to 10 units/mm.
+	 */
+	input_abs_set_res(input, ABS_X, 10);
+	input_abs_set_res(input, ABS_Y, 10);
+
+	input->name = "Goodix Active Pen";
+	input->phys = "input/pen";
+	input->id.bustype = BUS_I2C;
+	if (kstrtou16(ts->id, 10, &input->id.product))
+		input->id.product = 0x1001;
+	input->id.version = ts->version;
+
+	if (input_register_device(input) != 0) {
+		input_free_device(input);
+		return NULL;
+	}
+
+	return input;
+}
+
+static void goodix_ts_report_pen_down(struct goodix_ts_data *ts, u8 *data)
+{
+	int input_x, input_y, input_w;
+	u8 key_value;
+
+	if (!ts->input_pen) {
+		ts->input_pen = goodix_create_pen_input(ts);
+		if (!ts->input_pen)
+			return;
+	}
+
+	if (ts->contact_size == 9) {
+		input_x = get_unaligned_le16(&data[4]);
+		input_y = get_unaligned_le16(&data[6]);
+		input_w = get_unaligned_le16(&data[8]);
+	} else {
+		input_x = get_unaligned_le16(&data[2]);
+		input_y = get_unaligned_le16(&data[4]);
+		input_w = get_unaligned_le16(&data[6]);
+	}
+
+	touchscreen_report_pos(ts->input_pen, &ts->prop, input_x, input_y, false);
+	input_report_abs(ts->input_pen, ABS_PRESSURE, input_w);
+
+	input_report_key(ts->input_pen, BTN_TOUCH, 1);
+	input_report_key(ts->input_pen, BTN_TOOL_PEN, 1);
+
+	if (data[0] & GOODIX_HAVE_KEY) {
+		key_value = data[1 + ts->contact_size];
+		input_report_key(ts->input_pen, BTN_STYLUS, key_value & 0x10);
+		input_report_key(ts->input_pen, BTN_STYLUS2, key_value & 0x20);
+	} else {
+		input_report_key(ts->input_pen, BTN_STYLUS, 0);
+		input_report_key(ts->input_pen, BTN_STYLUS2, 0);
+	}
+
+	input_sync(ts->input_pen);
+}
+
+static void goodix_ts_report_pen_up(struct goodix_ts_data *ts)
+{
+	if (!ts->input_pen)
+		return;
+
+	input_report_key(ts->input_pen, BTN_TOUCH, 0);
+	input_report_key(ts->input_pen, BTN_TOOL_PEN, 0);
+	input_report_key(ts->input_pen, BTN_STYLUS, 0);
+	input_report_key(ts->input_pen, BTN_STYLUS2, 0);
+
+	input_sync(ts->input_pen);
+}
+
 static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8 *coor_data)
 {
 	int id = coor_data[0] & 0x0F;
@@ -328,6 +429,14 @@ static void goodix_ts_report_touch_9b(struct goodix_ts_data *ts, u8 *coor_data)
 	input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
 }
 
+static void goodix_ts_release_keys(struct goodix_ts_data *ts)
+{
+	int i;
+
+	for (i = 0; i < GOODIX_MAX_KEYS; i++)
+		input_report_key(ts->input_dev, ts->keymap[i], 0);
+}
+
 static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
 {
 	int touch_num;
@@ -342,8 +451,7 @@ static void goodix_ts_report_key(struct goodix_ts_data *ts, u8 *data)
 				input_report_key(ts->input_dev,
 						 ts->keymap[i], 1);
 	} else {
-		for (i = 0; i < GOODIX_MAX_KEYS; i++)
-			input_report_key(ts->input_dev, ts->keymap[i], 0);
+		goodix_ts_release_keys(ts);
 	}
 }
 
@@ -365,6 +473,15 @@ static void goodix_process_events(struct goodix_ts_data *ts)
 	if (touch_num < 0)
 		return;
 
+	/* The pen being down is always reported as a single touch */
+	if (touch_num == 1 && (point_data[1] & 0x80)) {
+		goodix_ts_report_pen_down(ts, point_data);
+		goodix_ts_release_keys(ts);
+		goto sync; /* Release any previousle registered touches */
+	} else {
+		goodix_ts_report_pen_up(ts);
+	}
+
 	goodix_ts_report_key(ts, point_data);
 
 	for (i = 0; i < touch_num; i++)
@@ -375,6 +492,7 @@ static void goodix_process_events(struct goodix_ts_data *ts)
 			goodix_ts_report_touch_8b(ts,
 				&point_data[1 + ts->contact_size * i]);
 
+sync:
 	input_mt_sync_frame(ts->input_dev);
 	input_sync(ts->input_dev);
 }
diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
index 02065d1c3263..fa8602e78a64 100644
--- a/drivers/input/touchscreen/goodix.h
+++ b/drivers/input/touchscreen/goodix.h
@@ -76,6 +76,7 @@ struct goodix_chip_data {
 struct goodix_ts_data {
 	struct i2c_client *client;
 	struct input_dev *input_dev;
+	struct input_dev *input_pen;
 	const struct goodix_chip_data *chip;
 	const char *firmware_name;
 	struct touchscreen_properties prop;
-- 
2.33.1

