Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5FA2F9660
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbhAQXrf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730881AbhAQXpv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:45:51 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D17C061798
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:57 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id o20so745779pfu.0
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eeNdsC6xC2dyhL82KUjoa92etHuC6rpYgDrQTr5nLkY=;
        b=sxZsTM4bDMd/60vwETVrvq/2b532PmmkAcyzEBkNPkHLHbYjtFTP01idTdN/wzhtZs
         Ae/SNDL+gUcqcfbxGOilaeHWtvhnXzJd2MqGJ3LnScnUH4uwWoev6uj9Xh57zSuSjpxj
         lnKczq0d7fKsFF7fS+9ZBrGoHx9oZiUSOBdzqu3D+EJKH9Kw7O5B7I2XquzZdsQBhp14
         jPdN8AJ+EulCEvauIQ2/yCHn5IaUsBX93q/PZDhX4akVFDgSLUvwpbVTBB5t6uIgZ7L8
         wTiX2BwDKu+kUwq/2FQnCicHmjgKWd+tKI60Kh8g4PRVd9UmZomH571G7q5uOVAg/sND
         0PuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eeNdsC6xC2dyhL82KUjoa92etHuC6rpYgDrQTr5nLkY=;
        b=oRdV0/PXvmhTfOn3Xkhq92onCTxy8kOXYRnONxhoQRYK+laHWMCMooyWlAVp9jpOXH
         hhQTdA57gjD9Jfa6NC9ZsPDyMriYOB2j6Q2eou5ZRVR1R+rlot7xvoOPRiDlNdE2neeM
         QU1FVKgZ4DV5WjgFjdHvTrvkQ3Y2BPYl6P69+dE+nZqYUptK7mSJd9W/lkIRGGFi9WWp
         qFmA5gt5uokKulh9q06JyshH62Tm+b4XxjgwxLLSbtXb3C1pmL0woqXJtVhlCGOVx14m
         xT61PunLKixwpW6/UTQMEK2xAeaf6jUHqEdF3Y+RAezOBlDMulSJ/6i6nbzaX+u45fpH
         QGWg==
X-Gm-Message-State: AOAM5327Q3PtGmn7hP4/Rbas0ZXZeQyV7DnMBV5an0mskgsRcMO55G9S
        IqQsEYvmaYhjouq/AqyTwaFMojWKKmAQ1g==
X-Google-Smtp-Source: ABdhPJyV0fmuQynYa3WteayASjv/8Gj5yFzq8UfZDOmxZGvZjMJrAxStGwGYKNAVo8MxghOICAoneQ==
X-Received: by 2002:a65:6116:: with SMTP id z22mr23810215pgu.264.1610927096997;
        Sun, 17 Jan 2021 15:44:56 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id i2sm14721568pjd.21.2021.01.17.15.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:44:56 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v4 12/13] HID: playstation: DualSense set LEDs to default player id.
Date:   Sun, 17 Jan 2021 15:44:34 -0800
Message-Id: <20210117234435.180294-13-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117234435.180294-1-roderick@gaikai.com>
References: <20210117234435.180294-1-roderick@gaikai.com>
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

