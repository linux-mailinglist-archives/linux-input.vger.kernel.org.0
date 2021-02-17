Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C1A31DE67
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234562AbhBQRgO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:36:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38106 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234483AbhBQReG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583159;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DvzCLbkZPIfmQKREojXO4UFklSzcbb7BeVXTml1eNwg=;
        b=BeN/+xlnwLDXaKUQjG8zmXgdl5MsergUhCWFw9Jhc5cmq0ukYAHfvIo1kb4YyjNA0lxw8Q
        nqkkrhAJ/kfbaxWD8TLr83gZhoGg+39+RqHowQEqrNhUlWFJzD/pxEVPFNrZxaa6XH/3ez
        Z+SSegNA3wm7tNsEwlPD+Np/0nFl5iA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-UNrBIJHDNjCF7EOmiJaosQ-1; Wed, 17 Feb 2021 12:32:36 -0500
X-MC-Unique: UNrBIJHDNjCF7EOmiJaosQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE42380364F;
        Wed, 17 Feb 2021 17:32:34 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4EF2D60C61;
        Wed, 17 Feb 2021 17:32:30 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 11/11] HID: playstation: add DualSense player LED support.
Date:   Wed, 17 Feb 2021 18:31:58 +0100
Message-Id: <20210217173158.3122868-12-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense features 5 player LEDs below its touchpad, which are
meant as player id indications. The LEDs are configured with a
player ID determined by an ID allocator, which assign player ids
to ps_device instances.

This patch is a combination of the following original patches
minus use of LED framework APIs:
- HID: playstation: add DualSense player LEDs support.
- HID: playstation: DualSense set LEDs to default player id.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Reviewed-by: Barnabás Pőcze <pobrn@protonmail.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-playstation.c | 83 ++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 04743fa0e03d..7f65d30ca77c 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -9,6 +9,7 @@
 #include <linux/crc32.h>
 #include <linux/device.h>
 #include <linux/hid.h>
+#include <linux/idr.h>
 #include <linux/input/mt.h>
 #include <linux/module.h>
 
@@ -20,6 +21,8 @@
 static DEFINE_MUTEX(ps_devices_lock);
 static LIST_HEAD(ps_devices_list);
 
+static DEFINE_IDA(ps_player_id_allocator);
+
 #define HID_PLAYSTATION_VERSION_PATCH 0x8000
 
 /* Base class for playstation devices. */
@@ -28,6 +31,8 @@ struct ps_device {
 	struct hid_device *hdev;
 	spinlock_t lock;
 
+	uint32_t player_id;
+
 	struct power_supply_desc battery_desc;
 	struct power_supply *battery;
 	uint8_t battery_capacity;
@@ -108,6 +113,7 @@ struct ps_calibration_data {
 #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
+#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
@@ -151,6 +157,11 @@ struct dualsense {
 	bool mic_muted;
 	bool last_btn_mic_state;
 
+	/* Player leds */
+	bool update_player_leds;
+	uint8_t player_leds_state;
+	struct led_classdev player_leds[5];
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -309,6 +320,24 @@ static int ps_devices_list_remove(struct ps_device *dev)
 	return 0;
 }
 
+static int ps_device_set_player_id(struct ps_device *dev)
+{
+	int ret = ida_alloc(&ps_player_id_allocator, GFP_KERNEL);
+
+	if (ret < 0)
+		return ret;
+
+	dev->player_id = ret;
+	return 0;
+}
+
+static void ps_device_release_player_id(struct ps_device *dev)
+{
+	ida_free(&ps_player_id_allocator, dev->player_id);
+
+	dev->player_id = U32_MAX;
+}
+
 static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const char *name_suffix)
 {
 	struct input_dev *input_dev;
@@ -824,6 +853,13 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
+	if (ds->update_player_leds) {
+		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
+		common->player_leds = ds->player_leds_state;
+
+		ds->update_player_leds = false;
+	}
+
 	if (ds->update_mic_mute) {
 		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
 		common->mute_button_led = ds->mic_muted;
@@ -1078,6 +1114,29 @@ static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t gr
 	schedule_work(&ds->output_worker);
 }
 
+static void dualsense_set_player_leds(struct dualsense *ds)
+{
+	/*
+	 * The DualSense controller has a row of 5 LEDs used for player ids.
+	 * Behavior on the PlayStation 5 console is to center the player id
+	 * across the LEDs, so e.g. player 1 would be "--x--" with x being 'on'.
+	 * Follow a similar mapping here.
+	 */
+	static const int player_ids[5] = {
+		BIT(2),
+		BIT(3) | BIT(1),
+		BIT(4) | BIT(2) | BIT(0),
+		BIT(4) | BIT(3) | BIT(1) | BIT(0),
+		BIT(4) | BIT(3) | BIT(2) | BIT(1) | BIT(0)
+	};
+
+	uint8_t player_id = ds->base.player_id % ARRAY_SIZE(player_ids);
+
+	ds->update_player_leds = true;
+	ds->player_leds_state = player_ids[player_id];
+	schedule_work(&ds->output_worker);
+}
+
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
@@ -1166,6 +1225,15 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 
 	dualsense_set_lightbar(ds, 0, 0, 128); /* blue */
 
+	ret = ps_device_set_player_id(ps_dev);
+	if (ret) {
+		hid_err(hdev, "Failed to assign player id for DualSense: %d\n", ret);
+		goto err;
+	}
+
+	/* Set player LEDs to our player id. */
+	dualsense_set_player_leds(ds);
+
 	/*
 	 * Reporting hardware and firmware is important as there are frequent updates, which
 	 * can change behavior.
@@ -1243,6 +1311,7 @@ static void ps_remove(struct hid_device *hdev)
 	struct ps_device *dev = hid_get_drvdata(hdev);
 
 	ps_devices_list_remove(dev);
+	ps_device_release_player_id(dev);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
@@ -1263,7 +1332,19 @@ static struct hid_driver ps_driver = {
 	.raw_event	= ps_raw_event,
 };
 
-module_hid_driver(ps_driver);
+static int __init ps_init(void)
+{
+	return hid_register_driver(&ps_driver);
+}
+
+static void __exit ps_exit(void)
+{
+	hid_unregister_driver(&ps_driver);
+	ida_destroy(&ps_player_id_allocator);
+}
+
+module_init(ps_init);
+module_exit(ps_exit);
 
 MODULE_AUTHOR("Sony Interactive Entertainment");
 MODULE_DESCRIPTION("HID Driver for PlayStation peripherals.");
-- 
2.29.2

