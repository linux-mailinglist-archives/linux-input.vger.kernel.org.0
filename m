Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645CE6124F8
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiJ2St2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ2St1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:27 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C523C5
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:26 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id p21so3668983plr.7
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S80tutkX1lAZvu7Kkpft8r04otkjmb2zzvnIOqODTsA=;
        b=AsHGYbEv3sLbashM+5b6Momx8knoHe49T/WOv0NBkv6nN2ROm0QQ+ntn5k/mbZW2Ew
         fn4Z4yK2t1ACfy2M3Z7nTAY+F4nYi6wQ0wOYmvgv/+IDNM/KYLm+UYljwPy9P0eWC4Jm
         2oYGmGLedPl015++gn307+75HPqoaP3c8WTzcLlE300XNpGIGMOshhQNZ6xOTsbgfWh4
         NhOBlDvus0mPw1z+bxjBP6lLs6eZ69YWX8v0KXIPHEK0GjsceGqp9sFaTLG+PxYKxU2q
         ZJVx31p/1h+CcZxe/xnozfbFHD9Dsi4863ZVfwfJPj/356NWynHD2AnB3GpvcEyr9JZ5
         a6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S80tutkX1lAZvu7Kkpft8r04otkjmb2zzvnIOqODTsA=;
        b=ORKYkC8mru7LMcfgKR1kl6NOAmhy8vA0c3rCf4sYjOSo49E/ljzFYLk+mJ6/gz+uDX
         Povkg7RY2vg2kx3hlDro1YB2x7oMW5slp1wsARWWaU16GHubgjVUBLWQJNeILQ1DrzP9
         cFazK14A2nQ9+D2fCFxwReJU26qJpPtaRQ3JKdtw+yXgD/9OdwmXFVtQAs25NvqL7M5G
         b+XrV5jNRTamWZVsT/On5qrMtvYS5WoUTkFiCKNIbFZn5cDewoN5q1nEUJ+CjvcI8jMI
         4i8NlU2Oh5agH9H4ZOUfqIan0lFDIV8vVbXiAeQdi3vNr/eT2MekzNOQHNEMj9PlXp0b
         Zjhw==
X-Gm-Message-State: ACrzQf2oeTpw8/JAxP1Nf986zV4XmFi9WyZhMNLqi2d8uZdwG4cTPrct
        iixDTgQjan4bPWSktjEuOtBP3Q==
X-Google-Smtp-Source: AMsMyM5yuRzyhesXJF0yQGPVqaXkjF4OJgY51laBj3DdAl+QPpKeHDc/3m17m5OoKI4ui34FUCMHnA==
X-Received: by 2002:a17:902:ef52:b0:17c:f072:95bc with SMTP id e18-20020a170902ef5200b0017cf07295bcmr5589989plx.28.1667069366103;
        Sat, 29 Oct 2022 11:49:26 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:25 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 06/13] HID: playstation: Add DualShock4 rumble support.
Date:   Sat, 29 Oct 2022 11:48:44 -0700
Message-Id: <20221029184851.282366-7-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch implements DualShock4 rumble support in a similar manner
as the DualSense implementation. It adds an output worker with
granular control of different features of the main DualShock4 output
report.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 148 +++++++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 03f33dea5d93..319f400dd946 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -285,6 +285,8 @@ struct dualsense_output_report {
 
 #define DS4_INPUT_REPORT_USB			0x01
 #define DS4_INPUT_REPORT_USB_SIZE		64
+#define DS4_OUTPUT_REPORT_USB			0x05
+#define DS4_OUTPUT_REPORT_USB_SIZE		32
 
 #define DS4_FEATURE_REPORT_CALIBRATION		0x02
 #define DS4_FEATURE_REPORT_CALIBRATION_SIZE	37
@@ -306,6 +308,9 @@ struct dualsense_output_report {
 /* Battery status within batery_status field. */
 #define DS4_BATTERY_STATUS_FULL		11
 
+/* Flags for DualShock4 output report. */
+#define DS4_OUTPUT_VALID_FLAG0_MOTOR		0x01
+
 /* DualShock4 hardware limits */
 #define DS4_ACC_RES_PER_G	8192
 #define DS4_ACC_RANGE		(4*DS_ACC_RES_PER_G)
@@ -328,6 +333,14 @@ struct dualshock4 {
 	bool sensor_timestamp_initialized;
 	uint32_t prev_sensor_timestamp;
 	uint32_t sensor_timestamp_us;
+
+	bool update_rumble;
+	uint8_t motor_left;
+	uint8_t motor_right;
+
+	struct work_struct output_worker;
+	bool output_worker_initialized;
+	void *output_report_dmabuf;
 };
 
 struct dualshock4_touch_point {
@@ -372,6 +385,45 @@ struct dualshock4_input_report_usb {
 } __packed;
 static_assert(sizeof(struct dualshock4_input_report_usb) == DS4_INPUT_REPORT_USB_SIZE);
 
+/* Common data between Bluetooth and USB DualShock4 output reports. */
+struct dualshock4_output_report_common {
+	uint8_t valid_flag0;
+	uint8_t valid_flag1;
+
+	uint8_t reserved;
+
+	uint8_t motor_right;
+	uint8_t motor_left;
+
+	uint8_t lightbar_red;
+	uint8_t lightbar_green;
+	uint8_t lightbar_blue;
+	uint8_t lightbar_blink_on;
+	uint8_t lightbar_blink_off;
+} __packed;
+
+struct dualshock4_output_report_usb {
+	uint8_t report_id; /* 0x5 */
+	struct dualshock4_output_report_common common;
+	uint8_t reserved[21];
+} __packed;
+static_assert(sizeof(struct dualshock4_output_report_usb) == DS4_OUTPUT_REPORT_USB_SIZE);
+
+/*
+ * The DualShock4 has a main output report used to control most features. It is
+ * largely the same between Bluetooth and USB except for different headers and CRC.
+ * This structure hide the differences between the two to simplify sending output reports.
+ */
+struct dualshock4_output_report {
+	uint8_t *data; /* Start of data */
+	uint8_t len; /* Size of output report */
+
+	/* Points to USB data payload in case for a USB report else NULL. */
+	struct dualshock4_output_report_usb *usb;
+	/* Points to common section of report, so past any headers. */
+	struct dualshock4_output_report_common *common;
+};
+
 /*
  * Common gamepad buttons across DualShock 3 / 4 and DualSense.
  * Note: for device with a touchpad, touchpad button is not included
@@ -399,6 +451,7 @@ static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
 };
 
 static inline void dualsense_schedule_work(struct dualsense *ds);
+static inline void dualshock4_schedule_work(struct dualshock4 *ds4);
 static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue);
 
 /*
@@ -1692,6 +1745,49 @@ static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 	return ret;
 }
 
+static void dualshock4_init_output_report(struct dualshock4 *ds4,
+		struct dualshock4_output_report *rp, void *buf)
+{
+	struct hid_device *hdev = ds4->base.hdev;
+
+	if (hdev->bus == BUS_USB) {
+		struct dualshock4_output_report_usb *usb = buf;
+
+		memset(usb, 0, sizeof(*usb));
+		usb->report_id = DS4_OUTPUT_REPORT_USB;
+
+		rp->data = buf;
+		rp->len = sizeof(*usb);
+		rp->usb = usb;
+		rp->common = &usb->common;
+	}
+}
+
+static void dualshock4_output_worker(struct work_struct *work)
+{
+	struct dualshock4 *ds4 = container_of(work, struct dualshock4, output_worker);
+	struct dualshock4_output_report report;
+	struct dualshock4_output_report_common *common;
+	unsigned long flags;
+
+	dualshock4_init_output_report(ds4, &report, ds4->output_report_dmabuf);
+	common = report.common;
+
+	spin_lock_irqsave(&ds4->base.lock, flags);
+
+	if (ds4->update_rumble) {
+		/* Select classic rumble style haptics and enable it. */
+		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_MOTOR;
+		common->motor_left = ds4->motor_left;
+		common->motor_right = ds4->motor_right;
+		ds4->update_rumble = false;
+	}
+
+	spin_unlock_irqrestore(&ds4->base.lock, flags);
+
+	hid_hw_output_report(ds4->base.hdev, report.data, report.len);
+}
+
 static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *report,
 		u8 *data, int size)
 {
@@ -1860,10 +1956,52 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	return 0;
 }
 
+static int dualshock4_play_effect(struct input_dev *dev, void *data, struct ff_effect *effect)
+{
+	struct hid_device *hdev = input_get_drvdata(dev);
+	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
+	unsigned long flags;
+
+	if (effect->type != FF_RUMBLE)
+		return 0;
+
+	spin_lock_irqsave(&ds4->base.lock, flags);
+	ds4->update_rumble = true;
+	ds4->motor_left = effect->u.rumble.strong_magnitude / 256;
+	ds4->motor_right = effect->u.rumble.weak_magnitude / 256;
+	spin_unlock_irqrestore(&ds4->base.lock, flags);
+
+	dualshock4_schedule_work(ds4);
+	return 0;
+}
+
+static void dualshock4_remove(struct ps_device *ps_dev)
+{
+	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ds4->base.lock, flags);
+	ds4->output_worker_initialized = false;
+	spin_unlock_irqrestore(&ds4->base.lock, flags);
+
+	cancel_work_sync(&ds4->output_worker);
+}
+
+static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ds4->base.lock, flags);
+	if (ds4->output_worker_initialized)
+		schedule_work(&ds4->output_worker);
+	spin_unlock_irqrestore(&ds4->base.lock, flags);
+}
+
 static struct ps_device *dualshock4_create(struct hid_device *hdev)
 {
 	struct dualshock4 *ds4;
 	struct ps_device *ps_dev;
+	uint8_t max_output_report_size;
 	int ret;
 
 	ds4 = devm_kzalloc(&hdev->dev, sizeof(*ds4), GFP_KERNEL);
@@ -1882,8 +2020,16 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	ps_dev->battery_capacity = 100; /* initial value until parse_report. */
 	ps_dev->battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
 	ps_dev->parse_report = dualshock4_parse_report;
+	ps_dev->remove = dualshock4_remove;
+	INIT_WORK(&ds4->output_worker, dualshock4_output_worker);
+	ds4->output_worker_initialized = true;
 	hid_set_drvdata(hdev, ds4);
 
+	max_output_report_size = sizeof(struct dualshock4_output_report_usb);
+	ds4->output_report_dmabuf = devm_kzalloc(&hdev->dev, max_output_report_size, GFP_KERNEL);
+	if (!ds4->output_report_dmabuf)
+		return ERR_PTR(-ENOMEM);
+
 	ret = dualshock4_get_mac_address(ds4);
 	if (ret) {
 		hid_err(hdev, "Failed to get MAC address from DualShock4\n");
@@ -1907,7 +2053,7 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 		goto err;
 	}
 
-	ds4->gamepad = ps_gamepad_create(hdev, NULL);
+	ds4->gamepad = ps_gamepad_create(hdev, dualshock4_play_effect);
 	if (IS_ERR(ds4->gamepad)) {
 		ret = PTR_ERR(ds4->gamepad);
 		goto err;
-- 
2.37.3

