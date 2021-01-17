Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00CC92F9666
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbhAQXry (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730852AbhAQXp3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:45:29 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92947C0613C1
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:49 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id cq1so8321486pjb.4
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WVlKx6xZ83Igk9QgAIM+ji3r+4485U9QbK8oiIuVj7U=;
        b=zq4LDp5EaezangXzd92eYhNm217jnZBXkom+2vWRlbTTFOOrhRmgsnhfT+w1lfsxvw
         OwzhSJtJ713+AiKG8ep6aL++K2rs+FdrFgIpq2BxcyP8Ouc5QF6k0tNnGGHpkdpe87Hh
         6Xclo3OtcZQn7un+2PmcSJlf+BeiySVoDGJ6NUKlm/Xu8GgJhQmU5hwrTgjr6OzrmP20
         Q52rDv27XfusSTTQoD1koX+40dOaMO4Fxc3++L2tmN0+R765N8RlWJj/Re2g+EVn/Jwe
         4M+Z+OmVq300mPUJ1AHlZbmTsquE7Biu59i/Oih7bWgp+htMSMpGXHKTkS8/LPvvRgP2
         LMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WVlKx6xZ83Igk9QgAIM+ji3r+4485U9QbK8oiIuVj7U=;
        b=FfEUfs84BU1NyNT3XmjjrKFNSta5ImJW6HYTWe6+nKz0jHpmFtEUZoLEqHnFB+bhdJ
         +U8vgMtLc1kDKwAIiYeA/04OGTA/CpBoOe7Eoufn+G/Ava4tSmaS/2lsXCDmlYAGrIgC
         xwJA2HxSE2tZONh4S0widZuqVxNYkCZrdp9q/PVcePkHIu81U56qexMZcUU0u9GVoPDQ
         1pph4n4SdIHcK3LSDMEo/FY51tKB6vt5m0+M3ktZsU/37RpFswwopZ7ygRhDQpFWP+LU
         wJvT/ZRK1xD9v+w407AzZIHyEFTiQ17pbQollg8nIxnO5Jz9VctOQ1Qv6INfMHxxktsS
         2WTg==
X-Gm-Message-State: AOAM532otfkRixhCWI8BdnjucDJluTiUYTyW6r5nedeHEeqjoLbw3xEL
        lmEhGrKOt4k1/CNDi+21RvPD4g==
X-Google-Smtp-Source: ABdhPJxtzgsEa3fdWLy5wm15jbAfVgjp1/pYWrHF76PBfQ7Umy/S5R5bHtpjYUPCYexJ9AGv5ZOCQw==
X-Received: by 2002:a17:90a:183:: with SMTP id 3mr10353737pjc.99.1610927089145;
        Sun, 17 Jan 2021 15:44:49 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id i2sm14721568pjd.21.2021.01.17.15.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:44:48 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v4 04/13] HID: playstation: add DualSense touchpad support.
Date:   Sun, 17 Jan 2021 15:44:26 -0800
Message-Id: <20210117234435.180294-5-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117234435.180294-1-roderick@gaikai.com>
References: <20210117234435.180294-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Implement support for DualSense touchpad as a separate input device.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 66 +++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index c5c450fc25db..64d6d736c435 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -60,9 +60,21 @@ struct ps_device {
 #define DS_STATUS_CHARGING		GENMASK(7, 4)
 #define DS_STATUS_CHARGING_SHIFT	4
 
+/*
+ * Status of a DualSense touch point contact.
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
@@ -272,6 +284,34 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 	return 0;
 }
 
+static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width, int height,
+		unsigned int num_contacts)
+{
+	struct input_dev *touchpad;
+	int ret;
+
+	touchpad = ps_allocate_input_dev(hdev, "Touchpad");
+	if (IS_ERR(touchpad))
+		return ERR_CAST(touchpad);
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
@@ -304,6 +344,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	unsigned long flags;
+	int i;
 
 	/*
 	 * DualSense in USB uses the full HID report for reportID 1, but
@@ -346,6 +387,25 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
+		struct dualsense_touch_point *point = &ds_report->points[i];
+		bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
+
+		input_mt_slot(ds->touchpad, i);
+		input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
+
+		if (active) {
+			int x = (point->x_hi << 8) | point->x_lo;
+			int y = (point->y_hi << 4) | point->y_lo;
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
 
@@ -422,6 +482,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	ds->touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
+	if (IS_ERR(ds->touchpad)) {
+		ret = PTR_ERR(ds->touchpad);
+		goto err;
+	}
+
 	ret = ps_device_register_battery(ps_dev);
 	if (ret)
 		goto err;
-- 
2.26.2

