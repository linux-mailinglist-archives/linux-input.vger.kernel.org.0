Return-Path: <linux-input+bounces-16719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8EFCE5D52
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E549301D0D0
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54B42777FC;
	Mon, 29 Dec 2025 03:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR6guHCr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C801271A9A
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978286; cv=none; b=jMaHIhrSwWuUA0qmc58ncJ9MFaq4O5ANH3Bqf/crPiyzzzt2v+Vbm1CA8xUSlJciQWc/LSJ1/VWRGOEqvIaAHheOy6TuHfpoEtIe1nJOMZ2D0TD562eggDFdXa0i9iboF1yy+KlVrL1+tddfTw2Be/Uj1Y6QD/sA9QpnB7cdJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978286; c=relaxed/simple;
	bh=k7cB8bimuZ6oT1v9Gj2n603wXmKa2cfulwV2tmsbxI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RlgtDMF09eIgmrYY7CoJlj9ShJTfU3xYw0pLU9+lP/4s5Y+G2grCWOp+4qx9mWo35H64UySurM50A2hXwEXztxNngow18VcW1HAllfywqcT/FYOO4Wv6jPZa/fYYzwTeue0/EToMnjPgk48UclkoqjCPlky/IOfr/ZRI4exMvnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OR6guHCr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d52768ccso108104205ad.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978283; x=1767583083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+x3dVzic0jLrP+IFVUqMXKs9oATFGZqyVhG2bgRl5N0=;
        b=OR6guHCr2Hn/W/MgC0uMadrPWdkLEPk5oEN2p+fXiccP+j3UAxAxGpEQeHgtimYQtZ
         xIpGc8k76uNl60yhp8/P2Cc/MBZabrgSdtmCeThC16VCuD7sfCbBj+1I5W7ygsoZTp9r
         e8XZgUYWV928VvTUyG47efRimYKmGU5+y85SQRiupfqVrfsmbxkDluYk3/ksmSKd3hy7
         GIrfJmpkaJy4TptO+/uVuLrStMHLjJepGftlkJJApa/eriIoklyEjlHcO0Vh4m6M4Nit
         JaZfPzawNk4W1f568aNcBJd9v/I89wpN3Xr8UAT7GSOQ70VbcRJBM/a5nMhga+wxfGHn
         T3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978283; x=1767583083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+x3dVzic0jLrP+IFVUqMXKs9oATFGZqyVhG2bgRl5N0=;
        b=MdPuRK7AP5biClKToS/TeyNs46WWt8zM6qq8Amjcwh8N0DGeV7NU1mUunfCp03sCWO
         EbxpC/OEGZ9ExtaK2lp/pDIQyJwJkIzqena+CGMkcahaEH9ozBSq0gSxB0q36DHvArUv
         5YsIZYVwoUaLPkPU2SMvPmLDFWAvIdD0MWHr/v9LxEj05MXYY+YT0qaPuJSOU+kHC1cT
         /yNkeQSusMbBeR9bWMEWs7YJrI+IfUkzUZTjeY+wB2luI7PHGKo2l8CACA8F+ssnxilh
         o5P6X+7pbTrrIV1avUs0ckxEMniQtNVK9iLcWOx7YSlmxAkZVB0zyoKonMR01rDYhN5Q
         k+uw==
X-Forwarded-Encrypted: i=1; AJvYcCVZI3kDoHHYpXzYJzHVHHHamd6+yvHcDXubWhH+tlMn7xVUKFZgJF9RhuEh9KNngW1ITMxNvnc9nGxZiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ATQIF4Q01aIE+VZ482myxbMYa7IwkW5kPxUySoNrsCbepSCm
	goPf5Rkjptm956lNwryF1Gg0fXKbEEelXutlllBhOB/aayjRzUDiEUjD
X-Gm-Gg: AY/fxX6tlduXL3hFhnuDjcUtyKU47TnpeBzprk49VQM1Z665GHJmSFD+cPlR7kJzWE4
	zfLiRaEiVbNhLURl2nUJY6OeWxgoVjTJnE/KNa7GP9czBxxE/asT3DuZ71fwWvF2uOWmwpY65eW
	TlNp+nanXJaNVqdKDoT9UvSjkrBQkAQVAaAzhpc2gBMkR74wtj9MgNz/EkTD7XlqmSDHkHINV2f
	Wb83PjggZ15teyw6vC11lZBaq1HtpYODJJyicBsFV9X7Z2luHLcTehwt/uIbMS7bRh8sA05eHim
	6u3NfPxiT66TfPaI7rOkyMu9i843AT+C1+k+FTr0rtRexko6IkUyHsvHbpwuKDe/zNqFigSTJ8L
	i73npROYwmB4wjk82NkZjroyegBN4CTdh9RMs59WhA6cBeMWeBm6+5Pwo6golv5Lu+j0gNQ3k9m
	Eawugflj9HS0+dWw7SNS6ek7QR9Utyqalxg2qflHlfRuyoT3Mf+z/Q/Kw89KR8r3k=
X-Google-Smtp-Source: AGHT+IHDA1RLeHSMiZ4j5C3eUkycXt81kF/BBdHJnJmIUy0kuAFrODRuG8IJvvrYQBK5lSQSh85yuQ==
X-Received: by 2002:a05:7022:90a:b0:119:e56b:9590 with SMTP id a92af1059eb24-121722c3c9fmr26435727c88.21.1766978282811;
        Sun, 28 Dec 2025 19:18:02 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:02 -0800 (PST)
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
Subject: [PATCH v2 06/16] HID: hid-lenovo-go: Add RGB LED control interface
Date: Mon, 29 Dec 2025 03:17:43 +0000
Message-ID: <20251229031753.581664-7-derekjohn.clark@gmail.com>
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

Adds an LED multicolor class device and attribute group for controlling
the RGB of the Left and right handles. In addition to the standard
led_cdev attributes, additional attributes that allow for the control of
the effect (monocolor, breathe, rainbow, and chroma), speed of the
effect change, an enable toggle, and profile.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 472 ++++++++++++++++++++++++++++++++++++
 1 file changed, 472 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 96f16ba5526c..c8761297f57b 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -17,12 +17,15 @@
 #include <linux/hid.h>
 #include <linux/jiffies.h>
 #include <linux/kstrtox.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
 #include <linux/usb.h>
+#include <linux/workqueue.h>
+#include <linux/workqueue_types.h>
 
 #include "hid-ids.h"
 
@@ -33,7 +36,9 @@
 
 struct hid_go_cfg {
 	unsigned char *buf;
+	struct delayed_work go_cfg_setup;
 	struct completion send_cmd_complete;
+	struct led_classdev *led_cdev;
 	struct hid_device *hdev;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
 	u8 fps_mode;
@@ -65,7 +70,11 @@ struct hid_go_cfg {
 	u32 mcu_version_product;
 	u32 mcu_version_protocol;
 	u32 mouse_dpi;
+	u8 rgb_effect;
 	u8 rgb_en;
+	u8 rgb_mode;
+	u8 rgb_profile;
+	u8 rgb_speed;
 	u8 tp_en;
 	u8 tp_vibration_en;
 	u8 tp_vibration_intensity;
@@ -220,6 +229,41 @@ static const char *const rumble_mode_text[] = {
 
 #define FPS_MODE_DPI           0x02
 
+enum rgb_config_index {
+	LIGHT_CFG_ALL = 0x01,
+	LIGHT_MODE_SEL,
+	LIGHT_PROFILE_SEL,
+	USR_LIGHT_PROFILE_1,
+	USR_LIGHT_PROFILE_2,
+	USR_LIGHT_PROFILE_3,
+};
+
+enum rgb_mode_index {
+	RGB_MODE_UNKNOWN,
+	RGB_MODE_DYNAMIC,
+	RGB_MODE_CUSTOM,
+};
+
+static const char *const rgb_mode_text[] = {
+	[RGB_MODE_UNKNOWN] = "unknown",
+	[RGB_MODE_DYNAMIC] = "dynamic",
+	[RGB_MODE_CUSTOM] = "custom",
+};
+
+enum rgb_effect_index {
+	RGB_EFFECT_MONO,
+	RGB_EFFECT_BREATHE,
+	RGB_EFFECT_CHROMA,
+	RGB_EFFECT_RAINBOW,
+};
+
+static const char *const rgb_effect_text[] = {
+	[RGB_EFFECT_MONO] = "monocolor",
+	[RGB_EFFECT_BREATHE] = "breathe",
+	[RGB_EFFECT_CHROMA] = "chroma",
+	[RGB_EFFECT_RAINBOW] = "rainbow",
+};
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -437,6 +481,33 @@ static int hid_go_fps_dpi_event(struct command_report *cmd_rep)
 	return 0;
 }
 
+static int hid_go_light_event(struct command_report *cmd_rep)
+{
+	struct led_classdev_mc *mc_cdev;
+
+	switch (cmd_rep->sub_cmd) {
+	case LIGHT_MODE_SEL:
+		drvdata.rgb_mode = cmd_rep->data[0];
+		return 0;
+	case LIGHT_PROFILE_SEL:
+		drvdata.rgb_profile = cmd_rep->data[0];
+		return 0;
+	case USR_LIGHT_PROFILE_1:
+	case USR_LIGHT_PROFILE_2:
+	case USR_LIGHT_PROFILE_3:
+		mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+		drvdata.rgb_effect = cmd_rep->data[0];
+		mc_cdev->subled_info[0].intensity = cmd_rep->data[1];
+		mc_cdev->subled_info[1].intensity = cmd_rep->data[2];
+		mc_cdev->subled_info[2].intensity = cmd_rep->data[3];
+		drvdata.led_cdev->brightness = cmd_rep->data[4];
+		drvdata.rgb_speed = cmd_rep->data[5];
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int hid_go_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -490,9 +561,13 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 		case GET_DPI_CFG:
 			ret = hid_go_fps_dpi_event(cmd_rep);
 			break;
+		case GET_RGB_CFG:
+			ret = hid_go_light_event(cmd_rep);
+			break;
 		case SET_FEATURE_STATUS:
 		case SET_MOTOR_CFG:
 		case SET_DPI_CFG:
+		case SET_RGB_CFG:
 			ret = hid_go_set_event_return(cmd_rep);
 			break;
 		default:
@@ -1077,6 +1152,274 @@ static ssize_t fps_mode_dpi_index_show(struct device *dev,
 	return sysfs_emit(buf, "500 800 1200 1800\n");
 }
 
+static int rgb_cfg_call(struct hid_device *hdev, enum mcu_command_index cmd,
+			enum rgb_config_index index, u8 *val, size_t size)
+{
+	if (cmd != SET_RGB_CFG && cmd != GET_RGB_CFG)
+		return -EINVAL;
+
+	if (index < LIGHT_CFG_ALL || index > USR_LIGHT_PROFILE_3)
+		return -EINVAL;
+
+	return mcu_property_out(hdev, MCU_CONFIG_DATA, cmd, index, UNSPECIFIED,
+				val, size);
+}
+
+static int rgb_attr_show(void)
+{
+	enum rgb_config_index index;
+
+	index = drvdata.rgb_profile + 3;
+
+	return rgb_cfg_call(drvdata.hdev, GET_RGB_CFG, index, 0, 0);
+};
+
+static ssize_t rgb_effect_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	enum rgb_config_index index;
+	u8 effect;
+	int ret;
+
+	ret = sysfs_match_string(rgb_effect_text, buf);
+	if (ret < 0)
+		return ret;
+
+	effect = ret;
+	index = drvdata.rgb_profile + 3;
+	u8 rgb_profile[6] = { effect,
+			      mc_cdev->subled_info[0].intensity,
+			      mc_cdev->subled_info[1].intensity,
+			      mc_cdev->subled_info[2].intensity,
+			      drvdata.led_cdev->brightness,
+			      drvdata.rgb_speed };
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, index, rgb_profile, 6);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_effect = effect;
+	return count;
+};
+
+static ssize_t rgb_effect_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int ret;
+
+	ret = rgb_attr_show();
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_effect >= ARRAY_SIZE(rgb_effect_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", rgb_effect_text[drvdata.rgb_effect]);
+}
+
+static ssize_t rgb_effect_index_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rgb_effect_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", rgb_effect_text[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
+static ssize_t rgb_speed_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	enum rgb_config_index index;
+	int val = 0;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val < 0 || val > 100)
+		return -EINVAL;
+
+	index = drvdata.rgb_profile + 3;
+	u8 rgb_profile[6] = { drvdata.rgb_effect,
+			      mc_cdev->subled_info[0].intensity,
+			      mc_cdev->subled_info[1].intensity,
+			      mc_cdev->subled_info[2].intensity,
+			      drvdata.led_cdev->brightness,
+			      val };
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, index, rgb_profile, 6);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_speed = val;
+
+	return count;
+};
+
+static ssize_t rgb_speed_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	int ret;
+
+	ret = rgb_attr_show();
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_speed > 100)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%hhu\n", drvdata.rgb_speed);
+}
+
+static ssize_t rgb_speed_range_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0-100\n");
+}
+
+static ssize_t rgb_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	int ret;
+	u8 val;
+
+	ret = sysfs_match_string(rgb_mode_text, buf);
+	if (ret <= 0)
+		return ret;
+
+	val = ret;
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, LIGHT_MODE_SEL, &val, 1);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_mode = val;
+
+	return count;
+};
+
+static ssize_t rgb_mode_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	int ret;
+
+	ret = rgb_cfg_call(drvdata.hdev, GET_RGB_CFG, LIGHT_MODE_SEL, 0, 0);
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_mode >= ARRAY_SIZE(rgb_mode_text))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", rgb_mode_text[drvdata.rgb_mode]);
+};
+
+static ssize_t rgb_mode_index_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(rgb_mode_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", rgb_mode_text[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
+static ssize_t rgb_profile_store(struct device *dev,
+				 struct device_attribute *attr, const char *buf,
+				 size_t count)
+{
+	size_t size = 1;
+	int ret;
+	u8 val;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val < 1 || val > 3)
+		return -EINVAL;
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, LIGHT_PROFILE_SEL, &val,
+			   size);
+	if (ret)
+		return ret;
+
+	drvdata.rgb_profile = val;
+
+	return count;
+};
+
+static ssize_t rgb_profile_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	int ret;
+
+	ret = rgb_cfg_call(drvdata.hdev, GET_RGB_CFG, LIGHT_PROFILE_SEL, 0,
+			   0);
+	if (ret)
+		return ret;
+
+	if (drvdata.rgb_profile < 1 || drvdata.rgb_profile > 3)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%hhu\n", drvdata.rgb_profile);
+};
+
+static ssize_t rgb_profile_range_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "1-3\n");
+}
+
+static void hid_go_brightness_set(struct led_classdev *led_cdev,
+				  enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+	enum rgb_config_index index;
+	int ret;
+
+	if (brightness > led_cdev->max_brightness) {
+		dev_err(led_cdev->dev, "Invalid argument\n");
+		return;
+	}
+
+	index = drvdata.rgb_profile + 3;
+	u8 rgb_profile[6] = { drvdata.rgb_effect,
+			      mc_cdev->subled_info[0].intensity,
+			      mc_cdev->subled_info[1].intensity,
+			      mc_cdev->subled_info[2].intensity,
+			      brightness,
+			      drvdata.rgb_speed };
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_RGB_CFG, index, rgb_profile, 6);
+	switch (ret) {
+	case 0:
+		led_cdev->brightness = brightness;
+		break;
+	case -ENODEV: /* during switch to IAP -ENODEV is expected */
+	case -ENOSYS: /* during rmmod -ENOSYS is expected */
+		dev_dbg(led_cdev->dev, "Failed to write RGB profile: %i\n", ret);
+		break;
+	default:
+		dev_err(led_cdev->dev, "Failed to write RGB profile: %i\n", ret);
+	};
+}
+
 #define LEGO_DEVICE_ATTR_RW(_name, _attrname, _dtype, _rtype, _group)         \
 	static ssize_t _name##_store(struct device *dev,                      \
 				     struct device_attribute *attr,           \
@@ -1387,6 +1730,109 @@ static const struct attribute_group *top_level_attr_groups[] = {
 	&touchpad_attr_group,	  NULL,
 };
 
+/* RGB */
+struct go_cfg_attr rgb_enabled = { FEATURE_LIGHT_ENABLE };
+
+LEGO_DEVICE_ATTR_RW(rgb_enabled, "enabled", UNSPECIFIED, index, feature_status);
+static DEVICE_ATTR_RO_NAMED(rgb_effect_index, "effect_index");
+static DEVICE_ATTR_RO_NAMED(rgb_enabled_index, "enabled_index");
+static DEVICE_ATTR_RO_NAMED(rgb_mode_index, "mode_index");
+static DEVICE_ATTR_RO_NAMED(rgb_profile_range, "profile_range");
+static DEVICE_ATTR_RO_NAMED(rgb_speed_range, "speed_range");
+static DEVICE_ATTR_RW_NAMED(rgb_effect, "effect");
+static DEVICE_ATTR_RW_NAMED(rgb_mode, "mode");
+static DEVICE_ATTR_RW_NAMED(rgb_profile, "profile");
+static DEVICE_ATTR_RW_NAMED(rgb_speed, "speed");
+
+static struct attribute *go_rgb_attrs[] = {
+	&dev_attr_rgb_effect.attr,
+	&dev_attr_rgb_effect_index.attr,
+	&dev_attr_rgb_enabled.attr,
+	&dev_attr_rgb_enabled_index.attr,
+	&dev_attr_rgb_mode.attr,
+	&dev_attr_rgb_mode_index.attr,
+	&dev_attr_rgb_profile.attr,
+	&dev_attr_rgb_profile_range.attr,
+	&dev_attr_rgb_speed.attr,
+	&dev_attr_rgb_speed_range.attr,
+	NULL,
+};
+
+static struct attribute_group rgb_attr_group = {
+	.attrs = go_rgb_attrs,
+};
+
+struct mc_subled go_rgb_subled_info[] = {
+	{
+		.color_index = LED_COLOR_ID_RED,
+		.brightness = 0x50,
+		.intensity = 0x24,
+		.channel = 0x1,
+	},
+	{
+		.color_index = LED_COLOR_ID_GREEN,
+		.brightness = 0x50,
+		.intensity = 0x22,
+		.channel = 0x2,
+	},
+	{
+		.color_index = LED_COLOR_ID_BLUE,
+		.brightness = 0x50,
+		.intensity = 0x99,
+		.channel = 0x3,
+	},
+};
+
+struct led_classdev_mc go_cdev_rgb = {
+	.led_cdev = {
+		.name = "go:rgb:joystick_rings",
+		.color = LED_COLOR_ID_RGB,
+		.brightness = 0x50,
+		.max_brightness = 0x64,
+		.brightness_set = hid_go_brightness_set,
+	},
+	.num_colors = ARRAY_SIZE(go_rgb_subled_info),
+	.subled_info = go_rgb_subled_info,
+};
+
+static void cfg_setup(struct work_struct *work)
+{
+	int ret;
+
+	/* RGB */
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA,
+			       GET_FEATURE_STATUS, FEATURE_LIGHT_ENABLE,
+			       UNSPECIFIED, 0, 0);
+	if (ret < 0) {
+		dev_err(drvdata.led_cdev->dev,
+			"Failed to retrieve RGB enabled: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, GET_RGB_CFG,
+			       LIGHT_MODE_SEL, UNSPECIFIED, 0, 0);
+	if (ret < 0) {
+		dev_err(drvdata.led_cdev->dev,
+			"Failed to retrieve RGB Mode: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, MCU_CONFIG_DATA, GET_RGB_CFG,
+			       LIGHT_PROFILE_SEL, UNSPECIFIED, 0, 0);
+	if (ret < 0) {
+		dev_err(drvdata.led_cdev->dev,
+			"Failed to retrieve RGB Profile: %i\n", ret);
+		return;
+	}
+
+	ret = rgb_attr_show();
+	if (ret < 0) {
+		dev_err(drvdata.led_cdev->dev,
+			"Failed to retrieve RGB Profile Data: %i\n", ret);
+		return;
+	}
+}
+
 static int hid_go_cfg_probe(struct hid_device *hdev,
 			    const struct hid_device_id *_id)
 {
@@ -1409,14 +1855,40 @@ static int hid_go_cfg_probe(struct hid_device *hdev,
 		return ret;
 	}
 
+	ret = devm_led_classdev_multicolor_register(&hdev->dev, &go_cdev_rgb);
+	if (ret) {
+		dev_err_probe(&hdev->dev, ret, "Failed to create RGB device\n");
+		return ret;
+	}
+
+	ret = devm_device_add_group(go_cdev_rgb.led_cdev.dev, &rgb_attr_group);
+	if (ret) {
+		dev_err_probe(&hdev->dev, ret,
+			      "Failed to create RGB configuration attributes\n");
+		return ret;
+	}
+
+	drvdata.led_cdev = &go_cdev_rgb.led_cdev;
+
 	init_completion(&drvdata.send_cmd_complete);
 
+	/* Executing calls prior to returning from probe will lock the MCU. Schedule
+	 * initial data call after probe has completed and MCU can accept calls.
+	 */
+	INIT_DELAYED_WORK(&drvdata.go_cfg_setup, &cfg_setup);
+	ret = schedule_delayed_work(&drvdata.go_cfg_setup, msecs_to_jiffies(2));
+	if (!ret) {
+		dev_err(&hdev->dev,
+			"Failed to schedule startup delayed work\n");
+		return -ENODEV;
+	}
 	return 0;
 }
 
 static void hid_go_cfg_remove(struct hid_device *hdev)
 {
 	guard(mutex)(&drvdata.cfg_mutex);
+	cancel_delayed_work_sync(&drvdata.go_cfg_setup);
 	sysfs_remove_groups(&hdev->dev.kobj, top_level_attr_groups);
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
-- 
2.51.2


