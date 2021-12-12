Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51152471A25
	for <lists+linux-input@lfdr.de>; Sun, 12 Dec 2021 13:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhLLMm4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 07:42:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39604 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230447AbhLLMmz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 07:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639312975;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+QlQP/S8gUl89g19IM6wFUKeV2R++HE0jY7GTynZh/0=;
        b=Ay6zJGXRACro8QYPJzslRqRwmmTM64MDAWHjHTzthZFsNk34BBrBQpbXGd3MeF8gTdgsov
        ckXOs6WZ9JTNbRs+e85k3CCiE+Nmu/s8asJpWl+FZt5d5p1Giev+FJNQQOo7umOl+QwaC3
        7vwh29GUPKCxgIGwTpYaCvYskFCtH8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-LMbtH7I7MlWTID3etIgsOQ-1; Sun, 12 Dec 2021 07:42:51 -0500
X-MC-Unique: LMbtH7I7MlWTID3etIgsOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEBDB801962;
        Sun, 12 Dec 2021 12:42:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA4515D6D7;
        Sun, 12 Dec 2021 12:42:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 5/5] Input: goodix - Fix race on driver unbind
Date:   Sun, 12 Dec 2021 13:42:42 +0100
Message-Id: <20211212124242.81019-6-hdegoede@redhat.com>
In-Reply-To: <20211212124242.81019-1-hdegoede@redhat.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Because there is no way to detect if the touchscreen has pen support,
the driver is allocating and registering the input_pen input_dev on
receiving the first pen event.

But this means that the input_dev gets allocated after the request_irq()
call which means that the devm framework will free it before disabling
the irq, leaving a window where the irq handler may run and reference the
free-ed input_dev.

To fix this move the allocation of the input_pen input_dev to before
the request_irq() call, while still only registering it on the first pen
event so that the driver does not advertise pen capability on touchscreens
without it (most goodix touchscreens do not have pen support).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 32 ++++++++++++++++++------------
 drivers/input/touchscreen/goodix.h |  1 +
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 04baf5a770f5..1ada40fa6de6 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -297,14 +297,14 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
 	return -ENOMSG;
 }
 
-static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
+static int goodix_create_pen_input(struct goodix_ts_data *ts)
 {
 	struct device *dev = &ts->client->dev;
 	struct input_dev *input;
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-		return NULL;
+		return -ENOMEM;
 
 	input_copy_abs(input, ABS_X, ts->input_dev, ABS_MT_POSITION_X);
 	input_copy_abs(input, ABS_Y, ts->input_dev, ABS_MT_POSITION_Y);
@@ -331,23 +331,18 @@ static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
 		input->id.product = 0x1001;
 	input->id.version = ts->version;
 
-	if (input_register_device(input) != 0) {
-		input_free_device(input);
-		return NULL;
-	}
-
-	return input;
+	ts->input_pen = input;
+	return 0;
 }
 
 static void goodix_ts_report_pen_down(struct goodix_ts_data *ts, u8 *data)
 {
-	int input_x, input_y, input_w;
+	int input_x, input_y, input_w, error;
 	u8 key_value;
 
-	if (!ts->input_pen) {
-		ts->input_pen = goodix_create_pen_input(ts);
-		if (!ts->input_pen)
-			return;
+	if (!ts->pen_input_registered) {
+		error = input_register_device(ts->input_pen);
+		ts->pen_input_registered = error == 0;
 	}
 
 	if (ts->contact_size == 9) {
@@ -1207,6 +1202,17 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 		return error;
 	}
 
+	/*
+	 * Create the input_pen device before goodix_request_irq() calls
+	 * devm_request_threaded_irq() so that the devm framework frees
+	 * it after disabling the irq.
+	 * Unfortunately there is no way to detect if the touchscreen has pen
+	 * support, so registering the dev is delayed till the first pen event.
+	 */
+	error = goodix_create_pen_input(ts);
+	if (error)
+		return error;
+
 	ts->irq_flags = goodix_irq_flags[ts->int_trigger_type] | IRQF_ONESHOT;
 	error = goodix_request_irq(ts);
 	if (error) {
diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
index fa8602e78a64..30ea24f28f8a 100644
--- a/drivers/input/touchscreen/goodix.h
+++ b/drivers/input/touchscreen/goodix.h
@@ -94,6 +94,7 @@ struct goodix_ts_data {
 	u16 version;
 	bool reset_controller_at_probe;
 	bool load_cfg_from_disk;
+	bool pen_input_registered;
 	struct completion firmware_loading_complete;
 	unsigned long irq_flags;
 	enum goodix_irq_pin_access_method irq_pin_access_method;
-- 
2.33.1

