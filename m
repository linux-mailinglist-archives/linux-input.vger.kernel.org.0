Return-Path: <linux-input+bounces-13348-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C227BAF6702
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 02:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9F707B6479
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 00:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6237D1F0E47;
	Thu,  3 Jul 2025 00:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfES109k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896231DDC1B;
	Thu,  3 Jul 2025 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503799; cv=none; b=RWww3pVSyMB25tAE0l8nK7YdW8Bo+TJCM486U0YHwQJuNPRev16TgeMAj3iI+ZgRJHOkLaRL9EzMND8w/CIQI5jRrqyASSfEn8Q9DmrqsfLm5Gw345SVqKpHDwiLqpBSKnD9i+pJQGMovIahtbyT5wDRn6OGgs9Dh8YjfXx4LmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503799; c=relaxed/simple;
	bh=kiXH7jDtyuRQQEy0RlM9enfx3lFrGVRjNc8pceWvr/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrRY8Dv6uhDo8XTS2Nw/HizAQU0t75ILYt7QtHOpHXBPdtP8e/jJiLBZrXjTr5n5Yb3mw0pIKUUnccW1kaBrLbf+ZFiHrQlbQpkWucTQQdAax9XhEdek/A7E196OMjnMIihz77LKfL6GF7MLrrVpgZsqSbncZ3GUAKOkuAnYD90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfES109k; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74924255af4so4293047b3a.1;
        Wed, 02 Jul 2025 17:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503796; x=1752108596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eo450L8q5WAnDHHsBBHicHtmkoM2oH+ORKs7xuLc0U=;
        b=GfES109kMC6SDWRTY4Rut92ZGdAaB4OmePryxuAwGo11piihNL8QhCB2y6cqNzpBvD
         XKMBF8kxMEGAyf/C5EnwY94dG6Jap6ku+pENv71AQR6dSKkPE895JzvtZecLDOeETTKz
         XWr3GGi54T3ZjgglXiXor/zx64kLRGFD5ojTlcZA5jF2d/zHDFOXKRjCtZlvZetQlQix
         1GU/c007DqCIx6DP9OagFPzcMzFYKqjo6y/9UbqIYU28Wa1sCkxcGUVApYyF+9b4LMXw
         QcAMsXRC4XGyxhCgvF/pW4XFiAHhJ0VLT9o0oLMHvAmubNOm5h+PCS0iyJygrsJ2mUct
         XRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503796; x=1752108596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eo450L8q5WAnDHHsBBHicHtmkoM2oH+ORKs7xuLc0U=;
        b=xDH3y+f3N8ItMgYD+CIBFxxk17QyYIOv9o3GHjZG4FuHeF9lhLn9iNtoyVUl9ygMBg
         TKZp2OsjeJn2dCxBhUCd2+ByVsxL3JEdlJ6i/91PvcUyeNs3TDmfVWQoH8cryURnjnms
         FCQdWtG7EHfhprJD4HDtncCRwR6ah5ZoxlRlWoWEgJlX5FFtg0SmJDWyArcET1joSb/v
         vBHx0QeV3/K1ZJfHKrtezkGI3ZzsjmSJDBB0m9z8IEl6ma1jf1WMwuU3Fp83A0FcOYCE
         Gi6up8o0m1UrYs7cLyLWxsMJXucVWzvSDu92VBjGqbfjmKbggbOOhwAUICT3wIxROdbA
         YRGw==
X-Forwarded-Encrypted: i=1; AJvYcCV7pMvzTQ5kY29udwxpnf7hSFryPLF6TZkX/ssRXbR5c9aRKCnPSIWF/FcY7P3ciWoCIj68s5sAtQVl/NU=@vger.kernel.org, AJvYcCVbOwBET/5suq+amVK8rHRbEt91pbYVEgBjBFPIxDk97LzD8nL3dlpVMuSc+ktt5dKY1uyzxKw9/XQmzX39@vger.kernel.org, AJvYcCXhQgpJ5VkqugY5QM37Oq4+QhPhTlwdnD4WKoziIpPWU4SleppMn8/eRTMAeILbfGrhQ2eVvbyfpv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw338eng4Ef66z+o2Cv55Hy3Bx7vpXtDCGaZyymlP3QhaXopZox
	ZNqOX9Z05GUgmx1LHo0N+7Lqu7HzGdgdtgReW7GLFdaZAUnXWa1At1lq0yBN9tRy
X-Gm-Gg: ASbGncte102R2KnwKoNnAW0oyB5D1sKH4WiFnHQhbIj8AsHuWnXBwHfAffagpqMiKGI
	zbdb+kNPlQ70XvHVO2oZSKlX4wcaw1v5qdL/kV/W1UENlt8gVMb/wq66oyi/QUyGb0WsTNQHWOf
	PcwR1Xmv+DGX3gInX1PjcDBiC/Bs6jl/fgRLgBofIW7sU+ztJhhabpgSy3WTwEl0i8gmc7FftJw
	SFvSXKwXkFT0bXBl7x7bSjP3iGuVu9Uw7NvUgI2tXXtdvymW2arXXiP6krJSKLuE/5PEAjTKUjt
	0hNpcfC/zDcWdHtG8Agg/pkTRPQ3a/DqAylzJfcyg548+G6WPHTg/raOPciGJG1gIg92301OvtD
	modLckxq6keKtIwIfXTYFQwcr92rwBONhclJZFOXRIA==
X-Google-Smtp-Source: AGHT+IHDqEJXPzx1AOtVQqHuwTrmib2LVCStFFuGQFWA4yoO53bxn2DkkII/dwbOA/NznYiJyGPQbw==
X-Received: by 2002:a05:6a00:1814:b0:740:b5f9:287b with SMTP id d2e1a72fcca58-74b512c2167mr6523841b3a.1.1751503795563;
        Wed, 02 Jul 2025 17:49:55 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c7546sm15369815b3a.111.2025.07.02.17.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:49:55 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 6/6] HID: Add lenovo-legos-hid configuration endpoint interface
Date: Wed,  2 Jul 2025 17:49:43 -0700
Message-ID: <20250703004943.515919-7-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703004943.515919-1-derekjohn.clark@gmail.com>
References: <20250703004943.515919-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the logical interface for the Lenovo Legion Go S configuration
endpoint. This endpoint provides settings for the gamepad, trackpad,
joystick RGB, and MCU information.

The MCU only responds to raw data through hid_raw_output_report. Returns
from this interface take ~800usec and multiple requests will lock the MCU,
so a mutex is used to block additional calls until it can return. After 5ms
the return call is aborted for normal MCU commands. The touchpad is queried
through the MCU over I2C and as such takes longer to respond. The response
for those calls aborts after 200ms.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/lenovo-legos-hid/Makefile |    2 +-
 drivers/hid/lenovo-legos-hid/config.c | 1509 +++++++++++++++++++++++++
 drivers/hid/lenovo-legos-hid/config.h |   19 +
 drivers/hid/lenovo-legos-hid/core.c   |    9 +
 4 files changed, 1538 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hid/lenovo-legos-hid/config.c
 create mode 100644 drivers/hid/lenovo-legos-hid/config.h

diff --git a/drivers/hid/lenovo-legos-hid/Makefile b/drivers/hid/lenovo-legos-hid/Makefile
index 707f1be80c78..ded6158bcbf2 100644
--- a/drivers/hid/lenovo-legos-hid/Makefile
+++ b/drivers/hid/lenovo-legos-hid/Makefile
@@ -2,5 +2,5 @@
 #
 # Makefile - Lenovo Legion Go S Handheld Console Controller driver
 #
-lenovo-legos-hid-y := core.o
+lenovo-legos-hid-y := core.o config.o
 obj-$(CONFIG_LENOVO_LEGOS_HID)	:= lenovo-legos-hid.o
diff --git a/drivers/hid/lenovo-legos-hid/config.c b/drivers/hid/lenovo-legos-hid/config.c
new file mode 100644
index 000000000000..bd148f26c8c7
--- /dev/null
+++ b/drivers/hid/lenovo-legos-hid/config.c
@@ -0,0 +1,1509 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Lenovo Legion Go S devices.
+ *
+ *  Copyright (c) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define BOOL_TO_STR(x) x ? "true" : "false"
+
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/hid.h>
+#include <linux/jiffies.h>
+#include <linux/kstrtox.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/mutex.h>
+#include <linux/printk.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/usb.h>
+#include <linux/workqueue.h>
+#include <linux/workqueue_types.h>
+
+#include "core.h"
+#include "config.h"
+
+struct legos_cfg {
+	struct delayed_work legos_cfg_setup;
+	struct completion send_cmd_complete;
+	struct led_classdev *led_cdev;
+	struct hid_device *hdev;
+	struct mutex cfg_mutex; /* Avoid Send/Rx MCU locking */
+	u8 gp_auto_sleep_time;
+	u8 gp_dpad_mode;
+	u8 gp_mode;
+	u8 gp_poll_rate;
+	bool imu_bypass_en;
+	u8 imu_manufacturer;
+	u8 imu_sensor_en;
+	u8 mcu_id[12];
+	u8 mouse_step;
+	u8 os_mode;
+	u8 rgb_effect;
+	bool rgb_en;
+	u8 rgb_mode;
+	u8 rgb_profile;
+	u8 rgb_speed;
+	bool tp_en;
+	u8 tp_linux_mode;
+	u8 tp_manufacturer;
+	u8 tp_version;
+	u8 tp_windows_mode;
+} drvdata;
+
+/* GET/SET_GAMEPAD_CFG */
+enum GAMEPAD_MODE {
+	XINPUT,
+	DINPUT,
+};
+
+static const char *const GAMEPAD_MODE_TEXT[] = {
+	[XINPUT] = "xinput",
+	[DINPUT] = "dinput",
+};
+
+enum IMU_ENABLED {
+	IMU_OFF,
+	IMU_ON,
+	IMU_OFF_2S,
+};
+
+static const char *const IMU_ENABLED_TEXT[] = {
+	[IMU_OFF] = "false",
+	[IMU_ON] = "true",
+	[IMU_OFF_2S] = "wake-2s",
+};
+
+enum OS_TYPE {
+	WINDOWS,
+	LINUX,
+};
+
+static const char *const OS_TYPE_TEXT[] = {
+	[WINDOWS] = "windows",
+	[LINUX] = "linux",
+};
+
+enum POLL_RATE {
+	HZ125,
+	HZ250,
+	HZ500,
+	HZ1000,
+};
+
+static const char *const POLL_RATE_TEXT[] = {
+	[HZ125] = "125",
+	[HZ250] = "250",
+	[HZ500] = "500",
+	[HZ1000] = "1000",
+};
+
+enum DPAD_MODE {
+	DIR8,
+	DIR4,
+};
+
+static const char *const DPAD_MODE_TEXT[] = {
+	[DIR8] = "8-way",
+	[DIR4] = "4-way",
+};
+
+enum GAMEPAD_CFG_INDEX {
+	NONE = 0x00,
+	CFG_GAMEPAD_MODE, // GAMEPAD_MODE
+	CFG_AUTO_SLP_TIME = 0x04, // 1-255
+	CFG_PASS_ENABLE, // FEATURE_ENABLED
+	CFG_LIGHT_ENABLE, // FEATURE_ENABLED
+	CFG_IMU_ENABLE, // FEATURE_ENABLED
+	CFG_TP_ENABLE, // FEATURE_ENABLED
+	CFG_OS_TYPE = 0x0A, // OS_TYPE
+	CFG_POLL_RATE = 0x10, // POLL_RATE
+	CFG_DPAD_MODE, // DPAD_MODE
+	CFG_MS_WHEEL_STEP, // 1-127
+};
+
+/* GET/SET_TP_PARAM */
+enum TOUCHPAD_MODE {
+	TP_REL,
+	TP_ABS,
+};
+
+static const char *const TOUCHPAD_MODE_TEXT[] = {
+	[TP_REL] = "relative",
+	[TP_ABS] = "absolute",
+};
+
+enum TOUCHPAD_CFG_INDEX {
+	CFG_WINDOWS_MODE = 0x03, // TOUCHPAD_MODE
+	CFG_LINUX_MODE, // TOUCHPAD_MODE
+
+};
+
+enum RGB_MODE {
+	RGB_MODE_DYNAMIC,
+	RGB_MODE_CUSTOM,
+};
+
+static const char *const RGB_MODE_TEXT[] = {
+	[RGB_MODE_DYNAMIC] = "dynamic",
+	[RGB_MODE_CUSTOM] = "custom",
+};
+
+enum RGB_EFFECT {
+	RGB_EFFECT_MONO,
+	RGB_EFFECT_BREATHE,
+	RGB_EFFECT_CHROMA,
+	RGB_EFFECT_RAINBOW,
+};
+
+static const char *const RGB_EFFECT_TEXT[] = {
+	[RGB_EFFECT_MONO] = "monocolor",
+	[RGB_EFFECT_BREATHE] = "breathe",
+	[RGB_EFFECT_CHROMA] = "chroma",
+	[RGB_EFFECT_RAINBOW] = "rainbow",
+};
+
+/* GET/SET_LIGHT_CFG */
+enum LIGHT_CFG_INDEX {
+	LIGHT_MODE_SEL = 0x01,
+	LIGHT_PROFILE_SEL,
+	USR_LIGHT_PROFILE_1,
+	USR_LIGHT_PROFILE_2,
+	USR_LIGHT_PROFILE_3,
+};
+
+enum MCU_COMMAND {
+	SEND_HEARTBEAT,
+	GET_VERSION,
+	GET_MCU_ID,
+	GET_GAMEPAD_CFG,
+	SET_GAMEPAD_CFG,
+	GET_TP_PARAM,
+	SET_TP_PARAM,
+	GET_MOTOR_CFG,
+	SET_MOTOR_CFG,
+	GET_TRIGGER_CFG,
+	SET_TRIGGER_CFG,
+	GET_STICK_CFG,
+	SET_STICK_CFG,
+	GET_GYRO_CFG,
+	SET_GYRO_CFG,
+	GET_LIGHT_CFG,
+	SET_LIGHT_CFG,
+	GET_KEY_MAP,
+	SET_KEY_MAP,
+	INT_EVENT_REPORT = 0xc0,
+	INT_EVENT_CLEAR,
+	GET_PL_TEST = 0xdf,
+	SET_PL_TEST,
+	START_IAP_UPGRADE,
+	DBG_CTRL,
+	PL_TP_TEST,
+	RESTORE_FACTORY,
+	IC_RESET,
+};
+
+/*GET/SET_PL_TEST */
+enum TEST_INDEX {
+	TEST_EN = 0x01,
+	TEST_TP_MFR, // TP_MANUFACTURER
+	TEST_IMU_MFR, // IMU_MANUFACTURER
+	TEST_TP_VER, // u8
+	MOTOR_F0_CALI = 0x10,
+	READ_MOTOR_F0,
+	SAVE_MOTOR_F0,
+	TEST_LED_L = 0x20,
+	TEST_LED_R,
+	LED_COLOR_CALI,
+	STICK_CALI_TH = 0x30,
+	TRIGGER_CALI_TH,
+	STICK_CALI_DEAD,
+	TRIGGER_CALI_DEAD,
+	STICK_CALI_POLARITY,
+	TRIGGER_CALI_POLARITY,
+	GYRO_CALI_CFG,
+	STICK_CALI_TOUT,
+	TRIGGER_CALI_TOUT,
+};
+
+enum TP_MANUFACTURER {
+	TP_NONE,
+	TP_BETTERLIFE,
+	TP_SIPO,
+};
+
+static const char *const TP_MANUFACTURER_TEXT[] = {
+	[TP_NONE] = "None",
+	[TP_BETTERLIFE] = "BetterLife",
+	[TP_SIPO] = "SIPO",
+};
+
+enum IMU_MANUFACTURER {
+	IMU_NONE,
+	IMU_BOSCH,
+	IMU_ST,
+};
+
+static const char *const IMU_MANUFACTURER_TEXT[] = {
+	[IMU_NONE] = "None",
+	[IMU_BOSCH] = "Bosch",
+	[IMU_ST] = "ST",
+};
+
+struct command_report {
+	u8 cmd;
+	u8 sub_cmd;
+	u8 data[63];
+} __packed;
+
+struct version_report {
+	u8 cmd;
+	u32 version;
+	u8 reserved[59];
+} __packed;
+
+struct legos_cfg_rw_attr {
+	u8 index;
+};
+
+int legos_cfg_raw_event(u8 *data, int size)
+{
+	struct led_classdev_mc *mc_cdev;
+	struct command_report *cmd_rep;
+	struct version_report *ver_rep;
+	int ret;
+
+	print_hex_dump_debug("", DUMP_PREFIX_NONE, 16, 1, data, size, false);
+
+	if (size != GO_S_PACKET_SIZE)
+		return -EINVAL;
+
+	cmd_rep = (struct command_report *)data;
+	switch (cmd_rep->cmd) {
+	case GET_VERSION:
+		ver_rep = (struct version_report *)data;
+		drvdata.hdev->firmware_version =
+			__cpu_to_le32(ver_rep->version);
+		ret = 0;
+		break;
+	case GET_MCU_ID:
+		drvdata.mcu_id[0] = cmd_rep->sub_cmd;
+		memcpy(&drvdata.mcu_id[1], cmd_rep->data, 11);
+		ret = 0;
+		break;
+	case GET_GAMEPAD_CFG:
+		switch (cmd_rep->sub_cmd) {
+		case CFG_GAMEPAD_MODE:
+			drvdata.gp_mode = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_AUTO_SLP_TIME:
+			drvdata.gp_auto_sleep_time = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_PASS_ENABLE:
+			drvdata.imu_bypass_en = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_LIGHT_ENABLE:
+			drvdata.rgb_en = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_IMU_ENABLE:
+			drvdata.imu_sensor_en = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_TP_ENABLE:
+			drvdata.tp_en = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_OS_TYPE:
+			drvdata.os_mode = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_POLL_RATE:
+			drvdata.gp_poll_rate = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_DPAD_MODE:
+			drvdata.gp_dpad_mode = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_MS_WHEEL_STEP:
+			drvdata.mouse_step = cmd_rep->data[0];
+			ret = 0;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		break;
+	case GET_TP_PARAM:
+		switch (cmd_rep->sub_cmd) {
+		case CFG_LINUX_MODE:
+			drvdata.tp_linux_mode = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case CFG_WINDOWS_MODE:
+			drvdata.tp_windows_mode = cmd_rep->data[0];
+			ret = 0;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		break;
+	case GET_PL_TEST:
+		switch (cmd_rep->sub_cmd) {
+		case TEST_TP_MFR:
+			drvdata.tp_manufacturer = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case TEST_IMU_MFR:
+			drvdata.imu_manufacturer = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case TEST_TP_VER:
+			drvdata.tp_version = cmd_rep->data[0];
+			ret = 0;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		break;
+	case GET_LIGHT_CFG:
+		switch (cmd_rep->sub_cmd) {
+		case LIGHT_MODE_SEL:
+			drvdata.rgb_mode = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case LIGHT_PROFILE_SEL:
+			drvdata.rgb_profile = cmd_rep->data[0];
+			ret = 0;
+			break;
+		case USR_LIGHT_PROFILE_1:
+		case USR_LIGHT_PROFILE_2:
+		case USR_LIGHT_PROFILE_3:
+			mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+			drvdata.rgb_effect = cmd_rep->data[0];
+			mc_cdev->subled_info[0].intensity = cmd_rep->data[1];
+			mc_cdev->subled_info[1].intensity = cmd_rep->data[2];
+			mc_cdev->subled_info[2].intensity = cmd_rep->data[3];
+			drvdata.led_cdev->brightness = cmd_rep->data[4];
+			drvdata.rgb_speed = cmd_rep->data[5];
+			ret = 0;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		break;
+	case GET_GYRO_CFG:
+	case GET_KEY_MAP:
+	case GET_MOTOR_CFG:
+	case GET_STICK_CFG:
+	case GET_TRIGGER_CFG:
+		ret = -EINVAL;
+		break;
+	case SET_GAMEPAD_CFG:
+	case SET_GYRO_CFG:
+	case SET_KEY_MAP:
+	case SET_LIGHT_CFG:
+	case SET_MOTOR_CFG:
+	case SET_STICK_CFG:
+	case SET_TP_PARAM:
+	case SET_TRIGGER_CFG:
+		ret = -cmd_rep->data[0];
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	};
+
+	if (ret && cmd_rep->cmd != START_IAP_UPGRADE)
+		dev_err(&drvdata.hdev->dev,
+			"Command %u with index %u failed with error code: %x\n",
+			cmd_rep->cmd, cmd_rep->sub_cmd, ret);
+
+	pr_debug("Last command: %u, sub_cmd: %u, ret: %u, val: [%ph]\n",
+		 cmd_rep->cmd, cmd_rep->sub_cmd, ret, cmd_rep->data);
+
+	complete(&drvdata.send_cmd_complete);
+	return ret;
+}
+
+static int legos_cfg_send_cmd(struct hid_device *hdev, u8 *buf, int ep)
+{
+	unsigned char *dmabuf __free(kfree) = NULL;
+	size_t size = GO_S_PACKET_SIZE;
+	int ret;
+
+	pr_debug("Send data as raw output report: [%*ph]\n", GO_S_PACKET_SIZE,
+		 buf);
+
+	dmabuf = kmemdup(buf, size, GFP_KERNEL);
+	if (!dmabuf)
+		return -ENOMEM;
+
+	ret = hid_hw_output_report(hdev, dmabuf, size);
+	if (ret < 0)
+		return ret;
+
+	return ret == size ? 0 : -EINVAL;
+}
+
+static int mcu_property_out(struct hid_device *hdev, enum MCU_COMMAND command,
+			    u8 index, u8 *val, size_t size)
+{
+	u8 outbuf[GO_S_PACKET_SIZE] = { command, index };
+	int ep = get_endpoint_address(hdev);
+	unsigned int i;
+	int timeout = 5;
+	int ret;
+
+	if (ep != LEGION_GO_S_CFG_INTF_IN)
+		return -ENODEV;
+
+	for (i = 0; i < size; i++)
+		outbuf[i + 2] = val[i];
+
+	guard(mutex)(&drvdata.cfg_mutex);
+	ret = legos_cfg_send_cmd(hdev, outbuf, ep);
+	if (ret)
+		return ret;
+
+	/* PL_TEST commands can take longer because they go out to another device */
+	if (command == GET_PL_TEST)
+		timeout = 200;
+
+	ret = wait_for_completion_interruptible_timeout(&drvdata.send_cmd_complete,
+							msecs_to_jiffies(timeout));
+
+	if (ret == 0) /* timeout occurred */
+		ret = -EBUSY;
+	if (ret > 0) /* timeout/interrupt didn't occur */
+		ret = 0;
+
+	reinit_completion(&drvdata.send_cmd_complete);
+	return ret;
+}
+
+/* Read-Write Attributes */
+static ssize_t gamepad_property_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count,
+				      enum GAMEPAD_CFG_INDEX index)
+{
+	size_t size = 1;
+	u8 val = 0;
+	bool res;
+	int ret;
+
+	switch (index) {
+	case CFG_GAMEPAD_MODE: {
+		ret = sysfs_match_string(GAMEPAD_MODE_TEXT, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		drvdata.gp_mode = val;
+		break;
+	}
+	case CFG_AUTO_SLP_TIME:
+		ret = kstrtou8(buf, 10, &val);
+		if (ret)
+			return ret;
+
+		if (val < 0 || val > 255)
+			return -EINVAL;
+		drvdata.gp_auto_sleep_time = val;
+		break;
+	case CFG_IMU_ENABLE:
+		ret = sysfs_match_string(IMU_ENABLED_TEXT, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		drvdata.imu_sensor_en = val;
+		break;
+	case CFG_PASS_ENABLE:
+		ret = kstrtobool(buf, &res);
+		if (ret < 0)
+			return ret;
+		drvdata.imu_bypass_en = res;
+		break;
+	case CFG_LIGHT_ENABLE:
+		ret = kstrtobool(buf, &res);
+		if (ret < 0)
+			return ret;
+		drvdata.rgb_en = res;
+		break;
+	case CFG_TP_ENABLE:
+		ret = kstrtobool(buf, &res);
+		if (ret < 0)
+			return ret;
+		drvdata.tp_en = res;
+		break;
+	case CFG_OS_TYPE:
+		ret = sysfs_match_string(OS_TYPE_TEXT, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		drvdata.os_mode = val;
+		break;
+	case CFG_POLL_RATE:
+		ret = sysfs_match_string(POLL_RATE_TEXT, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		drvdata.gp_poll_rate = val;
+		break;
+	case CFG_DPAD_MODE:
+		ret = sysfs_match_string(DPAD_MODE_TEXT, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		drvdata.gp_dpad_mode = val;
+		break;
+	case CFG_MS_WHEEL_STEP:
+		ret = kstrtou8(buf, 10, &val);
+		if (ret)
+			return ret;
+		if (val < 1 || val > 127)
+			return -EINVAL;
+		drvdata.mouse_step = val;
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
+				     enum GAMEPAD_CFG_INDEX index)
+{
+	size_t count = 0;
+	char *res;
+	u8 i;
+
+	count = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, index, 0, 0);
+	if (count < 0)
+		return count;
+
+	switch (index) {
+	case CFG_GAMEPAD_MODE:
+		i = drvdata.gp_mode;
+		if (i > DINPUT)
+			count = -EINVAL;
+		else
+			count = sysfs_emit(buf, "%s\n", GAMEPAD_MODE_TEXT[i]);
+		break;
+	case CFG_AUTO_SLP_TIME:
+		count = sysfs_emit(buf, "%u\n", drvdata.gp_auto_sleep_time);
+		break;
+	case CFG_IMU_ENABLE:
+		i = drvdata.imu_sensor_en;
+		if (i > IMU_OFF_2S)
+			count = -EINVAL;
+		else
+			count = sysfs_emit(buf, "%s\n", IMU_ENABLED_TEXT[i]);
+		break;
+	case CFG_PASS_ENABLE:
+		res = BOOL_TO_STR(drvdata.imu_bypass_en);
+		count = sysfs_emit(buf, "%s\n", res);
+		break;
+	case CFG_LIGHT_ENABLE:
+		res = BOOL_TO_STR(drvdata.rgb_en);
+		count = sysfs_emit(buf, "%s\n", res);
+		break;
+	case CFG_TP_ENABLE:
+		res = BOOL_TO_STR(drvdata.tp_en);
+		count = sysfs_emit(buf, "%s\n", res);
+		break;
+	case CFG_OS_TYPE:
+		i = drvdata.os_mode;
+		if (i > LINUX)
+			count = -EINVAL;
+		else
+			count = sysfs_emit(buf, "%s\n", OS_TYPE_TEXT[i]);
+		break;
+	case CFG_POLL_RATE:
+		i = drvdata.gp_poll_rate;
+		if (i > HZ1000)
+			count = -EINVAL;
+		else
+			count = sysfs_emit(buf, "%s\n", POLL_RATE_TEXT[i]);
+		break;
+	case CFG_DPAD_MODE:
+		i = drvdata.gp_dpad_mode;
+		if (i > DIR4)
+			count = -EINVAL;
+		else
+			count = sysfs_emit(buf, "%s\n", DPAD_MODE_TEXT[i]);
+		break;
+	case CFG_MS_WHEEL_STEP:
+		i = drvdata.mouse_step;
+		if (i < 1 || i > 127)
+			count = -EINVAL;
+		else
+			count = sysfs_emit(buf, "%u\n", i);
+		break;
+	default:
+		count = -EINVAL;
+		break;
+	}
+
+	return count;
+}
+
+static ssize_t gamepad_property_options(struct device *dev,
+					struct device_attribute *attr,
+					char *buf, enum GAMEPAD_CFG_INDEX index)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	switch (index) {
+	case CFG_GAMEPAD_MODE:
+		for (i = 0; i < ARRAY_SIZE(GAMEPAD_MODE_TEXT); i++)
+			count += sysfs_emit_at(buf, count, "%s ", GAMEPAD_MODE_TEXT[i]);
+		break;
+	case CFG_AUTO_SLP_TIME:
+		return sysfs_emit(buf, "0-255\n");
+	case CFG_IMU_ENABLE:
+		for (i = 0; i < ARRAY_SIZE(IMU_ENABLED_TEXT); i++)
+			count += sysfs_emit_at(buf, count, "%s ", IMU_ENABLED_TEXT[i]);
+		break;
+	case CFG_PASS_ENABLE:
+	case CFG_LIGHT_ENABLE:
+	case CFG_TP_ENABLE:
+		return sysfs_emit(buf, "true false\n");
+	case CFG_OS_TYPE:
+		for (i = 0; i < ARRAY_SIZE(OS_TYPE_TEXT); i++)
+			count += sysfs_emit_at(buf, count, "%s ", OS_TYPE_TEXT[i]);
+		break;
+	case CFG_POLL_RATE:
+		for (i = 0; i < ARRAY_SIZE(POLL_RATE_TEXT); i++)
+			count += sysfs_emit_at(buf, count, "%s ", POLL_RATE_TEXT[i]);
+		break;
+	case CFG_DPAD_MODE:
+		for (i = 0; i < ARRAY_SIZE(DPAD_MODE_TEXT); i++)
+			count += sysfs_emit_at(buf, count, "%s ", DPAD_MODE_TEXT[i]);
+		break;
+	case CFG_MS_WHEEL_STEP:
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
+static ssize_t touchpad_property_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count,
+				       enum TOUCHPAD_CFG_INDEX index)
+{
+	size_t size = 1;
+	u8 val = 0;
+	int ret;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+		ret = sysfs_match_string(TOUCHPAD_MODE_TEXT, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		drvdata.tp_windows_mode = val;
+		break;
+	case CFG_LINUX_MODE:
+		ret = sysfs_match_string(TOUCHPAD_MODE_TEXT, buf);
+		if (ret < 0)
+			return ret;
+		val = ret;
+		drvdata.tp_linux_mode = val;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (!val)
+		size = 0;
+
+	ret = mcu_property_out(drvdata.hdev, SET_TP_PARAM, index, &val, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t touchpad_property_show(struct device *dev,
+				      struct device_attribute *attr, char *buf,
+				      enum TOUCHPAD_CFG_INDEX index)
+{
+	int ret = 0;
+	u8 i;
+
+	ret = mcu_property_out(drvdata.hdev, GET_TP_PARAM, index, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+		i = drvdata.tp_windows_mode;
+		break;
+	case CFG_LINUX_MODE:
+		i = drvdata.tp_linux_mode;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (i > TP_ABS)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", TOUCHPAD_MODE_TEXT[i]);
+}
+
+static ssize_t touchpad_property_options(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf,
+					 enum TOUCHPAD_CFG_INDEX index)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	switch (index) {
+	case CFG_WINDOWS_MODE:
+	case CFG_LINUX_MODE:
+		for (i = 0; i < ARRAY_SIZE(TOUCHPAD_MODE_TEXT); i++) {
+			count += sysfs_emit_at(buf, count, "%s ",
+					       TOUCHPAD_MODE_TEXT[i]);
+		}
+		break;
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
+/* RGB LED */
+static int rgb_cfg_call(struct hid_device *hdev, enum MCU_COMMAND cmd,
+			enum LIGHT_CFG_INDEX index, u8 *val, size_t size)
+{
+	if (cmd != SET_LIGHT_CFG && cmd != GET_LIGHT_CFG)
+		return -EINVAL;
+
+	if (index < LIGHT_MODE_SEL || index > USR_LIGHT_PROFILE_3)
+		return -EINVAL;
+
+	return mcu_property_out(hdev, cmd, index, val, size);
+}
+
+static int rgb_profile_call(enum MCU_COMMAND cmd, u8 *rgb_profile, size_t size)
+{
+	enum LIGHT_CFG_INDEX index;
+
+	index = drvdata.rgb_profile + 2;
+
+	return rgb_cfg_call(drvdata.hdev, cmd, index, rgb_profile, size);
+}
+
+static int rgb_write_profile(void)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(drvdata.led_cdev);
+
+	u8 rgb_profile[6] = { drvdata.rgb_effect,
+			      mc_cdev->subled_info[0].intensity,
+			      mc_cdev->subled_info[1].intensity,
+			      mc_cdev->subled_info[2].intensity,
+			      drvdata.led_cdev->brightness,
+			      drvdata.rgb_speed };
+
+	return rgb_profile_call(SET_LIGHT_CFG, rgb_profile, 6);
+}
+
+static int rgb_attr_show(void)
+{
+	return rgb_profile_call(GET_LIGHT_CFG, 0, 0);
+};
+
+static int rgb_attr_store(void)
+{
+	if (drvdata.rgb_mode != RGB_MODE_CUSTOM)
+		return -EINVAL;
+
+	return rgb_write_profile();
+}
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
+	return sysfs_emit(buf, "%s\n", RGB_EFFECT_TEXT[drvdata.rgb_effect]);
+}
+
+static ssize_t rgb_effect_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	int ret;
+
+	ret = sysfs_match_string(RGB_EFFECT_TEXT, buf);
+	if (ret < 0)
+		return ret;
+
+	drvdata.rgb_effect = ret;
+
+	ret = rgb_attr_store();
+	if (ret)
+		return ret;
+
+	return count;
+};
+
+static ssize_t rgb_effect_index_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(RGB_EFFECT_TEXT); i++)
+		count += sysfs_emit_at(buf, count, "%s ", RGB_EFFECT_TEXT[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
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
+	return sysfs_emit(buf, "%hhu\n", drvdata.rgb_speed);
+}
+
+static ssize_t rgb_speed_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	int val = 0;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val > 100 || val < 0)
+		return -EINVAL;
+
+	drvdata.rgb_speed = val;
+
+	ret = rgb_attr_store();
+	if (ret)
+		return ret;
+
+	return count;
+};
+
+static ssize_t rgb_speed_range_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0-100\n");
+}
+
+static ssize_t rgb_mode_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	return sysfs_emit(buf, "%s\n", RGB_MODE_TEXT[drvdata.rgb_mode]);
+};
+
+static ssize_t rgb_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	size_t size = 1;
+	int ret;
+
+	ret = sysfs_match_string(RGB_MODE_TEXT, buf);
+	if (ret < 0)
+		return ret;
+
+	drvdata.rgb_mode = ret;
+
+	if (!drvdata.rgb_mode)
+		size = 0;
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_LIGHT_CFG, LIGHT_MODE_SEL,
+			   &drvdata.rgb_mode, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+};
+
+static ssize_t rgb_mode_index_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	size_t count = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(RGB_MODE_TEXT); i++)
+		count += sysfs_emit_at(buf, count, "%s ", RGB_MODE_TEXT[i]);
+
+	if (count)
+		buf[count - 1] = '\n';
+
+	return count;
+}
+
+static ssize_t rgb_profile_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%hhu\n", drvdata.rgb_profile);
+};
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
+	if (val > 3 || val < 1)
+		return -EINVAL;
+
+	drvdata.rgb_profile = val;
+
+	if (!drvdata.rgb_profile)
+		size = 0;
+
+	ret = rgb_cfg_call(drvdata.hdev, SET_LIGHT_CFG, LIGHT_PROFILE_SEL,
+			   &drvdata.rgb_profile, size);
+	if (ret < 0)
+		return ret;
+
+	return count;
+};
+
+static ssize_t rgb_profile_range_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "1-3\n");
+}
+
+static enum led_brightness legos_rgb_color_get(struct led_classdev *led_cdev)
+{
+	return led_cdev->brightness;
+};
+
+static void legos_rgb_color_set(struct led_classdev *led_cdev,
+				enum led_brightness brightness)
+{
+	int ret;
+
+	led_cdev->brightness = brightness;
+
+	ret = rgb_attr_store();
+	switch (ret) {
+	case 0:
+		break;
+	case -ENODEV: /* during switch to IAP -ENODEV is expected */
+	case -ENOSYS: /* during rmmod -ENOSYS is expected */
+		dev_dbg(led_cdev->dev, "Failed to write RGB profile: %i\n",
+			ret);
+		break;
+	default:
+		dev_err(led_cdev->dev, "Failed to write RGB profile: %i\n",
+			ret);
+	};
+}
+
+#define DEVICE_ATTR_RO_NAMED(_name, _attrname)               \
+	struct device_attribute dev_attr_##_name = {         \
+		.attr = { .name = _attrname, .mode = 0444 }, \
+		.show = _name##_show,                        \
+	}
+
+#define DEVICE_ATTR_RW_NAMED(_name, _attrname)               \
+	struct device_attribute dev_attr_##_name = {         \
+		.attr = { .name = _attrname, .mode = 0644 }, \
+		.show = _name##_show,                        \
+		.store = _name##_store,                      \
+	}
+
+#define ATTR_LEGOS_GAMEPAD_RW(_name, _attrname, _rtype)                       \
+	static ssize_t _name##_store(struct device *dev,                      \
+				     struct device_attribute *attr,           \
+				     const char *buf, size_t count)           \
+	{                                                                     \
+		return gamepad_property_store(dev, attr, buf, count,          \
+					      _name.index);                   \
+	}                                                                     \
+	static ssize_t _name##_show(struct device *dev,                       \
+				    struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return gamepad_property_show(dev, attr, buf, _name.index);    \
+	}                                                                     \
+	static ssize_t _name##_##_rtype##_show(                               \
+		struct device *dev, struct device_attribute *attr, char *buf) \
+	{                                                                     \
+		return gamepad_property_options(dev, attr, buf, _name.index); \
+	}                                                                     \
+	DEVICE_ATTR_RW_NAMED(_name, _attrname)
+
+#define ATTR_LEGOS_TOUCHPAD_RW(_name, _attrname, _rtype)                       \
+	static ssize_t _name##_store(struct device *dev,                       \
+				     struct device_attribute *attr,            \
+				     const char *buf, size_t count)            \
+	{                                                                      \
+		return touchpad_property_store(dev, attr, buf, count,          \
+					       _name.index);                   \
+	}                                                                      \
+	static ssize_t _name##_show(struct device *dev,                        \
+				    struct device_attribute *attr, char *buf)  \
+	{                                                                      \
+		return touchpad_property_show(dev, attr, buf, _name.index);    \
+	}                                                                      \
+	static ssize_t _name##_##_rtype##_show(                                \
+		struct device *dev, struct device_attribute *attr, char *buf)  \
+	{                                                                      \
+		return touchpad_property_options(dev, attr, buf, _name.index); \
+	}                                                                      \
+	DEVICE_ATTR_RW_NAMED(_name, _attrname)
+
+/* Gamepad */
+struct legos_cfg_rw_attr auto_sleep_time = { CFG_AUTO_SLP_TIME };
+struct legos_cfg_rw_attr dpad_mode = { CFG_DPAD_MODE };
+struct legos_cfg_rw_attr gamepad_mode = { CFG_GAMEPAD_MODE };
+struct legos_cfg_rw_attr gamepad_poll_rate = { CFG_POLL_RATE };
+
+ATTR_LEGOS_GAMEPAD_RW(auto_sleep_time, "auto_sleep_time", range);
+ATTR_LEGOS_GAMEPAD_RW(dpad_mode, "dpad_mode", index);
+ATTR_LEGOS_GAMEPAD_RW(gamepad_mode, "mode", index);
+ATTR_LEGOS_GAMEPAD_RW(gamepad_poll_rate, "poll_rate", index);
+static DEVICE_ATTR_RO(auto_sleep_time_range);
+static DEVICE_ATTR_RO(dpad_mode_index);
+static DEVICE_ATTR_RO_NAMED(gamepad_mode_index, "mode_index");
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
+/* IMU */
+struct legos_cfg_rw_attr imu_bypass_enabled = { CFG_PASS_ENABLE };
+struct legos_cfg_rw_attr imu_manufacturer = { TEST_IMU_MFR };
+struct legos_cfg_rw_attr imu_sensor_enabled = { CFG_IMU_ENABLE };
+
+ATTR_LEGOS_GAMEPAD_RW(imu_bypass_enabled, "bypass_enabled", index);
+ATTR_LEGOS_GAMEPAD_RW(imu_sensor_enabled, "sensor_enabled", index);
+static DEVICE_ATTR_RO_NAMED(imu_bypass_enabled_index, "bypass_enabled_index");
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
+/* MCU */
+struct legos_cfg_rw_attr os_mode = { CFG_OS_TYPE };
+
+ATTR_LEGOS_GAMEPAD_RW(os_mode, "os_mode", index);
+static DEVICE_ATTR_RO(os_mode_index);
+
+static struct attribute *legos_mcu_attrs[] = {
+	&dev_attr_os_mode.attr,
+	&dev_attr_os_mode_index.attr,
+	NULL,
+};
+
+/* RGB */
+struct legos_cfg_rw_attr rgb_enabled = { CFG_LIGHT_ENABLE };
+
+ATTR_LEGOS_GAMEPAD_RW(rgb_enabled, "enabled", index);
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
+static struct attribute *legos_rgb_attrs[] = {
+	&dev_attr_rgb_effect.attr,
+	&dev_attr_rgb_effect_index.attr,
+	&dev_attr_rgb_speed.attr,
+	&dev_attr_rgb_speed_range.attr,
+	&dev_attr_rgb_mode.attr,
+	&dev_attr_rgb_mode_index.attr,
+	&dev_attr_rgb_profile.attr,
+	&dev_attr_rgb_profile_range.attr,
+	&dev_attr_rgb_enabled.attr,
+	&dev_attr_rgb_enabled_index.attr,
+	NULL,
+};
+
+/* Touchpad */
+struct legos_cfg_rw_attr touchpad_enabled = { CFG_TP_ENABLE };
+struct legos_cfg_rw_attr touchpad_linux_mode = { CFG_LINUX_MODE };
+struct legos_cfg_rw_attr touchpad_manufacturer = { TEST_TP_MFR };
+struct legos_cfg_rw_attr touchpad_version = { TEST_TP_VER };
+struct legos_cfg_rw_attr touchpad_windows_mode = { CFG_WINDOWS_MODE };
+
+ATTR_LEGOS_GAMEPAD_RW(touchpad_enabled, "enabled", index);
+ATTR_LEGOS_TOUCHPAD_RW(touchpad_linux_mode, "linux_mode", index);
+ATTR_LEGOS_TOUCHPAD_RW(touchpad_windows_mode, "windows_mode", index);
+static DEVICE_ATTR_RO_NAMED(touchpad_enabled_index, "enabled_index");
+static DEVICE_ATTR_RO_NAMED(touchpad_linux_mode_index, "linux_mode_index");
+static DEVICE_ATTR_RO_NAMED(touchpad_windows_mode_index, "windows_mode_index");
+
+static struct attribute *legos_touchpad_attrs[] = {
+	&dev_attr_touchpad_enabled.attr,
+	&dev_attr_touchpad_enabled_index.attr,
+	&dev_attr_touchpad_linux_mode.attr,
+	&dev_attr_touchpad_linux_mode_index.attr,
+	&dev_attr_touchpad_windows_mode.attr,
+	&dev_attr_touchpad_windows_mode_index.attr,
+	NULL,
+};
+
+static const struct attribute_group gamepad_attr_group = {
+	.name = "gamepad",
+	.attrs = legos_gamepad_attrs,
+};
+
+static const struct attribute_group imu_attr_group = {
+	.name = "imu",
+	.attrs = legos_imu_attrs,
+};
+
+static const struct attribute_group mcu_attr_group = {
+	.attrs = legos_mcu_attrs,
+};
+
+static struct attribute_group rgb_attr_group = {
+	.attrs = legos_rgb_attrs,
+};
+
+static const struct attribute_group touchpad_attr_group = {
+	.name = "touchpad",
+	.attrs = legos_touchpad_attrs,
+};
+
+static const struct attribute_group *legos_top_level_attr_groups[] = {
+	&gamepad_attr_group,
+	&imu_attr_group,
+	&mcu_attr_group,
+	&touchpad_attr_group,
+	NULL,
+};
+
+struct mc_subled legos_rgb_subled_info[] = {
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
+struct led_classdev_mc legos_cdev_rgb = {
+	.led_cdev = {
+		.name = "go_s:rgb:joystick_rings",
+		.brightness = 0x50,
+		.max_brightness = 0x64,
+		.brightness_set = legos_rgb_color_set,
+		.brightness_get = legos_rgb_color_get,
+	},
+	.num_colors = ARRAY_SIZE(legos_rgb_subled_info),
+	.subled_info = legos_rgb_subled_info,
+};
+
+void cfg_setup(struct work_struct *work)
+{
+	int ret;
+
+	/* Gamepad */
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_AUTO_SLP_TIME,
+			       0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve gamepad auto sleep time: %i\n",
+			ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_DPAD_MODE, 0,
+			       0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve gamepad dpad mode: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_GAMEPAD_MODE,
+			       0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve gamepad mode: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_POLL_RATE, 0,
+			       0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve gamepad poll rate: %i\n", ret);
+		return;
+	}
+
+	/* IMU */
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_PASS_ENABLE,
+			       0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve IMU bypass enabled: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_IMU_MFR, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve IMU Manufacturer: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_IMU_ENABLE, 0,
+			       0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve IMU enabled: %i\n", ret);
+		return;
+	}
+
+	/* MCU */
+	ret = mcu_property_out(drvdata.hdev, GET_MCU_ID, NONE, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev, "Failed to retrieve MCU ID: %i\n",
+			ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_OS_TYPE, 0,
+			       0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve MCU OS Mode: %i\n", ret);
+		return;
+	}
+
+	/* RGB */
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_LIGHT_ENABLE,
+			       0, 0);
+	if (ret < 0) {
+		dev_err(drvdata.led_cdev->dev,
+			"Failed to retrieve RGB enabled: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_LIGHT_CFG, LIGHT_MODE_SEL, 0,
+			       0);
+	if (ret < 0) {
+		dev_err(drvdata.led_cdev->dev,
+			"Failed to retrieve RGB Mode: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_LIGHT_CFG, LIGHT_PROFILE_SEL,
+			       0, 0);
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
+
+	/* Touchpad */
+	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, CFG_TP_ENABLE, 0,
+			       0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve touchpad enabled: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_TP_PARAM, CFG_LINUX_MODE, 0,
+			       0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve touchpad Linux mode: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_TP_MFR, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve touchpad manufacturer: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_TP_PARAM, CFG_WINDOWS_MODE, 0,
+			       0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve touchpad Windows mode: %i\n", ret);
+		return;
+	}
+
+	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_TP_VER, 0, 0);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to retrieve touchpad Version: %i\n", ret);
+		return;
+	}
+}
+
+static int legos_cfg_uevent(const struct device *dev,
+			    struct kobj_uevent_env *env)
+{
+	if (add_uevent_var(env, "LEGOS_TP_MANUFACTURER=%s",
+			   TP_MANUFACTURER_TEXT[drvdata.tp_manufacturer]))
+		return -ENOMEM;
+	if (add_uevent_var(env, "LEGOS_TP_VERSION=%u", drvdata.tp_version))
+		return -ENOMEM;
+	if (add_uevent_var(env, "LEGOS_IMU_MANUFACTURER=%s",
+			   IMU_MANUFACTURER_TEXT[drvdata.imu_manufacturer]))
+		return -ENOMEM;
+	if (add_uevent_var(env, "LEGOS_MCU_ID=%*phN", 12, &drvdata.mcu_id))
+		return -ENOMEM;
+	return 0;
+}
+
+int legos_cfg_probe(struct hid_device *hdev, const struct hid_device_id *_id)
+{
+	int ret;
+
+	mutex_init(&drvdata.cfg_mutex);
+
+	hid_set_drvdata(hdev, &drvdata);
+
+	drvdata.hdev = hdev;
+	hdev->uevent = legos_cfg_uevent;
+
+	ret = sysfs_create_groups(&hdev->dev.kobj, legos_top_level_attr_groups);
+	if (ret) {
+		dev_err(&hdev->dev,
+			"Failed to create gamepad configuration attributes: %i\n",
+			ret);
+		return ret;
+	}
+
+	ret = devm_led_classdev_multicolor_register(&hdev->dev,
+						    &legos_cdev_rgb);
+	if (ret) {
+		dev_err(&hdev->dev, "Failed to create RGB device: %i\n", ret);
+		return ret;
+	}
+
+	ret = devm_device_add_group(legos_cdev_rgb.led_cdev.dev,
+				    &rgb_attr_group);
+	if (ret) {
+		dev_err(&hdev->dev,
+			"Failed to create RGB configuratiion attributes: %i\n",
+			ret);
+		return ret;
+	}
+
+	drvdata.led_cdev = &legos_cdev_rgb.led_cdev;
+	drvdata.led_cdev->color = LED_COLOR_ID_RGB;
+
+	init_completion(&drvdata.send_cmd_complete);
+
+	/* Executing calls prior to returning from probe will lock the MCU. Schedule
+	 * initial data call after probe has completed and MCU can accept calls.
+	 */
+	INIT_DELAYED_WORK(&drvdata.legos_cfg_setup, &cfg_setup);
+	schedule_delayed_work(&drvdata.legos_cfg_setup, msecs_to_jiffies(2));
+
+	return 0;
+}
+
+void legos_cfg_remove(struct hid_device *hdev)
+{
+	guard(mutex)(&drvdata.cfg_mutex);
+	cancel_delayed_work_sync(&drvdata.legos_cfg_setup);
+	sysfs_remove_groups(&hdev->dev.kobj, legos_top_level_attr_groups);
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+	hdev->uevent = NULL;
+	hid_set_drvdata(hdev, NULL);
+}
diff --git a/drivers/hid/lenovo-legos-hid/config.h b/drivers/hid/lenovo-legos-hid/config.h
new file mode 100644
index 000000000000..3d13744e2692
--- /dev/null
+++ b/drivers/hid/lenovo-legos-hid/config.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
+
+#ifndef _LENOVO_LEGOS_HID_CONFIG_
+#define _LENOVO_LEGOS_HID_CONFIG_
+
+#include <linux/types.h>
+
+struct hid_device;
+struct hid_device_id;
+struct work_struct;
+
+int legos_cfg_raw_event(u8 *data, int size);
+void cfg_setup(struct work_struct *work);
+int legos_cfg_probe(struct hid_device *hdev, const struct hid_device_id *_id);
+void legos_cfg_remove(struct hid_device *hdev);
+
+#endif /* !_LENOVO_LEGOS_HID_CONFIG_*/
diff --git a/drivers/hid/lenovo-legos-hid/core.c b/drivers/hid/lenovo-legos-hid/core.c
index 9049cbb8bd6c..1a5d5396ea6d 100644
--- a/drivers/hid/lenovo-legos-hid/core.c
+++ b/drivers/hid/lenovo-legos-hid/core.c
@@ -11,6 +11,7 @@
 #include <linux/usb.h>
 
 #include "core.h"
+#include "config.h"
 #include "../hid-ids.h"
 
 u8 get_endpoint_address(struct hid_device *hdev)
@@ -35,6 +36,8 @@ static int lenovo_legos_raw_event(struct hid_device *hdev,
 	ep = get_endpoint_address(hdev);
 
 	switch (ep) {
+	case LEGION_GO_S_CFG_INTF_IN:
+		return legos_cfg_raw_event(data, size);
 	default:
 		break;
 	}
@@ -70,6 +73,9 @@ static int lenovo_legos_hid_probe(struct hid_device *hdev,
 	}
 
 	switch (ep) {
+	case LEGION_GO_S_CFG_INTF_IN:
+		ret = legos_cfg_probe(hdev, id);
+		break;
 	default:
 		break;
 	}
@@ -82,6 +88,9 @@ static void lenovo_legos_hid_remove(struct hid_device *hdev)
 	int ep = get_endpoint_address(hdev);
 
 	switch (ep) {
+	case LEGION_GO_S_CFG_INTF_IN:
+		legos_cfg_remove(hdev);
+		break;
 	default:
 		hid_hw_close(hdev);
 		hid_hw_stop(hdev);
-- 
2.50.0


