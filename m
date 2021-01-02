Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DD52E8908
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbhABWc6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbhABWc5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:57 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20C7C0617A3
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:45 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id q22so14055886pfk.12
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gi8/CTgZPDKxehMytPWFsv0BOGBiUCMPMGE5dEqXWvE=;
        b=D825KqDvNN/gLmhKa2r7wrYb2ACP044Uvr+Tlg55N7Xy6AYfYB6IZTzpXrzkxaiMZW
         csAkk5lWUFw7lmHPe1zuwz/fGGT6gNHnkOpX86M5I5jO90I5e7c2nXz9McVQrJGU7aaJ
         E1cXY16p9ljl98DhkCVwwkpZrSdko/7Y7Mlluyzif8YspOP9G36gqJNlmVCGE0hH7nZl
         UOO6ypgSLmq1SYJY4mH20223iZwvWOQVMWxyQFPQLS1JXDk2mKnc6TXaT167O4R6RhLo
         ipn+/pCfrEYeVzXxC3ob7FWPut+dJZClLRPDQPtrkDvNJ/m9ub/mclO2tBQU/8/7ijTG
         zJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gi8/CTgZPDKxehMytPWFsv0BOGBiUCMPMGE5dEqXWvE=;
        b=XrzXibdn2ZCorGPHmAV2dRRuKxnK0EJgkCvnfO1wgCZ0Nq9WfcE0lsZmAloRtiXZih
         OueCAVIdLJxsYy4+KZ8G3C/sRLOMTYfk6aalVjJeF98/3EO51hoezsjIWq1oQRGyXAm/
         JsDoiGXx5fZnXdXXFGP0ivml4XHzmELFmns61DjQ5DW8mLCQRyRdjYlODhD0SiR412Q6
         KQTMTO2kn15mr8PrLGHkfW5+siaTjma8lAxHXZ5wiBBbIwVX4hBvOSX2+gQt8qcRAzla
         nJbmyxuDt5SgWEXKY8Z0H5jwJKibZVPzlY/oibS78kfYpGZNqGKIQoD1LL6dGJ67LX1w
         h/bg==
X-Gm-Message-State: AOAM5302OUsaKyFnIDYRh4ZHfLCmnlJBfr14DQk2QYxdO8DueEqUvKyH
        azQ5KcIK9XLnrsQKfYkbG350nw==
X-Google-Smtp-Source: ABdhPJxQedOBaIjQPqkSpZbES1nbqfmUpbZptTGbOo6A1w/ktOQm4HqZPeUfEob54Uyw/QfEunGPEA==
X-Received: by 2002:aa7:9619:0:b029:1ae:33b2:780f with SMTP id q25-20020aa796190000b02901ae33b2780fmr4968463pfg.26.1609626705272;
        Sat, 02 Jan 2021 14:31:45 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:44 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 12/13] HID: playstation: DualSense set LEDs to default player id.
Date:   Sat,  2 Jan 2021 14:31:08 -0800
Message-Id: <20210102223109.996781-13-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 69 ++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 183f011f081b..1a95c81da8a3 100644
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
@@ -299,6 +304,24 @@ static int ps_devices_list_remove(struct ps_device *dev)
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
+	dev->player_id = -1;
+}
+
 static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const char *name_suffix)
 {
 	struct input_dev *input_dev;
@@ -1102,6 +1125,28 @@ static int dualsense_reset_leds(struct dualsense *ds)
 	return 0;
 }
 
+static void dualsense_set_player_leds(struct dualsense *ds)
+{
+	/* The DualSense controller has a row of 5 LEDs used for player ids.
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
+	uint8_t player_id = ds->base.player_id % 5;
+
+	ds->update_player_leds = true;
+	ds->player_leds_state = player_ids[player_id];
+	schedule_work(&ds->output_worker);
+}
+
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
@@ -1207,6 +1252,15 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 			goto err;
 	}
 
+	ret = ps_device_set_player_id(ps_dev);
+	if (ret < 0) {
+		hid_err(hdev, "Failed to assign player id for DualSense\n");
+		goto err;
+	}
+
+	/* Set player LEDs to our player id. */
+	dualsense_set_player_leds(ds);
+
 	return &ds->base;
 
 err:
@@ -1271,6 +1325,7 @@ static void ps_remove(struct hid_device *hdev)
 	struct ps_device *dev = hid_get_drvdata(hdev);
 
 	ps_devices_list_remove(dev);
+	ps_device_release_player_id(dev);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
@@ -1291,7 +1346,19 @@ static struct hid_driver ps_driver = {
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

