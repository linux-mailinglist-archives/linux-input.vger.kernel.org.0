Return-Path: <linux-input+bounces-12972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F15EBAE1076
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 02:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81E933B3908
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 00:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97E74C79;
	Fri, 20 Jun 2025 00:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgPpk4+0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8BA23CE;
	Fri, 20 Jun 2025 00:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750380365; cv=none; b=H9O8XO8ZkvWQyC8bHiuDzOulwjbaiBBhrxLIfc3w/jFqNHjJ0RpJIXKZEmS1db6vXLaxA+Pu9tPjES/0k/1DQixz5UMHyV8TqRUktJvKBrZFabc9KOXzvHCydzabwvP+sz1Y4J8SaaIciM2z30MGMg93C2zKoEYOfQsp8oLTPxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750380365; c=relaxed/simple;
	bh=MzUuSg4NpLWyNz6pkfUoQSMn0crSeKOVA1iOczCgsMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CzrvSNlYvCLBaUg1HC51JhGHT7wp11TbZF++Su9inkIqPhsFPVkbvYpEBv95eqZJPQoMbUlShQP8TRWn73DWAJRFtfO+Y3AmE6c6pjof8dXAb56CSCoY4B+BJ8gi3zqNXJbxLEsKpwD5VJMPW5JuYvE0nIWXFyQk3052eXY42u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgPpk4+0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235e1d4cba0so10880725ad.2;
        Thu, 19 Jun 2025 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750380363; x=1750985163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQg973+ufjVuMHyrzITaW0ybSIdkXPsZ44e1NZj+ppk=;
        b=UgPpk4+0Hgfb0w8RR9mzlL0OXyvzDe5skjnUizuEZUTHajJ3ZXRd2qkoXSSxi9xmHH
         c5O9r7LuTYapauooPcZFe7x29h3QZHpxQQ7Ok6+cmTM8q/xZxB1411YfjEJ7Cm2Fzyrc
         N4Ot5q8WclYiX8Uz7Z1WMTVFcpK67Lgtv0u6qFgWA4rRiI9sRh03XghIplvJoL6Pw5vj
         ST7nsrZ+O+Z4wSCLAwJnKPW5R0mn1Szd3yEE9xYmy2pSMZlzPGUVTsEPyxEBJDgOySEp
         WFp81P7c/sqsmQQxeyDtVQGXFs6/KArTx4LsO7As70j7LLsaqvS/+wYX9d6UlNve41Kb
         7qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750380363; x=1750985163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQg973+ufjVuMHyrzITaW0ybSIdkXPsZ44e1NZj+ppk=;
        b=BHSnPESg10qLJ+/yRTRFqCBLbW83CIEcC8O0Np5bthmlqYSVAqiLcPgGv1qokZYAN6
         VhVgOap1CZeEZjdpAERfmPoxi05r/PrjEC5/8RDojNZSxdnAeS+O3nuA7HLeIgGuqAYx
         6lNRpddLwF8zWrDdBoyHXWxL6/XgBMlcxYOQ30l63WPTRguzqbTlRzzaJMIZI4ha4s2+
         DqrbKXkWq/RwLmGN+3geUnLEIQJONanzBSsQbITYzmaiYvX0zA8BGy5BM8wGv/zN4YxW
         M5F07Lx1rKONdSO9XQsc+FqMhlP93qxHNPaUpEp+dAS1itLLCG+OTIXsf9GiOR3ZveJz
         BZVg==
X-Forwarded-Encrypted: i=1; AJvYcCUCBFHRELxV7fb+6ngOi5SR5ybMgANFch+MuMmkuLXpe7Krpdzx5k6MRSAzQrXC2bQPtMEvplB2k37ggg==@vger.kernel.org, AJvYcCWtuikNPaJWKlBHLBsU+H+ZSs6iO3ZmLpYH8H1vHPGTBBj04RkELfe6/YwOivApBVVpTub+8xjswHAMj1S0@vger.kernel.org, AJvYcCXhyKJHVJe/SJfbLFDreARn7XIeQwtlNdZIIdcW72tTwc+TIPRXXHAgUQwHuJpg4XpvnDKX0RNzCFuoqCDd9J62cN7WHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8x7/bKiMwoM04tLjof89fSU3upoIZtr0xEE9YANY0uF2CceJS
	/LzGhz5ee4r+hRpk8yJ+mMgB4M/UQID0EeK0oWd+ODNhCscqxRGd+oB2
X-Gm-Gg: ASbGnctaCnxuXtiG4XEsv+iDTctCC81/lH1aq1yxNxToKWNvTnHVrC5aVz2NiPsUqH/
	mJPQGR+ZoQ/BRidxt7pbl62eyO/BtthXBrkoqB58op98z2kRsyM1fl+OLsWe+mleaP1QEJZVUXM
	Fxg7406JkUEnff6i/CJloK3TZpmLAR42MPGRq8i9UY1jYE1+05JM8ILx54X6+eaJoYlFYkXMQrX
	PN4pg78DkY9sWNy+fBUOUrUEVU8srliSky2SFSi9EHXISqaq9PY24OjXLr7d/27a3IQkvY55hzC
	i+H2FrBPAFP/wsT0KE6cMD/5zIKQKAuaLBq/GfEeuqP0MmjHOLLokTkgTXJx+cIeXRWq4xehEhv
	yM0XWHOUa2YnDyBQH
X-Google-Smtp-Source: AGHT+IEq73gsgVn5CXUc0KsCulS9g3qRN78Z7hVFVN9QJ1qlEJIN/nffAorE8TXlOd4e585MftfTQA==
X-Received: by 2002:a17:903:2f4b:b0:235:f70:fd44 with SMTP id d9443c01a7336-237d9870d24mr10497975ad.21.1750380363019;
        Thu, 19 Jun 2025 17:46:03 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12.. ([2404:7a80:b9a1:7100:a8d:7fca:8b97:7765])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df846fdsm468946a91.20.2025.06.19.17.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:46:02 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: pali@kernel.org,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: tglx@linutronix.de,
	mingo@kernel.org,
	jon_xie@pixart.com,
	jay_lee@pixart.com,
	zhoubinbin@loongson.cn,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap handling
Date: Fri, 20 Jun 2025 09:42:08 +0900
Message-ID: <20250620004209.28250-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Newer ThinkPads have a doubletap feature that needs to be turned
ON/OFF via the trackpoint registers.
Systems released from 2023 have doubletap disabled by default and
need the feature enabling to be useful.

This patch introduces support for exposing and controlling the
trackpoint doubletap feature via a sysfs attribute.
/sys/devices/platform/thinkpad_acpi/tp_doubletap
This can be toggled by an "enable" or a "disable".

With this implemented we can remove the masking of events, and rely on
HW control instead, when the feature is disabled.

Note - Early Thinkpads (pre 2015) used the same register for hysteris
control, Check the FW IDs to make sure these are not affected.

trackpoint.h is moved to linux/input/.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/input/mouse/alps.c                    |   2 +-
 drivers/input/mouse/psmouse-base.c            |   2 +-
 drivers/input/mouse/trackpoint.c              | 115 ++++++++++++-
 drivers/platform/x86/thinkpad_acpi.c          | 153 ++++++++++++++++--
 .../linux/input}/trackpoint.h                 |  16 ++
 5 files changed, 276 insertions(+), 12 deletions(-)
 rename {drivers/input/mouse => include/linux/input}/trackpoint.h (90%)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index be734d65ea72..2abf338e8f1b 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -18,10 +18,10 @@
 #include <linux/serio.h>
 #include <linux/libps2.h>
 #include <linux/dmi.h>
+#include <linux/input/trackpoint.h>
 
 #include "psmouse.h"
 #include "alps.h"
-#include "trackpoint.h"
 
 /*
  * Definitions for ALPS version 3 and 4 command mode protocol
diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index a2c9f7144864..6bc515254403 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -21,6 +21,7 @@
 #include <linux/libps2.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/input/trackpoint.h>
 
 #include "psmouse.h"
 #include "synaptics.h"
@@ -28,7 +29,6 @@
 #include "alps.h"
 #include "hgpk.h"
 #include "lifebook.h"
-#include "trackpoint.h"
 #include "touchkit_ps2.h"
 #include "elantech.h"
 #include "sentelic.h"
diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 5f6643b69a2c..53d06d72968a 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -13,8 +13,10 @@
 #include <linux/libps2.h>
 #include <linux/proc_fs.h>
 #include <linux/uaccess.h>
+#include <linux/input/trackpoint.h>
 #include "psmouse.h"
-#include "trackpoint.h"
+
+static struct trackpoint_data *trackpoint_dev;
 
 static const char * const trackpoint_variants[] = {
 	[TP_VARIANT_IBM]		= "IBM",
@@ -63,6 +65,21 @@ static int trackpoint_write(struct ps2dev *ps2dev, u8 loc, u8 val)
 	return ps2_command(ps2dev, param, MAKE_PS2_CMD(3, 0, TP_COMMAND));
 }
 
+/* Read function for TrackPoint extended registers */
+static int trackpoint_extended_read(struct ps2dev *ps2dev, u8 loc, u8 *val)
+{
+	u8 ext_param[2] = {TP_READ_MEM, loc};
+	int error;
+
+	error = ps2_command(ps2dev,
+			    ext_param, MAKE_PS2_CMD(2, 1, TP_COMMAND));
+
+	if (!error)
+		*val = ext_param[0];
+
+	return error;
+}
+
 static int trackpoint_toggle_bit(struct ps2dev *ps2dev, u8 loc, u8 mask)
 {
 	u8 param[3] = { TP_TOGGLE, loc, mask };
@@ -393,6 +410,96 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
 	return 0;
 }
 
+/* List of known incapable device PNP IDs */
+static const char * const dt_incompatible_devices[] = {
+	"LEN0304",
+	"LEN0306",
+	"LEN0317",
+	"LEN031A",
+	"LEN031B",
+	"LEN031C",
+	"LEN031D",
+};
+
+/*
+ * checks if it’s a doubletap capable device
+ * The PNP ID format eg: is "PNP: LEN030d PNP0f13".
+ */
+bool is_trackpoint_dt_capable(const char *pnp_id)
+{
+	char id[16];
+
+	/* Make sure string starts with "PNP: " */
+	if (strncmp(pnp_id, "PNP: LEN03", 10) != 0)
+		return false;
+
+	/* Extract the first word after "PNP: " */
+	if (sscanf(pnp_id + 5, "%15s", id) != 1)
+		return false;
+
+	/* Check if it's blacklisted */
+	for (size_t i = 0; i < ARRAY_SIZE(dt_incompatible_devices); ++i) {
+		if (strcmp(pnp_id, dt_incompatible_devices[i]) == 0)
+			return false;
+	}
+
+	return true;
+}
+
+/* Trackpoint doubletap status function */
+int trackpoint_doubletap_status(bool *status)
+{
+	struct trackpoint_data *tp = trackpoint_dev;
+	struct ps2dev *ps2dev = &tp->psmouse->ps2dev;
+	u8 reg_val;
+	int rc;
+
+	/* Reading the Doubletap register using extended read */
+	rc = trackpoint_extended_read(ps2dev, TP_DOUBLETAP, &reg_val);
+	if (!rc)
+		*status = reg_val & BIT(TP_DOUBLETAP_STATUS_BIT) ?
+				true : false;
+
+	return rc;
+}
+EXPORT_SYMBOL(trackpoint_doubletap_status);
+
+/* Trackpoint doubletap enable/disable function */
+int trackpoint_set_doubletap(bool enable)
+{
+	struct trackpoint_data *tp = trackpoint_dev;
+	struct ps2dev *ps2dev = &tp->psmouse->ps2dev;
+	static u8 doubletap_status;
+	u8 new_val;
+
+	if (!tp)
+		return -ENODEV;
+
+	new_val = enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE;
+
+	/* Comparing the new value paased with the existing value */
+	if (doubletap_status == new_val) {
+		pr_info("TrackPoint: Doubletap is already %s\n",
+			enable ? "enabled" : "disabled");
+		return 0;
+	}
+
+	doubletap_status = new_val;
+
+	return trackpoint_write(ps2dev, TP_DOUBLETAP, new_val);
+}
+EXPORT_SYMBOL(trackpoint_set_doubletap);
+
+/*
+ * Doubletap capability check
+ * We use PNP ID to check the capability of the device.
+ */
+bool trackpoint_doubletap_support(void)
+{
+	return trackpoint_dev->doubletap_capable;
+}
+EXPORT_SYMBOL(trackpoint_doubletap_support);
+
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
@@ -425,6 +532,9 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 	psmouse->reconnect = trackpoint_reconnect;
 	psmouse->disconnect = trackpoint_disconnect;
 
+	trackpoint_dev = psmouse->private;
+	trackpoint_dev->psmouse = psmouse;  /* Set parent reference */
+
 	if (variant_id != TP_VARIANT_IBM) {
 		/* Newer variants do not support extended button query. */
 		button_info = 0x33;
@@ -470,6 +580,9 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 		     psmouse->vendor, firmware_id,
 		     (button_info & 0xf0) >> 4, button_info & 0x0f);
 
+	/* Checking the doubletap Capability */
+	tp->doubletap_capable = is_trackpoint_dt_capable(ps2dev->serio->firmware_id);
+
 	return 0;
 }
 
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e7350c9fa3aa..241c1dd5e1f4 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -71,6 +71,7 @@
 #include <linux/uaccess.h>
 #include <linux/units.h>
 #include <linux/workqueue.h>
+#include <linux/input/trackpoint.h>
 
 #include <acpi/battery.h>
 #include <acpi/video.h>
@@ -373,7 +374,8 @@ static struct {
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
-	u32 trackpoint_doubletap:1;
+	u32 trackpoint_doubletap_state:1;
+	u32 trackpoint_doubletap_capable:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -3325,6 +3327,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	bool radiosw_state  = false;
 	bool tabletsw_state = false;
 	int hkeyv, res, status, camera_shutter_state;
+	bool dt_state;
+	int rc;
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 			"initializing hotkey subdriver\n");
@@ -3556,8 +3560,19 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
-	/* Enable doubletap by default */
-	tp_features.trackpoint_doubletap = 1;
+	/* Checking doubletap status by default */
+	tp_features.trackpoint_doubletap_capable = trackpoint_doubletap_support();
+
+	if (tp_features.trackpoint_doubletap_capable) {
+		rc = trackpoint_doubletap_status(&dt_state);
+		if (rc) {
+			/* Disable if access to register fails */
+			tp_features.trackpoint_doubletap_state = false;
+			pr_info("ThinkPad ACPI: Doubletap failed to check status\n");
+		} else {
+			tp_features.trackpoint_doubletap_state = dt_state;
+		}
+	}
 
 	return 0;
 }
@@ -3862,9 +3877,7 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
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
@@ -10738,6 +10751,101 @@ static struct ibm_struct  dytc_profile_driver_data = {
 	.exit = dytc_profile_exit,
 };
 
+/************************************************************************
+ * Trackpoint Doubletap Interface
+ *
+ * Control/Monitoring of Trackpoint Doubletap from
+ * /sys/devices/platform/thinkpad_acpi/tp_doubletap
+ */
+
+static ssize_t tp_doubletap_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	bool status;
+
+	if (!trackpoint_doubletap_status(&status))
+		return sysfs_emit(buf, "access error\n");
+
+	return sysfs_emit(buf, "%s\n", status ? "enabled" : "disabled");
+}
+
+static ssize_t tp_doubletap_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+{
+	if (sysfs_streq(buf, "enable")) {
+		/* enabling the doubletap here */
+		if (!trackpoint_set_doubletap(true))
+			tp_features.trackpoint_doubletap_state = true;
+	} else if (sysfs_streq(buf, "disable")) {
+		/* disabling the doubletap here */
+		if (!trackpoint_set_doubletap(false))
+			tp_features.trackpoint_doubletap_state = false;
+	} else {
+		pr_err("ThinkPad ACPI: thinkpad_acpi: Invalid value '%s' for tp_doubletap\n", buf);
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static umode_t tp_doubletap_is_visible(struct kobject *kobj, struct attribute *attr, int index);
+
+static DEVICE_ATTR_RW(tp_doubletap);
+
+static struct attribute *tp_doubletap_attrs[] = {
+	&dev_attr_tp_doubletap.attr,
+	NULL
+};
+
+static const struct attribute_group tp_doubletap_attr_group = {
+	.attrs = tp_doubletap_attrs,
+	.is_visible = tp_doubletap_is_visible,
+};
+
+static umode_t tp_doubletap_is_visible(struct kobject *kobj, struct attribute *attr, int index)
+{
+	/* Only show the attribute if the TrackPoint doubletap is supported */
+	tp_features.trackpoint_doubletap_capable = trackpoint_doubletap_support();
+	if (!tp_features.trackpoint_doubletap_capable)
+		return 0;
+
+	pr_info("ThinkPad ACPI: TrackPoint doubletap sysfs is visible\n");
+
+	return attr->mode;
+}
+
+static struct delayed_work tp_doubletap_work;
+
+static void tp_doubletap_work_func(struct work_struct *work)
+{
+	if (!trackpoint_doubletap_support()) {
+		pr_info("TrackPoint doubletap not supported yet, rechecking later\n");
+		schedule_delayed_work(&tp_doubletap_work, msecs_to_jiffies(2000));
+		return;
+	}
+
+	if (sysfs_create_group(&tpacpi_pdev->dev.kobj, &tp_doubletap_attr_group) == 0)
+		pr_info("TrackPoint doubletap sysfs group created\n");
+	else
+		pr_err("Failed to create TrackPoint doubletap sysfs group\n");
+}
+
+static int __init tp_doubletap_init(struct ibm_init_struct *iibm)
+{
+	INIT_DELAYED_WORK(&tp_doubletap_work, tp_doubletap_work_func);
+	schedule_delayed_work(&tp_doubletap_work, msecs_to_jiffies(1000));
+
+	return 0;
+}
+
+static void tp_doubletap_exit(void)
+{
+	device_remove_file(&tpacpi_pdev->dev, &dev_attr_tp_doubletap);
+}
+
+static struct ibm_struct tp_doubletap_driver_data = {
+	.name = "tp_doubletap",
+	.exit =  tp_doubletap_exit,
+};
+
 /*************************************************************************
  * Keyboard language interface
  */
@@ -11192,7 +11300,7 @@ static struct platform_driver tpacpi_hwmon_pdriver = {
  */
 static bool tpacpi_driver_event(const unsigned int hkey_event)
 {
-	int camera_shutter_state;
+	int camera_shutter_state, rc;
 
 	switch (hkey_event) {
 	case TP_HKEY_EV_BRGHT_UP:
@@ -11284,8 +11392,30 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		mutex_unlock(&tpacpi_inputdev_send_mutex);
 		return true;
 	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
-		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
-		return true;
+		if (tp_features.trackpoint_doubletap_capable) {
+			/* Togging the register value */
+			rc = trackpoint_set_doubletap(!tp_features.trackpoint_doubletap_state);
+
+			if (rc) {
+				pr_err("ThinkPad ACPI: Trackpoint doubletap toggle failed\n");
+			} else {
+				/* Toggling the Doubletap Enable/Disable */
+				tp_features.trackpoint_doubletap_state =
+					!tp_features.trackpoint_doubletap_state;
+				pr_info("ThinkPad ACPI: Trackpoint doubletap is %s\n",
+					tp_features.trackpoint_doubletap_state ?
+					"enabled" : "disabled");
+
+				return true;
+			}
+		}
+
+		/*
+		 * Suppress the event if Doubletap is not supported
+		 * or if the trackpoint_set_doubletap() is failing
+		 */
+		return false;
+
 	case TP_HKEY_EV_PROFILE_TOGGLE:
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
 		platform_profile_cycle();
@@ -11751,6 +11881,11 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = auxmac_init,
 		.data = &auxmac_data,
 	},
+	{
+		.init = tp_doubletap_init,
+		.data = &tp_doubletap_driver_data
+	},
+
 };
 
 static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
diff --git a/drivers/input/mouse/trackpoint.h b/include/linux/input/trackpoint.h
similarity index 90%
rename from drivers/input/mouse/trackpoint.h
rename to include/linux/input/trackpoint.h
index eb5412904fe0..a8165becabe6 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/include/linux/input/trackpoint.h
@@ -69,6 +69,8 @@
 					/* (how hard it is to drag */
 					/* with Z-axis pressed) */
 
+#define TP_DOUBLETAP		0x58	/* TrackPoint doubletap register */
+
 #define TP_MINDRAG		0x59	/* Minimum amount of force needed */
 					/* to trigger dragging */
 
@@ -139,6 +141,12 @@
 #define TP_DEF_TWOHAND		0x00
 #define TP_DEF_SOURCE_TAG	0x00
 
+/* Doubletap register values */
+#define TP_DOUBLETAP_ENABLE	0xFF	/* Enable value */
+#define TP_DOUBLETAP_DISABLE	0xFE	/* Disable value */
+
+#define TP_DOUBLETAP_STATUS_BIT 0	/* 0th bit defines enable/disable */
+
 #define MAKE_PS2_CMD(params, results, cmd) ((params<<12) | (results<<8) | (cmd))
 
 struct trackpoint_data {
@@ -150,13 +158,21 @@ struct trackpoint_data {
 	u8 thresh, upthresh;
 	u8 ztime, jenks;
 	u8 drift_time;
+	bool doubletap_capable;
 
 	/* toggles */
 	bool press_to_select;
 	bool skipback;
 	bool ext_dev;
+
+	struct psmouse *psmouse;  /* Parent device */
 };
 
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
 
+int trackpoint_doubletap_status(bool *status);
+int trackpoint_set_doubletap(bool enable);
+bool trackpoint_doubletap_support(void);
+bool is_trackpoint_dt_capable(const char *device_id);
+
 #endif /* _TRACKPOINT_H */
-- 
2.48.1


