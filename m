Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8E12E88FE
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbhABWcS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbhABWcS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:18 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45B1C0613ED
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:37 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id n3so4115631pjm.1
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZJ2TAMT9tEUax5Sl+5+xGLS93MsUJkzcH2wYIIGrKko=;
        b=zecV1JbAeJnFEAVwZkLhkMZOg0KZPW9Bgm8b3snwpzfmX5Fy+ScFjxQs/RbTDFEG/e
         9GaJY6D1iCzB1LWJxaVulzzoeif46aIuswGJs7WQ58EqLxC28cySkxdQ81RieS4hp3bF
         fyIBiwUtb1b1PQ7WLqhNaB5NmSWJhRNdFmACj/rz/TW/ouskottQk0DtB0aq/71MqJue
         MG0DLo2GbVVO/MCfphFUO5FOGdMGm/jsKsD9Giqa/nGjEtu60hYukob8Py9/wd7gD+yF
         wEWz9CwW7ia3eXB2F/8B6abACF4xX/ZspF5UpVEjH0KHQeDHCz6OjAzsdS+fJGNLZupR
         NuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZJ2TAMT9tEUax5Sl+5+xGLS93MsUJkzcH2wYIIGrKko=;
        b=bhTadqf7QAeiRadl3SL47OkIAZftd4gOyiFuOkwGsVp1rPkWDcze24qs3HsUy8q6x/
         lunyr84uU6UbJnOxgnuFEIIJIyLQ975ofFlgjnb6FqNa0FiqknC9KgEbBy3xp9KCGsEn
         QTBOhoxqxkZmvTK3NPXAGYgsBDcf1fxRWWfqFJhzrlNxfgk+QBlTx5za0Tom76ob4YZ7
         muyh8eDv4fEuWu+54QZXqeOs+GrZV+hR9TUNmmvN176MIM+XyQA0oHXbkA51pm/M9Pi2
         1pKR70wROeAe03C9Jwg8/HcP8uMqxDlmHuyqmaNs4aW3GPuzokycp+/kRJ6ltJoG/lXy
         PLfQ==
X-Gm-Message-State: AOAM532gqktFpb52Oix3Sf443qoUbQv4R/p802JJGTIBJLxt199hySZJ
        COmVBja8kqWZE9b0F4XpTJc3iA==
X-Google-Smtp-Source: ABdhPJw2swgf8mSs7CB1v60PHI2ufyw6UtRgrFJcbbxwa2hor2xX3WxjDBQ85lDfKWEDu5fYq2iXxA==
X-Received: by 2002:a17:90b:46ca:: with SMTP id jx10mr23582202pjb.208.1609626697527;
        Sat, 02 Jan 2021 14:31:37 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:37 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 04/13] HID: playstation: add DualSense touchpad support.
Date:   Sat,  2 Jan 2021 14:31:00 -0800
Message-Id: <20210102223109.996781-5-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Implement support for DualSense touchpad as a separate input device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 2fc798d2a8af..06e946c45c64 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -60,9 +60,20 @@ struct ps_device {
 #define DS_STATUS_CHARGING		GENMASK(7, 4)
 #define DS_STATUS_CHARGING_SHIFT	4
 
+/* Status of a DualSense touch point contact.
+ * Contact IDs, with highest bit set are 'inactive'
+ * and any associated data is then invalid.
+ */
+#define DS_TOUCH_POINT_INACTIVE BIT(7)
+
+/* DualSense hardware limits */
+#define DS_TOUCHPAD_WIDTH	1920
+#define DS_TOUCHPAD_HEIGHT	1080
+
 struct dualsense {
 	struct ps_device base;
 	struct input_dev *gamepad;
+	struct input_dev *touchpad;
 };
 
 struct dualsense_touch_point {
@@ -244,6 +255,34 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 	return gamepad;
 }
 
+static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width, int height,
+		unsigned int num_contacts)
+{
+	struct input_dev *touchpad;
+	int ret;
+
+	touchpad = ps_allocate_input_dev(hdev, "Touchpad");
+	if (IS_ERR(touchpad))
+		return ERR_PTR(-ENOMEM);
+
+	/* Map button underneath touchpad to BTN_LEFT. */
+	input_set_capability(touchpad, EV_KEY, BTN_LEFT);
+	__set_bit(INPUT_PROP_BUTTONPAD, touchpad->propbit);
+
+	input_set_abs_params(touchpad, ABS_MT_POSITION_X, 0, width - 1, 0, 0);
+	input_set_abs_params(touchpad, ABS_MT_POSITION_Y, 0, height - 1, 0, 0);
+
+	ret = input_mt_init_slots(touchpad, num_contacts, INPUT_MT_POINTER);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = input_register_device(touchpad);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return touchpad;
+}
+
 static int dualsense_get_mac_address(struct dualsense *ds)
 {
 	uint8_t *buf;
@@ -281,6 +320,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	unsigned long flags;
+	int i;
 
 	/* DualSense in USB uses the full HID report for reportID 1, but
 	 * Bluetooth uses a minimal HID report for reportID 1 and reports
@@ -321,6 +361,24 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	for (i = 0; i < 2; i++) {
+		bool active = (ds_report->points[i].contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
+
+		input_mt_slot(ds->touchpad, i);
+		input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
+
+		if (active) {
+			int x = (ds_report->points[i].x_hi << 8) | ds_report->points[i].x_lo;
+			int y = (ds_report->points[i].y_hi << 4) | ds_report->points[i].y_lo;
+
+			input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
+			input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
+		}
+	}
+	input_mt_sync_frame(ds->touchpad);
+	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
+	input_sync(ds->touchpad);
+
 	battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
 	charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
 
@@ -394,6 +452,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ds->touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
+	if (IS_ERR(ds->touchpad)) {
+		ret = PTR_ERR(ds->touchpad);
+		goto err;
+	}
+
 	ret = ps_device_register_battery(ps_dev);
 	if (ret < 0)
 		goto err;
-- 
2.26.2

