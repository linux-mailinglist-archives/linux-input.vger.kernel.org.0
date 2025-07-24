Return-Path: <linux-input+bounces-13684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B01B1122B
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 22:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D03E3AC2089
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 20:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A040E23C8A1;
	Thu, 24 Jul 2025 20:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWFjqkcM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E1239567;
	Thu, 24 Jul 2025 20:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388690; cv=none; b=Qg1pHRxNR3ZUcYJw+snhQblGgumnBUtEbv7gEObs9b7eAmGnS+7ZnNOTxwMMjxbzshdEZ6lXcOaUkQDkZVrOS8k1d26RGXBXaBMHQETaRnrFOjH9Rl0vAr2DBHaPyy8xnkhh9o81ed5t6719T6Y1dGUK/QM+BviC1DfHdoKRJYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388690; c=relaxed/simple;
	bh=koWz4qifCGj7OTtNgHlA3dYWZovw7LDne4OFxXeW4Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LKEXp12tO7aA51xqZZzPL3uCFkmzr7VBzN1pwqoWB6nm6BbIDkTQfrNb985LXxGTU5MEGqG7TJcwBs0s8a48XHK14Usj83C7tliFUwjrr4n69kkDQXKm1I8Dislyis2hYrm1ftilCeAEKnhUzQDaCr3VRNgAcP/ecG7n0bTNhgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWFjqkcM; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso1323732a12.3;
        Thu, 24 Jul 2025 13:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753388688; x=1753993488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IN5McEE14w8eBuFMHIBGq02p/0OhTNf8/j4tPHNoND0=;
        b=fWFjqkcMOf0rwQFgwsK9b2j/MNaoM0Cbl2zZ5ZzzbQJ2fxEGWpwxtsG6+4ItSJnHTU
         M0pQm4PCJbn27Ky0EitC9acfNU8a05vnI8/nRZUY3nJXhiJMrUbcP9J6Vv2S1CHYU1QG
         5Di2Dj3WCZpJpmpB6sRUBFLBz/R3IEwg50umEBsRQg4pjrZBLoHVJlgHf7imdBW7/LXZ
         H/J2V78Xi/CPckmag9WOr9OePZxJ2pxcUpDYiPPwOp31ounbmEkqJYwgcQHo8Spj7n+w
         eshllqYsvFF9LYLM7G40kalZy5slngL26rK671jHastocYD0C1PvPJy1Oh/m0vuNgOyE
         KvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388688; x=1753993488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IN5McEE14w8eBuFMHIBGq02p/0OhTNf8/j4tPHNoND0=;
        b=Z/iiqb+cVCqjJntMc4lZMNyJuR336RNNbE06Pvpo1CviiomX/+qXvNptqdCMyIrpX7
         Kl3sZw0T2fPLyzF6eA8XCo4uJcLTLgBO7sY8Sz6narSps1w4f2TpMBssP/OkRig2QG8G
         +WC1Bxqj933Vtr39vjGahWd4fw9HhLww2T3ZKFWIj/UWr2tbJlpXrqH6I59dMa23/MqR
         lhA3lyNLBo1i95wswhnznACXJ97x787deJPInR64XbJ9hyieKMjUtv9+wy2eyfSwdVDr
         in/tuhjBSJ4+bVfrG+WJtsuFGUWz0ZGy4w5uQuAJ/HpjwwmkyN9rI+oxLRcBoN/OyFbU
         7BCA==
X-Forwarded-Encrypted: i=1; AJvYcCW5HG9DNHGmFf8cXxfXz9IJ1XXcP5xElotwhULoM6rZJVd+yAHO4ZF2+b4JK/CUqOOK/03L/d/3S1xG0EGnHG3ad23nuA==@vger.kernel.org, AJvYcCWfD3XwohpQ/6BUT/cHuDo/EGxxbG2Mjm+Dlk5IUb9FaJuKYK8G6xjad4tkFF0H7GfyRjkOgXlAdisMUg==@vger.kernel.org, AJvYcCXvOgXvoSHHDzEL0q6YWMTAUeVUNnfmT/LEjo8RqKGRpliYLrDo4AfLRfV/aAmTVomGj+kP9RWQSRXjVniD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxmb0XPSa30VaLI0Ho8iqY6OavpOfoSe5jPuuwJhLYzvS7/W80
	iiMVlEFOXNjo//nMTJ46v4/9v8om59Z1ElID84P7mw3WCFiJcxh4eGmx
X-Gm-Gg: ASbGncvi41bciTMH/9M1ncVSbu/20CcXe6cIPagb374wlTkrUgy0d8JOyHMDoul28Ro
	rnuC7PF/ira6kUHZHMevzfe98hIjUayLQoZu0x6gVkCMi3waL/wjyrzriztid0zlZ2stvHGDzJr
	6TqcBaMfl5tLWVdBoZhcJY5rCifKqvZEGG2Xsx6WtU88bCVGss1LEpZKMBsEH1OxurU9bXhbulO
	qdhm5SQzm8qNSVUEejKvqrnwr1SYBMgFWqDF8p+OMBNFp3aq21MXVpe5uNXrTmm5s6kEkli8Ptf
	hKP1582tPbikRO0ET8vWCZRN8VVvxBE1gTIRNoCY83FJHdoMDmd6HNsBkY6tEr4GBSGHHGSpA1s
	vLlFx6au4gPV7Swkgblg+So7JitTM1td5obMDSKd9Lnzv1sj7JQEXdw==
X-Google-Smtp-Source: AGHT+IHYn5ikLjNuAydEDMMGIex7ApqgM3/KQF99ewlubvbJVmlu95fmMQm6oRn7qWe2odGl/vvM2Q==
X-Received: by 2002:a17:90b:3c4a:b0:313:20d2:c99b with SMTP id 98e67ed59e1d1-31e5071ce28mr11403083a91.9.1753388687938;
        Thu, 24 Jul 2025 13:24:47 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12.. ([2404:7a80:b9a1:7100:9762:3c57:4828:75d1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6625068bsm2023458a91.5.2025.07.24.13.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:24:47 -0700 (PDT)
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
Subject: [PATCH v2 1/2] input: mouse: trackpoint: Add doubletap enable/disable support
Date: Fri, 25 Jul 2025 05:23:47 +0900
Message-ID: <20250724202349.11200-1-vishnuocv@gmail.com>
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


