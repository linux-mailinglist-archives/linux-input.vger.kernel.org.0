Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F07431DE50
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234444AbhBQRfB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:35:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40974 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234513AbhBQRdk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sDTOgUIEuEM7FQrqTpcMCOXLpfzqhPkgfJcNxhVfhqQ=;
        b=CCRstXCoIwEzQeWTUUbe+phSmvYsw18k3AYLog6bg0VlZnF8BiD16tpe6oJN4GRNz3io96
        M/iecA3G43PIJrVW56q6xiA57pCTGXZj5zCZz1YambNoYULU7Ggh70LiXPdzDYAHoywARF
        /CSKgozvCLCzQ+uuMbdbVJtJVi2KEvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-S1I1SHYVMda519shZ8CrPQ-1; Wed, 17 Feb 2021 12:32:12 -0500
X-MC-Unique: S1I1SHYVMda519shZ8CrPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A646A192CC40;
        Wed, 17 Feb 2021 17:32:10 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0196F60C61;
        Wed, 17 Feb 2021 17:32:08 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 03/11] Revert "HID: playstation: DualSense set LEDs to default player id."
Date:   Wed, 17 Feb 2021 18:31:50 +0100
Message-Id: <20210217173158.3122868-4-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

This reverts commit 05afe02ac24f ("HID: playstation: DualSense
set LEDs to default player id.")

There is currently an ongoing discussion on linux-leds LKML,
and so to give us more room, we need to revert those related
patches from linux-next.

This is not a big deal, they are still not pushed to Linus.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-playstation.c | 70 +----------------------------------
 1 file changed, 1 insertion(+), 69 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 973c1fe61e8a..2d96785c397d 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -9,7 +9,6 @@
 #include <linux/crc32.h>
 #include <linux/device.h>
 #include <linux/hid.h>
-#include <linux/idr.h>
 #include <linux/input/mt.h>
 #include <linux/leds.h>
 #include <linux/led-class-multicolor.h>
@@ -23,8 +22,6 @@
 static DEFINE_MUTEX(ps_devices_lock);
 static LIST_HEAD(ps_devices_list);
 
-static DEFINE_IDA(ps_player_id_allocator);
-
 #define HID_PLAYSTATION_VERSION_PATCH 0x8000
 
 /* Base class for playstation devices. */
@@ -33,8 +30,6 @@ struct ps_device {
 	struct hid_device *hdev;
 	spinlock_t lock;
 
-	uint32_t player_id;
-
 	struct power_supply_desc battery_desc;
 	struct power_supply *battery;
 	uint8_t battery_capacity;
@@ -326,24 +321,6 @@ static int ps_devices_list_remove(struct ps_device *dev)
 	return 0;
 }
 
-static int ps_device_set_player_id(struct ps_device *dev)
-{
-	int ret = ida_alloc(&ps_player_id_allocator, GFP_KERNEL);
-
-	if (ret < 0)
-		return ret;
-
-	dev->player_id = ret;
-	return 0;
-}
-
-static void ps_device_release_player_id(struct ps_device *dev)
-{
-	ida_free(&ps_player_id_allocator, dev->player_id);
-
-	dev->player_id = U32_MAX;
-}
-
 static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const char *name_suffix)
 {
 	struct input_dev *input_dev;
@@ -1179,29 +1156,6 @@ static int dualsense_reset_leds(struct dualsense *ds)
 	return 0;
 }
 
-static void dualsense_set_player_leds(struct dualsense *ds)
-{
-	/*
-	 * The DualSense controller has a row of 5 LEDs used for player ids.
-	 * Behavior on the PlayStation 5 console is to center the player id
-	 * across the LEDs, so e.g. player 1 would be "--x--" with x being 'on'.
-	 * Follow a similar mapping here.
-	 */
-	static const int player_ids[5] = {
-		BIT(2),
-		BIT(3) | BIT(1),
-		BIT(4) | BIT(2) | BIT(0),
-		BIT(4) | BIT(3) | BIT(1) | BIT(0),
-		BIT(4) | BIT(3) | BIT(2) | BIT(1) | BIT(0)
-	};
-
-	uint8_t player_id = ds->base.player_id % ARRAY_SIZE(player_ids);
-
-	ds->update_player_leds = true;
-	ds->player_leds_state = player_ids[player_id];
-	schedule_work(&ds->output_worker);
-}
-
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
@@ -1310,15 +1264,6 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 			goto err;
 	}
 
-	ret = ps_device_set_player_id(ps_dev);
-	if (ret) {
-		hid_err(hdev, "Failed to assign player id for DualSense: %d\n", ret);
-		goto err;
-	}
-
-	/* Set player LEDs to our player id. */
-	dualsense_set_player_leds(ds);
-
 	return &ds->base;
 
 err:
@@ -1383,7 +1328,6 @@ static void ps_remove(struct hid_device *hdev)
 	struct ps_device *dev = hid_get_drvdata(hdev);
 
 	ps_devices_list_remove(dev);
-	ps_device_release_player_id(dev);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
@@ -1404,19 +1348,7 @@ static struct hid_driver ps_driver = {
 	.raw_event	= ps_raw_event,
 };
 
-static int __init ps_init(void)
-{
-	return hid_register_driver(&ps_driver);
-}
-
-static void __exit ps_exit(void)
-{
-	hid_unregister_driver(&ps_driver);
-	ida_destroy(&ps_player_id_allocator);
-}
-
-module_init(ps_init);
-module_exit(ps_exit);
+module_hid_driver(ps_driver);
 
 MODULE_AUTHOR("Sony Interactive Entertainment");
 MODULE_DESCRIPTION("HID Driver for PlayStation peripherals.");
-- 
2.29.2

