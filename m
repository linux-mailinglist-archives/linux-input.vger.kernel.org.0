Return-Path: <linux-input+bounces-10011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 496DDA3409D
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 14:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30D473A8605
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 13:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FED2222DD;
	Thu, 13 Feb 2025 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etjmyCXo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ACA2222CE;
	Thu, 13 Feb 2025 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739454209; cv=none; b=h/GtjK9Ip4QzXQQXlqjYagrzkiPJD5VuX4XTAizoS4qUkRKAwa8GCQe6cBhU9NLb4IbiWW4NjMY/THT2an8K4EnlvYDzRvpsYPvWw2e/w4bNIDHSRO7YQAKCUu4UIhNPfDUe5szwLlUZb13REo9Q46BgkX8yafF+kbpC/waquBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739454209; c=relaxed/simple;
	bh=1THMgtBUVWtS8iZzrqo/yymnGZZkmDBdqurvA1tE8k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3zECh3pqRKV+1sAvxRqNpljoU8QE+JlwmKAjT5sZ/grTJuEe0bVKcE0Toxgtcs9b6GJsXVmF3sSGYQqbcyttZAU5lSe0tglDRxXXk4m0qhMH/FBuuQvggoYmwz5PZ/I9E3pc0D0RZpj5e70MDFr4cJhxzt2SfGLluCKGYG+oWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etjmyCXo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso6286755e9.3;
        Thu, 13 Feb 2025 05:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739454205; x=1740059005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XMPABjjogfdKDCcQgCBVWi5+k2BUL7XWDxcvghN5g/4=;
        b=etjmyCXol/6m1PYRRYCdy6WjxtRTSheSJ60RCZXrJ84dufGk5KRhUucWS34hfJ8Poi
         Q51mG0TvetlZmIXuLJ5FECs3pFltUDqJDurufvq+PvdeTEE2mGmpzCa7CHXbHyeQ7ZC5
         EsM+6AyzBUTChbsL70iCf+keMS31mad/eNn9bJD7q/lmioY2b5Zm375WzWT0erOl/wSM
         BsWr5SKgRaP44ePL8DNk3CeoaA82eLJdUVSg/yEQtRCORuv+E9Vrb4COkjlZH/Xt72lG
         P+sQuNq1o2GYFiCToJF2YUZl9qpd06zEwJVcskRi34yGPqCUbU1F48qaLN8bhxnB1Vtg
         UtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739454205; x=1740059005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMPABjjogfdKDCcQgCBVWi5+k2BUL7XWDxcvghN5g/4=;
        b=JWXzzMNGyu/kE9t4FBaxOI1Ci7kGHWEbqKLuv7TkUvKwyKtxq1ZadVyplbIuC/oyT4
         UuHsv1LCjXylKBhQc48U/EXbZbt9oh+jOp3A570A9pWKf939w6cwWeQrtmj66KophN0R
         Pl4yvVg1LWJDL+V6N4OPZnsnlnqBeCseYZNdMrRonTMwupMumFmaG2/c2oZsScTzf2I6
         OgS+DdVerORFyNfTqW/Dl2tHMjxs+oxZdFFnamRpF5EBOVZhLGsOfc050+2Xnw37RpSD
         y+83ImOWEVJOsq2nJko0pm6sgWW3iq7i0GeOJg3LkwP/eFcR2UFcXGFm/7pgPBNSdGT5
         217g==
X-Forwarded-Encrypted: i=1; AJvYcCUVw9pp9J3eDLgl32DV01m8SKc6J/OOTH5yKojqGyT2xGD4bj1W83YgzjfNdFFdA6btYJn8tR0v/+7JAxw=@vger.kernel.org, AJvYcCWwVwTBx/GqqAVMvWTQTpFccxXg4YtRHRhC86jEHUyGuwyWdJvWLtWy6nBnilH9/Dgm1jmpMZ0J@vger.kernel.org
X-Gm-Message-State: AOJu0YwVV+PDvo/3I2D3ZGvJOBHqLwF/MLs4TjBanUF6HM0q8Fu8Fndr
	Dutvz4wp6p0DwT+fqUvqBq05ly0GIy9OYo/bgoHmgtriJYQqAPc1oVbah0iL
X-Gm-Gg: ASbGncuNAdexQN2HEOWR0dp5RQo4m0JaNp6RytYpFJn3CgDTlxJfRcETpPKbymBBLbM
	EeCHQgjDIBLMfS0cKDJu+i0vbD8LVEESiT5J0Rr05DW1dnsbjEZst4Z50g1BgltPnrZrVsVMcZr
	FriHatWsFwl7VW+Vkg97N+D8Xn+M9qH0/DD+15Pk5bC+q7eB+K172huos9U4sAfabVGczkaqpKw
	MwOr/IMc8LxuMsLwmPMW0d8rQp5PJiZ4CIhArJm1TIJH+5ryz8ts1OwJ2H7NdWhqTASgJbwOcjl
	UXr6MZ539XSHMcRrvmzx6nmvPQZ5m09Dokme938=
X-Google-Smtp-Source: AGHT+IHGh5hxeTTEn/ULQbgxjZRpnBSlL1VvOrm01LozDLNI/OQRJLTs0nLgEadHJzEMLliDtiQkEA==
X-Received: by 2002:a5d:47c3:0:b0:38d:de92:adab with SMTP id ffacd0b85a97d-38dea28c762mr6807008f8f.29.1739454205306;
        Thu, 13 Feb 2025 05:43:25 -0800 (PST)
Received: from localhost.localdomain ([109.175.243.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccef7sm1982547f8f.31.2025.02.13.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:43:24 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-input@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] HID: corsair-void: Update power supply values with a unified work handler
Date: Thu, 13 Feb 2025 13:38:49 +0000
Message-ID: <20250213133854.100866-3-stuart.a.hayhurst@gmail.com>
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

v2 -> v3:
 - Use an enum instead of a define for battery flag values
 - Use an integer instead of BIT() for the bit index
 - Drop unhelpful comments
 - Simplify corsair_void_battery_work_handler logic
 - Remove extra newline in commit message
v1 -> v2:
 - Actually remove the mutex

---
 drivers/hid/hid-corsair-void.c | 83 ++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 40 deletions(-)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index 56e858066c3c..afbd67aa9719 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -71,11 +71,9 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
-#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/power_supply.h>
 #include <linux/usb.h>
 #include <linux/workqueue.h>
@@ -120,6 +118,12 @@ enum {
 	CORSAIR_VOID_BATTERY_CHARGING	= 5,
 };
 
+enum {
+	CORSAIR_VOID_ADD_BATTERY	= 0,
+	CORSAIR_VOID_REMOVE_BATTERY	= 1,
+	CORSAIR_VOID_UPDATE_BATTERY	= 2,
+};
+
 static enum power_supply_property corsair_void_battery_props[] = {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_PRESENT,
@@ -155,12 +159,12 @@ struct corsair_void_drvdata {
 
 	struct power_supply *battery;
 	struct power_supply_desc battery_desc;
-	struct mutex battery_mutex;
 
 	struct delayed_work delayed_status_work;
 	struct delayed_work delayed_firmware_work;
-	struct work_struct battery_remove_work;
-	struct work_struct battery_add_work;
+
+	unsigned long battery_work_flags;
+	struct work_struct battery_work;
 };
 
 /*
@@ -260,11 +264,9 @@ static void corsair_void_process_receiver(struct corsair_void_drvdata *drvdata,
 
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
 
@@ -536,29 +538,11 @@ static void corsair_void_firmware_work_handler(struct work_struct *work)
 
 }
 
-static void corsair_void_battery_remove_work_handler(struct work_struct *work)
-{
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
+static void corsair_void_add_battery(struct corsair_void_drvdata *drvdata)
 {
-	struct corsair_void_drvdata *drvdata;
 	struct power_supply_config psy_cfg = {};
 	struct power_supply *new_supply;
 
-	drvdata = container_of(work, struct corsair_void_drvdata,
-			       battery_add_work);
-	guard(mutex)(&drvdata->battery_mutex);
 	if (drvdata->battery)
 		return;
 
@@ -583,16 +567,42 @@ static void corsair_void_battery_add_work_handler(struct work_struct *work)
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
+	if (add_battery && !remove_battery) {
+		corsair_void_add_battery(drvdata);
+	} else if (remove_battery && !add_battery && drvdata->battery) {
+		power_supply_unregister(drvdata->battery);
+		drvdata->battery = NULL;
+	}
+
+	if (update_battery && drvdata->battery)
+		power_supply_changed(drvdata->battery);
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
@@ -678,13 +688,7 @@ static int corsair_void_probe(struct hid_device *hid_dev,
 	drvdata->battery_desc.get_property = corsair_void_battery_get_property;
 
 	drvdata->battery = NULL;
-	INIT_WORK(&drvdata->battery_remove_work,
-		  corsair_void_battery_remove_work_handler);
-	INIT_WORK(&drvdata->battery_add_work,
-		  corsair_void_battery_add_work_handler);
-	ret = devm_mutex_init(drvdata->dev, &drvdata->battery_mutex);
-	if (ret)
-		return ret;
+	INIT_WORK(&drvdata->battery_work, corsair_void_battery_work_handler);
 
 	ret = sysfs_create_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
 	if (ret)
@@ -721,8 +725,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
 	struct corsair_void_drvdata *drvdata = hid_get_drvdata(hid_dev);
 
 	hid_hw_stop(hid_dev);
-	cancel_work_sync(&drvdata->battery_remove_work);
-	cancel_work_sync(&drvdata->battery_add_work);
+	cancel_work_sync(&drvdata->battery_work);
 	if (drvdata->battery)
 		power_supply_unregister(drvdata->battery);
 
-- 
2.47.2


