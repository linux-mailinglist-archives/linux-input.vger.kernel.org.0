Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B301E31B3B3
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 01:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBOAr0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Feb 2021 19:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhBOArX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Feb 2021 19:47:23 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD23DC061794
        for <linux-input@vger.kernel.org>; Sun, 14 Feb 2021 16:46:05 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id a4so1719988pgc.11
        for <linux-input@vger.kernel.org>; Sun, 14 Feb 2021 16:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MmcKsFVK0P14KymYonH17v2gPDioHATwv8SN0tz8rmc=;
        b=cVcbqVVvD4DqfnA59AUDkEhTIKLYdXgiIdzbhceBJvPndK2kamGJx+lA13eT8f1CSs
         EpWQ//I6r0ksHlX+vdfPM73Xp0L4p9ANI6UaygqTbArVEB+EUokzUC91SwxC8Drsipj6
         v9UEAW04tTOiEAP1TtJayq9CfXB7uwXmuxMWRjiK06pZe1mbkigboAOOdyEgkNh8uJlC
         Y3TGzSDryAtxm5Po29T8Eu+qYtuIpSHzZVy9Txsv4lkiE1v8CVJ/pyD2oNivTYiN6LJg
         Dv+k8OlDMh8cLXSBY82JUInq7S4+dlFnErBzfXFc4OnQ6YAYABMlBzcDuByZepJGCJ5o
         pFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MmcKsFVK0P14KymYonH17v2gPDioHATwv8SN0tz8rmc=;
        b=hDdNb3zDeB2jA9flSBcULgVgcs12rqUl2JW0fn4tjOimU6N/QVeoMJsOwghUNXuoua
         d3s0PEiZHAClaAtRSvyDYgInmyUBFkcbr5Bcg4RN30VRrsDYfOnPuD89BnRd8iFOsn2Y
         ILFsOmjUD87q3vN6mb4Qs6ilBx9Pxf/kXRdXsEr2CFkJ0oAdW7/k1oT4EBL4PMeVWgB8
         /ejmfuodJCYOgojgX5khFfeepRPUith/3y0voCPPtAWSrZTq3XjxJeI9bHRgstkVyr+S
         +PxwIVGPsVOJk3tZGgYt+/j4H+hfWcS7DB0R1wms5wP5SYXH/3t+B3Qmaylu2knS5I1A
         RRgg==
X-Gm-Message-State: AOAM533FTSroqz8xiogIgQNt/F1Sm9MGLLMeUn5FIPf4d7gKfFdcZYzf
        Bmn2r+WQp0205vhpl0XZjrdSTJAeHx/f2A==
X-Google-Smtp-Source: ABdhPJyIjYxN1CDJvwX5KSp1VQ+ENKtJmzlhRCQJjlhuuvtw2QnWcQWbetk7hWemw5l4IOQHe61sjw==
X-Received: by 2002:a63:ac19:: with SMTP id v25mr12942086pge.258.1613349965171;
        Sun, 14 Feb 2021 16:46:05 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id q188sm16127746pfb.8.2021.02.14.16.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 16:46:04 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        dmitry.torokhov@gmail.com, pobm@protonmail.com
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 4/4] HID: playstation: DualSense set LEDs to default player id.
Date:   Sun, 14 Feb 2021 16:45:49 -0800
Message-Id: <20210215004549.135251-5-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215004549.135251-1-roderick@gaikai.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 70 ++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 2d96785c397d..973c1fe61e8a 100644
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
@@ -1156,6 +1179,29 @@ static int dualsense_reset_leds(struct dualsense *ds)
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
@@ -1264,6 +1310,15 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
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
@@ -1328,6 +1383,7 @@ static void ps_remove(struct hid_device *hdev)
 	struct ps_device *dev = hid_get_drvdata(hdev);
 
 	ps_devices_list_remove(dev);
+	ps_device_release_player_id(dev);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
@@ -1348,7 +1404,19 @@ static struct hid_driver ps_driver = {
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
2.26.2

