Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838C26124FF
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiJ2Stv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiJ2Stt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:49 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD04314097
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:47 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id u6so7517366plq.12
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KyW0lSBWeurKf3smir9O6Xb+3JTUvpA5yWPhcDZubs=;
        b=X29xN7vnc1pTXylGiSWVGriT5LBy2mMcddkenghjkYaWmLrVdo5evTKrkOJGRn1y2e
         I3+7J3QJoDuNs2fv4zmGSI/h2+7uekEkSVvcpF6LWTmdqMDswIboIpUmgOoxxMbK14Gg
         sORuIS1tXuvo+520q7i4ONwWwpOIWQa3PRGpG0z5STwn62vYb0g4IND6APRLbwKXn2LB
         sJwnwnBdEwfwPoe9owOBQSM5efauZXNaK/VvugT3RRk15uOjobNwhMC27rn3YQauBfxt
         jL4HGanhggfRpx9XKnegQV/KtleUvHf5o5Dibxle/oJvltQtLcVTWlnHBfpCfGg5yyoN
         PfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KyW0lSBWeurKf3smir9O6Xb+3JTUvpA5yWPhcDZubs=;
        b=7816M/jmMhGy+Z02jgzZP+2S1uAwdWkL5OnAaowua/5DmLAQ+b7cLLK5DIq8KJQCmK
         JlgyU2wLDe96Wy7Z55SYFbO/yUU3f4+PSMpANQ3ZqQL8+xNT4Yl7xtGck/XxYUvnrCN+
         8iVQS2YWkgoQo5sPfC/GCnIfKwTCadRiMxl2SuDg95kuaD4/f4k5fY928WijM03fyuYb
         JlDFhcQDYsHu7DTJ3Zcg5OBXQmgnnWCbRQxXcDICq4xNZ12bF5T6g8ZaxZMkW3xr40q3
         CoFM/PCxHpDjuQ0ssCVw91IOWBkeAC5P0XIFsj8L9QI6etY+Vhp/ZwCeH0xoYlezdmTH
         QbSQ==
X-Gm-Message-State: ACrzQf1tqinMxIxCN4njugP3OcOatOtbaKdUSbELNtIS3K91A+yttiR7
        1iG3ZYAkvY+/aDnc20LdFF9gmA==
X-Google-Smtp-Source: AMsMyM5+g8A0kYDVse1FO0RTkYgpiwq1DtH+Yioz3AoF6QPBs/UWJD+L6sjO/PU8vNTDqU9yfBdycQ==
X-Received: by 2002:a17:902:8c81:b0:178:1701:cd with SMTP id t1-20020a1709028c8100b00178170100cdmr5812561plo.138.1667069387276;
        Sat, 29 Oct 2022 11:49:47 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:46 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 13/13] HID: playstation: add DualShock4 dongle support.
Date:   Sat, 29 Oct 2022 11:48:51 -0700
Message-Id: <20221029184851.282366-14-roderick.colenbrander@sony.com>
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

This patch adds support for the DualShock4 dongle in a very similar
way we contributed to hid-sony before.

The dongle is a USB to Bluetooth bridge and uses the same HID reports
as a USB device. It reports data through the DS4's main USB input
report independent on whether a Bluetooth controller is connected.
For this reason there is custom dongle report parsing code to
detect controller hotplug and kick of calibration work until we
are ready to process actual input reports.

The logic also incorporates a workaround needed for Steam in which
hid-playstation and Steam using hidraw can fight.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 146 ++++++++++++++++++++++++++++++++--
 1 file changed, 140 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 05553d07cb1b..bae3e712a562 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -315,6 +315,11 @@ struct dualsense_output_report {
 #define DS4_STATUS0_CABLE_STATE		BIT(4)
 /* Battery status within batery_status field. */
 #define DS4_BATTERY_STATUS_FULL		11
+/* Status1 bit2 contains dongle connection state:
+ * 0 = connectd
+ * 1 = disconnected
+ */
+#define DS4_STATUS1_DONGLE_STATE	BIT(2)
 
 /* The lower 6 bits of hw_control of the Bluetooth main output report
  * control the interval at which Dualshock 4 reports data:
@@ -344,6 +349,13 @@ struct dualsense_output_report {
 #define DS4_TOUCHPAD_WIDTH	1920
 #define DS4_TOUCHPAD_HEIGHT	942
 
+enum dualshock4_dongle_state {
+	DONGLE_DISCONNECTED,
+	DONGLE_CALIBRATING,
+	DONGLE_CONNECTED,
+	DONGLE_DISABLED
+};
+
 struct dualshock4 {
 	struct ps_device base;
 	struct input_dev *gamepad;
@@ -354,6 +366,11 @@ struct dualshock4 {
 	struct ps_calibration_data accel_calib_data[3];
 	struct ps_calibration_data gyro_calib_data[3];
 
+	/* Only used on dongle to track state transitions. */
+	enum dualshock4_dongle_state dongle_state;
+	/* Used during calibration. */
+	struct work_struct dongle_hotplug_worker;
+
 	/* Timestamp for sensor data */
 	bool sensor_timestamp_initialized;
 	uint32_t prev_sensor_timestamp;
@@ -513,9 +530,11 @@ static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
 	{0, 0},
 };
 
+static int dualshock4_get_calibration_data(struct dualshock4 *ds4);
 static inline void dualsense_schedule_work(struct dualsense *ds);
 static inline void dualshock4_schedule_work(struct dualshock4 *ds4);
 static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue);
+static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4);
 
 /*
  * Add a new ps_device to ps_devices if it doesn't exist.
@@ -1678,6 +1697,33 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return ERR_PTR(ret);
 }
 
+static void dualshock4_dongle_calibration_work(struct work_struct *work)
+{
+	struct dualshock4 *ds4 = container_of(work, struct dualshock4, dongle_hotplug_worker);
+	unsigned long flags;
+	enum dualshock4_dongle_state dongle_state;
+	int ret;
+
+	ret = dualshock4_get_calibration_data(ds4);
+	if (ret < 0) {
+		/* This call is very unlikely to fail for the dongle. When it
+		 * fails we are probably in a very bad state, so mark the
+		 * dongle as disabled. We will re-enable the dongle if a new
+		 * DS4 hotplug is detect from sony_raw_event as any issues
+		 * are likely resolved then (the dongle is quite stupid).
+		 */
+		hid_err(ds4->base.hdev, "DualShock 4 USB dongle: calibration failed, disabling device\n");
+		dongle_state = DONGLE_DISABLED;
+	} else {
+		hid_info(ds4->base.hdev, "DualShock 4 USB dongle: calibration completed\n");
+		dongle_state = DONGLE_CONNECTED;
+	}
+
+	spin_lock_irqsave(&ds4->base.lock, flags);
+	ds4->dongle_state = dongle_state;
+	spin_unlock_irqrestore(&ds4->base.lock, flags);
+}
+
 static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 {
 	struct hid_device *hdev = ds4->base.hdev;
@@ -1694,15 +1740,34 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 	uint8_t *buf;
 
 	if (ds4->base.hdev->bus == BUS_USB) {
+		int retries;
+
 		buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 
-		ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
-				DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
-		if (ret) {
-			hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
-			goto err_free;
+		/* We should normally receive the feature report data we asked
+		 * for, but hidraw applications such as Steam can issue feature
+		 * reports as well. In particular for Dongle reconnects, Steam
+		 * and this function are competing resulting in often receiving
+		 * data for a different HID report, so retry a few times.
+		 */
+		for (retries = 0; retries < 3; retries++) {
+			ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
+					DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
+			if (ret) {
+				if (retries < 2) {
+					hid_warn(hdev, "Retrying DualShock 4 get calibration report (0x02) request\n");
+					continue;
+				} else {
+					ret = -EILSEQ;
+					goto err_free;
+				}
+				hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
+				goto err_free;
+			} else {
+				break;
+			}
 		}
 	} else { /* Bluetooth */
 		buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, GFP_KERNEL);
@@ -2220,6 +2285,62 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
 	return 0;
 }
 
+static int dualshock4_dongle_parse_report(struct ps_device *ps_dev, struct hid_report *report,
+		u8 *data, int size)
+{
+	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
+	bool connected = false;
+
+	/* The dongle reports data using the main USB report (0x1) no matter whether a controller
+	 * is connected with mostly zeros. The report does contain dongle status, which we use to
+	 * determine if a controller is connected and if so we forward to the regular DualShock4
+	 * parsing code.
+	 */
+	if (data[0] == DS4_INPUT_REPORT_USB && size == DS4_INPUT_REPORT_USB_SIZE) {
+		struct dualshock4_input_report_common *ds4_report = (struct dualshock4_input_report_common *)&data[1];
+		unsigned long flags;
+
+		connected = ds4_report->status[1] & DS4_STATUS1_DONGLE_STATE ? false : true;
+
+		if (ds4->dongle_state == DONGLE_DISCONNECTED && connected) {
+			hid_info(ps_dev->hdev, "DualShock 4 USB dongle: controller connected\n");
+
+			dualshock4_set_default_lightbar_colors(ds4);
+
+			spin_lock_irqsave(&ps_dev->lock, flags);
+			ds4->dongle_state = DONGLE_CALIBRATING;
+			spin_unlock_irqrestore(&ps_dev->lock, flags);
+
+			schedule_work(&ds4->dongle_hotplug_worker);
+
+			/* Don't process the report since we don't have
+			 * calibration data, but let hidraw have it anyway.
+			 */
+			return 0;
+		} else if ((ds4->dongle_state == DONGLE_CONNECTED ||
+			    ds4->dongle_state == DONGLE_DISABLED) && !connected) {
+			hid_info(ps_dev->hdev, "DualShock 4 USB dongle: controller disconnected\n");
+
+			spin_lock_irqsave(&ps_dev->lock, flags);
+			ds4->dongle_state = DONGLE_DISCONNECTED;
+			spin_unlock_irqrestore(&ps_dev->lock, flags);
+
+			/* Return 0, so hidraw can get the report. */
+			return 0;
+		} else if (ds4->dongle_state == DONGLE_CALIBRATING ||
+			   ds4->dongle_state == DONGLE_DISABLED ||
+			   ds4->dongle_state == DONGLE_DISCONNECTED) {
+			/* Return 0, so hidraw can get the report. */
+			return 0;
+		}
+	}
+
+	if (connected)
+		return dualshock4_parse_report(ps_dev, report, data, size);
+
+	return 0;
+}
+
 static int dualshock4_play_effect(struct input_dev *dev, void *data, struct ff_effect *effect)
 {
 	struct hid_device *hdev = input_get_drvdata(dev);
@@ -2249,6 +2370,9 @@ static void dualshock4_remove(struct ps_device *ps_dev)
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 
 	cancel_work_sync(&ds4->output_worker);
+
+	if (ps_dev->hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE)
+		cancel_work_sync(&ds4->dongle_hotplug_worker);
 }
 
 static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
@@ -2342,6 +2466,14 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	if (!ds4->output_report_dmabuf)
 		return ERR_PTR(-ENOMEM);
 
+	if (hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE) {
+		ds4->dongle_state = DONGLE_DISCONNECTED;
+		INIT_WORK(&ds4->dongle_hotplug_worker, dualshock4_dongle_calibration_work);
+
+		/* Override parse report for dongle specific hotplug handling. */
+		ps_dev->parse_report = dualshock4_dongle_parse_report;
+	}
+
 	ret = dualshock4_get_mac_address(ds4);
 	if (ret) {
 		hid_err(hdev, "Failed to get MAC address from DualShock4\n");
@@ -2457,7 +2589,8 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	if (hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER ||
-		hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) {
+		hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_2 ||
+		hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE) {
 		dev = dualshock4_create(hdev);
 		if (IS_ERR(dev)) {
 			hid_err(hdev, "Failed to create dualshock4.\n");
@@ -2503,6 +2636,7 @@ static const struct hid_device_id ps_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE) },
 	/* Sony DualSense controllers for PS5 */
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
-- 
2.37.3

