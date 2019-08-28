Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3ECEA020D
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 14:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfH1Mlq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 08:41:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43478 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbfH1Mlq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 08:41:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 30CD2308A9E0;
        Wed, 28 Aug 2019 12:41:46 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-147.ams2.redhat.com [10.36.116.147])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 180025C1D6;
        Wed, 28 Aug 2019 12:41:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 7/7] HID: lg-g15: Add support for the G510's M1-M3 and MR LEDs
Date:   Wed, 28 Aug 2019 14:41:30 +0200
Message-Id: <20190828124130.26752-7-hdegoede@redhat.com>
In-Reply-To: <20190828124130.26752-1-hdegoede@redhat.com>
References: <20190828124130.26752-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 28 Aug 2019 12:41:46 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for controlling the LEDs below the M1-M3 and MR keys
on the G510.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lg-g15.c | 93 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index b8ea059c46f3..8a9268a5c66a 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -353,6 +353,90 @@ static void lg_g510_leds_sync_work(struct work_struct *work)
 	mutex_unlock(&g15->mutex);
 }
 
+static int lg_g510_update_mkey_led_brightness(struct lg_g15_data *g15)
+{
+	int ret;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G510_FEATURE_M_KEYS_LEDS,
+				 g15->transfer_buf, 2,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret != 2) {
+		hid_err(g15->hdev, "Error getting LED brightness: %d\n", ret);
+		ret = (ret < 0) ? ret : -EIO;
+	}
+
+	g15->leds[LG_G15_MACRO_PRESET1].brightness =
+		!!(g15->transfer_buf[1] & 0x80);
+	g15->leds[LG_G15_MACRO_PRESET2].brightness =
+		!!(g15->transfer_buf[1] & 0x40);
+	g15->leds[LG_G15_MACRO_PRESET3].brightness =
+		!!(g15->transfer_buf[1] & 0x20);
+	g15->leds[LG_G15_MACRO_RECORD].brightness =
+		!!(g15->transfer_buf[1] & 0x10);
+
+	return 0;
+}
+
+static enum led_brightness lg_g510_mkey_led_get(struct led_classdev *led_cdev)
+{
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	enum led_brightness brightness;
+
+	mutex_lock(&g15->mutex);
+	lg_g510_update_mkey_led_brightness(g15);
+	brightness = g15->leds[g15_led->led].brightness;
+	mutex_unlock(&g15->mutex);
+
+	return brightness;
+}
+
+static int lg_g510_mkey_led_set(struct led_classdev *led_cdev,
+				enum led_brightness brightness)
+{
+	struct lg_g15_led *g15_led =
+		container_of(led_cdev, struct lg_g15_led, cdev);
+	struct lg_g15_data *g15 = dev_get_drvdata(led_cdev->dev->parent);
+	u8 val, mask = 0;
+	int i, ret;
+
+	/* Ignore LED off on unregister / keyboard unplug */
+	if (led_cdev->flags & LED_UNREGISTERING)
+		return 0;
+
+	mutex_lock(&g15->mutex);
+
+	for (i = LG_G15_MACRO_PRESET1; i < LG_G15_LED_MAX; i++) {
+		if (i == g15_led->led)
+			val = brightness;
+		else
+			val = g15->leds[i].brightness;
+
+		if (val)
+			mask |= 0x80 >> (i - LG_G15_MACRO_PRESET1);
+	}
+
+	g15->transfer_buf[0] = LG_G510_FEATURE_M_KEYS_LEDS;
+	g15->transfer_buf[1] = mask;
+
+	ret = hid_hw_raw_request(g15->hdev, LG_G510_FEATURE_M_KEYS_LEDS,
+				 g15->transfer_buf, 2,
+				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
+	if (ret == 2) {
+		/* Success */
+		g15_led->brightness = brightness;
+		ret = 0;
+	} else {
+		hid_err(g15->hdev, "Error setting LED brightness: %d\n", ret);
+		ret = (ret < 0) ? ret : -EIO;
+	}
+
+	mutex_unlock(&g15->mutex);
+
+	return ret;
+}
+
 /******** Generic LED functions ********/
 static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 {
@@ -372,7 +456,7 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 		if (ret)
 			return ret;
 
-		return 0;
+		return lg_g510_update_mkey_led_brightness(g15);
 	}
 	return -EINVAL; /* Never reached */
 }
@@ -606,8 +690,11 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i)
 			g15->leds[i].cdev.groups = lg_g510_kbd_led_groups;
 			break;
 		default:
-			/* TODO: Add support for M1 - M3 and MR leds */
-			return 0;
+			g15->leds[i].cdev.brightness_set_blocking =
+				lg_g510_mkey_led_set;
+			g15->leds[i].cdev.brightness_get =
+				lg_g510_mkey_led_get;
+			g15->leds[i].cdev.max_brightness = 1;
 		}
 		break;
 	}
-- 
2.23.0

