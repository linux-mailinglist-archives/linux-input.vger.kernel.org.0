Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50D02DED76
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgLSGYZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgLSGYZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:24:25 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F15C061248
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:44 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id e2so2704031pgi.5
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nW+mbDO5wiMCdT0liT2YH3WjYnrCDE+jfI3goBYcijI=;
        b=ToPDrcOy6yjKbi3UinwH09cWzoHy+NR8E7RTD2eO48ldnZXPhGmKW6c/quFD+os/HV
         NyXyNTxDwryXbwlwtFPpUPeICYhTBA29A8NW2EDucE+Nbhs2e6JfHlaSK6pgI/9Gx3P9
         aP9lV2VPO9jYWc5p7Ix8RypkDEddi75ueZn8sYEoj0YpSp0IjvoBsSBfeiSw6DylpWCS
         3pLo0lfJHxRxMMcHCr1Pj+KPREr6J+GiGSiPxPCGvAJSJeJavv3DWzaRi2gaNydHm3Lv
         sUL1x5LoNBAlPIRbAY42QASS4a7f/Tt0v7mJi/z1Wfd81KuY6KzKzXso4AM0aT/jkxzi
         tWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nW+mbDO5wiMCdT0liT2YH3WjYnrCDE+jfI3goBYcijI=;
        b=PvHqOb0kY+AfWzl0RtbdtXgLZME/Qx/qzsPVN5xzGO/A6FaYARbKCZ0NeKU9+16mGa
         1yCKBKccYWRACSxr+kFxZPUc52HxS3299zE5Fk8dbXHJ4UIXJ7By9ka9Bveub9NG+uCq
         ssXrfwi4erhmdkQHDcCaEUtqP/B+g75/RNSKx6FYkZSg9pfMAL7EjSBKWdILxxZbDPHh
         RQZ6Q3xdymwfNQaEL0agZ4cK1nWk4wehSLrdgQeZIflQ9Djmj1yGLK441C20d5vgdBGo
         0DLxS+TWmQ1C64ynm1CkfxefEJDkQGd6hLQi7wnaQ53fav2frVETW9BbuFhwBAT0s6ax
         dtmw==
X-Gm-Message-State: AOAM531l4G36XLp7io/1+IvPd3Fq5bbqGviQsT+FqAqdslbHwdkT5UiB
        DAwtoP9+uhzyI52JbD1PkLhlBg==
X-Google-Smtp-Source: ABdhPJzEPlJ4b8jKEWXZ26jPsmDDOGs13UTBrwvk0uaqh9dHFeFuJimVf5mWPbEKfzVcZVtT3LB3jg==
X-Received: by 2002:a63:1a5b:: with SMTP id a27mr7257010pgm.169.1608359024463;
        Fri, 18 Dec 2020 22:23:44 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:44 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 04/13] HID: playstation: add DualSense touchpad support.
Date:   Fri, 18 Dec 2020 22:23:27 -0800
Message-Id: <20201219062336.72568-5-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Implement support for DualSense touchpad as a separate input device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 59 +++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 598d262e2a08..7e622b02ee30 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -56,9 +56,14 @@ struct ps_device {
 #define DS_STATUS_CHARGING		GENMASK(7, 4)
 #define DS_STATUS_CHARGING_SHIFT	4
 
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
@@ -239,6 +244,34 @@ static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 	return gamepad;
 }
 
+static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width, int height,
+		int num_contacts)
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
+	input_set_abs_params(touchpad, ABS_MT_POSITION_X, 0, width, 0, 0);
+	input_set_abs_params(touchpad, ABS_MT_POSITION_Y, 0, height, 0, 0);
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
@@ -271,6 +304,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	unsigned long flags;
+	int i;
 
 	/* DualSense in USB uses the full HID report for reportID 1, but
 	 * Bluetooth uses a minimal HID report for reportID 1 and reports
@@ -311,6 +345,25 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
+	for (i = 0; i < 2; i++) {
+		bool active = (ds_report->points[i].contact & 0x80) ? false : true;
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
 
@@ -382,6 +435,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ds->touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
+	if (IS_ERR(ds->touchpad)) {
+		ret = PTR_ERR(ds->touchpad);
+		goto err;
+	}
+
 	ret = ps_device_register_battery((struct ps_device *)ds);
 	if (ret < 0)
 		goto err;
-- 
2.26.2

