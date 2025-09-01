Return-Path: <linux-input+bounces-14408-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B7B3E625
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 15:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 574897A71C1
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 13:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C962FB622;
	Mon,  1 Sep 2025 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFI4WhoV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1A1C27;
	Mon,  1 Sep 2025 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756734839; cv=none; b=PXxZdBveSIpHx6Pu3uDTA1t55iz6OjdRM3Q4gTJOon+EzGcjYCnG9A5IjTDxyjBWMaefznME4i7tc6jSlEm5ofGTHuFfbCOXFhYMMM24Ni6iZochuTNl2/dEHYCSTHawgrx6zBZWOg0QwhpBpwjBx3r8+jLo3XKxTZJ/qD5jskM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756734839; c=relaxed/simple;
	bh=q1l39/qWULtcklU4dvKGAq4X0HcIR7cTEfCWPbaWihs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rrWhi/8PT/eZsGAkoVSGYg3bQbBD8R8tUkSkp4vtTpFiu2pdWCfNKsudjqVitK0NleM4WaUqer85LNGDpp5f+Ssb81W+W0q5kjQC6+Df9X9/vPynO4ELodOUdkaaDXzGFTUNPDvVQ4cy4L8D0T2vCbZ5VXPuo/dV/OfDtMMyoZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFI4WhoV; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4f8bf49aeaso398246a12.1;
        Mon, 01 Sep 2025 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756734837; x=1757339637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rK1EbDKDuWPUrJNs2px748yhqHLstsIWGKUzW9Z511w=;
        b=jFI4WhoVY/zTZSAy/7CWbrQeIdcM3+RIDr+A1486VfzCN4CmM25InjWvW06ZOA9ag9
         4Uc4iToU2FZ1DfeUuKGjcGBjZ6MIyYVomK97qphtT47smW2qMBjjphm3TAyqNw8Lnv+/
         kv2xW/EarT7LNeODp9mixpLoFF2zBRUKImu/Xz3pJCqWk+8bdVCYDAcbECLQkGTn/JN0
         AS8yLSkvJt3fuUqTuSGbff/g6t3Xjy/WUkXFeN/hgp4OORbI7Tc/IeVepBd0Z5QXujTk
         5Bj1+IiQWGwH+p5qZglVX3R8Vk306lKpo91P6gpSbfzYAqugzpczkxfmEO0yTODftzWb
         Al8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756734837; x=1757339637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rK1EbDKDuWPUrJNs2px748yhqHLstsIWGKUzW9Z511w=;
        b=G7xE/ayDh9HGSJvmm6YmKOO/7glu7aUzveDp1NeIoiKQ7suu8q9x0EYbjtjd5aKiE0
         qag9TsIEOJZIby/YgaFGNuflMu0w20cjy1qVppBVU6gbgeo4JKFPz4XWXSh8hb67lSB+
         6vCBj22ha27k3sj9toO4A072PjJgv2gN4uZYDsLyLdP+Rbhml8Hb9BwxWrYzqoVwFjJP
         36TGpWH8VdYDQetRtlDOrwp0ys6iDkBLAmD4AcGjAALLf+mKDky70dWY9HV1kkcQZVSc
         mlpafbztnKUCCzpwm9N5k7DIClj0XM2xweTPaLfhCiwOT+7sEAHU2bh0BB2/0FLlIiv4
         eCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCURBW43WhYI8VUI02zHcShfNTlNgyfIdUv1tZvL0kdZYWw3ZjV3WAKD41UkaehL30zqdeBlTtQ4WmQDvSA5@vger.kernel.org, AJvYcCUdXIwLJp+lskml+dY7wl0HM1X+yvfagY4NHC844TT6hVqcQF92dXZ65SF2rzgFT8lLeYGVZhtCcH8YTg==@vger.kernel.org, AJvYcCXZlrgVXMD23eA0YXF0LpXD4/eN5r886H1tGkk9KPRYwxakM1Wmoj8ohDNvYCHSA0nm+0SQUJYSwC47gFO8/fRE6lB/fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0geaB6WXk4HjL2/6Chh7BuS+s0feh01xniKZAjk/Fj5Fs8DPE
	Z9D6S6HGjGHzIHljZhk+wKAsZlbhxHmcEzFywkqezwPWGVcZmywIFjG0hQWU3J+j2mLdBhOb
X-Gm-Gg: ASbGncsPsdq2wYZMENP/CKz3rDNayGOG4YQMNqXB5WuB+G9bZjzFBpUeH9AOGx417Q6
	b+rEedawZRlGHF5cyh+RKkGs2ksoMPYq5DTLzk/U9nf8utX562res7eT5sTE55+BaAUwwqqy/XS
	nizbu2UrPbdlxYJGhIloNjuZwQTUUqrOfEqI4vpIg7WzoJJUAQKXvN5lpwYrm4q0eYMdW8K8vNE
	CJuYHbInLwSBJntO/5K9E5pqICTcmw4KwXlyjT5Lwy7Jzappc66TUmbMfeWOnG7gX6C3XJ2UoOa
	XuW9NSxlmcIk/uiKVqCFPNutxtYyPllgsaSybjTM56sI6LkHTd6WjAjXL0lCcJBpeaEY3PGI2YR
	adujumzQAVLj/vQeXVpwyXiNRL5WZj3EOwjl0Z7L3IT8HBe/jBdfo016s2iHnxs5vw37YuryWml
	A=
X-Google-Smtp-Source: AGHT+IHFqCqitZlzdPBclNqo3AnC1Zazlu6sHnOHE7NOv+jzSjNSZPJL+v2HShi62/cyEJsA3T28RQ==
X-Received: by 2002:a17:903:3c45:b0:242:9be2:f67a with SMTP id d9443c01a7336-24944873f96mr107659715ad.11.1756734837415;
        Mon, 01 Sep 2025 06:53:57 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12.. ([2404:7a80:b9a1:7100:d5e9:d016:7fe4:a7c2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906390e6bsm106733415ad.96.2025.09.01.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 06:53:56 -0700 (PDT)
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
Subject: [PATCH v3 1/3] input: mouse: trackpoint: Add doubletap enable/disable support
Date: Mon,  1 Sep 2025 22:53:05 +0900
Message-ID: <20250901135308.52340-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for enabling and disabling doubletap on TrackPoint devices
that support this functionality. The feature is detected using firmware
ID and exposed via sysfs as `doubletap_enabled`.

The feature is only available on newer ThinkPads (2023 and later).The driver
exposes this capability via a new sysfs attribute:
"/sys/bus/serio/devices/seriox/doubletap_enabled".

The attribute is only created if the device is detected to be capable of
doubletap via firmware and variant ID checks. This functionality will be
used by platform drivers such as thinkpad_acpi to expose and control doubletap
via user interfaces.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Improve commit messages
- Sysfs attributes moved to trackpoint.c
- Removed unnecessary comments
- Removed unnecessary debug messages
- Using strstarts() instead of strcmp()
- is_trackpoint_dt_capable() modified
- Removed _BIT suffix and used BIT() define.
- Reverse the trackpoint_doubletap_status() logic to return error first.
- Removed export functions as a result of the design change
- Changed trackpoint_dev->psmouse to parent_psmouse
- The path of trackpoint.h is not changed.
Changes in v3:
- No changes.
---
 drivers/input/mouse/trackpoint.c | 149 +++++++++++++++++++++++++++++++
 drivers/input/mouse/trackpoint.h |  15 ++++
 2 files changed, 164 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 5f6643b69a2c..c6f17b0dec3a 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -16,6 +16,8 @@
 #include "psmouse.h"
 #include "trackpoint.h"
 
+static struct trackpoint_data *trackpoint_dev;
+
 static const char * const trackpoint_variants[] = {
 	[TP_VARIANT_IBM]		= "IBM",
 	[TP_VARIANT_ALPS]		= "ALPS",
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
@@ -393,6 +410,131 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
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
+static bool is_trackpoint_dt_capable(const char *pnp_id)
+{
+	const char *id_start;
+	char id[8];
+
+	if (!strstarts(pnp_id, "PNP: LEN03"))
+		return false;
+
+	/* Points to "LEN03xxxx" */
+	id_start = pnp_id + 5;
+	if (sscanf(id_start, "%7s", id) != 1)
+		return false;
+
+	/* Check if it's blacklisted */
+	for (size_t i = 0; i < ARRAY_SIZE(dt_incompatible_devices); ++i) {
+		if (strcmp(id, dt_incompatible_devices[i]) == 0)
+			return false;
+	}
+	return true;
+}
+
+/* Trackpoint doubletap status function */
+static int trackpoint_doubletap_status(bool *status)
+{
+	struct trackpoint_data *tp = trackpoint_dev;
+	struct ps2dev *ps2dev = &tp->parent_psmouse->ps2dev;
+	u8 reg_val;
+	int rc;
+
+	/* Reading the Doubletap register using extended read */
+	rc = trackpoint_extended_read(ps2dev, TP_DOUBLETAP, &reg_val);
+	if (rc)
+		return rc;
+
+	*status = reg_val & TP_DOUBLETAP_STATUS ? true : false;
+
+	return 0;
+}
+
+/* Trackpoint doubletap enable/disable function */
+static int trackpoint_set_doubletap(bool enable)
+{
+	struct trackpoint_data *tp = trackpoint_dev;
+	struct ps2dev *ps2dev = &tp->parent_psmouse->ps2dev;
+	static u8 doubletap_state;
+	u8 new_val;
+
+	if (!tp)
+		return -ENODEV;
+
+	new_val = enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE;
+
+	if (doubletap_state == new_val)
+		return 0;
+
+	doubletap_state = new_val;
+
+	return trackpoint_write(ps2dev, TP_DOUBLETAP, new_val);
+}
+
+/*
+ * Trackpoint Doubletap Interface
+ * Control/Monitoring of Trackpoint Doubletap from:
+ * /sys/bus/serio/devices/seriox/doubletap_enabled
+ */
+static ssize_t doubletap_enabled_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct serio *serio = to_serio_port(dev);
+	struct psmouse *psmouse = psmouse_from_serio(serio);
+	struct trackpoint_data *tp = psmouse->private;
+	bool status;
+	int rc;
+
+	if (!tp || !tp->doubletap_capable)
+		return -ENODEV;
+
+	rc = trackpoint_doubletap_status(&status);
+	if (rc)
+		return rc;
+
+	return sysfs_emit(buf, "%d\n", status ? 1 : 0);
+}
+
+static ssize_t doubletap_enabled_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	struct serio *serio = to_serio_port(dev);
+	struct psmouse *psmouse = psmouse_from_serio(serio);
+	struct trackpoint_data *tp = psmouse->private;
+	bool enable;
+	int err;
+
+	if (!tp || !tp->doubletap_capable)
+		return -ENODEV;
+
+	err = kstrtobool(buf, &enable);
+	if (err)
+		return err;
+
+	err = trackpoint_set_doubletap(enable);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(doubletap_enabled);
+
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
@@ -425,6 +567,9 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 	psmouse->reconnect = trackpoint_reconnect;
 	psmouse->disconnect = trackpoint_disconnect;
 
+	trackpoint_dev = psmouse->private;
+	trackpoint_dev->parent_psmouse = psmouse;
+
 	if (variant_id != TP_VARIANT_IBM) {
 		/* Newer variants do not support extended button query. */
 		button_info = 0x33;
@@ -470,6 +615,10 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 		     psmouse->vendor, firmware_id,
 		     (button_info & 0xf0) >> 4, button_info & 0x0f);
 
+	tp->doubletap_capable = is_trackpoint_dt_capable(ps2dev->serio->firmware_id);
+	if (tp->doubletap_capable)
+		device_create_file(&psmouse->ps2dev.serio->dev, &dev_attr_doubletap_enabled);
+
 	return 0;
 }
 
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index eb5412904fe0..256e8cb35581 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -8,6 +8,8 @@
 #ifndef _TRACKPOINT_H
 #define _TRACKPOINT_H
 
+#include <linux/bitops.h>
+
 /*
  * These constants are from the TrackPoint System
  * Engineering documentation Version 4 from IBM Watson
@@ -69,6 +71,8 @@
 					/* (how hard it is to drag */
 					/* with Z-axis pressed) */
 
+#define TP_DOUBLETAP		0x58	/* TrackPoint doubletap register */
+
 #define TP_MINDRAG		0x59	/* Minimum amount of force needed */
 					/* to trigger dragging */
 
@@ -139,6 +143,14 @@
 #define TP_DEF_TWOHAND		0x00
 #define TP_DEF_SOURCE_TAG	0x00
 
+/* Doubletap register values */
+#define TP_DOUBLETAP_ENABLE	0xFF	/* Enable value */
+#define TP_DOUBLETAP_DISABLE	0xFE	/* Disable value */
+
+#define TP_DOUBLETAP_STATUS_BIT 0	/* 0th bit defines enable/disable */
+
+#define TP_DOUBLETAP_STATUS   BIT(TP_DOUBLETAP_STATUS_BIT)
+
 #define MAKE_PS2_CMD(params, results, cmd) ((params<<12) | (results<<8) | (cmd))
 
 struct trackpoint_data {
@@ -150,11 +162,14 @@ struct trackpoint_data {
 	u8 thresh, upthresh;
 	u8 ztime, jenks;
 	u8 drift_time;
+	bool doubletap_capable;
 
 	/* toggles */
 	bool press_to_select;
 	bool skipback;
 	bool ext_dev;
+
+	struct psmouse *parent_psmouse;
 };
 
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
-- 
2.48.1


