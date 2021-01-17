Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78C42F9625
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730637AbhAQXLs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730651AbhAQXLk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:11:40 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA096C061794
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:13 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id v1so8291757pjr.2
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+UlDkIMMU2jt/0QfaowQN/FKZOJwRkZJLjtlfJL5ps=;
        b=mSALuUv4UzbvUXcNDsiCU3jOhPnO/P5b+DFAxDXlA2y1mq4+0S9cIndkROx5bXbynk
         pbjF3laWK9ydBXflrUp1WJd/Ny/LIIVNIMvA7NtY7j6B+AENix12BTDgDl97VyMqDGlr
         Aqv8++p+bdpfIrzYclwMTN/VoAckNQkHLMgXiNzXpLlU+oAhTs27MEq8wPxH4085CqHy
         ZR9CYnIIX6ab4LpN5hVtYHfKNFvZ1BQx01DymOy6yH/UWTTidHnP9vOmszE/b2Y6zewi
         +8BsH2Bb9HE5d/yOABFu92QuMUjItZ9jDIrxM/WLFVb1vzGJ2jLGNQQ65oasFTXXiYan
         PGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+UlDkIMMU2jt/0QfaowQN/FKZOJwRkZJLjtlfJL5ps=;
        b=VDcW+YNPHHTf3IXigMsVv2ASg4Lv+T9VOjkweDab567VGlrLKQtDCJ+hEXGnRUt1Y/
         SDWU3SPn3RuxniQp/UZJK4M7uS+YexAoPOIlitMuUWqI6csxclrgMe35L9ZqnaiA6yUa
         eMM/F4Y01M3SiPsr70fCyjfNSMH57PEhF6aF8q+F7ApuMnquo17SAPQDRd0kbRIr83wC
         LhQyyEeaHBhG2H8vA5W+Sc+IAhVbOSgBhnNSgOg9Gp3nnyg70vACIwO2Jn2nJEYG6x8O
         9LH1TJc7ohenZmJYPLBkflzHMq7bZDXPi1qlfLnnKiNQouhdkfEvH7DonVF6e4vtOq/o
         AhFQ==
X-Gm-Message-State: AOAM532yJBWcDNmGhz6z208djtwSDcV3ydExWC5n4wrtF09RePp5CXt9
        5dJ6NbnRz5Ym8f8FsCl8J5iS3A==
X-Google-Smtp-Source: ABdhPJxAHz7/IsF/c33guYfVXbJ8pj7CBPXUcfGqFz1uXdOphaNQNWCjQWE5Qnf6odLZ8abNtebSRw==
X-Received: by 2002:a17:902:a711:b029:dc:2f27:c67f with SMTP id w17-20020a170902a711b02900dc2f27c67fmr23842784plq.74.1610925013283;
        Sun, 17 Jan 2021 15:10:13 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id g3sm14018746pjt.34.2021.01.17.15.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:10:12 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 11/12] HID: playstation: DualSense set LEDs to default player id.
Date:   Sun, 17 Jan 2021 15:09:55 -0800
Message-Id: <20210117230956.173031-12-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117230956.173031-1-roderick@gaikai.com>
References: <20210117230956.173031-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Add a ID allocator to assign player ids to ps_device instances.
Utilize the player id to set a default color on the DualSense its
player LED strip.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 74 +++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 0c2c7f7b1072..1cfad1f40b4e 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -9,6 +9,7 @@
 #include <linux/crc32.h>
 #include <linux/device.h>
 #include <linux/hid.h>
+#include <linux/idr.h>
 #include <linux/input/mt.h>
 #include <linux/leds.h>
 #include <linux/led-class-multicolor.h>
@@ -22,6 +23,8 @@
 static DEFINE_MUTEX(ps_devices_lock);
 static LIST_HEAD(ps_devices_list);
 
+static DEFINE_IDA(ps_player_id_allocator);
+
 #define HID_PLAYSTATION_VERSION_PATCH 0x8000
 
 /* Base class for playstation devices. */
@@ -30,6 +33,8 @@ struct ps_device {
 	struct hid_device *hdev;
 	spinlock_t lock;
 
+	uint32_t player_id;
+
 	struct power_supply_desc battery_desc;
 	struct power_supply *battery;
 	uint8_t battery_capacity;
@@ -321,6 +326,24 @@ static int ps_devices_list_remove(struct ps_device *dev)
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
@@ -791,9 +814,9 @@ static void dualsense_player_led_set_brightness(struct led_classdev *led, enum l
 
 	led_index = led - ds->player_leds;
 	if (value == LED_OFF)
-		ds->player_leds_state &= ~(1 << led_index);
+		ds->player_leds_state &= ~BIT(led_index);
 	else
-		ds->player_leds_state |= (1 << led_index);
+		ds->player_leds_state |= BIT(led_index);
 
 	ds->update_player_leds = true;
 	spin_unlock_irqrestore(&ds->base.lock, flags);
@@ -1144,6 +1167,29 @@ static int dualsense_reset_leds(struct dualsense *ds)
 	return 0;
 }
 
+static void dualsense_set_player_leds(struct dualsense *ds)
+{
+	/*
+	 * The DualSense controller has a row of 5 LEDs used for player ids.
+	 * Behavior on the PlayStation 5 console is to center the player id
+	 * across the LEDs, so e.g. player 1 would be "--x--" with x being 'on'.
+	 * Follow a similar mapping here.
+	 */
+	int player_ids[5] = {
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
@@ -1252,6 +1298,15 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 			goto err;
 	}
 
+	ret = ps_device_set_player_id(ps_dev);
+	if (ret) {
+		hid_err(hdev, "Failed to assign player id for DualSense: %d\n", ret);
+		goto err;
+	}
+
+	/* Set player LEDs to our player id. */
+	dualsense_set_player_leds(ds);
+
 	return &ds->base;
 
 err:
@@ -1316,6 +1371,7 @@ static void ps_remove(struct hid_device *hdev)
 	struct ps_device *dev = hid_get_drvdata(hdev);
 
 	ps_devices_list_remove(dev);
+	ps_device_release_player_id(dev);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
@@ -1336,7 +1392,19 @@ static struct hid_driver ps_driver = {
 	.raw_event        = ps_raw_event,
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
2.26.2

