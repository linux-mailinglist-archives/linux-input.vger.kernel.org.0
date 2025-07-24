Return-Path: <linux-input+bounces-13685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B807AB1122F
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 22:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F16AC214D
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 20:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A58B23D2A4;
	Thu, 24 Jul 2025 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUCjU1/n"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA26239567;
	Thu, 24 Jul 2025 20:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388697; cv=none; b=OVanO6GR9DiKPS+up/Y1WoZPEChMgdOKW3jaRdAqeUU4cL+ehn4oKthfp+ROpsoWLk2cXGi/hRXtuYvWXfiZ4hsmEQDQViy6U75LIjWr6hX6ecd7P5/t9T4kB36Tgqfw7M0bFbyz1bsaCtN8MwcCAT7hYvudE6X2EzpgxHohzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388697; c=relaxed/simple;
	bh=lR7STELFR8UBgJ3/YAxUgaCeebrZGjPWO/ydGdpQk94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIUtGkrT7myPaucaVYuAbimiZRTektUqLD2CyA54VoiyYzU0tF78mNKWsKEcdA7mu874tk9gIxGos5P1Dbaids/qC1EcSNTZggk/1xA4CoukIOsKA7EXIpvQdUUgfOFrPB0SIFIo2RtE/mMT8vFAqKMH7oTvkD4/xzOYZnkHZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUCjU1/n; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313f68bc519so1129819a91.0;
        Thu, 24 Jul 2025 13:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753388695; x=1753993495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NyY2H3QimHapd9ALycOJd37zY8x0BuXHqiOgfyYuUU=;
        b=IUCjU1/nwB2IzWDL++RLIJ25+ASB3LDlPeCALsTIATyA5gCXo6Dz2x8HNXlN3s0oym
         qNk9G0Qg5srC4nmtiVVCXVlKZx+5FrUWnK5KDO3L3yD7Ahpgnr642QHZ+8g/YO1nc0rD
         1UvnKCVhAdkjZ0HFxflRM0TPMZN7YMPB+qqjCOcMo4MzvWYZs8iGpXWbL63mdfZ6TVOZ
         70FAbDynGbAbdGLjANjPMaw9u31grfnpkE0VG8OIDq73p+l4mDk/LHLiyY8MDN57NFl3
         Iqb37eunQa3+eOmYgujbTSfyFaP33ALX7n4rzc6B7IZnYMlIHJNoivE95KVGnyTkjryE
         Ce2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388695; x=1753993495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NyY2H3QimHapd9ALycOJd37zY8x0BuXHqiOgfyYuUU=;
        b=f+GRPHHIB015L2LMwS6aMW9JIUVZNbf0cX+TpIw0DBmNzvGfTzjkNRrBzPvhUbGLXK
         9B82PJscPmWO2udlTvhElo62u9+uRjfly6vwWrVmBhyw1o+8G3B160+Axmx0bl9aA86v
         YS2x+KEoaMbpFKg+hHhxvQrrOMsV6BWpMekxkOZ7X66EdE3q0jXmoTQZ6v3CMv/rcq96
         bk/8Wr87s21rjvwWiyI7X37M5O5f8d3BP6hOFlAoNId2lM4a3x1BRNIpYXbpUBtboqpC
         FY78dv1I0ka1TY2GYqQJpyzjZiBEa5MyZVin2xrt7RLnus8B9lXXoWAwPoNbxIlp2KC2
         eUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlsxW9qxCncLpj4O70EYTjqRwuFmdhLY6UXpD9m/WztzaFdCwivzNk4eJFL7c3uwg91f+nTb8zpEqK52SHhggJ6kTzpA==@vger.kernel.org, AJvYcCXpnkTXkpDlzuHwzqYJJ4G3NlTAozMu9tzYCJ7ACybOBi4NybrRQspK7HUFtWSscVzsrAuoL3a76eSbPA==@vger.kernel.org, AJvYcCXwaM/dEg6kMEXCOUuH80XotSKhRLsGLb7YJjHN/UVsrr6w1g3MOZqBVq9TkmkCz3iz5NLauPjAIjlIxg2s@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXDNmUA2ZtafYejJN4JIFz431QWyklTsrlivf2k2DOYYnBLna
	N3Tx7SzFr/5+qlMqed0XBvLU6oc7DVpsORJDBBJychADkXftU3LDp0kO7tkDLbx1m2KJtA==
X-Gm-Gg: ASbGncs3u/XIbXa6lwrzheGhvuntJHfdTsFxfTXy0blklJehCx4MzdxUbik5CDlFxQh
	s1jP+drePWowY7Z5e6KytIuy7kQcuGMVVSu82NeqgqvirVYQ6U6iPCdEo1CvSABfe0OO850U8q0
	UzpM6Lgb5j1GWdwQc0kCE3nvSKI+2hnUNUxRzUoqDGwDvJqPXvqtJfj6MeKyC00eR9GfKiH9U0J
	89pLVOwVnHP2qvupo0tHMyQBostbc52Y+DLk98OwNqiSpiOMsGOuKVRK55AL1uCJHNsTXdDy2Up
	YevASjXeduOvuQoC4/Dr8rJWqFqMtGkfAN4LNOpX7O9UB+1e+o++tfuIeAg3ATaDKM+L9gioqr9
	EMRIFQ6y3wSOXckPvUdBESEVkyW1A5V7qtReENiaUAAYEaYc584A9dQ==
X-Google-Smtp-Source: AGHT+IG10P4peUyc/n/35gEyTkQcRjmVC8EsMzqlVVG/eJmYcI0SVLUSXI36qmAUCXvVGLA+0xWNOg==
X-Received: by 2002:a17:90b:35c7:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-31e5079f043mr11112711a91.2.1753388694677;
        Thu, 24 Jul 2025 13:24:54 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12.. ([2404:7a80:b9a1:7100:9762:3c57:4828:75d1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6625068bsm2023458a91.5.2025.07.24.13.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:24:53 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Use trackpoint doubletap interface via sysfs
Date: Fri, 25 Jul 2025 05:23:48 +0900
Message-ID: <20250724202349.11200-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250724202349.11200-1-vishnuocv@gmail.com>
References: <20250724202349.11200-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TrackPoint devices supporting doubletap expose a sysfs attribute under
/sys/devices/.../trackpoint/doubletap_enabled. This patch enables
thinkpad_acpi to detect if the system has a TrackPoint device with
doubletap capability, and allows toggling the feature via sysfs.

This avoids direct linking between subsystems and relies on sysfs
as the interface for coordination between input and platform drivers.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Updated commit message to clarify dependency on trackpoint driver
- Now handling sysfs read/write of trackpoint driver using file read/write
- Removed sysfs attribute creation of trackpoint double tap here.
- Reversed the logic and return false right away
- Dropped unnecessary debug messages
- Using dev_dbg() instead of pr_xxxx()
---
 drivers/platform/x86/thinkpad_acpi.c | 155 +++++++++++++++++++++++++--
 1 file changed, 147 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b59b4d90b0c7..cb981de9bbb2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -72,6 +72,13 @@
 #include <linux/units.h>
 #include <linux/workqueue.h>
 
+#include <linux/fs.h>
+#include <linux/file.h>
+#include <linux/err.h>
+#include <linux/fcntl.h>
+#include <linux/namei.h>
+#include <linux/kernel_read_file.h>
+
 #include <acpi/battery.h>
 #include <acpi/video.h>
 
@@ -373,7 +380,8 @@ static struct {
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
-	u32 trackpoint_doubletap:1;
+	u32 trackpoint_doubletap_state:1;
+	u32 trackpoint_doubletap_capable:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -2879,6 +2887,107 @@ static DEVICE_ATTR_RW(hotkey_poll_freq);
 
 #endif /* CONFIG_THINKPAD_ACPI_HOTKEY_POLL */
 
+/*
+ * Trackpoint doubletap handlers
+ * These set of functions will communicate with the sysfs attributes of TrackPoint driver
+ * Attribute : /sys/bus/serio/devices/seriox/doubletap_enabled
+ */
+
+/* Global buffer to reuse path */
+static char trackpoint_doubletap_path[128];
+
+/* Function to find the correct serio path with TrackPoint attribute "doubletap_enabled" */
+static int thinkpad_find_trackpoint_path(void)
+{
+	struct path serio_path;
+	char path_buf[128];
+	int i;
+
+	for (i = 0; i < 10; i++) {
+		snprintf(path_buf, sizeof(path_buf),
+		"/sys/bus/serio/devices/serio%d/doubletap_enabled", i);
+
+		if (!kern_path(path_buf, LOOKUP_FOLLOW, &serio_path)) {
+			path_put(&serio_path);
+			snprintf(trackpoint_doubletap_path, sizeof(trackpoint_doubletap_path),
+				"%s", path_buf);
+			pr_info("ThinkPad ACPI: TrackPoint doubletap found at %s\n",
+				trackpoint_doubletap_path);
+			return 0;
+		}
+	}
+	return -ENODEV;
+}
+
+/* Writing to the sysfs attribute of Trackpoint "doubletap_enabled" */
+static int write_doubletap_sysfs_value(const void *buf, size_t count, loff_t *pos)
+{
+	struct file *filp;
+	ssize_t written;
+
+	if (!buf)
+		return -EINVAL;
+
+	filp = filp_open(trackpoint_doubletap_path, O_WRONLY | O_CREAT, 0644);
+	if (IS_ERR(filp))
+		return PTR_ERR(filp);
+
+	/* Required to avoid EINVAL from vfs checks in some cases */
+	if (!(filp->f_mode & FMODE_CAN_WRITE)) {
+		filp_close(filp, NULL);
+		return -EINVAL;
+	}
+
+	/* Write using kernel_write */
+	written = kernel_write(filp, buf, count, pos);
+	filp_close(filp, NULL);
+
+	return written < 0 ? written : 0;
+}
+
+/* Function to read the TrackPoint doubletap status */
+static int trackpoint_read_doubletap_status(bool *enabled)
+{
+	struct file *filp;
+	loff_t pos = 0;
+	char buf[8];
+	ssize_t ret;
+
+	if (!enabled)
+		return -EINVAL;
+
+	if (!trackpoint_doubletap_path[0])
+		return -ENODEV;
+
+	filp = filp_open(trackpoint_doubletap_path, O_RDONLY, 0);
+	if (IS_ERR(filp))
+		return PTR_ERR(filp);
+
+	ret = kernel_read(filp, buf, sizeof(buf) - 1, &pos);
+	filp_close(filp, NULL);
+
+	if (ret < 0)
+		return ret;
+
+	buf[ret] = '\0'; // Safe: ret < sizeof(buf)
+
+	*enabled = (buf[0] == '1');
+
+	return 0;
+}
+
+/* Function to check the TrackPoint doubletap status */
+static int thinkpad_set_doubletap_status(bool enable)
+{
+	const char *val = enable ? "1" : "0";
+	loff_t pos = 0;
+
+	if (!trackpoint_doubletap_path[0])
+		return -ENODEV;
+
+	return write_doubletap_sysfs_value(val, strlen(val), &pos);
+}
+
 /* sysfs hotkey radio_sw (pollable) ------------------------------------ */
 static ssize_t hotkey_radio_sw_show(struct device *dev,
 			   struct device_attribute *attr,
@@ -3326,6 +3435,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	bool radiosw_state  = false;
 	bool tabletsw_state = false;
 	int hkeyv, res, status, camera_shutter_state;
+	bool dt_state;
+	int rc;
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 			"initializing hotkey subdriver\n");
@@ -3557,9 +3668,22 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
-	/* Enable doubletap by default */
-	tp_features.trackpoint_doubletap = 1;
+	/* Checking doubletap status by default */
+	rc = thinkpad_find_trackpoint_path();
+	if (rc) {
+		dev_dbg(&tpacpi_pdev->dev, "Could not find TrackPoint doubletap sysfs path\n");
+		tp_features.trackpoint_doubletap_capable = false;
+		return 0;
+	}
+	tp_features.trackpoint_doubletap_capable = true;
 
+	rc = trackpoint_read_doubletap_status(&dt_state);
+	if (rc) {
+		/* Disable if access to register fails */
+		dt_state = false;
+		dev_dbg(&tpacpi_pdev->dev, "Doubletap failed to check status\n");
+	}
+	tp_features.trackpoint_doubletap_state = dt_state;
 	return 0;
 }
 
@@ -3863,9 +3987,7 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_TRACK_DOUBLETAP:
-		if (tp_features.trackpoint_doubletap)
-			tpacpi_input_send_key(hkey, send_acpi_ev);
-
+		*send_acpi_ev = true;
 		return true;
 	default:
 		return false;
@@ -11194,6 +11316,7 @@ static struct platform_driver tpacpi_hwmon_pdriver = {
 static bool tpacpi_driver_event(const unsigned int hkey_event)
 {
 	int camera_shutter_state;
+	int rc;
 
 	switch (hkey_event) {
 	case TP_HKEY_EV_BRGHT_UP:
@@ -11285,8 +11408,24 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		mutex_unlock(&tpacpi_inputdev_send_mutex);
 		return true;
 	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
-		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
-		return true;
+		if (tp_features.trackpoint_doubletap_capable) {
+			rc = thinkpad_set_doubletap_status(!tp_features.trackpoint_doubletap_state);
+
+			if (rc) {
+				dev_dbg(&tpacpi_pdev->dev, "Trackpoint doubletap toggle failed\n");
+			} else {
+				tp_features.trackpoint_doubletap_state =
+					!tp_features.trackpoint_doubletap_state;
+				dev_dbg(&tpacpi_pdev->dev, "Trackpoint doubletap is %s\n",
+						tp_features.trackpoint_doubletap_state ? "enabled" : "disabled");
+				return true;
+			}
+		}
+		/*
+		 * Suppress the event if Doubletap is not supported
+		 * or if the trackpoint_set_doubletap_status() is failing
+		 */
+		return false;
 	case TP_HKEY_EV_PROFILE_TOGGLE:
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
 		platform_profile_cycle();
-- 
2.48.1


