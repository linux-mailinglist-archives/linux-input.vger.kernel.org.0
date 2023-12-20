Return-Path: <linux-input+bounces-890-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B8819737
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 04:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2883B246FF
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 03:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860B98F45;
	Wed, 20 Dec 2023 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="ITv4uo7u"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114E78C02
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 03:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 0341EA26C;
	Tue, 19 Dec 2023 19:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1703043530; bh=JulwiXNYhSEXOn2RaM3vPCuIKxVKkWxTmLm5LSiCvGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ITv4uo7uk+TbESQ0eOQBTde59cACqWZ+aFg5RMkJ5atLSQ/FOTdiDxLLyCJLo7VNv
	 c+Fo4r7Xf+zrE2bWV3ZS0IVsjsifPxq7yGkALjFgrsKTnSk1wQzqeFWpSM/eDu7vLt
	 osFX18XW7sWSQS4KHZBL1TE1xh8Ds5h7CiBdjFUtNpE1pm+XHa8wbzOxNaEX9QclWP
	 CxoxWWuDRhtMtuZnO5N0mng+F+ULqgrkE+u5NvMgjRgvefLjN69S1Rp+xvYT4xRORC
	 VAUp8i0jsXXNwqoRDVF0MCREK0U/qc8JTj7xGKyh8RrEB+sY2WCMlyD+ajq5t8JKKK
	 qPUNAwVCRXydA==
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/7] HID: hid-steam: Disable watchdog instead of using a heartbeat
Date: Tue, 19 Dec 2023 19:38:32 -0800
Message-ID: <20231220033837.2135194-2-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220033837.2135194-1-vi@endrift.com>
References: <20231220033609.2132033-1-vi@endrift.com>
 <20231220033837.2135194-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Steam Deck has a setting that controls whether or not the watchdog is
enabled, so instead of using a heartbeat to keep the watchdog from triggering,
this commit changes the behavior to simply disable the watchdog instead.
---
 drivers/hid/hid-steam.c | 30 ++----------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 7aefd52e945a..efd297e0ea8c 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -101,6 +101,7 @@ static LIST_HEAD(steam_devices);
 #define STEAM_REG_GYRO_MODE		0x30
 #define STEAM_REG_LPAD_CLICK_PRESSURE	0x34
 #define STEAM_REG_RPAD_CLICK_PRESSURE	0x35
+#define STEAM_REG_WATCHDOG_ENABLE		0x47
 
 /* Raw event identifiers */
 #define STEAM_EV_INPUT_DATA		0x01
@@ -134,7 +135,6 @@ struct steam_device {
 	struct power_supply __rcu *battery;
 	u8 battery_charge;
 	u16 voltage;
-	struct delayed_work heartbeat;
 	struct work_struct rumble_work;
 	u16 rumble_left;
 	u16 rumble_right;
@@ -340,8 +340,6 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 		steam_send_report_byte(steam, STEAM_CMD_DEFAULT_MAPPINGS);
 		/* enable mouse */
 		steam_send_report_byte(steam, STEAM_CMD_DEFAULT_MOUSE);
-
-		cancel_delayed_work_sync(&steam->heartbeat);
 	} else {
 		/* disable esc, enter, cursor */
 		steam_send_report_byte(steam, STEAM_CMD_CLEAR_MAPPINGS);
@@ -352,13 +350,8 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 				STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
 				STEAM_REG_LPAD_CLICK_PRESSURE, 0xFFFF, /* disable clicky pad */
 				STEAM_REG_RPAD_CLICK_PRESSURE, 0xFFFF, /* disable clicky pad */
+				STEAM_REG_WATCHDOG_ENABLE, 0, /* disable watchdog that tests if Steam is active */
 				0);
-			/*
-			 * The Steam Deck has a watchdog that automatically enables
-			 * lizard mode if it doesn't see any traffic for too long
-			 */
-			if (!work_busy(&steam->heartbeat.work))
-				schedule_delayed_work(&steam->heartbeat, 5 * HZ);
 		} else {
 			steam_write_registers(steam,
 				STEAM_REG_LPAD_MODE, 0x07, /* disable mouse */
@@ -733,22 +726,6 @@ static bool steam_is_valve_interface(struct hid_device *hdev)
 	return !list_empty(&rep_enum->report_list);
 }
 
-static void steam_lizard_mode_heartbeat(struct work_struct *work)
-{
-	struct steam_device *steam = container_of(work, struct steam_device,
-							heartbeat.work);
-
-	mutex_lock(&steam->mutex);
-	if (!steam->client_opened && steam->client_hdev) {
-		steam_send_report_byte(steam, STEAM_CMD_CLEAR_MAPPINGS);
-		steam_write_registers(steam,
-			STEAM_REG_RPAD_MODE, 0x07, /* disable mouse */
-			0);
-		schedule_delayed_work(&steam->heartbeat, 5 * HZ);
-	}
-	mutex_unlock(&steam->mutex);
-}
-
 static int steam_client_ll_parse(struct hid_device *hdev)
 {
 	struct steam_device *steam = hdev->driver_data;
@@ -887,7 +864,6 @@ static int steam_probe(struct hid_device *hdev,
 	steam->quirks = id->driver_data;
 	INIT_WORK(&steam->work_connect, steam_work_connect_cb);
 	INIT_LIST_HEAD(&steam->list);
-	INIT_DEFERRABLE_WORK(&steam->heartbeat, steam_lizard_mode_heartbeat);
 	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
 
 	steam->client_hdev = steam_create_client_hid(hdev);
@@ -944,7 +920,6 @@ static int steam_probe(struct hid_device *hdev,
 	hid_destroy_device(steam->client_hdev);
 client_hdev_fail:
 	cancel_work_sync(&steam->work_connect);
-	cancel_delayed_work_sync(&steam->heartbeat);
 	cancel_work_sync(&steam->rumble_work);
 steam_alloc_fail:
 	hid_err(hdev, "%s: failed with error %d\n",
@@ -965,7 +940,6 @@ static void steam_remove(struct hid_device *hdev)
 	mutex_lock(&steam->mutex);
 	steam->client_hdev = NULL;
 	steam->client_opened = false;
-	cancel_delayed_work_sync(&steam->heartbeat);
 	mutex_unlock(&steam->mutex);
 	cancel_work_sync(&steam->work_connect);
 	if (steam->quirks & STEAM_QUIRK_WIRELESS) {
-- 
2.42.0


