Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78AD336209E
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 15:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243509AbhDPNOE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 09:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28854 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240600AbhDPNOE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 09:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618578819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=doZCo40olfiy9h3AlVaue7bjTd7SfvhJo1kUvyxuRFc=;
        b=hWuRsF2x2Efn89I5mEMUKNpPQnE0aoDGQFZTjLOhaP2I0odNRYAe2VQAAUkbwFzZtw5kfM
        pyy8UgP0aV1bm3H5p4N6cBibldI7sTlNLnqeSBqSb4N+GaT8ldKRizIPOeNVuifmIlkmZ+
        /AYpw5ePhIuGljkRnlrBr6XheeCeBnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-yDRdTJJqN6u5nBBbB3iE3g-1; Fri, 16 Apr 2021 09:13:37 -0400
X-MC-Unique: yDRdTJJqN6u5nBBbB3iE3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4196F10054F6;
        Fri, 16 Apr 2021 13:13:36 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-102.ams2.redhat.com [10.36.113.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 07E145C257;
        Fri, 16 Apr 2021 13:13:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Peter Hoeg <peter@hoeg.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 5/6] HID: lg-g15: Add support for the Logitech Z-10 speakers
Date:   Fri, 16 Apr 2021 15:13:22 +0200
Message-Id: <20210416131323.233184-6-hdegoede@redhat.com>
In-Reply-To: <20210416131323.233184-1-hdegoede@redhat.com>
References: <20210416131323.233184-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to hid-lg-g15 for the Logitech Z-10 speakers. This adds
support for the LCD menu keys found on these speakers, as well as
support for controlling the LCD's brightness through a LED classdev.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h    |  1 +
 drivers/hid/hid-lg-g15.c | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index df78b1a11fb5..5a3d2e5a3b3a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -759,6 +759,7 @@
 #define I2C_DEVICE_ID_LG_7010		0x7010
 
 #define USB_VENDOR_ID_LOGITECH		0x046d
+#define USB_DEVICE_ID_LOGITECH_Z_10_SPK	0x0a07
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
 #define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index b76988c19f84..701ddb98e7d2 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -28,6 +28,7 @@ enum lg_g15_model {
 	LG_G15_V2,
 	LG_G510,
 	LG_G510_USB_AUDIO,
+	LG_Z10,
 };
 
 enum lg_g15_led_type {
@@ -457,6 +458,13 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 			return ret;
 
 		return lg_g510_update_mkey_led_brightness(g15);
+	case LG_Z10:
+		/*
+		 * Getting the LCD backlight brightness is not supported.
+		 * Reading Feature(2) fails with -EPIPE and this crashes
+		 * the LCD and touch keys part of the speakers.
+		 */
+		return 0;
 	}
 	return -EINVAL; /* Never reached */
 }
@@ -626,6 +634,12 @@ static int lg_g15_raw_event(struct hid_device *hdev, struct hid_report *report,
 		if (data[0] == 0x02 && size == 5)
 			return lg_g15_v2_event(g15, data);
 		break;
+	case LG_Z10:
+		if (data[0] == 0x02 && size == 9) {
+			lg_g15_handle_lcd_menu_keys(g15, data);
+			input_sync(g15->input);
+		}
+		break;
 	case LG_G510:
 	case LG_G510_USB_AUDIO:
 		if (data[0] == 0x03 && size == 5)
@@ -660,8 +674,10 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 	switch (g15->model) {
 	case LG_G15:
 	case LG_G15_V2:
-		g15->leds[i].cdev.brightness_set_blocking = lg_g15_led_set;
 		g15->leds[i].cdev.brightness_get = lg_g15_led_get;
+		fallthrough;
+	case LG_Z10:
+		g15->leds[i].cdev.brightness_set_blocking = lg_g15_led_set;
 		if (i < LG_G15_BRIGHTNESS_MAX) {
 			g15->leds[i].cdev.flags = LED_BRIGHT_HW_CHANGED;
 			g15->leds[i].cdev.max_brightness = 2;
@@ -802,6 +818,9 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		gkeys_settings_feature_report = 0x01;
 		gkeys = 18;
 		break;
+	case LG_Z10:
+		connect_mask = HID_CONNECT_HIDRAW;
+		break;
 	}
 
 	ret = hid_hw_start(hdev, connect_mask);
@@ -844,6 +863,19 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		goto error_hw_stop;
 
+	if (g15->model == LG_Z10) {
+		lg_g15_init_input_dev(hdev, g15->input, "Logitech Z-10 LCD Menu Keys");
+		ret = input_register_device(g15->input);
+		if (ret)
+			goto error_hw_stop;
+
+		ret = lg_g15_register_led(g15, 1, "z-10::lcd_backlight");
+		if (ret)
+			goto error_hw_stop;
+
+		return 0; /* All done */
+	}
+
 	/* Setup and register input device */
 	lg_g15_init_input_dev(hdev, input, "Logitech Gaming Keyboard Gaming Keys");
 
@@ -904,6 +936,10 @@ static const struct hid_device_id lg_g15_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 			 USB_DEVICE_ID_LOGITECH_G510_USB_AUDIO),
 		.driver_data = LG_G510_USB_AUDIO },
+	/* Z-10 speakers */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+			 USB_DEVICE_ID_LOGITECH_Z_10_SPK),
+		.driver_data = LG_Z10 },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, lg_g15_devices);
-- 
2.31.1

