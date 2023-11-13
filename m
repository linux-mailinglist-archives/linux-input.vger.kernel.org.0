Return-Path: <linux-input+bounces-30-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0A7E96FC
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 08:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CD411F2104F
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 07:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C08156D9;
	Mon, 13 Nov 2023 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0NvnCW1"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E0156CE
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 07:13:18 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACB010F7
	for <linux-input@vger.kernel.org>; Sun, 12 Nov 2023 23:13:13 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6bf20d466cdso721361b3a.1
        for <linux-input@vger.kernel.org>; Sun, 12 Nov 2023 23:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699859592; x=1700464392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vE6h+38umjFa00bwsDKimYy/SPxQVJEqZUge8fXpZpY=;
        b=E0NvnCW1TqaYBT6CtkpT+hDxyui7K+ezQeMQDFw1Pt16PBET/ySsVPRxXLbpY0mBUO
         1Xoo4y2JoEWf4TjYLO8muikQqYsKALb4p6UrMP+wFNU+xWvFnuBkCsVvwE8AQAxKue0k
         2Lj4S2zz5ycwYJiqFDoLis8djbXosDiV9aMT+700vpsexr43nXtVZzJgfX7QIXR/oqqI
         puvW9J+HjoSQxJAED2tay6WZjlogAKUAKpl4KgNi9NGub2MidjLXlrvZ3GxSJcb5bc7p
         jYjaNIz3BSrPCJ/00xr+MPVwx0Dk2JGSYr+9mOjP9R0AJWAY9FhWmlVXmfDM3azDQGsF
         qL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699859592; x=1700464392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vE6h+38umjFa00bwsDKimYy/SPxQVJEqZUge8fXpZpY=;
        b=SCutFy9Qx+B6epdnvP8i0Ra3snMcRh2x4Vb48wMm+3rY9hXPdaO1Ydia/BAOH0BDHU
         bypNjnAolXMKN85iNEGbm+I+gsx27XWnILWcvXkX+QROEzcPR9XQ1avXz35Y2GSa8oET
         +HbjLXotXq6ch6+k5zw/4leTpSu2WJzRa3VtD4pHFzpRpwtNGI0HUxHScdnvvrkMFu4N
         I1Kv+mWSFQIpnIC+747MqHi/LZZciKLvdNR9XKM/ugWE9pUNPJCXtf3NOIkOi3k9iH1w
         70HoUlA50IlmZXk806bUi9MR/bUCQOa9Dz/dXPdjtgXDzGUUkUW3ifgsmUL+bijaNay6
         pX8g==
X-Gm-Message-State: AOJu0Yy1jZMoc7xnDnHsurTrii+y0vmPSqHUK+cZDPKm4P0MiPik6kPb
	XBklcZw2pyfcIdj1wUiyk+Z5BZcu146559o1
X-Google-Smtp-Source: AGHT+IHvcV1w1zSPmRqnCm7fEQ6AoO4nxAMcouTi9GDb1hSHfLXsybJig+WuXqKt4iqsiA+0m+p39Q==
X-Received: by 2002:a05:6a21:33a0:b0:16c:b514:a4bc with SMTP id yy32-20020a056a2133a000b0016cb514a4bcmr8692747pzb.4.1699859592363;
        Sun, 12 Nov 2023 23:13:12 -0800 (PST)
Received: from Holt.. (219.117.252.242.static.zoot.jp. [219.117.252.242])
        by smtp.gmail.com with ESMTPSA id e13-20020a056a001a8d00b006b8ffc49ba5sm3293219pfv.38.2023.11.12.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:13:12 -0800 (PST)
From: Tatsunosuke <tatsunosuke.wacom@gmail.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <Jason.Gerecke@wacom.com>,
	Aaron Skomra <aaron.skomra@wacom.com>,
	Josh Dickens <joshua.dickens@wacom.com>
Subject: [PATCH] HID: wacom: Remove AES power_supply after extended inactivity
Date: Mon, 13 Nov 2023 16:12:57 +0900
Message-Id: <20231113071257.13369-1-tatsunosuke.wacom@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>

Even if a user does not use their AES pen for an extended period,
the battery power supply attributes continue to exist.
This results in the desktop showing battery status for a pen
that is no longer in use and which may in fact be in a different
state (e.g. the user may be charging the pen).
To avoid confusion and ensure userspace has an accurate view
of the battery state, this patch automatically removes
the power_supply after 30 minutes of inactivity.

Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Reviewed-by: Jason Gerecke <Jason.Gerecke@wacom.com>
Reviewed-by: Aaron Skomra <aaron.skomra@wacom.com>
Reviewed-by: Josh Dickens <joshua.dickens@wacom.com>
---
 drivers/hid/wacom.h     |  2 ++
 drivers/hid/wacom_sys.c | 52 ++++++++++++++++++++++++++++++-----------
 drivers/hid/wacom_wac.c | 19 +++++++++++----
 drivers/hid/wacom_wac.h |  5 ++--
 4 files changed, 58 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/wacom.h b/drivers/hid/wacom.h
index 4da50e19808e..77c5fb26cd14 100644
--- a/drivers/hid/wacom.h
+++ b/drivers/hid/wacom.h
@@ -150,6 +150,7 @@ struct wacom_remote {
 		struct input_dev *input;
 		bool registered;
 		struct wacom_battery battery;
+		ktime_t active_time;
 	} remotes[WACOM_MAX_REMOTES];
 };
 
@@ -163,6 +164,7 @@ struct wacom {
 	struct work_struct battery_work;
 	struct work_struct remote_work;
 	struct delayed_work init_work;
+	struct delayed_work aes_battery_work;
 	struct wacom_remote *remote;
 	struct work_struct mode_change_work;
 	struct timer_list idleprox_timer;
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 76e5353aca0c..b613f11ed949 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1813,6 +1813,13 @@ static void wacom_destroy_battery(struct wacom *wacom)
 	}
 }
 
+static void wacom_aes_battery_handler(struct work_struct *work)
+{
+	struct wacom *wacom = container_of(work, struct wacom, aes_battery_work.work);
+
+	wacom_destroy_battery(wacom);
+}
+
 static ssize_t wacom_show_speed(struct device *dev,
 				struct device_attribute
 				*attr, char *buf)
@@ -1997,7 +2004,7 @@ static int wacom_initialize_remotes(struct wacom *wacom)
 	spin_lock_init(&remote->remote_lock);
 
 	error = kfifo_alloc(&remote->remote_fifo,
-			5 * sizeof(struct wacom_remote_data),
+			5 * sizeof(struct wacom_remote_work_data),
 			GFP_KERNEL);
 	if (error) {
 		hid_err(wacom->hdev, "failed allocating remote_fifo\n");
@@ -2523,6 +2530,18 @@ static void wacom_wireless_work(struct work_struct *work)
 	return;
 }
 
+static void wacom_remote_destroy_battery(struct wacom *wacom, int index)
+{
+	struct wacom_remote *remote = wacom->remote;
+
+	if (remote->remotes[index].battery.battery) {
+		devres_release_group(&wacom->hdev->dev,
+				     &remote->remotes[index].battery.bat_desc);
+		remote->remotes[index].battery.battery = NULL;
+		remote->remotes[index].active_time = 0;
+	}
+}
+
 static void wacom_remote_destroy_one(struct wacom *wacom, unsigned int index)
 {
 	struct wacom_remote *remote = wacom->remote;
@@ -2537,9 +2556,7 @@ static void wacom_remote_destroy_one(struct wacom *wacom, unsigned int index)
 			remote->remotes[i].registered = false;
 			spin_unlock_irqrestore(&remote->remote_lock, flags);
 
-			if (remote->remotes[i].battery.battery)
-				devres_release_group(&wacom->hdev->dev,
-						     &remote->remotes[i].battery.bat_desc);
+			wacom_remote_destroy_battery(wacom, i);
 
 			if (remote->remotes[i].group.name)
 				devres_release_group(&wacom->hdev->dev,
@@ -2547,7 +2564,6 @@ static void wacom_remote_destroy_one(struct wacom *wacom, unsigned int index)
 
 			remote->remotes[i].serial = 0;
 			remote->remotes[i].group.name = NULL;
-			remote->remotes[i].battery.battery = NULL;
 			wacom->led.groups[i].select = WACOM_STATUS_UNKNOWN;
 		}
 	}
@@ -2632,6 +2648,9 @@ static int wacom_remote_attach_battery(struct wacom *wacom, int index)
 	if (remote->remotes[index].battery.battery)
 		return 0;
 
+	if (!remote->remotes[index].active_time)
+		return 0;
+
 	if (wacom->led.groups[index].select == WACOM_STATUS_UNKNOWN)
 		return 0;
 
@@ -2647,17 +2666,19 @@ static void wacom_remote_work(struct work_struct *work)
 {
 	struct wacom *wacom = container_of(work, struct wacom, remote_work);
 	struct wacom_remote *remote = wacom->remote;
-	struct wacom_remote_data data;
+	ktime_t kt = ktime_get();
+	struct wacom_remote_work_data remote_work_data;
 	unsigned long flags;
 	unsigned int count;
-	u32 serial;
+	u32 work_serial;
 	int i;
 
 	spin_lock_irqsave(&remote->remote_lock, flags);
 
-	count = kfifo_out(&remote->remote_fifo, &data, sizeof(data));
+	count = kfifo_out(&remote->remote_fifo, &remote_work_data,
+			  sizeof(remote_work_data));
 
-	if (count != sizeof(data)) {
+	if (count != sizeof(remote_work_data)) {
 		hid_err(wacom->hdev,
 			"workitem triggered without status available\n");
 		spin_unlock_irqrestore(&remote->remote_lock, flags);
@@ -2670,10 +2691,14 @@ static void wacom_remote_work(struct work_struct *work)
 	spin_unlock_irqrestore(&remote->remote_lock, flags);
 
 	for (i = 0; i < WACOM_MAX_REMOTES; i++) {
-		serial = data.remote[i].serial;
-		if (data.remote[i].connected) {
+		work_serial = remote_work_data.remote[i].serial;
+		if (work_serial) {
+
+			if (kt - remote->remotes[i].active_time > WACOM_REMOTE_BATTERY_TIMEOUT
+			    && remote->remotes[i].active_time != 0)
+				wacom_remote_destroy_battery(wacom, i);
 
-			if (remote->remotes[i].serial == serial) {
+			if (remote->remotes[i].serial == work_serial) {
 				wacom_remote_attach_battery(wacom, i);
 				continue;
 			}
@@ -2681,7 +2706,7 @@ static void wacom_remote_work(struct work_struct *work)
 			if (remote->remotes[i].serial)
 				wacom_remote_destroy_one(wacom, i);
 
-			wacom_remote_create_one(wacom, serial, i);
+			wacom_remote_create_one(wacom, work_serial, i);
 
 		} else if (remote->remotes[i].serial) {
 			wacom_remote_destroy_one(wacom, i);
@@ -2776,6 +2801,7 @@ static int wacom_probe(struct hid_device *hdev,
 
 	mutex_init(&wacom->lock);
 	INIT_DELAYED_WORK(&wacom->init_work, wacom_init_work);
+	INIT_DELAYED_WORK(&wacom->aes_battery_work, wacom_aes_battery_handler);
 	INIT_WORK(&wacom->wireless_work, wacom_wireless_work);
 	INIT_WORK(&wacom->battery_work, wacom_battery_work);
 	INIT_WORK(&wacom->remote_work, wacom_remote_work);
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 174bf03908d7..c205198ded11 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1134,6 +1134,7 @@ static int wacom_remote_irq(struct wacom_wac *wacom_wac, size_t len)
 	if (index < 0 || !remote->remotes[index].registered)
 		goto out;
 
+	remote->remotes[i].active_time = ktime_get();
 	input = remote->remotes[index].input;
 
 	input_report_key(input, BTN_0, (data[9] & 0x01));
@@ -1196,22 +1197,20 @@ static void wacom_remote_status_irq(struct wacom_wac *wacom_wac, size_t len)
 	struct wacom *wacom = container_of(wacom_wac, struct wacom, wacom_wac);
 	unsigned char *data = wacom_wac->data;
 	struct wacom_remote *remote = wacom->remote;
-	struct wacom_remote_data remote_data;
+	struct wacom_remote_work_data remote_data;
 	unsigned long flags;
 	int i, ret;
 
 	if (data[0] != WACOM_REPORT_DEVICE_LIST)
 		return;
 
-	memset(&remote_data, 0, sizeof(struct wacom_remote_data));
+	memset(&remote_data, 0, sizeof(struct wacom_remote_work_data));
 
 	for (i = 0; i < WACOM_MAX_REMOTES; i++) {
 		int j = i * 6;
 		int serial = (data[j+6] << 16) + (data[j+5] << 8) + data[j+4];
-		bool connected = data[j+2];
 
 		remote_data.remote[i].serial = serial;
-		remote_data.remote[i].connected = connected;
 	}
 
 	spin_lock_irqsave(&remote->remote_lock, flags);
@@ -2529,11 +2528,12 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 	struct input_dev *input = wacom_wac->pen_input;
 	bool range = wacom_wac->hid_data.inrange_state;
 	bool sense = wacom_wac->hid_data.sense_state;
+	bool entering_range = !wacom_wac->tool[0] && range;
 
 	if (wacom_wac->is_invalid_bt_frame)
 		return;
 
-	if (!wacom_wac->tool[0] && range) { /* first in range */
+	if (entering_range) { /* first in range */
 		/* Going into range select tool */
 		if (wacom_wac->hid_data.invert_state)
 			wacom_wac->tool[0] = BTN_TOOL_RUBBER;
@@ -2584,6 +2584,15 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 		input_sync(input);
 	}
 
+	/* Handle AES battery timeout behavior */
+	if (wacom_wac->features.quirks & WACOM_QUIRK_AESPEN) {
+		if (entering_range)
+			cancel_delayed_work(&wacom->aes_battery_work);
+		if (!sense)
+			schedule_delayed_work(&wacom->aes_battery_work,
+					      msecs_to_jiffies(WACOM_AES_BATTERY_TIMEOUT));
+	}
+
 	if (!sense) {
 		wacom_wac->tool[0] = 0;
 		wacom_wac->id[0] = 0;
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index ee21bb260f22..e63b1e806e34 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -13,6 +13,8 @@
 #define WACOM_NAME_MAX		64
 #define WACOM_MAX_REMOTES	5
 #define WACOM_STATUS_UNKNOWN	255
+#define WACOM_REMOTE_BATTERY_TIMEOUT	21000000000ll
+#define WACOM_AES_BATTERY_TIMEOUT       1800000
 
 /* packet length for individual models */
 #define WACOM_PKGLEN_BBFUN	 9
@@ -327,10 +329,9 @@ struct hid_data {
 	ktime_t time_delayed;
 };
 
-struct wacom_remote_data {
+struct wacom_remote_work_data {
 	struct {
 		u32 serial;
-		bool connected;
 	} remote[WACOM_MAX_REMOTES];
 };
 
-- 
2.34.1


