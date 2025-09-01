Return-Path: <linux-input+bounces-14410-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F9B3E634
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 15:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37F7F204ED2
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 13:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363AA33EB10;
	Mon,  1 Sep 2025 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY4lXt4c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7073833A01A;
	Mon,  1 Sep 2025 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756734882; cv=none; b=poIbVOel7XhVipBNMgHbMMj51ItlJvUBjp9IHGMm2sa1+lHW0e59yc/9G0zKrZBTHx0hFrLsplcRwkrPi15KVrILso4byDBMMAzO0BpiC1ZZj4YRp8w6ViFut4P4iGM4Uo5nIRv4wDheExlFpFtv/9HATNAnEPce9qdWIRAes7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756734882; c=relaxed/simple;
	bh=QVK+8sL7qG8wagIwyT0IjqC80DQFdFOPePRJZwwL4+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0lbRD3dteescDXcVRhY2Ek6qmKNJlZuUMY+3mJ19o05spVFXNd6l8rw9GZfV+7tgydQlQNNxE/yc9Hp+YUqva2nOWffqz6ZPuLdQHEY616vtxJP3H3g7PGiZHkC5dnyuXDvv+LlCZuBhFTn6sP9p0HENv+nhflHzLn349V0Czs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RY4lXt4c; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4d5886f825so2382870a12.0;
        Mon, 01 Sep 2025 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756734880; x=1757339680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qmat2k9pfOSO69Tb0r7zHqSs9B7iOPv+szdxWbx8dGw=;
        b=RY4lXt4chXJ5ktNZndNcg2rVqE2YJczWQ/HDB1wv8jaapEFvHz+1fRrByMwvQjt/6e
         vpTX91NGl/kIKpMV1QEjqoZ1LDzGko9YB8hcKPkBe9gPc7+5HwQspacDLbkp8+tJM6g5
         5x3tGgrn4cVsE6Q/Jxnp3Ftt358EzfhxcjocnI7IJb/EogrFJjJZlb2X7PPoCks3JB38
         VFKlM+1X1dG1044j9T0X4tDh+Qzhwl+XAXz+iVLvhOJhlIAn16sKhphntzxZXIS98slT
         x3hW1fWWYF/mNUuf9425hf6bfo0OBw++WTcFzbhd8cX5raNxfJjO1nIG3TPFKS1G3quV
         gaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756734880; x=1757339680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qmat2k9pfOSO69Tb0r7zHqSs9B7iOPv+szdxWbx8dGw=;
        b=GfUOU9fC/fbDh5zpF6RsbX1sNUmUoE4BgweixHFgRBGKJR+tY8UARgUEubYs/BTt0a
         ACTkAjOYWjTqozsCwhepb6Pt58tXkWtFWMlLs/GtNDBJnTj1Eaf+Nu4oByo30akN1rqz
         Z7ichQYsqE8HJ3k7dLM+crm/rB11PYP9SNkESvS2mQr7VWtVHJD5av3DEDqRjwpInav6
         tcKo6pTGMma9oW0C0TDLOMayQiVOrYbzXTaa3os1YOCyC0QjFlmOaKIJBewBnZ+L/RvB
         nYUhddW+x4VVcjwnIChzcrY/3+TjL8A5B5iCW1mAlzoXxKcVaR6DNfv9qkDzGHJmmEqo
         sbAA==
X-Forwarded-Encrypted: i=1; AJvYcCVsFVeDQTOQAqDppSeBgVtQRPyLnz86FNf/+tjQKojcKzJLgU6WvbYsJFSezjNjDhGQnwffSKBshz2z1TN0@vger.kernel.org, AJvYcCWPrqIMqhBVbYEC9SXDV29dPyszl9Hvb/8ior7alKaV7NdVXE60MtnvYxOL3E2HZ1yBR67gXmGJXw9OpA==@vger.kernel.org, AJvYcCXqDh3MyRBZu32tYcICpJlewt2IpkwSwGDQM/yQXwkEoBCP4vc53IMwPQRQFWGRAvDqnIgoHgyJB21Fv4IYE0xLpiMgZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrcjW8OOY3cDsD3QTh2Jm8hz4kZgCHkW4VzhjCPG2DIe1x1vEj
	awvMkXvJTpuCF769JXU3/sHiuHym/X+P/yImfX4XdqEio6jNyW06O+hd
X-Gm-Gg: ASbGncuGGgvIUcOGI75txvZgAhf7Q3/2EMeoxzoet2ndR3Z9iLJ44iqtMxBSJqrtzaq
	8oqoVtIwIbWGoZK0qqnW6Gukix6n1oRJqEgyaJPDWxC8p9K0W0dcSOM7XvXH0vUVqO3ukxj8nHG
	KZ/2yZ5ZiJ7WP5xFMAtGtO1jXp3J7kACSOq4JFLJRevWs/xAVM93oPPK3StOgFHSF2C0H1dtY/O
	a7M/+Bikv0j+LTFE8ClwJcpWxc9PN0kmkDJbG0JCDnFAND9iP5vVuWIRzxQ40+t7xDJ2ZWIacCa
	fBBhxrQPBRJ/c3/fPCR6uh0/C1SmkXvtTQoROQlYJKRe6XrZvm2qef+EGzNtCuTMFa940aNpLz6
	bpWLOTwmIDDqNRk7m8xzCIdwnBwodlQNIETolhAQQKMCewQA8xd5pJTnUWjZYNv+dTdD7DMkpLa
	M=
X-Google-Smtp-Source: AGHT+IG/Q4L45KXe+/gksjaOcTZyKvCY1W3Jewqq8/y5N+D8XoPHGgEBozIvDzGI/eqExhq1Jik3Qw==
X-Received: by 2002:a17:902:ccd1:b0:246:de32:10d2 with SMTP id d9443c01a7336-24944a458c3mr103898685ad.15.1756734879524;
        Mon, 01 Sep 2025 06:54:39 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12.. ([2404:7a80:b9a1:7100:d5e9:d016:7fe4:a7c2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906390e6bsm106733415ad.96.2025.09.01.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:54:39 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v3 3/3] platform/x86: thinkpad_acpi: Use trackpoint doubletap interface via sysfs
Date: Mon,  1 Sep 2025 22:53:07 +0900
Message-ID: <20250901135308.52340-3-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250901135308.52340-1-vishnuocv@gmail.com>
References: <20250901135308.52340-1-vishnuocv@gmail.com>
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
Changes in v3:
- No changes
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 155 +++++++++++++++++++-
 1 file changed, 147 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..f5070442a7ba 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
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


