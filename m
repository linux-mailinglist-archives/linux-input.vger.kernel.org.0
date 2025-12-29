Return-Path: <linux-input+bounces-16720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE890CE5D64
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22E23027D90
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CDB27EC80;
	Mon, 29 Dec 2025 03:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRfOVsAh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59393277016
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978288; cv=none; b=GdTEGmsdC/SVIXeVbiYnxtdvXWFMVoikhuxHY999WZbVaEvZipcM7NGUoJgZF1LgKcywt+64qF2hrw8EX5K01UKDC0EXaQWBLTSqT8gNw3gWDL6ULtFBkK7aGDA3Tyjidho6Ndusbf8u4/kAFjd1K0cCCPXlFjO8TjpGTG3D7ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978288; c=relaxed/simple;
	bh=H1DevgY7ldlq+LgJ4KTfx5nobMC0edHeeHRaeArfCzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmAZZI94WnAWDpYY+H2g31fGuTUMNSX9TT86Nzg4FSnlNFJ3LcmZ4cV0ucYeyD9PGGJpjx4gaXudQ+PK6q5+AosHYi86wZ1cr32AGgBtC3FxISJF4u62beMFPA/yw9cDWeIAg1hvN1f0czlZq9M2pyyVQkFw6vpZ2M2pEM2JRcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRfOVsAh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c13771b2cf9so7305363a12.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978284; x=1767583084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ApPxIyni3cWMMjHk1TPgt3W0M/pYt17LWc/dDcwFVI=;
        b=WRfOVsAhOadQVKLgdJcbPMnt/KYajV14OEpypXF2KLPIdA/N+M4dmRdGNUww34OJLL
         vTsDCpAEUMhowJLCREEfk55cNqdfktW9n3iE/efMxhymSdSzHRFv0hYXmwKpmr2aZuYV
         s7HwhEVaHmT+9Npu8MApCvUs5Tm6pKfgfx9U0rwSEPiZaa6dN04pavEClOiXd2Izrd5l
         XRE4Ut+Emm8I4mrNFbbAppFb8YpBnhhNtwo/z9ykRwxRbOpQhwSgw1EB6XQDHqG3m4ag
         iTL9Dz5/RuxXw4z7KIm/1xvSYa+4Z2x/TTEK4QOIpwyCqRqZdZwVNx5taW1mHL73ibvU
         06sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978284; x=1767583084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ApPxIyni3cWMMjHk1TPgt3W0M/pYt17LWc/dDcwFVI=;
        b=KjgzFq+b9754Pb/gnortkqau4Z+TlqJL0oy2K1jbzWxHyaMtgoA0/vvENYbTWp6/nq
         0PoejUbAVf5LEC4khVMIQryxr81moYYB2K1cEg7Z7Xx3v7BLSP60RV/si4VEcF67qr9G
         bOFcvwGJCdgFwGVGZEbLlfQwV14Wdh5htjB/bcs1DdA+P83OnjSRlvoFdngZeDE+z6Di
         a6jEELGgRbDDgO/KjoV1L9XJhPjBXBtgENa2MQSPSFcu+9J+VYSkT2fqmQ0E14UShp/8
         blYVcdF6D0Frm6Jpque7wjeQqVtv3Pt6GPFOjZ3gli7aOG3hAw86pYmYqeiBlR6gSO5N
         XMCg==
X-Forwarded-Encrypted: i=1; AJvYcCVD4X/lW9ibElhLxMA4GeNBUjRJ329iZuLPb9Hqj7u6ic7af/cnR0ICOuBOhE5/T9G90iCp1cP5j4Z/iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWf3lvdIkyngyEXVJCTqalC4Wz3DZh74LNISL417Ipjda2TbAg
	FxHNeg+F2F7uYZ1R7ZLay/FoKcL4sAj/BmHel6joou8Xsfsory7r4Fvb
X-Gm-Gg: AY/fxX5xXbI+bHcH+inLGyMnz/fgH+OeXvv6DYGOFQsi2IUxATlpoyC3uQ/nD2naxP7
	vMfsfpiuR7XaMJ0LoN4qrBeV/ncLPjgV0L3O6xktzfxEdqVAqDuOI2ARtQH3iWuuc26bO9h762c
	jc+ZzvTcikI7CgonPTMog4iZdbPjwrjURAtB9qCQHuldbykonArKqnKKnJR20juC+fsCMfXDbxG
	qG+3ob0g+H/BTJGZfnv6JQRp7uw5MC9UqB8pbVT9R1vr2cxuQZQMU3OwFNGzMR+vKTHxO1VDhNa
	4sdbbwzyt98PbryEakuDiHUiohkWw4oBBuBgfBDRIXbtF00U9APFK8AFmaO7DkCnbRkOcl23g3m
	U51CAoct0KgkGY/3AHAuMlfaqDx7u+TKK/nLU8eaDVDWmbjg+wHvFjKhN6COLuwqCkzKuQm7oDX
	+O86WxBjL9aEpKThNUpHmiTNhAM+4Fe8U8F0bI4gPyxlFdyXY39iKkraSawXx0f3Y=
X-Google-Smtp-Source: AGHT+IGkT8wJ9FLo7iQAbw/26b3x0f0Nf3C0m7EhEbIkxwCRLJwYybdVJicektb4lrjeCjQzYVpxeQ==
X-Received: by 2002:a05:7022:4287:b0:11b:9386:8268 with SMTP id a92af1059eb24-12172302173mr27788731c88.45.1766978284316;
        Sun, 28 Dec 2025 19:18:04 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:04 -0800 (PST)
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
Subject: [PATCH v2 08/16] HID: hid-lenovo-go: Add OS Mode Toggle
Date: Mon, 29 Dec 2025 03:17:45 +0000
Message-ID: <20251229031753.581664-9-derekjohn.clark@gmail.com>
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

Adds OS Mode toggle, who's primary function is to change the built-in
functional chords to use the right handle legion button instead of the
left handle legion button as the mode shift key. This setting needs to
be restored after resume, so a reset-resume hook is added.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 137 ++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 470878b51e97..f3623871edbf 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -76,6 +76,7 @@ struct hid_go_cfg {
 	u32 mcu_version_product;
 	u32 mcu_version_protocol;
 	u32 mouse_dpi;
+	u8 os_mode;
 	u8 rgb_effect;
 	u8 rgb_en;
 	u8 rgb_mode;
@@ -166,6 +167,8 @@ enum feature_status_index {
 	FEATURE_GAMEPAD_MODE = 0x0e,
 };
 
+#define FEATURE_OS_MODE 0x69
+
 enum fps_switch_status_index {
 	FPS_STATUS_UNKNOWN,
 	GAMEPAD,
@@ -311,6 +314,23 @@ enum device_status_index {
 	GET_HOTKEY_TRIGG_STATUS,
 };
 
+enum os_mode_cfg_index {
+	SET_OS_MODE = 0x09,
+	GET_OS_MODE,
+};
+
+enum os_mode_index {
+	OS_UNKNOWN,
+	WINDOWS,
+	LINUX,
+};
+
+static const char *const os_mode_text[] = {
+	[OS_UNKNOWN] = "unknown",
+	[WINDOWS] = "windows",
+	[LINUX] = "linux",
+};
+
 static int hid_go_version_event(struct command_report *cmd_rep)
 {
 	switch (cmd_rep->sub_cmd) {
@@ -593,6 +613,21 @@ static int hid_go_device_status_event(struct command_report *cmd_rep)
 	}
 }
 
+static int hid_go_os_mode_cfg_event(struct command_report *cmd_rep)
+{
+	switch (cmd_rep->sub_cmd) {
+	case SET_OS_MODE:
+		if (cmd_rep->data[0] != 1)
+			return -EIO;
+		return 0;
+	case GET_OS_MODE:
+		drvdata.os_mode = cmd_rep->data[0];
+		return 0;
+	default:
+		return -EINVAL;
+	};
+}
+
 static int hid_go_set_event_return(struct command_report *cmd_rep)
 {
 	if (cmd_rep->data[0] != 0)
@@ -666,6 +701,9 @@ static int hid_go_raw_event(struct hid_device *hdev, struct hid_report *report,
 			break;
 		};
 		break;
+	case OS_MODE_DATA:
+		ret = hid_go_os_mode_cfg_event(cmd_rep);
+		break;
 	default:
 		goto passthrough;
 	};
@@ -1338,6 +1376,64 @@ static ssize_t calibrate_config_options(struct device *dev,
 	return count;
 }
 
+static ssize_t os_mode_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	size_t size = 1;
+	int ret;
+	u8 val;
+
+	ret = sysfs_match_string(os_mode_text, buf);
+	if (ret <= 0)
+		return ret;
+
+	val = ret;
+	ret = mcu_property_out(drvdata.hdev, OS_MODE_DATA, FEATURE_OS_MODE,
+			       SET_OS_MODE, USB_MCU, &val, size);
+	if (ret < 0)
+		return ret;
+
+	drvdata.os_mode = val;
+
+	return count;
+}
+
+static ssize_t os_mode_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	ssize_t count = 0;
+	int ret;
+	u8 i;
+
+	ret = mcu_property_out(drvdata.hdev, OS_MODE_DATA, FEATURE_OS_MODE,
+			       GET_OS_MODE, USB_MCU, 0, 0);
+	if (ret)
+		return ret;
+
+	i = drvdata.os_mode;
+	if (i >= ARRAY_SIZE(os_mode_text))
+		return -EINVAL;
+
+	count = sysfs_emit(buf, "%s\n", os_mode_text[i]);
+
+	return count;
+}
+
+static ssize_t os_mode_index_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	ssize_t count = 0;
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(os_mode_text); i++)
+		count += sysfs_emit_at(buf, count, "%s ", os_mode_text[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
 static int rgb_cfg_call(struct hid_device *hdev, enum mcu_command_index cmd,
 			enum rgb_config_index index, u8 *val, size_t size)
 {
@@ -1704,6 +1800,9 @@ static DEVICE_ATTR_RO_NAMED(gamepad_rumble_intensity_index,
 static DEVICE_ATTR_RW(fps_mode_dpi);
 static DEVICE_ATTR_RO(fps_mode_dpi_index);
 
+static DEVICE_ATTR_RW(os_mode);
+static DEVICE_ATTR_RO(os_mode_index);
+
 static struct attribute *mcu_attrs[] = {
 	&dev_attr_fps_mode_dpi.attr,
 	&dev_attr_fps_mode_dpi_index.attr,
@@ -1712,6 +1811,8 @@ static struct attribute *mcu_attrs[] = {
 	&dev_attr_gamepad_mode_index.attr,
 	&dev_attr_gamepad_rumble_intensity.attr,
 	&dev_attr_gamepad_rumble_intensity_index.attr,
+	&dev_attr_os_mode.attr,
+	&dev_attr_os_mode_index.attr,
 	&dev_attr_reset_mcu.attr,
 	&dev_attr_version_firmware_mcu.attr,
 	&dev_attr_version_gen_mcu.attr,
@@ -2177,6 +2278,27 @@ static void hid_go_cfg_remove(struct hid_device *hdev)
 	hid_set_drvdata(hdev, NULL);
 }
 
+static int hid_go_cfg_reset_resume(struct hid_device *hdev)
+{
+	u8 os_mode = drvdata.os_mode;
+	int ret;
+
+	ret = mcu_property_out(drvdata.hdev, OS_MODE_DATA, FEATURE_OS_MODE,
+			       SET_OS_MODE, USB_MCU, &os_mode, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = mcu_property_out(drvdata.hdev, OS_MODE_DATA, FEATURE_OS_MODE,
+			       GET_OS_MODE, USB_MCU, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	if (drvdata.os_mode != os_mode)
+		return -ENODEV;
+
+	return 0;
+}
+
 static int hid_go_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret, ep;
@@ -2235,6 +2357,20 @@ static void hid_go_remove(struct hid_device *hdev)
 	}
 }
 
+static int hid_go_reset_resume(struct hid_device *hdev)
+{
+	int ep = get_endpoint_address(hdev);
+
+	switch (ep) {
+	case GO_GP_INTF_IN:
+		return hid_go_cfg_reset_resume(hdev);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct hid_device_id hid_go_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO,
 			 USB_DEVICE_ID_LENOVO_LEGION_GO2_XINPUT) },
@@ -2254,6 +2390,7 @@ static struct hid_driver hid_lenovo_go = {
 	.probe = hid_go_probe,
 	.remove = hid_go_remove,
 	.raw_event = hid_go_raw_event,
+	.reset_resume = hid_go_reset_resume,
 };
 module_hid_driver(hid_lenovo_go);
 
-- 
2.51.2


