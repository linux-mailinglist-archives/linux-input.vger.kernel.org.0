Return-Path: <linux-input+bounces-12233-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDFFAB0573
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 23:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BED084C545C
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 21:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F14221FDB;
	Thu,  8 May 2025 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPk6ob/q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD8191F77;
	Thu,  8 May 2025 21:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746740625; cv=none; b=n0jMLnlLXzKAAEKXl+qW99RaZ7V582S+n6UKPz8pAZsm5QPvtuz8txxM0Pn3JuK00FeImS6QX9Dxf/AYmXvSEg4Z9CZWsIO+YOUnFbIwACAdmacIaUm4Wi8jlyiXoBrzg9HM2tob2aKnQdHkEqlT9PEbwppKnqiM3X5UvcxTCB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746740625; c=relaxed/simple;
	bh=J9Dmli0C5XnBzm1XsVjXcJ56mJMtmyK7n5kAZLDu9Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRVQvOLeSGGqrRG97GbBnGPqejLnZixOPmjEx9bo1kDCIHah8qEnFKY1eaXxQlGyUD0WgBdo8C/P10wo50WSBqGrFgZdDcsmoD2UuKGEYeUaP22kBaeCsFT37yS3vqaTH059n7JLsoxnM/5uiMsB2qVHMB6pRJ/cc+T0xKFUbyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPk6ob/q; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so2924882a12.1;
        Thu, 08 May 2025 14:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746740622; x=1747345422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxFI4RPqw5Oc72zgRf5XAcOfnV2sr6KPSZ5TqvC5GzI=;
        b=XPk6ob/qSJxazmJKv5Gb1Yw/0WpajH5VzwhYrvSv5yV/9cUb5KsA5hCiRX6s2FdU0e
         XG+T4K/cb+5EQKSpxAk6f4nImVjvyonmiuny/GB0Yt9+CRAYEHSebNmeoGl9AVeTeN3h
         AKiskknVR7oJ3X1zL6zuKUYfip5ElDeMihIEOyxpyFBhNvAdoQWue8u9zlkIvF6NtfAc
         3nH4G2uK/H0uo/MfpjN5f7//vZEKoBsG0haVxidQvdj5qkgJU7ammzrseHE4YhnWo96b
         E3ancHn6/Ve0hAvm9Fsi4GeYIdjbiR46zsOvbw1nEv89+UHhVaq7V6D/0L7x10vLes9/
         iNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746740622; x=1747345422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxFI4RPqw5Oc72zgRf5XAcOfnV2sr6KPSZ5TqvC5GzI=;
        b=V0WNnjA5ye9S/nNLf2HzrFOb30wO5xEgZYi0hfv1w0sRKfGcY1WdR5Wb+QGgl979Au
         IJlBoLd90V5CKLAUCgD90Yz7J1a04a5pVYxSFyrdjbtRasQY7IBuDrOlqg9duGnexmje
         x7+PfEfusSy6yTLouqGQmqSbV5M1y8PQtk/xKQPqwyBUM3ZWJi+mEASch+oiV8ru6U7z
         Xd3AEyRlpUMOfNODxFDjvZ/fgeEdV5WMdwhEJ0wP22VzYJCK9v8BdQe5tPuvV4dz39hq
         OxTcHk7WbPRAWjMQIO/tbXd25W6QgokpAalZevBxg4RqsTTsKGO3y28gXvDP0vBdB5Qa
         BDkw==
X-Forwarded-Encrypted: i=1; AJvYcCUdyOXfcWCo8rkJtYVa9EBV1tCmJ2Nv0cFVnXncuy6byip9qybj0nkKD7k+R2K4TfwczWNxbFd8XSUt8g==@vger.kernel.org, AJvYcCWYdXfZbC+oalRhJnf1nMMBZd228RH4qfBdyxCHSmVR0OVUm/rQaV2RQk8aUGR3gfkF8uiZlghaHIEzHymJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/ooOXXHZj90wR1dRpXp6PSXH4DQ88rsMG5dtOLcKBhn5NPSj
	/r1P+1jI4GLg6kPszTXEr67443gaGLCnzcy4JD/PHa8XDo38XPpm
X-Gm-Gg: ASbGncvOGM3PIN4n3JYw18U/1ebOfAL8DvLT/gkErW4tLLobnitif4BXZ0t8n61Vs51
	FAAWYu3cgO4xoyxUDJqzRIrkbk8H3hMuLeuiMv6gcZWDbpJkXZk71a0Q219rdZkLpbQdW/Qva6N
	FXHkEEtZna+022S7v1Pmoi+rEHB2eIXCD6RadzsJw3mq/87qHWe4wj+GoB3tgo0Sic2G0HmuaqL
	LA5hlDvn8IK2SsBIAtW4LxY87hEwwT1UeRB8NAPEN3uQxrSWyMK1rORVq9FyGSBUP+HdhGDPu8t
	etf0v+Jmro0a1chqt0P/+uTAs54I6+0mdMvKS/0+9Q==
X-Google-Smtp-Source: AGHT+IGCr7kNM8GxAeQgVOtn9fqJtJDnlu2uiaxt+HwMB0B30ez3ZUtOBnpZPPI/kcG6uuMX/M3FFg==
X-Received: by 2002:a17:907:9404:b0:aca:a162:67bb with SMTP id a640c23a62f3a-ad218e90a03mr130636466b.4.1746740621903;
        Thu, 08 May 2025 14:43:41 -0700 (PDT)
Received: from framework.. ([146.70.161.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746f06sm46007866b.107.2025.05.08.14.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:43:41 -0700 (PDT)
From: Vadym Tytan <titanv3585@gmail.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: Vadym Tytan <titanv3585@gmail.com>
Subject: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
Date: Thu,  8 May 2025 23:41:32 +0200
Message-ID: <20250508214305.836406-1-titanv3585@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508210148.799578-1-titanv3585@gmail.com>
References: <20250508210148.799578-1-titanv3585@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between v6.1 and v6.2 versions of Linux kernel,
DualShock4 related code was moved from `hid-sony.c`
to `hid-playstation.c` (near DualSense code) and
Bluetooth poll interval adjustment functionality was lost

Signed-off-by: Vadym Tytan <titanv3585@gmail.com>
---
 CREDITS                       |  4 +++
 drivers/hid/hid-playstation.c | 64 +++++++++++++++++++++++++++++++++--
 2 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/CREDITS b/CREDITS
index f74d230992d6..137c3636e318 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4001,6 +4001,10 @@ S: 44 Campbell Park Crescent
 S: Edinburgh EH13 0HT
 S: United Kingdom
 
+N: Vadym Tytan
+E: titanv3585@gmail.com
+D: Minor game controllers features
+
 N: Thomas Uhl
 E: uhl@sun1.rz.fh-heilbronn.de
 D: Application programmer
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 1468fb11e39d..fd51f00b0516 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -337,7 +337,7 @@ struct dualsense_output_report {
  * 0x3F - disabled
  */
 #define DS4_OUTPUT_HWCTL_BT_POLL_MASK	0x3F
-/* Default to 4ms poll interval, which is same as USB (not adjustable). */
+/* Default to 4ms poll interval, which is same as USB (adjustable). */
 #define DS4_BT_DEFAULT_POLL_INTERVAL_MS	4
 #define DS4_OUTPUT_HWCTL_CRC32		0x40
 #define DS4_OUTPUT_HWCTL_HID		0x80
@@ -542,6 +542,7 @@ static inline void dualsense_schedule_work(struct dualsense *ds);
 static inline void dualshock4_schedule_work(struct dualshock4 *ds4);
 static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue);
 static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4);
+static int dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8_t interval);
 
 /*
  * Add a new ps_device to ps_devices if it doesn't exist.
@@ -1738,6 +1739,43 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return ERR_PTR(ret);
 }
 
+static ssize_t dualshock4_show_poll_interval(struct device *dev,
+				struct device_attribute
+				*attr, char *buf)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ps_device *ps_dev = hid_get_drvdata(hdev);
+	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
+
+	return sysfs_emit(buf, "%i\n", ds4->bt_poll_interval);
+}
+
+static ssize_t dualshock4_store_poll_interval(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct hid_device *hdev = to_hid_device(dev);
+	struct ps_device *ps_dev = hid_get_drvdata(hdev);
+	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
+	int ret;
+	u8 interval;
+
+	if (kstrtou8(buf, 0, &interval))
+		return -EINVAL;
+
+	ret = dualshock4_set_bt_poll_interval(ds4, interval);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+struct device_attribute dev_attr_dualshock4_bt_poll_interval = {
+	.attr	= { .name = "bt_poll_interval", .mode = 0644 },
+	.show	= dualshock4_show_poll_interval,
+	.store	= dualshock4_store_poll_interval,
+};
+
 static void dualshock4_dongle_calibration_work(struct work_struct *work)
 {
 	struct dualshock4 *ds4 = container_of(work, struct dualshock4, dongle_hotplug_worker);
@@ -2493,6 +2531,9 @@ static void dualshock4_remove(struct ps_device *ps_dev)
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
 	unsigned long flags;
 
+	if (ps_dev->hdev->bus == BUS_BLUETOOTH)
+		device_remove_file(&ps_dev->hdev->dev, &dev_attr_dualshock4_bt_poll_interval);
+
 	spin_lock_irqsave(&ds4->base.lock, flags);
 	ds4->output_worker_initialized = false;
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
@@ -2513,11 +2554,16 @@ static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 }
 
-static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8_t interval)
+static int dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint8_t interval)
 {
+	if (interval >= DS4_OUTPUT_HWCTL_BT_POLL_MASK)
+		return -EINVAL;
+
 	ds4->bt_poll_interval = interval;
 	ds4->update_bt_poll_interval = true;
 	dualshock4_schedule_work(ds4);
+
+	return 0;
 }
 
 /* Set default lightbar color based on player. */
@@ -2659,7 +2705,17 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 			goto err;
 	}
 
-	dualshock4_set_bt_poll_interval(ds4, DS4_BT_DEFAULT_POLL_INTERVAL_MS);
+	if (hdev->bus == BUS_BLUETOOTH) {
+		ret = dualshock4_set_bt_poll_interval(ds4, DS4_BT_DEFAULT_POLL_INTERVAL_MS);
+		if (ret) {
+			hid_err(hdev, "Failed to set poll interval for DualShock4: %d\n", ret);
+			goto err;
+		}
+
+		ret = device_create_file(&hdev->dev, &dev_attr_dualshock4_bt_poll_interval);
+		if (ret)
+			hid_warn(hdev, "can't create sysfs bt_poll_interval attribute err: %d\n", ret);
+	}
 
 	ret = ps_device_set_player_id(ps_dev);
 	if (ret) {
@@ -2678,6 +2734,8 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	return &ds4->base;
 
 err:
+	if (hdev->bus == BUS_BLUETOOTH)
+		device_remove_file(&hdev->dev, &dev_attr_dualshock4_bt_poll_interval);
 	ps_devices_list_remove(ps_dev);
 	return ERR_PTR(ret);
 }
-- 
2.49.0


