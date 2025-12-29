Return-Path: <linux-input+bounces-16727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4600CE5D55
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E40493012CD8
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30762750FB;
	Mon, 29 Dec 2025 03:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRmfy+ML"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA7425DD1E
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978294; cv=none; b=XmsKK52aKo1QwyDyjQxdr8ylucq+jdzzMzqwdFMmVmICGRtRF6fHJuYKzaDdmcoM1tm5p0dw6+O2kD/yWNKT35gsA0rzT4AApKsUvnXbsnHQ+5e9WWor//FGolj+E3chJDz7/IDyVbhoz+KjbLaUYeopeVlAaOxYtAb0l3ftoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978294; c=relaxed/simple;
	bh=IUvo+u2e1SrpUl39JLlNAQlGoj/E9x719j6K58inOTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHTAAz15cVESZaXoPP5MRLOT3Qccy3lBRi0jftekNwpXmD5HrNhJw44L1MeI2h+aZIPvucnQc60iQ7hUNwORVn1cMkG/D+OuQgTkcYHBUfCH0d9XSCEqwshTYLDdmhfF2s9h4O4hwXhDex9znC7JOOie7eWZeRRXRHU7xbYHb1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRmfy+ML; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso5250898a12.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978289; x=1767583089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yn94LU96Z2B+v/2xA7vRHpP471K3U6dTWIu2Ddfkl2Q=;
        b=jRmfy+MLN+dCnqXGTT9MQmKIQjche36HVqYs8HpTf5edaF3CcFePNv/eDZ/7YgRSCS
         SJeVbQj9pmN7uXW5hQ7/FeoOQU9OxSugeshviGb2PDkXNavc7o4YYhcdMV5tUrYopsAU
         MxGOj6KgpYtB3PeMHKPJQOIBCM/NZFdmJgzPQpUUudSrpqARO4y3uEcwC0yApk+sZaKF
         oSgAK/UQJOZDyf3MfXAF/gAEKqLBPhJU1WjUlZdgISHQoVrGm1/lPwcZTJOhM/0/kS2z
         S7uqDPXKr60rMfwCRay5lbbzZ0a0JSpIT1XkadBT0jANdy/DhyjDAMMrbTE2bBsTHjWA
         5/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978289; x=1767583089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yn94LU96Z2B+v/2xA7vRHpP471K3U6dTWIu2Ddfkl2Q=;
        b=D9aPkeYk60infYdlr9BeTecpEnfu8y+3F7FC2n0/6j3bKGjWCqIbTMGvqsbQDSyJes
         qZA47jze2jPnV7a7IyGjPbz3oKedCE7u/HMgEkYqzQ2L2ECgr0FDFqlQou/bSb9nB9h/
         juYPogvDaU7kgdU7Wud/NKwvHj6yFD1V70JbcqhiNRo+QbP72f+OE8JpYNntUg3xwI+A
         cXhIzYG2KFOq/+UbKPH5Rmg6S2Gu/CA9roTDsuaFsUK9fKKTd467Uu+Eces2uZcYAfqe
         v6E02MfWlIlRVE1DXk9Cr0tcgOmMjhQFme+0XJzkXH9AgxOU+50yKwwVGxZJSs0wYSfu
         qK9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCI04Wi3pnjDZLEeUBYgXTx2xYXfZHNwNs78oVQ/B4vuk+j9wjJErfgNQbR5t8l+PL63vSFwp9D9xiNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysknNRYehivPFWKpbyFGKkLBjsHhcH3izAEfWlo+mSGv9VKNJ2
	ObtBnIBB6FqjDosiAVndwioJEdFaqYUWicqVWBTKIi87ziPtnmpbZDiM
X-Gm-Gg: AY/fxX75rvsQbMEMRqY//KUEeIp5bTiJ5Ju3RJh8+3ikG5LtwyRAUpHlEFqfSIocmez
	9b86IAO0nTk1CwvM+POOJBpFvA3RDUxUvFE7x8yLFp5OznjmRxFuUB9sKVpjS/ybwrWPrMVLbLe
	LcQzj8DWVOBCam7jJ4GUvUYRq3FUN2hqDlQohCLSJVTA/IfoSSGB5/jzic8PzBDHr6IOplBgyYH
	EmET5EcsUpuUA1Q7MY7eO2cpMufYufDO+vwm2l/ez1DKftM+9AxBfeU0++G54EiUOlZTdXZdUhy
	NdNKQk9qGfkchIuWuINLozjWqAQOju8YqlcFNk3rxd4YyAvKoU5yECT9Y2IULRlrV7rEW/FS7Ks
	oLl+X218qS8eHNxoIAqXZw6RN0nZxZ8zFucdHl1GvpG+KDjq8X1iMhjJ/RR1FgGee0/XwLL2rCG
	hyTmM/Ure4wjOowDBgiiY4aJBs9d/uUDpH4NqvgtBcK+kSEl233A6Rzl06HuRK6tY=
X-Google-Smtp-Source: AGHT+IFQ5fbCr21d6zsw6uYA1gOZsyHt90UhAMUtwWfZf5dhOP8cfNLe5vdZhiKaUYPmyinJjXAt8Q==
X-Received: by 2002:a05:7022:2526:b0:119:e56b:98be with SMTP id a92af1059eb24-121723031f8mr27749537c88.37.1766978289476;
        Sun, 28 Dec 2025 19:18:09 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:18:09 -0800 (PST)
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
Subject: [PATCH v2 15/16] HID: hid-lenovo-go-s: Add IMU and Touchpad RO Attributes
Date: Mon, 29 Dec 2025 03:17:52 +0000
Message-ID: <20251229031753.581664-16-derekjohn.clark@gmail.com>
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

Adds attributes for reporting the touchpad manufacturer, version, and
IMU manufacturer.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 108 ++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index e422f3977517..11000cf54e56 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -43,6 +43,7 @@ struct hid_gos_cfg {
 	u8 gp_mode;
 	u8 gp_poll_rate;
 	u8 imu_bypass_en;
+	u8 imu_manufacturer;
 	u8 imu_sensor_en;
 	u8 mcu_id[12];
 	u8 mouse_step;
@@ -54,6 +55,8 @@ struct hid_gos_cfg {
 	u8 rgb_speed;
 	u8 tp_en;
 	u8 tp_linux_mode;
+	u8 tp_manufacturer;
+	u8 tp_version;
 	u8 tp_windows_mode;
 } drvdata;
 
@@ -201,6 +204,36 @@ enum rgb_config_index {
 	USR_LIGHT_PROFILE_3,
 };
 
+enum test_command_index {
+	TEST_TP_MFR = 0x02,
+	TEST_IMU_MFR,
+	TEST_TP_VER,
+};
+
+enum tp_mfr_index {
+	TP_NONE,
+	TP_BETTERLIFE,
+	TP_SIPO,
+};
+
+static const char *const touchpad_manufacturer_text[] = {
+	[TP_NONE] = "none",
+	[TP_BETTERLIFE] = "BetterLife",
+	[TP_SIPO] = "SIPO",
+};
+
+enum imu_mfr_index {
+	IMU_NONE,
+	IMU_BOSCH,
+	IMU_ST,
+};
+
+static const char *const imu_manufacturer_text[] = {
+	[IMU_NONE] = "none",
+	[IMU_BOSCH] = "Bosch",
+	[IMU_ST] = "ST",
+};
+
 static int hid_gos_version_event(u8 *data)
 {
 	struct version_report *ver_rep = (struct version_report *)data;
@@ -279,6 +312,30 @@ static int hid_gos_touchpad_event(struct command_report *cmd_rep)
 	return ret;
 }
 
+static int hid_gos_pl_test_event(struct command_report *cmd_rep)
+{
+	int ret = 0;
+
+	switch (cmd_rep->sub_cmd) {
+	case TEST_TP_MFR:
+		drvdata.tp_manufacturer = cmd_rep->data[0];
+		ret = 0;
+		break;
+	case TEST_IMU_MFR:
+		drvdata.imu_manufacturer = cmd_rep->data[0];
+		ret = 0;
+		break;
+	case TEST_TP_VER:
+		drvdata.tp_version = cmd_rep->data[0];
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
 static int hid_gos_light_event(struct command_report *cmd_rep)
 {
 	struct led_classdev_mc *mc_cdev;
@@ -362,6 +419,9 @@ static int hid_gos_raw_event(struct hid_device *hdev, struct hid_report *report,
 	case GET_TP_PARAM:
 		ret = hid_gos_touchpad_event(cmd_rep);
 		break;
+	case GET_PL_TEST:
+		ret = hid_gos_pl_test_event(cmd_rep);
+		break;
 	case GET_RGB_CFG:
 		ret = hid_gos_light_event(cmd_rep);
 		break;
@@ -742,6 +802,42 @@ static ssize_t touchpad_property_options(struct device *dev,
 	return count;
 }
 
+static ssize_t test_property_show(struct device *dev,
+				  struct device_attribute *attr, char *buf,
+				  enum test_command_index index)
+{
+	size_t count = 0;
+	int ret;
+	u8 i;
+
+	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, index, 0, 0);
+	if (ret)
+		return ret;
+
+	switch (index) {
+	case TEST_TP_MFR:
+		i = drvdata.tp_manufacturer;
+		if (i >= ARRAY_SIZE(touchpad_manufacturer_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", touchpad_manufacturer_text[i]);
+		break;
+	case TEST_IMU_MFR:
+		i = drvdata.imu_manufacturer;
+		if (i >= ARRAY_SIZE(imu_manufacturer_text))
+			return -EINVAL;
+		count = sysfs_emit(buf, "%s\n", imu_manufacturer_text[i]);
+		break;
+	case TEST_TP_VER:
+		count = sysfs_emit(buf, "%u\n", drvdata.tp_version);
+		break;
+	default:
+		count = -EINVAL;
+		break;
+	}
+
+	return count;
+}
+
 static ssize_t mcu_id_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
@@ -1085,6 +1181,9 @@ struct gos_cfg_attr imu_bypass_enabled = { FEATURE_IMU_BYPASS };
 LEGOS_DEVICE_ATTR_RW(imu_bypass_enabled, "bypass_enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(imu_bypass_enabled_index, "bypass_enabled_index");
 
+struct gos_cfg_attr imu_manufacturer = { TEST_IMU_MFR };
+LEGOS_DEVICE_ATTR_RO(imu_manufacturer, "manufacturer", test);
+
 struct gos_cfg_attr imu_sensor_enabled = { FEATURE_IMU_ENABLE };
 LEGOS_DEVICE_ATTR_RW(imu_sensor_enabled, "sensor_enabled", index, gamepad);
 static DEVICE_ATTR_RO_NAMED(imu_sensor_enabled_index, "sensor_enabled_index");
@@ -1092,6 +1191,7 @@ static DEVICE_ATTR_RO_NAMED(imu_sensor_enabled_index, "sensor_enabled_index");
 static struct attribute *legos_imu_attrs[] = {
 	&dev_attr_imu_bypass_enabled.attr,
 	&dev_attr_imu_bypass_enabled_index.attr,
+	&dev_attr_imu_manufacturer.attr,
 	&dev_attr_imu_sensor_enabled.attr,
 	&dev_attr_imu_sensor_enabled_index.attr,
 	NULL,
@@ -1145,6 +1245,12 @@ struct gos_cfg_attr touchpad_linux_mode = { CFG_LINUX_MODE };
 LEGOS_DEVICE_ATTR_RW(touchpad_linux_mode, "linux_mode", index, touchpad);
 static DEVICE_ATTR_RO_NAMED(touchpad_linux_mode_index, "linux_mode_index");
 
+struct gos_cfg_attr touchpad_manufacturer = { TEST_TP_MFR };
+LEGOS_DEVICE_ATTR_RO(touchpad_manufacturer, "manufacturer", touchpad);
+
+struct gos_cfg_attr touchpad_version = { TEST_TP_VER };
+LEGOS_DEVICE_ATTR_RO(touchpad_version, "version", touchpad);
+
 struct gos_cfg_attr touchpad_windows_mode = { CFG_WINDOWS_MODE };
 LEGOS_DEVICE_ATTR_RW(touchpad_windows_mode, "windows_mode", index, touchpad);
 static DEVICE_ATTR_RO_NAMED(touchpad_windows_mode_index, "windows_mode_index");
@@ -1154,6 +1260,8 @@ static struct attribute *legos_touchpad_attrs[] = {
 	&dev_attr_touchpad_enabled_index.attr,
 	&dev_attr_touchpad_linux_mode.attr,
 	&dev_attr_touchpad_linux_mode_index.attr,
+	&dev_attr_touchpad_manufacturer.attr,
+	&dev_attr_touchpad_version.attr,
 	&dev_attr_touchpad_windows_mode.attr,
 	&dev_attr_touchpad_windows_mode_index.attr,
 	NULL,
-- 
2.51.2


