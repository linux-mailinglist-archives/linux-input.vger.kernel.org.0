Return-Path: <linux-input+bounces-9967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52855A317F3
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 22:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88FC3188A133
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 21:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0169726A089;
	Tue, 11 Feb 2025 21:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+6q4LQC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C591268C7F;
	Tue, 11 Feb 2025 21:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739309990; cv=none; b=unNZtoAoy/hZCyAe5iOiNCx1m56/7MWAFEK65rxH7zP+RcBl5hPPzGJnyVXIJ9FsIDcvSFm3JEBoKTsOr7A6spvXkDI3MeoHkqQM7fUvAGSXX0XyxERx8RNULLqQ0/+VRTnBoRCq2z12Doc9OxQHT/EHL2l3X2TF9S0rs94AAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739309990; c=relaxed/simple;
	bh=HdxVaz/S5j8E53rUOyKqSsCK0tMWeMTxuGqTrEvGvd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQ66DUHsiGUk8Z2SARQmUMnK5HqfYoUXvyzD5SAhyUBdRFeyJ/reLvJ+logirTYMckTevzeD74GpjurTaTJwNOrSSLt2KyyswJmWvV8Onshowx82T2ln1NBVmCvdE0iEGRebGNXy/zzpB0DDwawuu4eiTBnBc9VrMq16iLesJs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+6q4LQC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439585a067eso1286935e9.3;
        Tue, 11 Feb 2025 13:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739309987; x=1739914787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYUL34qtOiHSo6M13JG0PlItLsuFU7xC7dAFW8FRolQ=;
        b=J+6q4LQCCW52dq62yXAIzlnUADjyZ07DGztESEDgri2wgHRI5T0dMdlSgvP8SV4Ary
         uZf/53BPOTU7K86kl+82xI8yQkhmUrOrzESdWEfCkUS9dva7bB9985AsPjfUZwLIbRtq
         Uyh6q9kjIOF5i3+Jn7yHcPO9NWJDxGAFWeRVZCuqh4YshQGGcml6Ctz8TDNjJMGJjL4f
         UmE8P8lXcJcGPR74/wQresshJFl/sEiGOY/p9rPI4sT4sD4n78fN9y3rTtg2ihXw74Et
         qAfCq/hTL+OSX3k5lXFm9I/xKDFH8+BEXDGzRwGsDEyQrV2NvQT4BCKtxZjxlb9b+oGo
         3TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739309987; x=1739914787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYUL34qtOiHSo6M13JG0PlItLsuFU7xC7dAFW8FRolQ=;
        b=NOO3vTETFJCgaYvOpa+YX1sDL+6AbTbTSYF9pO9pqp4DYo1YKBdnGoZ4d84JGn3gfN
         UWxsmscevAXSaV3kSZ/tT3Vgi1qAFkJv/PXIJ2gvPG7cmIkn8ytu7Np3aojo4yMJ3hBH
         Bcak4rxcH2RUJ1hDXoLZOYl1vqfud0+5TIAe51CrYr9sI6gj/FQN+8pnB58vTmA1HsAW
         hHcG3qpmRaTw9gAG3qfcT10+y0XtvpUWkxFzNGfocMr/z1RQuX5wAfiwKLd+QC2TjLBU
         JP8yLKXVRkFK5RDLDqL65HQJD1mgpea2HBnQjONDcK5NB9Pzc55IOoOv3tqWX+DijGQg
         8F3g==
X-Forwarded-Encrypted: i=1; AJvYcCWYZhVCMRM+YWeDRFbIvEuHXz+eAeVLR8LBJlw+JwIEldg/Dt31aex66/OuFbVCKqYNs0hGlMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0qj4PpV6pMYFozLvJarM+3loVYTxBpbheH+QHmcWG98SWo8E0
	c6M5IiVH3Ljg+QC5Ohf9Fo09GLg7Uu97EnUB3jSa11Xj1HLSPXxDYzbBY8fk
X-Gm-Gg: ASbGncvNNzN36KpR5hKkIJrUbC3itn6Oqffo+BJlEx9Ftu1++jz0hy0ArIhs1BfYQo2
	6bMAJ7yUGOH/gRCf75+R4JC62Yi7qwMJywOZWm+Ctl27NanQ8lNuZ3D/9N20D/muBKZzeELCWo5
	wMXO/hjE3IlPQhzcGmj7N2nl8q/DOImIygEn14g2tu2nF7nzWedib4Cu4MBbktOFwOSzKwxV9EX
	DfeDs1gcc1w+9y6UPZYTAaYT0WEfO7P7cloaF+GCZn5g7TkA1tOwvTbnl/Ufd7ah1JSwR6hEAMT
	x6b25TDHyElwF1z9GJAAQxgup7Fdrw0lPqlJT28=
X-Google-Smtp-Source: AGHT+IEF8oes0PV6SJLh3ehqMcVXcJ/8VY0zLzUDxi5Pm7DobpQlBY7oYhytHiUnbOhLv2i314vZTg==
X-Received: by 2002:a05:600c:3b92:b0:439:4c83:2b8b with SMTP id 5b1f17b1804b1-439581b192dmr6813975e9.19.1739309986347;
        Tue, 11 Feb 2025 13:39:46 -0800 (PST)
Received: from localhost.localdomain ([109.175.243.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd07fa80csm11613156f8f.13.2025.02.11.13.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:39:45 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-input@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] HID: corsair-void: Update power supply values with a unified work handler
Date: Tue, 11 Feb 2025 21:38:23 +0000
Message-ID: <20250211213833.9182-2-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

corsair_void_process_receiver can be called from an interrupt context,
locking battery_mutex in it was causing a kernel panic.
Fix it by moving the critical section into its own work, sharing this
work with battery_add_work and battery_remove_work to remove the need
for any locking

Closes: https://bugzilla.suse.com/show_bug.cgi?id=1236843

Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
Cc: stable@vger.kernel.org
Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---
 drivers/hid/hid-corsair-void.c | 84 +++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 33 deletions(-)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index 56e858066c3c..0423036b4544 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -107,6 +107,10 @@
 #define CORSAIR_VOID_SIDETONE_MAX_WIRELESS	55
 #define CORSAIR_VOID_SIDETONE_MAX_WIRED		4096
 
+#define CORSAIR_VOID_ADD_BATTERY		BIT(0)
+#define CORSAIR_VOID_REMOVE_BATTERY		BIT(1)
+#define CORSAIR_VOID_UPDATE_BATTERY		BIT(2)
+
 enum {
 	CORSAIR_VOID_WIRELESS,
 	CORSAIR_VOID_WIRED,
@@ -159,8 +163,9 @@ struct corsair_void_drvdata {
 
 	struct delayed_work delayed_status_work;
 	struct delayed_work delayed_firmware_work;
-	struct work_struct battery_remove_work;
-	struct work_struct battery_add_work;
+
+	unsigned long battery_work_flags;
+	struct work_struct battery_work;
 };
 
 /*
@@ -260,11 +265,9 @@ static void corsair_void_process_receiver(struct corsair_void_drvdata *drvdata,
 
 	/* Inform power supply if battery values changed */
 	if (memcmp(&orig_battery_data, battery_data, sizeof(*battery_data))) {
-		scoped_guard(mutex, &drvdata->battery_mutex) {
-			if (drvdata->battery) {
-				power_supply_changed(drvdata->battery);
-			}
-		}
+		set_bit(CORSAIR_VOID_UPDATE_BATTERY,
+			&drvdata->battery_work_flags);
+		schedule_work(&drvdata->battery_work);
 	}
 }
 
@@ -536,28 +539,11 @@ static void corsair_void_firmware_work_handler(struct work_struct *work)
 
 }
 
-static void corsair_void_battery_remove_work_handler(struct work_struct *work)
+static void corsair_void_add_battery(struct corsair_void_drvdata *drvdata)
 {
-	struct corsair_void_drvdata *drvdata;
-
-	drvdata = container_of(work, struct corsair_void_drvdata,
-			       battery_remove_work);
-	scoped_guard(mutex, &drvdata->battery_mutex) {
-		if (drvdata->battery) {
-			power_supply_unregister(drvdata->battery);
-			drvdata->battery = NULL;
-		}
-	}
-}
-
-static void corsair_void_battery_add_work_handler(struct work_struct *work)
-{
-	struct corsair_void_drvdata *drvdata;
 	struct power_supply_config psy_cfg = {};
 	struct power_supply *new_supply;
 
-	drvdata = container_of(work, struct corsair_void_drvdata,
-			       battery_add_work);
 	guard(mutex)(&drvdata->battery_mutex);
 	if (drvdata->battery)
 		return;
@@ -583,16 +569,52 @@ static void corsair_void_battery_add_work_handler(struct work_struct *work)
 	drvdata->battery = new_supply;
 }
 
+static void corsair_void_battery_work_handler(struct work_struct *work)
+{
+	struct corsair_void_drvdata *drvdata = container_of(work,
+		struct corsair_void_drvdata, battery_work);
+
+	bool add_battery = test_and_clear_bit(CORSAIR_VOID_ADD_BATTERY,
+					      &drvdata->battery_work_flags);
+	bool remove_battery = test_and_clear_bit(CORSAIR_VOID_REMOVE_BATTERY,
+						 &drvdata->battery_work_flags);
+	bool update_battery = test_and_clear_bit(CORSAIR_VOID_UPDATE_BATTERY,
+						 &drvdata->battery_work_flags);
+
+	/* Add, remove or skip battery */
+	if (add_battery && !remove_battery) {
+		corsair_void_add_battery(drvdata);
+	} else if (remove_battery && !add_battery) {
+		scoped_guard(mutex, &drvdata->battery_mutex) {
+			if (drvdata->battery) {
+				power_supply_unregister(drvdata->battery);
+				drvdata->battery = NULL;
+			}
+		}
+	}
+
+	/* Communicate that battery values changed */
+	if (update_battery) {
+		scoped_guard(mutex, &drvdata->battery_mutex) {
+			if (drvdata->battery)
+				power_supply_changed(drvdata->battery);
+		}
+	}
+
+}
+
 static void corsair_void_headset_connected(struct corsair_void_drvdata *drvdata)
 {
-	schedule_work(&drvdata->battery_add_work);
+	set_bit(CORSAIR_VOID_ADD_BATTERY, &drvdata->battery_work_flags);
+	schedule_work(&drvdata->battery_work);
 	schedule_delayed_work(&drvdata->delayed_firmware_work,
 			      msecs_to_jiffies(100));
 }
 
 static void corsair_void_headset_disconnected(struct corsair_void_drvdata *drvdata)
 {
-	schedule_work(&drvdata->battery_remove_work);
+	set_bit(CORSAIR_VOID_REMOVE_BATTERY, &drvdata->battery_work_flags);
+	schedule_work(&drvdata->battery_work);
 
 	corsair_void_set_unknown_wireless_data(drvdata);
 	corsair_void_set_unknown_batt(drvdata);
@@ -678,10 +700,7 @@ static int corsair_void_probe(struct hid_device *hid_dev,
 	drvdata->battery_desc.get_property = corsair_void_battery_get_property;
 
 	drvdata->battery = NULL;
-	INIT_WORK(&drvdata->battery_remove_work,
-		  corsair_void_battery_remove_work_handler);
-	INIT_WORK(&drvdata->battery_add_work,
-		  corsair_void_battery_add_work_handler);
+	INIT_WORK(&drvdata->battery_work, corsair_void_battery_work_handler);
 	ret = devm_mutex_init(drvdata->dev, &drvdata->battery_mutex);
 	if (ret)
 		return ret;
@@ -721,8 +740,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
 	struct corsair_void_drvdata *drvdata = hid_get_drvdata(hid_dev);
 
 	hid_hw_stop(hid_dev);
-	cancel_work_sync(&drvdata->battery_remove_work);
-	cancel_work_sync(&drvdata->battery_add_work);
+	cancel_work_sync(&drvdata->battery_work);
 	if (drvdata->battery)
 		power_supply_unregister(drvdata->battery);
 
-- 
2.47.2


