Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DF4307C82
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhA1Ra4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:30:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233053AbhA1R1Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:24 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672B6C0617A9
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:09 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id md11so4246937pjb.0
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WVlKx6xZ83Igk9QgAIM+ji3r+4485U9QbK8oiIuVj7U=;
        b=pS9tXiOOwJJPRY2UtSpoH4FMH631WOBmciU29mXtrpNxZHXxikZ3Fa4m65P9p4lV70
         jVrqs/mZpiZe9H5Dv9QUczgx+k7z8gzvdLcU6FfzS8TpP5d+DqFdnMDYV1tb/wATyZZO
         obkzaCIFbWn/w6jmfjzfJec5q603OyqlJyw3sScOmwPPrA2ZKWQx6pTEHiM5iEm82Mti
         gTQQNcL6SOqLwbpibYXUdZ1RsQQj6hxznoh5rZ/EpNQvaXDKt0rggOzv6DIOJdXfxunn
         dHTGWiWaI05NL6rV9cX0whmZP+/1MCEu9a2BkMEIvcqXrwnGXLNv2BaSqwNCw1pHMvXy
         uFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WVlKx6xZ83Igk9QgAIM+ji3r+4485U9QbK8oiIuVj7U=;
        b=oUNtYcPzvfy0ERNmtlCb75819DGBld3PZ9yuXanRJwAjgBUOfBxQXcBAS/98sVdO1A
         DNFKOA2sxno6Y9KZ20rLxu91/mDOEhgkcuHlquLuH4JyPpu6ZqVbSV3J/pHInaffNPnl
         /DmlGWR51u3N/WxVv9geauF0fIBjR31VQj6p4+FJ65IER07XP7WgFxxCf9RsaV38jCGc
         pnI919veDmC1DUWYLj7HVN6ruNHOsCGyukVH3+cdrlGze+QLtsRxrlZ/XdYe6JEAK+SW
         V6CdL6n4dGGjnlL3ApiTP8LNFzcN5acoSAbubKt1NOk7+yNRXP87sSuYIAXFsFaOMWqW
         WLOQ==
X-Gm-Message-State: AOAM5339l2Aq650efNonHTPnUm79duj2TLjBzDYKnG6viAvwMIK9zgXp
        PaUxuxsKSqpCuOl+41XtGIJEjA==
X-Google-Smtp-Source: ABdhPJw5ZQooX1Ni4m0V9Fg80I50KyN6wVqL+MIIVLL/65syhmQjP6s6vDtasFag/4kn7QoZO7DPdg==
X-Received: by 2002:a17:902:ea85:b029:df:db7a:3ad8 with SMTP id x5-20020a170902ea85b02900dfdb7a3ad8mr562863plb.15.1611854828990;
        Thu, 28 Jan 2021 09:27:08 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:08 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 04/13] HID: playstation: add DualSense touchpad support.
Date:   Thu, 28 Jan 2021 09:26:48 -0800
Message-Id: <20210128172657.24516-5-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
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

