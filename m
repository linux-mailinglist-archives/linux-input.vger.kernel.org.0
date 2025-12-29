Return-Path: <linux-input+bounces-16721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E6CE5D61
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A1E30274C7
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EE927E7F0;
	Mon, 29 Dec 2025 03:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMGVAVsE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FC9255E53
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978289; cv=none; b=cT2F+DYL+yUH8HTU3lm5sCYbTJmtrvzGm7m79IX0ibqicltnTo+/fjGqLiosARzEE1IStyxZbo4wPywMRLJfymbGFS4x49G3NxoffftvmORWBoJSOEZ1jHfoqeeZ8rISXrx2tp+JEPoZl1pPI7wezDBpxfgXWjloH0Y72iuV4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978289; c=relaxed/simple;
	bh=tNZs0S8Zijac4ZW6CpaZWlugpcI/4pA16X1La22rX5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n04RuxYVyxAS5vfJSAa4w8BCvFAP50m8DqzbayL+fE1s16zmDOEzuWNTWz3fjS2jbXb3Rx2yqVMt78TaJ3HCSVoMjks+/Mjx3Qe5yzfGzYIzpIXidUoTy8c8zxhZoLMH2DEIvMCmi1nI5oGOm4hRl6ntxRyTMOqDATXNpbLxEgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMGVAVsE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f1bc40b35so148269125ad.2
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978284; x=1767583084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IQfKNQR1YN2qCXVPY7PVCVQVuK91xQgxlzV8ELl4us=;
        b=eMGVAVsEGObGZ8UU0uw6QPSSMuWVY17g9H0eVAqWuZ8C5bGRe8oxJ/G/WCeHDHnR07
         29xvyFt1IN7hDEKr64p6K3DpWCif8KiuJAl7esZs/Z/btYuNkxTmkPE7SahasU+T+rhE
         PtYSBUx7nMqj198Szcne5aOW65psju62o8nvdNOPvUoaAvT6FmJqRQletK6IqQff7AQV
         SeyJzD26Wx9vmjcij6wMWFbQT0WnXb95EyEN//zwmajcPZ67tQNWOpyflirRswjh/nmW
         rAQEPhEBagJ3750qmHiJZFdncEccxRK5hegqs3MK/kvpT3Y0kkz/Reqt8mNrYPXdB3QO
         EQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978284; x=1767583084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9IQfKNQR1YN2qCXVPY7PVCVQVuK91xQgxlzV8ELl4us=;
        b=pxD2oiuEab0qK3kAU2/hld//NIv3jxWMcL920Ovs9n8VzNmiy5ndNQ9UnnotU8BEBK
         inocxZJLzKGI/DZQn9ZtZeqkyWiD53gnfFCpXhjpaIP6u3jHj1uFS/vASLO2X/XyGGl5
         F3zuLD0LS5joaEGNtlQpkOIeJOqF5l/TmvS/BlEpk8nSwx3RKVldHEyghgX3qfXd/hQl
         Xkxh/UdfwqCl+O7+HKNZ51iDw9bA6e4PM2+ICl9ZnyOVZKVXuvkdq2MSp1vpDsJJ8GCM
         lEIwDwJAzAmhZav/5hRt2ejXg2fmXfv6Ipw+F8+0bkuyU7g7g1QRsGbeYLmJuC7Li8wV
         NpCA==
X-Forwarded-Encrypted: i=1; AJvYcCXhixBiDOK8QIeqE0d/NrQ/HM5U8VDiJtAWyx2qjuEuzwQRKHjvXyFe1dktzqRSV8RyX0zTCUKhDtULyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMf9zEx7fKOZv22I/wwGHdvL3qYXiEaDQzFvOmBDxG4Ge2aCOl
	eD6mYLTEQ0t+Pc8zLN880oxwp3DsSRMVPNcuZ44vkpsbVkcm5VeqCsJq
X-Gm-Gg: AY/fxX4ER3QLi4Jj82LWhrX9+7e/tCXPZHDOinDH/GzLurl8T28ll7Bv1dquaVS1M9h
	pksSus4xiTfE+bdTZpd3DIFHWVwlhtwN6kYoHxWk6LFPLQovr7SYQJQtOeyC2lZvByHW8lQY10z
	DbgY5jWYfDwXeLkLRRuAzg2duWmVlK9DsL8bhGCexWL3TsxyI0Z86MgemuZBiqDUnyyytXO69TM
	IGx0IRx4NfPaQ/vbDUIkbMYe6wJkZQB8h0yVpS2YZibBPXGqxem0aer3X7O+C4ZQZQWa+5kPiXh
	L+/Dc6LKvTLjVWO14qHm3mitDukqMSeHYY45rE2EnhfYYjt14S4ug/4pXjwemEqOI5dZcxVrNmp
	qoVxuMrp21+s4qU9VeHjpNaKj7rvh+S0PQaKnQUrIQEEfCeB/1e9vPhJAYSZlDWcn+zVpsmRnHn
	+mHpZ+mOwkdtaGJCyFCNzM9omwJUREpG5uVOAN/0SoSXUcmECSEUdlgI7i5lTL5m0=
X-Google-Smtp-Source: AGHT+IHQnnT7tExR1ci3zRSoO4izwrF2dBzRsUyZ1Y15a0DYrgefSPPfviRg9+LlIOHVKTE/hNjuHA==
X-Received: by 2002:a05:7022:4583:b0:119:e56b:c762 with SMTP id a92af1059eb24-121722f837fmr26769856c88.39.1766978283505;
        Sun, 28 Dec 2025 19:18:03 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:03 -0800 (PST)
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
Subject: [PATCH v2 07/16] HID: hid-lenovo-go: Add Calibration Settings
Date: Mon, 29 Dec 2025 03:17:44 +0000
Message-ID: <20251229031753.581664-8-derekjohn.clark@gmail.com>
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

Adds calibration enable and last calibration status indicators for the
triggers, joysticks, and handle gyros.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 284 +++++++++++++++++++++++++++++++++++-
 1 file changed, 283 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index c8761297f57b..470878b51e97 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -43,8 +43,11 @@ struct hid_go_cfg {
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
 	u8 fps_mode;
 	u8 gp_left_auto_sleep_time;
+	u8 gp_left_gyro_cal_status;
+	u8 gp_left_joy_cal_status;
 	u8 gp_left_notify_en;
 	u8 gp_left_rumble_mode;
+	u8 gp_left_trigg_cal_status;
 	u32 gp_left_version_firmware;
 	u8 gp_left_version_gen;
 	u32 gp_left_version_hardware;
@@ -52,8 +55,11 @@ struct hid_go_cfg {
 	u32 gp_left_version_protocol;
 	u8 gp_mode;
 	u8 gp_right_auto_sleep_time;
+	u8 gp_right_gyro_cal_status;
+	u8 gp_right_joy_cal_status;
 	u8 gp_right_notify_en;
 	u8 gp_right_rumble_mode;
+	u8 gp_right_trigg_cal_status;
 	u32 gp_right_version_firmware;
 	u8 gp_right_version_gen;
 	u32 gp_right_version_hardware;
@@ -227,7 +233,41 @@ static const char *const rumble_mode_text[] = {
 	[RUMBLE_MODE_RPG] = "rpg",
 };
 
-#define FPS_MODE_DPI           0x02
+#define FPS_MODE_DPI		0x02
+#define TRIGGER_CALIBRATE	0x04
+#define JOYSTICK_CALIBRATE	0x04
+#define GYRO_CALIBRATE		0x06
+
+enum cal_device_type {
+	CALDEV_GYROSCOPE = 0x01,
+	CALDEV_JOYSTICK,
+	CALDEV_TRIGGER,
+	CALDEV_JOY_TRIGGER,
+};
+
+enum cal_enable {
+	CAL_UNKNOWN,
+	CAL_START,
+	CAL_STOP,
+};
+
+static const char *const cal_enabled_text[] = {
+	[CAL_UNKNOWN] = "unknown",
+	[CAL_START] = "start",
+	[CAL_STOP] = "stop",
+};
+
+enum cal_status_index {
+	CAL_STAT_UNKNOWN,
+	CAL_STAT_SUCCESS,
+	CAL_STAT_FAILURE,
+};
+
+static const char *const cal_status_text[] = {
+	[CAL_STAT_UNKNOWN] = "unknown",
+	[CAL_STAT_SUCCESS] = "success",
+	[CAL_STAT_FAILURE] = "failure",
+};
 
 enum rgb_config_index {
 	LIGHT_CFG_ALL = 0x01,
@@ -264,6 +304,13 @@ static const char *const rgb_effect_text[] = {
 	[RGB_EFFECT_RAINBOW] = "rainbow",
 };
 
+enum device_status_index {
+	GET_CAL_STATUS = 0x02,
+	GET_UPGRADE_STATUS,
+	GET_MACRO_REC_STATUS,
+	GET_HOTKEY_TRIGG_STATUS,
+};
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -508,6 +555,44 @@ static int hid_go_light_event(struct command_report *cmd_rep)
 	}
 }
 
+static int hid_go_device_status_event(struct command_report *cmd_rep)
+{
+	switch (cmd_rep->device_type) {
+	case LEFT_CONTROLLER:
+		switch (cmd_rep->data[0]) {
+		case CALDEV_GYROSCOPE:
+			drvdata.gp_left_gyro_cal_status = cmd_rep->data[1];
+			return 0;
+		case CALDEV_JOYSTICK:
+			drvdata.gp_left_joy_cal_status = cmd_rep->data[1];
+			return 0;
+		case CALDEV_TRIGGER:
+			drvdata.gp_left_trigg_cal_status = cmd_rep->data[1];
+			return 0;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case RIGHT_CONTROLLER:
+		switch (cmd_rep->data[0]) {
+		case CALDEV_GYROSCOPE:
+			drvdata.gp_right_gyro_cal_status = cmd_rep->data[1];
+			return 0;
+		case CALDEV_JOYSTICK:
+			drvdata.gp_right_joy_cal_status = cmd_rep->data[1];
+			return 0;
+		case CALDEV_TRIGGER:
+			drvdata.gp_right_trigg_cal_status = cmd_rep->data[1];
+			return 0;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int hid_go_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -564,10 +649,16 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 		case GET_RGB_CFG:
 			ret = hid_go_light_event(cmd_rep);
 			break;
+		case GET_DEVICE_STATUS:
+			ret = hid_go_device_status_event(cmd_rep);
+			break;
 		case SET_FEATURE_STATUS:
 		case SET_MOTOR_CFG:
 		case SET_DPI_CFG:
 		case SET_RGB_CFG:
+		case SET_TRIGGER_CFG:
+		case SET_JOYSTICK_CFG:
+		case SET_GYRO_CFG:
 			ret = hid_go_set_event_return(cmd_rep);
 			break;
 		default:
@@ -1152,6 +1243,101 @@ static ssize_t fps_mode_dpi_index_show(struct device *dev,
 	return sysfs_emit(buf, "500 800 1200 1800\n");
 }
 
+static ssize_t device_status_show(struct device *dev,
+				  struct device_attribute *attr, char *buf,
+				  enum device_status_index index,
+				  enum dev_type device_type,
+				  enum cal_device_type cal_type)
+{
+	u8 i;
+
+	switch (index) {
+	case GET_CAL_STATUS:
+		switch (device_type) {
+		case LEFT_CONTROLLER:
+			switch (cal_type) {
+			case CALDEV_GYROSCOPE:
+				i = drvdata.gp_left_gyro_cal_status;
+				break;
+			case CALDEV_JOYSTICK:
+				i = drvdata.gp_left_joy_cal_status;
+				break;
+			case CALDEV_TRIGGER:
+				i = drvdata.gp_left_trigg_cal_status;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		case RIGHT_CONTROLLER:
+			switch (cal_type) {
+			case CALDEV_GYROSCOPE:
+				i = drvdata.gp_right_gyro_cal_status;
+				break;
+			case CALDEV_JOYSTICK:
+				i = drvdata.gp_right_joy_cal_status;
+				break;
+			case CALDEV_TRIGGER:
+				i = drvdata.gp_right_trigg_cal_status;
+				break;
+			default:
+				return -EINVAL;
+			}
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	};
+
+	if (i >= ARRAY_SIZE(cal_status_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", cal_status_text[i]);
+}
+
+static ssize_t calibrate_config_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, u8 cmd, u8 sub_cmd,
+				      size_t count, enum dev_type device_type)
+{
+	size_t size = 1;
+	u8 val = 0;
+	int ret;
+
+	ret = sysfs_match_string(cal_enabled_text, buf);
+	if (ret < 0)
+		return ret;
+
+	val = ret;
+	if (!val)
+		size = 0;
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, cmd, sub_cmd,
+			       device_type, &val, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t calibrate_config_options(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(cal_enabled_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", cal_enabled_text[i]);
+
+	buf[count - 1] = '\n';
+
+	return count;
+}
+
 static int rgb_cfg_call(struct hid_device *hdev, enum mcu_command_index cmd,
 			enum rgb_config_index index, u8 *val, size_t size)
 {
@@ -1458,6 +1644,30 @@ static void hid_go_brightness_set(struct led_classdev *led_cdev,
 	}                                                                     \
 	static DEVICE_ATTR_RO_NAMED(_name, _attrname)
 
+#define LEGO_CAL_DEVICE_ATTR(_name, _attrname, _scmd, _dtype, _rtype)         \
+	static ssize_t _name##_store(struct device *dev,                      \
+				     struct device_attribute *attr,           \
+				     const char *buf, size_t count)           \
+	{                                                                     \
+		return calibrate_config_store(dev, attr, buf, _name.index,    \
+					      _scmd, count, _dtype);          \
+	}                                                                     \
+	static ssize_t _name##_##_rtype##_show(                               \
+		struct device *dev, struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return calibrate_config_options(dev, attr, buf);              \
+	}                                                                     \
+	static DEVICE_ATTR_WO_NAMED(_name, _attrname)
+
+#define LEGO_DEVICE_STATUS_ATTR(_name, _attrname, _scmd, _dtype)              \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return device_status_show(dev, attr, buf, _name.index, _scmd, \
+					  _dtype);                            \
+	}                                                                     \
+	static DEVICE_ATTR_RO_NAMED(_name, _attrname)
+
 /* Gamepad - MCU */
 struct go_cfg_attr version_product_mcu = { PRODUCT_VERSION };
 LEGO_DEVICE_ATTR_RO(version_product_mcu, "product_version", USB_MCU, version);
@@ -1595,9 +1805,45 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_left, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_left_index,
 			    "rumble_notification_index");
 
+struct go_cfg_attr cal_trigg_left = { TRIGGER_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_trigg_left, "calibrate_trigger", SET_TRIGGER_CFG,
+		     LEFT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_trigg_left_index, "calibrate_trigger_index");
+
+struct go_cfg_attr cal_joy_left = { JOYSTICK_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_joy_left, "calibrate_joystick", SET_JOYSTICK_CFG,
+		     LEFT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_joy_left_index, "calibrate_joystick_index");
+
+struct go_cfg_attr cal_gyro_left = { GYRO_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_gyro_left, "calibrate_gyro", SET_GYRO_CFG,
+		     LEFT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_gyro_left_index, "calibrate_gyro_index");
+
+struct go_cfg_attr cal_trigg_left_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_trigg_left_status, "calibrate_trigger_status",
+			LEFT_CONTROLLER, CALDEV_TRIGGER);
+
+struct go_cfg_attr cal_joy_left_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_joy_left_status, "calibrate_joystick_status",
+			LEFT_CONTROLLER, CALDEV_JOYSTICK);
+
+struct go_cfg_attr cal_gyro_left_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_gyro_left_status, "calibrate_gyro_status",
+			LEFT_CONTROLLER, CALDEV_GYROSCOPE);
+
 static struct attribute *left_gamepad_attrs[] = {
 	&dev_attr_auto_sleep_time_left.attr,
 	&dev_attr_auto_sleep_time_left_range.attr,
+	&dev_attr_cal_gyro_left.attr,
+	&dev_attr_cal_gyro_left_index.attr,
+	&dev_attr_cal_gyro_left_status.attr,
+	&dev_attr_cal_joy_left.attr,
+	&dev_attr_cal_joy_left_index.attr,
+	&dev_attr_cal_joy_left_status.attr,
+	&dev_attr_cal_trigg_left.attr,
+	&dev_attr_cal_trigg_left_index.attr,
+	&dev_attr_cal_trigg_left_status.attr,
 	&dev_attr_imu_bypass_left.attr,
 	&dev_attr_imu_bypass_left_index.attr,
 	&dev_attr_imu_enable_left.attr,
@@ -1666,9 +1912,45 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_right, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_right_index,
 			    "rumble_notification_index");
 
+struct go_cfg_attr cal_trigg_right = { TRIGGER_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_trigg_right, "calibrate_trigger", SET_TRIGGER_CFG,
+		     RIGHT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_trigg_right_index, "calibrate_trigger_index");
+
+struct go_cfg_attr cal_joy_right = { JOYSTICK_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_joy_right, "calibrate_joystick", SET_JOYSTICK_CFG,
+		     RIGHT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_joy_right_index, "calibrate_joystick_index");
+
+struct go_cfg_attr cal_gyro_right = { GYRO_CALIBRATE };
+LEGO_CAL_DEVICE_ATTR(cal_gyro_right, "calibrate_gyro", SET_GYRO_CFG,
+		     RIGHT_CONTROLLER, index);
+static DEVICE_ATTR_RO_NAMED(cal_gyro_right_index, "calibrate_gyro_index");
+
+struct go_cfg_attr cal_trigg_right_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_trigg_right_status, "calibrate_trigger_status",
+			RIGHT_CONTROLLER, CALDEV_TRIGGER);
+
+struct go_cfg_attr cal_joy_right_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_joy_right_status, "calibrate_joystick_status",
+			RIGHT_CONTROLLER, CALDEV_JOYSTICK);
+
+struct go_cfg_attr cal_gyro_right_status = { GET_CAL_STATUS };
+LEGO_DEVICE_STATUS_ATTR(cal_gyro_right_status, "calibrate_gyro_status",
+			RIGHT_CONTROLLER, CALDEV_GYROSCOPE);
+
 static struct attribute *right_gamepad_attrs[] = {
 	&dev_attr_auto_sleep_time_right.attr,
 	&dev_attr_auto_sleep_time_right_range.attr,
+	&dev_attr_cal_gyro_right.attr,
+	&dev_attr_cal_gyro_right_index.attr,
+	&dev_attr_cal_gyro_right_status.attr,
+	&dev_attr_cal_joy_right.attr,
+	&dev_attr_cal_joy_right_index.attr,
+	&dev_attr_cal_joy_right_status.attr,
+	&dev_attr_cal_trigg_right.attr,
+	&dev_attr_cal_trigg_right_index.attr,
+	&dev_attr_cal_trigg_right_status.attr,
 	&dev_attr_imu_bypass_right.attr,
 	&dev_attr_imu_bypass_right_index.attr,
 	&dev_attr_imu_enable_right.attr,
-- 
2.51.2


