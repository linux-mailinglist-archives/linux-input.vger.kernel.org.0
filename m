Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723D9307C7F
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhA1Rab (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbhA1R2R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:28:17 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E727C061354
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:19 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id i7so4711311pgc.8
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eeNdsC6xC2dyhL82KUjoa92etHuC6rpYgDrQTr5nLkY=;
        b=sL3ApqwPmCeFcdX6VtPDjDTAQqgOGykEUTqSccAVzppPJesQ6fhs2yI+uEXiXV0ieP
         VXjBOLL/yb4j8Je6dNYu1ZOYUCjHc2mL07O1DI8Lwiv4Aj8XUNfg95LvTNCSZEd+Wlza
         4Jh/lj7gLyGd2Fo/KKKSJtPGhSuGipda9vmr4UG5q5y5oluPpRkEAj5fTG2Qd1zOZ8Rg
         5lsVaXoPSzNjuZ2ivGmb75Gy/6u6Q6yNpJvKQmy+3shXrPuspDKWzFbC0T2vVYQGMTzi
         nW4v0xCZG9DMNIShHMRcsSNyoVc3QNvBDu1mMY4VSj8MhO5pP1Fs3eLNx3xoxIrTALlr
         ru1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eeNdsC6xC2dyhL82KUjoa92etHuC6rpYgDrQTr5nLkY=;
        b=qBj/FyUPbwWRMGNFr4A8Butgh8/bMg3ngt7dOENKiU0VHWAAJViC03XvyYbqyxX6gB
         lWxsNOINfbWUrPTJjqzDKMRNzPDPqEpDDyhrIMHtA3UtCxkG+6WiRYHHFAePeiBPde9W
         X8gb8C4oV5ZZ/9aQccDsxxPTFQ/SVELVEfEMN46Ooo7aDlGJ5RyS+0PORk1HsiefAibi
         PsmXdmsTZpsqZB5WPRTpq0s6mARdIh3jMMgnGbIG2Z8JlvWB3rbbpr/e4mba1mmG0DQN
         nAbs5EkGHwfZ/mr8CCIhFg4D2E0buaqy964zTzT3OOvu0vS5YHo1W8zw/D/cfHWAnWmz
         2kbw==
X-Gm-Message-State: AOAM533urChCO6WILXgHrXCdnQ4822h6BT5UVSoZYJPnal7qgP8JsKbM
        mgyp/MEzq9Vcf+6DOohW1LDlSw==
X-Google-Smtp-Source: ABdhPJw6gLh1bTG08cIlcDArV9gj5qoVTVm40ryyYBOwyDo+U3hgDXswK03XXjFIoFrs5xi8WTzbzw==
X-Received: by 2002:a63:704c:: with SMTP id a12mr531200pgn.360.1611854838782;
        Thu, 28 Jan 2021 09:27:18 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:18 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 12/13] HID: playstation: DualSense set LEDs to default player id.
Date:   Thu, 28 Jan 2021 09:26:56 -0800
Message-Id: <20210128172657.24516-13-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
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
index 966d1a5aee18..8d827d78fa65 100644
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

