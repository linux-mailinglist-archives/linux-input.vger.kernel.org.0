Return-Path: <linux-input+bounces-16726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9D1CE5D4C
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D324330094B2
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCBC287276;
	Mon, 29 Dec 2025 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkP6IAn6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144C027AC4C
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978293; cv=none; b=aH7qLrejHPLnVVlY4nJc87yCfM6vdpQFL8x/alAotfxZsmdwn6Hrc6eHQMu7NkwirJiZAxECgd/IeB7SEMEdLmXJS1fI56u+q66fHXKvZkhvrz4JE0wPzW7OUY8ZTJug7ofbbzYkG3Dlz84dImmMEi0e+TyXAHo6Q13VH+xkXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978293; c=relaxed/simple;
	bh=TjcLc8b1McUidwujjfQYTR+PxKrP04JoWpS4YYDWZFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXInKENoIyxrWA6GRd9q10k2LYVBPa52Q5k42iXte7OlwJT4xONe7tEaUVkwdw7SV9OuWo0FCOWx0gSxEJmOuYl/2rWikcTX1FF7WrZN6roz8VCXfJx9H1oJDZuma27foSAmQwiUTuECrj7LFMOqp61ovwhtcRzDF3KvR7uRVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkP6IAn6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b553412a19bso8310530a12.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978287; x=1767583087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SSUxFyBlljVoOkyziM9cW6Mg4NT0OL48ryA8PfVXFE=;
        b=HkP6IAn6hb8KTMz8wco1lzO4nCbWQg9wRNByiD/OCLaFO5c/Q6RHXszvMAdIyD5BPN
         1c4GtSurswFEubrW7rFD6QGn7IG9h40VdZPJnSHcOjpaXTkMfiEQUElsko2bvjQWLOBJ
         U6w5u82xLrOc/JPCBtltuIIrXDZkEWBsOcGa9pEzEIcupjCw/b1cKEl7w55YWXyB4blA
         /FV/BUYE0EBHyTFJWsrOCImSNdD3lexnVYc1p3Nez0TSVAtnBqGPDu7ZvtAh6N7wgrNc
         benGBB/fPb5SM//viPfZhLo5+FceDh/5d/P0ijQQiNyrexnr1HbC8oeAuJ8/KmuD5MCV
         5D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978287; x=1767583087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/SSUxFyBlljVoOkyziM9cW6Mg4NT0OL48ryA8PfVXFE=;
        b=DhAL2IUEARKEtvC7kakPd7sXWVIh7+f6r1FeDTsSw2/oX4oiNfn/hN3ppgl4ZOATED
         TBp8klSwZ9SuUAdBPvZ21nPRS4e0V7+H0yMnMZm0BqbMyQzd05bhUB96Kwc2a6Q8zZ8S
         CP7lIGEMTIF83P1DCS8j6hPXb9F+ZEobDVLu9eUzd4O41mBAMRhZnwXqzLHOQCaWlo0r
         Ft2VYKODHZqMbpqUeVU6cyoalcohOrX869hMzpIKteDv8Wgr7U6RNCgtIsnHqqzWyUqK
         16xEQPK9+fQWwFoO8aDjFVswzDU3SWS9ABadzvc0AZs9Suv9AW0/NwTmt9ODVP8GdHFK
         jdwg==
X-Forwarded-Encrypted: i=1; AJvYcCWtiRik1akTvLPIdmk+OH1enZYyKbpS+0KKnsDPxp5Km1yGj9FAyFIHpkWZDQpK4nd0dd7hbBL9y64bng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGF4gReaGrttuQse1TdGumogzqJEXRXoSh2L2P7PEC8fOHL0v
	RQ5RayTcqmbC14AWFHCc2qZMnrRypziR7XAxhg+eXjL1Ha31wiQ5tMC0
X-Gm-Gg: AY/fxX7RNV/Sf8TsATSMnXgwVCXxXZvfVQcZFSD2GhMjs0xdnMwfqWZ5staga9lnUed
	6VqT20kqCxFxU9tpb8qr24oLmVsnED8kL6Rm4oKb/w4BGKSP/hxBfeVxuk1IXmulCPbAd+dpDM1
	FQ0x6u+A/b8nc1t389UsLNfNcgkEtlPWOFIdDnAN4ENzdqEcfUG8X0lLNGCNMa9LFcSGVUsIhcC
	fRwnCwqqB7yMjg6mls/xjFGNwA/bwgih4AUUP31N/FHyvViUziq9Ufpxqhg4K8IpBcZujD8jFZH
	iJ9xZBNK5dnr6cFKm7HaqsI8jBVfFKQv/e9nPhoKR9CD+Hf5yWT1NPP+Wi65TB8ysQd7N4tJ91R
	Mn10INdzPrQ+086rCkNU3lKLdrJTzhCKkeIGLUB/gLoZsrbBVE/VOq595myr9MLoJDkZ9TTAUNR
	ARLmxLe2WjjIoBu45xZszLAsduI6FY+gp+4Dy34cYDAPCJTyjLGDwm2XZX3elSewA=
X-Google-Smtp-Source: AGHT+IFy6JlhPUmYZyhP9/6iKZQqnm4h0/gpD7xRl7MJ8NcHJHy2QxB6lQ6mbz7HEpi07optHW5p6Q==
X-Received: by 2002:a05:7022:eac1:b0:11b:9b9f:426b with SMTP id a92af1059eb24-121722c3d35mr27502722c88.20.1766978287185;
        Sun, 28 Dec 2025 19:18:07 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:06 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] HID: hid-lenovo-go-s: Add Feature Status Attributes
Date: Mon, 29 Dec 2025 03:17:49 +0000
Message-ID: <20251229031753.581664-13-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251229031753.581664-1-derekjohn.clark@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds features status attributes for the gamepad, MCU, touchpad/mouse,
and IMU devices.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 524 +++++++++++++++++++++++++++++++++-
 1 file changed, 523 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 36cee6c3d4cc..076afdaa9628 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/jiffies.h>
+#include <linux/kstrtox.h>
 #include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/string.h>
@@ -35,7 +36,17 @@ struct hid_gos_cfg {
 	struct completion send_cmd_complete;
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
+	u8 gp_auto_sleep_time;
+	u8 gp_dpad_mode;
+	u8 gp_mode;
+	u8 gp_poll_rate;
+	u8 imu_bypass_en;
+	u8 imu_sensor_en;
 	u8 mcu_id[12];
+	u8 mouse_step;
+	u8 os_mode;
+	u8 rgb_en;
+	u8 tp_en;
 } drvdata;
 
 struct gos_cfg_attr {
@@ -66,7 +77,73 @@ enum mcu_command_index {
 	GET_PL_TEST = 0xdf,
 };
 
-#define FEATURE_NONE 0x00
+enum feature_enabled_index {
+	FEATURE_DISABLED,
+	FEATURE_ENABLED,
+};
+
+static const char *const feature_enabled_text[] = {
+	[FEATURE_DISABLED] = "false",
+	[FEATURE_ENABLED] = "true",
+};
+
+enum feature_status_index {
+	FEATURE_NONE = 0x00,
+	FEATURE_GAMEPAD_MODE = 0x01,
+	FEATURE_AUTO_SLEEP_TIME = 0x04,
+	FEATURE_IMU_BYPASS,
+	FEATURE_RGB_ENABLE,
+	FEATURE_IMU_ENABLE,
+	FEATURE_TOUCHPAD_ENABLE,
+	FEATURE_OS_MODE = 0x0A,
+	FEATURE_POLL_RATE = 0x10,
+	FEATURE_DPAD_MODE,
+	FEATURE_MOUSE_WHEEL_STEP,
+};
+
+enum gamepad_mode_index {
+	XINPUT,
+	DINPUT,
+};
+
+static const char *const gamepad_mode_text[] = {
+	[XINPUT] = "xinput",
+	[DINPUT] = "dinput",
+};
+
+enum os_type_index {
+	WINDOWS,
+	LINUX,
+};
+
+static const char *const os_type_text[] = {
+	[WINDOWS] = "windows",
+	[LINUX] = "linux",
+};
+
+enum poll_rate_index {
+	HZ125,
+	HZ250,
+	HZ500,
+	HZ1000,
+};
+
+static const char *const poll_rate_text[] = {
+	[HZ125] = "125",
+	[HZ250] = "250",
+	[HZ500] = "500",
+	[HZ1000] = "1000",
+};
+
+enum dpad_mode_index {
+	DIR8,
+	DIR4,
+};
+
+static const char *const dpad_mode_text[] = {
+	[DIR8] = "8-way",
+	[DIR4] = "4-way",
+};
 
 static int hid_gos_version_event(u8 *data)
 {
@@ -84,6 +161,57 @@ static int hid_gos_mcu_id_event(struct command_report *cmd_rep)
 	return 0;
 }
 
+static int hid_gos_gamepad_cfg_event(struct command_report *cmd_rep)
+{
+	int ret = 0;
+
+	switch (cmd_rep->sub_cmd) {
+	case FEATURE_GAMEPAD_MODE:
+		drvdata.gp_mode = cmd_rep->data[0];
+		break;
+	case FEATURE_AUTO_SLEEP_TIME:
+		drvdata.gp_auto_sleep_time = cmd_rep->data[0];
+		break;
+	case FEATURE_IMU_BYPASS:
+		drvdata.imu_bypass_en = cmd_rep->data[0];
+		break;
+	case FEATURE_RGB_ENABLE:
+		drvdata.rgb_en = cmd_rep->data[0];
+		break;
+	case FEATURE_IMU_ENABLE:
+		drvdata.imu_sensor_en = cmd_rep->data[0];
+		break;
+	case FEATURE_TOUCHPAD_ENABLE:
+		drvdata.tp_en = cmd_rep->data[0];
+		break;
+	case FEATURE_OS_MODE:
+		drvdata.os_mode = cmd_rep->data[0];
+		break;
+	case FEATURE_POLL_RATE:
+		drvdata.gp_poll_rate = cmd_rep->data[0];
+		break;
+	case FEATURE_DPAD_MODE:
+		drvdata.gp_dpad_mode = cmd_rep->data[0];
+		break;
+	case FEATURE_MOUSE_WHEEL_STEP:
+		drvdata.mouse_step = cmd_rep->data[0];
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int hid_gos_set_event_return(struct command_report *cmd_rep)
+{
+	if (cmd_rep->data[0] != 0)
+		return -EIO;
+
+	return 0;
+}
+
 static u8 get_endpoint_address(struct hid_device *hdev)
 {
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
@@ -120,6 +248,12 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case GET_MCU_ID:
 		ret = hid_gos_mcu_id_event(cmd_rep);
 		break;
+	case GET_GAMEPAD_CFG:
+		ret = hid_gos_gamepad_cfg_event(cmd_rep);
+		break;
+	case SET_GAMEPAD_CFG:
+		ret = hid_gos_set_event_return(cmd_rep);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -177,17 +311,333 @@ static int mcu_property_out(struct hid_device *hdev, u8 command, u8 index,
 	return ret;
 }
 
+static ssize_t gamepad_property_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count,
+				      enum feature_status_index index)
+{
+	size_t size = 1;
+	u8 val = 0;
+	int ret;
+
+	switch (index) {
+	case FEATURE_GAMEPAD_MODE:
+		ret = sysfs_match_string(gamepad_mode_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case FEATURE_AUTO_SLEEP_TIME:
+		ret = kstrtou8(buf, 10, &val);
+		if (ret)
+			return ret;
+
+		if (val < 0 || val > 255)
+			return -EINVAL;
+		break;
+	case FEATURE_IMU_ENABLE:
+		ret = sysfs_match_string(feature_enabled_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case FEATURE_IMU_BYPASS:
+		ret = sysfs_match_string(feature_enabled_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case FEATURE_RGB_ENABLE:
+		ret = sysfs_match_string(feature_enabled_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case FEATURE_TOUCHPAD_ENABLE:
+		ret = sysfs_match_string(feature_enabled_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case FEATURE_OS_MODE:
+		ret = sysfs_match_string(os_type_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		drvdata.os_mode = val;
+		break;
+	case FEATURE_POLL_RATE:
+		ret = sysfs_match_string(poll_rate_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case FEATURE_DPAD_MODE:
+		ret = sysfs_match_string(dpad_mode_text, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		break;
+	case FEATURE_MOUSE_WHEEL_STEP:
+		ret = kstrtou8(buf, 10, &val);
+		if (ret)
+			return ret;
+		if (val < 1 || val > 127)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!val)
+		size = 0;
+
+	ret = mcu_property_out(drvdata.hdev, SET_GAMEPAD_CFG, index, &val,
+			       size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t gamepad_property_show(struct device *dev,
+				     struct device_attribute *attr, char *buf,
+				     enum feature_status_index index)
+{
+	size_t count = 0;
+	u8 i;
+
+	count = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, index, 0, 0);
+	if (count < 0)
+		return count;
+
+	switch (index) {
+	case FEATURE_GAMEPAD_MODE:
+		i = drvdata.gp_mode;
+		if (i >= ARRAY_SIZE(gamepad_mode_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", gamepad_mode_text[i]);
+		break;
+	case FEATURE_AUTO_SLEEP_TIME:
+		count = sysfs_emit(buf, "%u\n", drvdata.gp_auto_sleep_time);
+		break;
+	case FEATURE_IMU_ENABLE:
+		i = drvdata.imu_sensor_en;
+		if (i >= ARRAY_SIZE(feature_enabled_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", feature_enabled_text[i]);
+		break;
+	case FEATURE_IMU_BYPASS:
+		i = drvdata.imu_bypass_en;
+		if (i >= ARRAY_SIZE(feature_enabled_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", feature_enabled_text[i]);
+		break;
+	case FEATURE_RGB_ENABLE:
+		i = drvdata.rgb_en;
+		if (i >= ARRAY_SIZE(feature_enabled_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", feature_enabled_text[i]);
+		break;
+	case FEATURE_TOUCHPAD_ENABLE:
+		i = drvdata.tp_en;
+		if (i >= ARRAY_SIZE(feature_enabled_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", feature_enabled_text[i]);
+		break;
+	case FEATURE_OS_MODE:
+		i = drvdata.os_mode;
+		if (i >= ARRAY_SIZE(os_type_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", os_type_text[i]);
+		break;
+	case FEATURE_POLL_RATE:
+		i = drvdata.gp_poll_rate;
+		if (i >= ARRAY_SIZE(poll_rate_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", poll_rate_text[i]);
+		break;
+	case FEATURE_DPAD_MODE:
+		i = drvdata.gp_dpad_mode;
+		if (i >= ARRAY_SIZE(dpad_mode_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", dpad_mode_text[i]);
+		break;
+	case FEATURE_MOUSE_WHEEL_STEP:
+		i = drvdata.mouse_step;
+		if (i < 1 || i > 127)
+			return -EINVAL;
+		count = sysfs_emit(buf, "%u\n", i);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static ssize_t gamepad_property_options(struct device *dev,
+					struct device_attribute *attr,
+					char *buf,
+					enum feature_status_index index)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	switch (index) {
+	case FEATURE_GAMEPAD_MODE:
+		for (i = 0; i < ARRAY_SIZE(gamepad_mode_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       gamepad_mode_text[i]);
+		}
+		break;
+	case FEATURE_AUTO_SLEEP_TIME:
+		return sysfs_emit(buf, "0-255\n");
+	case FEATURE_IMU_ENABLE:
+		for (i = 0; i < ARRAY_SIZE(feature_enabled_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       feature_enabled_text[i]);
+		}
+		break;
+	case FEATURE_IMU_BYPASS:
+	case FEATURE_RGB_ENABLE:
+	case FEATURE_TOUCHPAD_ENABLE:
+		for (i = 0; i < ARRAY_SIZE(feature_enabled_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       feature_enabled_text[i]);
+		}
+		break;
+	case FEATURE_OS_MODE:
+		for (i = 0; i < ARRAY_SIZE(os_type_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       os_type_text[i]);
+		}
+		break;
+	case FEATURE_POLL_RATE:
+		for (i = 0; i < ARRAY_SIZE(poll_rate_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       poll_rate_text[i]);
+		}
+		break;
+	case FEATURE_DPAD_MODE:
+		for (i = 0; i < ARRAY_SIZE(dpad_mode_text); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       dpad_mode_text[i]);
+		}
+		break;
+	case FEATURE_MOUSE_WHEEL_STEP:
+		return sysfs_emit(buf, "1-127\n");
+	default:
+		return count;
+	}
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
 static ssize_t mcu_id_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	return sysfs_emit(buf, "%*phN\n", 12, &drvdata.mcu_id);
 }
 
+#define LEGOS_DEVICE_ATTR_RW(_name, _attrname, _rtype, _group)                 \
+	static ssize_t _name##_store(struct device *dev,                       \
+				     struct device_attribute *attr,            \
+				     const char *buf, size_t count)            \
+	{                                                                      \
+		return _group##_property_store(dev, attr, buf, count,          \
+					       _name.index);                   \
+	}                                                                      \
+	static ssize_t _name##_show(struct device *dev,                        \
+				    struct device_attribute *attr, char *buf)  \
+	{                                                                      \
+		return _group##_property_show(dev, attr, buf, _name.index);    \
+	}                                                                      \
+	static ssize_t _name##_##_rtype##_show(                                \
+		struct device *dev, struct device_attribute *attr, char *buf)  \
+	{                                                                      \
+		return _group##_property_options(dev, attr, buf, _name.index); \
+	}                                                                      \
+	static DEVICE_ATTR_RW_NAMED(_name, _attrname)
+
+#define LEGOS_DEVICE_ATTR_RO(_name, _attrname, _group)                        \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return _group##_property_show(dev, attr, buf, _name.index);   \
+	}                                                                     \
+	static DEVICE_ATTR_RO_NAMED(_name, _attrname)
+
+/* Gamepad */
+struct gos_cfg_attr auto_sleep_time = { FEATURE_AUTO_SLEEP_TIME };
+LEGOS_DEVICE_ATTR_RW(auto_sleep_time, "auto_sleep_time", range, gamepad);
+static DEVICE_ATTR_RO(auto_sleep_time_range);
+
+struct gos_cfg_attr dpad_mode = { FEATURE_DPAD_MODE };
+LEGOS_DEVICE_ATTR_RW(dpad_mode, "dpad_mode", index, gamepad);
+static DEVICE_ATTR_RO(dpad_mode_index);
+
+struct gos_cfg_attr gamepad_mode = { FEATURE_GAMEPAD_MODE };
+LEGOS_DEVICE_ATTR_RW(gamepad_mode, "mode", index, gamepad);
+static DEVICE_ATTR_RO_NAMED(gamepad_mode_index, "mode_index");
+
+struct gos_cfg_attr gamepad_poll_rate = { FEATURE_POLL_RATE };
+LEGOS_DEVICE_ATTR_RW(gamepad_poll_rate, "poll_rate", index, gamepad);
+static DEVICE_ATTR_RO_NAMED(gamepad_poll_rate_index, "poll_rate_index");
+
+static struct attribute *legos_gamepad_attrs[] = {
+	&dev_attr_auto_sleep_time.attr,
+	&dev_attr_auto_sleep_time_range.attr,
+	&dev_attr_dpad_mode.attr,
+	&dev_attr_dpad_mode_index.attr,
+	&dev_attr_gamepad_mode.attr,
+	&dev_attr_gamepad_mode_index.attr,
+	&dev_attr_gamepad_poll_rate.attr,
+	&dev_attr_gamepad_poll_rate_index.attr,
+	NULL,
+};
+
+static const struct attribute_group gamepad_attr_group = {
+	.name = "gamepad",
+	.attrs = legos_gamepad_attrs,
+};
+
+/* IMU */
+struct gos_cfg_attr imu_bypass_enabled = { FEATURE_IMU_BYPASS };
+LEGOS_DEVICE_ATTR_RW(imu_bypass_enabled, "bypass_enabled", index, gamepad);
+static DEVICE_ATTR_RO_NAMED(imu_bypass_enabled_index, "bypass_enabled_index");
+
+struct gos_cfg_attr imu_sensor_enabled = { FEATURE_IMU_ENABLE };
+LEGOS_DEVICE_ATTR_RW(imu_sensor_enabled, "sensor_enabled", index, gamepad);
+static DEVICE_ATTR_RO_NAMED(imu_sensor_enabled_index, "sensor_enabled_index");
+
+static struct attribute *legos_imu_attrs[] = {
+	&dev_attr_imu_bypass_enabled.attr,
+	&dev_attr_imu_bypass_enabled_index.attr,
+	&dev_attr_imu_sensor_enabled.attr,
+	&dev_attr_imu_sensor_enabled_index.attr,
+	NULL,
+};
+
+static const struct attribute_group imu_attr_group = {
+	.name = "imu",
+	.attrs = legos_imu_attrs,
+};
+
 /* MCU */
 static DEVICE_ATTR_RO(mcu_id);
 
+struct gos_cfg_attr os_mode = { FEATURE_OS_MODE };
+LEGOS_DEVICE_ATTR_RW(os_mode, "os_mode", index, gamepad);
+static DEVICE_ATTR_RO(os_mode_index);
+
 static struct attribute *legos_mcu_attrs[] = {
 	&dev_attr_mcu_id.attr,
+	&dev_attr_os_mode.attr,
+	&dev_attr_os_mode_index.attr,
 	NULL,
 };
 
@@ -195,8 +645,44 @@ static const struct attribute_group mcu_attr_group = {
 	.attrs = legos_mcu_attrs,
 };
 
+/* Mouse */
+struct gos_cfg_attr mouse_wheel_step = { FEATURE_MOUSE_WHEEL_STEP };
+LEGOS_DEVICE_ATTR_RW(mouse_wheel_step, "step", range, gamepad);
+static DEVICE_ATTR_RO_NAMED(mouse_wheel_step_range, "step_range");
+
+static struct attribute *legos_mouse_attrs[] = {
+	&dev_attr_mouse_wheel_step.attr,
+	&dev_attr_mouse_wheel_step_range.attr,
+	NULL,
+};
+
+static const struct attribute_group mouse_attr_group = {
+	.name = "mouse",
+	.attrs = legos_mouse_attrs,
+};
+
+/* Touchpad */
+struct gos_cfg_attr touchpad_enabled = { FEATURE_TOUCHPAD_ENABLE };
+LEGOS_DEVICE_ATTR_RW(touchpad_enabled, "enabled", index, gamepad);
+static DEVICE_ATTR_RO_NAMED(touchpad_enabled_index, "enabled_index");
+
+static struct attribute *legos_touchpad_attrs[] = {
+	&dev_attr_touchpad_enabled.attr,
+	&dev_attr_touchpad_enabled_index.attr,
+	NULL,
+};
+
+static const struct attribute_group touchpad_attr_group = {
+	.name = "touchpad",
+	.attrs = legos_touchpad_attrs,
+};
+
 static const struct attribute_group *top_level_attr_groups[] = {
+	&gamepad_attr_group,
+	&imu_attr_group,
 	&mcu_attr_group,
+	&mouse_attr_group,
+	&touchpad_attr_group,
 	NULL,
 };
 
@@ -268,6 +754,27 @@ static void hid_gos_cfg_remove(struct hid_device *hdev)
 	hid_set_drvdata(hdev, NULL);
 }
 
+static int hid_gos_cfg_reset_resume(struct hid_device *hdev)
+{
+	u8 os_mode = drvdata.os_mode;
+	int ret;
+
+	ret = mcu_property_out(drvdata.hdev, SET_GAMEPAD_CFG, FEATURE_OS_MODE,
+			       &os_mode, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, FEATURE_OS_MODE, 0,
+			       0);
+	if (ret < 0)
+		return ret;
+
+	if (drvdata.os_mode != os_mode)
+		return -ENODEV;
+
+	return 0;
+}
+
 static int hid_gos_probe(struct hid_device *hdev,
 			 const struct hid_device_id *id)
 {
@@ -326,6 +833,20 @@ static void hid_gos_remove(struct hid_device *hdev)
 	}
 }
 
+static int hid_gos_reset_resume(struct hid_device *hdev)
+{
+	int ep = get_endpoint_address(hdev);
+
+	switch (ep) {
+	case GO_S_CFG_INTF_IN:
+		return hid_gos_cfg_reset_resume(hdev);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct hid_device_id hid_gos_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_QHE,
 			 USB_DEVICE_ID_LENOVO_LEGION_GO_S_XINPUT) },
@@ -340,6 +861,7 @@ static struct hid_driver hid_lenovo_go_s = {
 	.id_table = hid_gos_devices,
 	.probe = hid_gos_probe,
 	.remove = hid_gos_remove,
+	.reset_resume = hid_gos_reset_resume,
 	.raw_event = hid_gos_raw_event,
 };
 module_hid_driver(hid_lenovo_go_s);
-- 
2.51.2


