Return-Path: <linux-input+bounces-9970-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FFDA31906
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 23:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B32B188608E
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 22:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA63272908;
	Tue, 11 Feb 2025 22:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI5rlr0R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DBD272905;
	Tue, 11 Feb 2025 22:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739314302; cv=none; b=Apa/HW2Wc+aGVuJQPpIVjjbfqSR1Zw6+P5ENfjJU4+Y1g/2qPD+RVURPp+On6nzyk620EgdnqNXHbG1b5kUOTz0d/X/eC8zFW5XFVGGNS8MWps1ARA3iwa+9w9+OXrWlOpseePfrYHu+jiCYtL2sdnnOS0wAwBSZ5WrFrm5b4p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739314302; c=relaxed/simple;
	bh=wIxUZEd+00TmCiNMDTMEX0eVV3GSpdk9fEt2kd93gUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gvC0yl+G3LJMAFGxSIG5rwUoyYG2g5veAv57DO9zTicvEdnWeQPmAEfhrTXGt0NR0Pgyp30VACGx9A6TQEBmSZfoAFQNJUzo6OTSmSEv6St6udoN8NxxL/2Tl370Rd+U+F6XfN/ED3BlEjU5mBSXhBiDccODcfEsIXKFFwfMLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI5rlr0R; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dd935a267so2591138f8f.1;
        Tue, 11 Feb 2025 14:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314298; x=1739919098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICnvzQMQAmp2cYz72i//djwS7X/1914dqOn5NPL1JfE=;
        b=GI5rlr0RlyinDILVmvqvkxEntgFY9MGuRnd5YshO1MFVALq/SqJ3XnUSZjlxSkW273
         3CcJZZwzq2p/TTiovNI0uEjy6LDOvnLdwQtRpXXeqPImWGSYFd+/skxlYdhKWIEcvDp5
         k+wjkVqwxoTKSc6GFuuMO4lIWZxO/daHyb3F9vMFmtuMVy30roTcE1iSgQ+EnzYgOCf8
         FhK8L/GegNCm5QNJ5iNpLFjFgPV9gDv5rHmzTM5Yj3Mv6NKF/UFSFGADR5FJv5Iem02y
         iPX05WyfpDzPmZbGz2v47UeKGD5Q5LRh6a5uI1DlcCE6lEj3M9WNmgRoR66qNZ7VsOJu
         hRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314298; x=1739919098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICnvzQMQAmp2cYz72i//djwS7X/1914dqOn5NPL1JfE=;
        b=eqfMaFQkNqUhee+wQGH+ZH/4LxMuXDudnJ7yZrVTJsLsHDNUxWzgEs1XfkNX1dds/b
         ZN0li04Pv6twogblW8/GTGpBJx2qKy2XL6pN2rBlEsPVzCQuZKg0Iq953Z2KDX+UmzZk
         ytc5bJYQYt6KBnQKhBHGpT4QqFRU1JSCF1KrFRM85T75Jt9DXlFuAETR2dGXsbxzKEJU
         RBrCwclmM1lg+81UFdru5PhQ644i6VizWqRSWl3p1Bs18tFb1Uo1o7aj07M+zcQcFxAs
         5mjddpqYPGAG+74nDzN8bhz9gJej9oVq/OczQMaurlEg8vzKXQwWxTh/0hGddnkemWgz
         yRzA==
X-Forwarded-Encrypted: i=1; AJvYcCWJxUO7c8OHlPM8g3RYIhtUZV5gz3bwZXdNv549WL6MJMlC2joXXDPHL36hKHY861jCyP9Dtu4Z@vger.kernel.org, AJvYcCWLxN9p0PSFNLFodZJc/dZoIxU7D0KboOV75B9tSt1yXI13S66+nCzc5XCVzjB2jQXQ5/3IWwgewO8xorc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjOyDGhByWzubGxzyJyuTvLBd7++GbNMfbpAOcGJ9gytIWgl5L
	fNJatdodZarC8y75KAyXtUP+M5wd82kIh49OIMgYgCEpxPcAQAEw0pkLB2aA
X-Gm-Gg: ASbGncszfi1pZs8WXaRhG1rnWUrsMWolfQAZxJ9AOUkDWgjqzVNwIt9Gjzk2Cpvjn7h
	iFLNu7yFgW8jwuey5hGf8Gin5Irosi5js4dn22kj5cFAF85nGjtPYm07GSIDeb1lCf5ZIs/4xs0
	r2NjzzkaO/MEfZUBxqIJDZRGxSjNbBl5nZgXEy6Eh700yyqTyL63EexO1bHcP3mwYMhEvVqnqtP
	yL1fgtksxtVJF+jvY0u+2KU2/3Gajm0KF8cMyIQrUsl5rgqIGWODg2cWcgLKUxbEU6xX717KDBP
	u+wf65Ixa8TxKAX7vkzF0c+QXrIJaegfQdYqDaw=
X-Google-Smtp-Source: AGHT+IFxSPr6Ik7EeG3X0laBlqQHQTytex4TBrPuw7lJ3kcVufJXL07N44Lupr/3PCF86v+ptpn2rQ==
X-Received: by 2002:a5d:59ab:0:b0:38d:d8b2:ceef with SMTP id ffacd0b85a97d-38dea2709b9mr565800f8f.13.1739314298204;
        Tue, 11 Feb 2025 14:51:38 -0800 (PST)
Received: from localhost.localdomain ([109.175.243.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394f3b8485sm19109895e9.1.2025.02.11.14.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:51:37 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-input@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] HID: corsair-void: Update power supply values with a unified work handler
Date: Tue, 11 Feb 2025 22:46:35 +0000
Message-ID: <20250211224705.13576-3-stuart.a.hayhurst@gmail.com>
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

v1 -> v2:
 - Actually remove the mutex

---
 drivers/hid/hid-corsair-void.c | 87 ++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 40 deletions(-)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index 56e858066c3c..2f70db8a2370 100644
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
@@ -107,6 +105,10 @@
 #define CORSAIR_VOID_SIDETONE_MAX_WIRELESS	55
 #define CORSAIR_VOID_SIDETONE_MAX_WIRED		4096
 
+#define CORSAIR_VOID_ADD_BATTERY		BIT(0)
+#define CORSAIR_VOID_REMOVE_BATTERY		BIT(1)
+#define CORSAIR_VOID_UPDATE_BATTERY		BIT(2)
+
 enum {
 	CORSAIR_VOID_WIRELESS,
 	CORSAIR_VOID_WIRED,
@@ -155,12 +157,12 @@ struct corsair_void_drvdata {
 
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
@@ -260,11 +262,9 @@ static void corsair_void_process_receiver(struct corsair_void_drvdata *drvdata,
 
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
 
@@ -536,29 +536,11 @@ static void corsair_void_firmware_work_handler(struct work_struct *work)
 
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
 
@@ -583,16 +565,48 @@ static void corsair_void_battery_add_work_handler(struct work_struct *work)
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
+		if (drvdata->battery) {
+			power_supply_unregister(drvdata->battery);
+			drvdata->battery = NULL;
+		}
+	}
+
+	/* Communicate that battery values changed */
+	if (update_battery) {
+		if (drvdata->battery)
+			power_supply_changed(drvdata->battery);
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
@@ -678,13 +692,7 @@ static int corsair_void_probe(struct hid_device *hid_dev,
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
@@ -721,8 +729,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
 	struct corsair_void_drvdata *drvdata = hid_get_drvdata(hid_dev);
 
 	hid_hw_stop(hid_dev);
-	cancel_work_sync(&drvdata->battery_remove_work);
-	cancel_work_sync(&drvdata->battery_add_work);
+	cancel_work_sync(&drvdata->battery_work);
 	if (drvdata->battery)
 		power_supply_unregister(drvdata->battery);
 
-- 
2.47.2


