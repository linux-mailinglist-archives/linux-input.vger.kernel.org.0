Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3615C6124F5
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiJ2StV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiJ2StU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:20 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC244599C
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:19 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id v17so4513655plo.1
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUwtoqb6ymCe0xoGoi2RycTEiGOOXs1xPWthLoNdQkg=;
        b=yNjpTHL5jlDHYjA1hdbf0MHt/JoEgSYKr2TwBWsY1mNKk48xl05HTZhPRsQZ3/8LVY
         UJaoWfDNsAO4KQ+MJ7GXxu4lTEgs3WzxBZDAOpgAlduHydi/Du06/nOmKqacyTODtrNW
         JW4MX76y3UteJ6Zf1qECb0HS9MpP6VJlILxbBMsjbuCyCqCqq87QDmTb77l4bFsQ+wN5
         LibabHzOk/le2K7E0llBCWH90qN7mkK/CgvPFikx0c0a1h32ynENheJ2qO4I53lVqgGf
         K25NsDuzRKjtj2s0aSrc1GIigVOYciPrd5khnB8HZHE9NIL5I6zC3pPLAcUK8lBoLyHX
         pCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUwtoqb6ymCe0xoGoi2RycTEiGOOXs1xPWthLoNdQkg=;
        b=YkorCtsIC2rN3gyy8fUJ41B1IYzNE1pPCGjeNJfXGvi6SSsT59y+vpwJsattp1DTC7
         j5OM4xvNoKoLtlJMTBlIuA4cdpFRafNBJhUEoxn5HuVyvCXyZMBfrxgetBY8FjyQ+SPN
         Hpl7B7besbuJ+RbZd6xx8CS+3530q+r0vDz1GjlEXAHFURkYHFf+ZYTeSAKPvbXZQvN9
         J04qTYbEUYaBJi7oj6oz9Qx/+V5KrqC0Gs3HfJYZYJ2jTU7Lgrg4mapXAdcvdKDzTNBs
         cFvnpfb/47omLq0j1rcewU0vXUIXqNDAfOVg1KOVHTM8REYXMb4d38NATpCEUlIrZox3
         NzsA==
X-Gm-Message-State: ACrzQf3bgdQQcD3ds7HIwgpUvYeBOtwDZvHUeGLP7ywDsyTJZjEW++7x
        Q/ra9GA26Lcu0DydCGKjsun2sA==
X-Google-Smtp-Source: AMsMyM7Pp/4+L+f18KyHbNjDeEvvazUEEaioxvGKmtoVjx3ZmrxUCf9hzkttKXgExOayCDOiYYyTtg==
X-Received: by 2002:a17:902:d2c9:b0:186:f355:a42b with SMTP id n9-20020a170902d2c900b00186f355a42bmr5575302plc.58.1667069353771;
        Sat, 29 Oct 2022 11:49:13 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:13 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 01/13] HID: playstation: initial DualShock4 USB support.
Date:   Sat, 29 Oct 2022 11:48:39 -0700
Message-Id: <20221029184851.282366-2-roderick.colenbrander@sony.com>
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

Add basic support for DualShock4 USB controller with buttons and sticks.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 174 +++++++++++++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 0b58763bfd30..04d03d2e40db 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2,7 +2,7 @@
 /*
  *  HID driver for Sony DualSense(TM) controller.
  *
- *  Copyright (c) 2020 Sony Interactive Entertainment
+ *  Copyright (c) 2020-2022 Sony Interactive Entertainment
  */
 
 #include <linux/bits.h>
@@ -283,6 +283,35 @@ struct dualsense_output_report {
 	struct dualsense_output_report_common *common;
 };
 
+#define DS4_INPUT_REPORT_USB			0x01
+#define DS4_INPUT_REPORT_USB_SIZE		64
+
+#define DS4_FEATURE_REPORT_PAIRING_INFO		0x12
+#define DS4_FEATURE_REPORT_PAIRING_INFO_SIZE	16
+
+struct dualshock4 {
+	struct ps_device base;
+	struct input_dev *gamepad;
+};
+
+/* Main DualShock4 input report excluding any BT/USB specific headers. */
+struct dualshock4_input_report_common {
+	uint8_t x, y;
+	uint8_t rx, ry;
+	uint8_t buttons[3];
+	uint8_t z, rz;
+
+	uint8_t reserved[20];
+} __packed;
+static_assert(sizeof(struct dualshock4_input_report_common) == 29);
+
+struct dualshock4_input_report_usb {
+	uint8_t report_id; /* 0x01 */
+	struct dualshock4_input_report_common common;
+	uint8_t reserved[34];
+} __packed;
+static_assert(sizeof(struct dualshock4_input_report_usb) == DS4_INPUT_REPORT_USB_SIZE);
+
 /*
  * Common gamepad buttons across DualShock 3 / 4 and DualSense.
  * Note: for device with a touchpad, touchpad button is not included
@@ -1465,6 +1494,135 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return ERR_PTR(ret);
 }
 
+static int dualshock4_get_mac_address(struct dualshock4 *ds4)
+{
+	uint8_t *buf;
+	int ret = 0;
+
+	buf = kzalloc(DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_PAIRING_INFO, buf,
+			DS4_FEATURE_REPORT_PAIRING_INFO_SIZE);
+	if (ret) {
+		hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 pairing info: %d\n", ret);
+		goto err_free;
+	}
+
+	memcpy(ds4->base.mac_address, &buf[1], sizeof(ds4->base.mac_address));
+
+err_free:
+	kfree(buf);
+	return ret;
+}
+
+static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *report,
+		u8 *data, int size)
+{
+	struct hid_device *hdev = ps_dev->hdev;
+	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
+	struct dualshock4_input_report_common *ds4_report;
+	uint8_t value;
+
+	/*
+	 * DualShock4 in USB uses the full HID report for reportID 1, but
+	 * Bluetooth uses a minimal HID report for reportID 1 and reports
+	 * the full report using reportID 17.
+	 */
+	if (hdev->bus == BUS_USB && report->id == DS4_INPUT_REPORT_USB &&
+			size == DS4_INPUT_REPORT_USB_SIZE) {
+		struct dualshock4_input_report_usb *usb = (struct dualshock4_input_report_usb *)data;
+
+		ds4_report = &usb->common;
+	} else {
+		hid_err(hdev, "Unhandled reportID=%d\n", report->id);
+		return -1;
+	}
+
+	input_report_abs(ds4->gamepad, ABS_X,  ds4_report->x);
+	input_report_abs(ds4->gamepad, ABS_Y,  ds4_report->y);
+	input_report_abs(ds4->gamepad, ABS_RX, ds4_report->rx);
+	input_report_abs(ds4->gamepad, ABS_RY, ds4_report->ry);
+	input_report_abs(ds4->gamepad, ABS_Z,  ds4_report->z);
+	input_report_abs(ds4->gamepad, ABS_RZ, ds4_report->rz);
+
+	value = ds4_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
+	if (value >= ARRAY_SIZE(ps_gamepad_hat_mapping))
+		value = 8; /* center */
+	input_report_abs(ds4->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value].x);
+	input_report_abs(ds4->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value].y);
+
+	input_report_key(ds4->gamepad, BTN_WEST,   ds4_report->buttons[0] & DS_BUTTONS0_SQUARE);
+	input_report_key(ds4->gamepad, BTN_SOUTH,  ds4_report->buttons[0] & DS_BUTTONS0_CROSS);
+	input_report_key(ds4->gamepad, BTN_EAST,   ds4_report->buttons[0] & DS_BUTTONS0_CIRCLE);
+	input_report_key(ds4->gamepad, BTN_NORTH,  ds4_report->buttons[0] & DS_BUTTONS0_TRIANGLE);
+	input_report_key(ds4->gamepad, BTN_TL,     ds4_report->buttons[1] & DS_BUTTONS1_L1);
+	input_report_key(ds4->gamepad, BTN_TR,     ds4_report->buttons[1] & DS_BUTTONS1_R1);
+	input_report_key(ds4->gamepad, BTN_TL2,    ds4_report->buttons[1] & DS_BUTTONS1_L2);
+	input_report_key(ds4->gamepad, BTN_TR2,    ds4_report->buttons[1] & DS_BUTTONS1_R2);
+	input_report_key(ds4->gamepad, BTN_SELECT, ds4_report->buttons[1] & DS_BUTTONS1_CREATE);
+	input_report_key(ds4->gamepad, BTN_START,  ds4_report->buttons[1] & DS_BUTTONS1_OPTIONS);
+	input_report_key(ds4->gamepad, BTN_THUMBL, ds4_report->buttons[1] & DS_BUTTONS1_L3);
+	input_report_key(ds4->gamepad, BTN_THUMBR, ds4_report->buttons[1] & DS_BUTTONS1_R3);
+	input_report_key(ds4->gamepad, BTN_MODE,   ds4_report->buttons[2] & DS_BUTTONS2_PS_HOME);
+	input_sync(ds4->gamepad);
+
+	return 0;
+}
+
+static struct ps_device *dualshock4_create(struct hid_device *hdev)
+{
+	struct dualshock4 *ds4;
+	struct ps_device *ps_dev;
+	int ret;
+
+	ds4 = devm_kzalloc(&hdev->dev, sizeof(*ds4), GFP_KERNEL);
+	if (!ds4)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * Patch version to allow userspace to distinguish between
+	 * hid-generic vs hid-playstation axis and button mapping.
+	 */
+	hdev->version |= HID_PLAYSTATION_VERSION_PATCH;
+
+	ps_dev = &ds4->base;
+	ps_dev->hdev = hdev;
+	spin_lock_init(&ps_dev->lock);
+	ps_dev->parse_report = dualshock4_parse_report;
+	hid_set_drvdata(hdev, ds4);
+
+	ret = dualshock4_get_mac_address(ds4);
+	if (ret) {
+		hid_err(hdev, "Failed to get MAC address from DualShock4\n");
+		return ERR_PTR(ret);
+	}
+	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds4->base.mac_address);
+
+	ret = ps_devices_list_add(ps_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ds4->gamepad = ps_gamepad_create(hdev, NULL);
+	if (IS_ERR(ds4->gamepad)) {
+		ret = PTR_ERR(ds4->gamepad);
+		goto err;
+	}
+
+	ret = ps_device_set_player_id(ps_dev);
+	if (ret) {
+		hid_err(hdev, "Failed to assign player id for DualShock4: %d\n", ret);
+		goto err;
+	}
+
+	return &ds4->base;
+
+err:
+	ps_devices_list_remove(ps_dev);
+	return ERR_PTR(ret);
+}
+
 static int ps_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *data, int size)
 {
@@ -1499,7 +1657,15 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_stop;
 	}
 
-	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER ||
+	if (hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER ||
+		hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) {
+		dev = dualshock4_create(hdev);
+		if (IS_ERR(dev)) {
+			hid_err(hdev, "Failed to create dualshock4.\n");
+			ret = PTR_ERR(dev);
+			goto err_close;
+		}
+	} else if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER ||
 		hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
 		dev = dualsense_create(hdev);
 		if (IS_ERR(dev)) {
@@ -1533,6 +1699,10 @@ static void ps_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id ps_devices[] = {
+	/* Sony DualShock 4 controllers for PS4 */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
+	/* Sony DualSense controllers for PS5 */
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) },
-- 
2.37.3

