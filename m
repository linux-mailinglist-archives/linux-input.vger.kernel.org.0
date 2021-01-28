Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE62D307C77
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbhA1R3z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbhA1R1x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:53 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37275C06178B
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:13 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id g3so3727524plp.2
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9HFv/uiOAIRc4RVa3GytTNf+rCGw5VL5GnKd6gUaGLA=;
        b=QsUiuTwJtShBsmhU0upcuk2yoM3II8MSIrzI+Zha051twrlsom7XlvRkZbIcHmS1li
         fEG4GVhryc3UnYIfa5k+8RCT3ybmalk9j9uI0Me7Ff4/LJ0vYuFfU5KjCsYqyK0EF1lv
         Wn9nvkKKqE32Nw/iTuslpiW0xn5Wm5bLGgfGoqxb6u6/t114abFghwpkW55zr1RVPlKP
         GkcntE5cSX8McywX41qTCV71CkynvCSiFEf9R2Sn9VWSJjB5ZnQQD5VxBlpjHkF3Xe7l
         p8ILZhrnk3cZd+/wror/HN7LAuCOsonyGj3ecxEUJVMsLH5NRd4CTpZAyi5CPdKuFmNp
         Eacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9HFv/uiOAIRc4RVa3GytTNf+rCGw5VL5GnKd6gUaGLA=;
        b=ZUBmm51IaaKg8DMWZhvcC1u+tZiGfs24VyKpGZX6kRn6L6KJyyuYS23P9MffFair/i
         kVSTmNSLd2M34j+xG7tWx0VWk7sttllEvTj2OqywYBjoGn3F5f9TAKEBitTnr4mJTpuW
         LhRHnb/6oOao/A9oFjUDMRcc++QvUI1zPTK8wcSRIJ6aXBKNva9XtiQtf2LvMIdLeeZh
         86E1BGtF4Fn231XXKB7QsVKuu3uv5SCk+CvryU3kbBeW4Fk6/J63oDzBsd6wP89TZP3d
         fNfdXWCUVn+iXWV/GRpotI6ZqXyqF/3S4iTgKjp1hM+p+RiwcafQBn5hgoqBd8vRr/R5
         vzGg==
X-Gm-Message-State: AOAM531wjIlur/4w89JKExQF91lKJwhMfGupFz8VCI051j9nu7p67yG9
        XNnIStiz68rnNFUV73ABinzvMGHle4JRBA==
X-Google-Smtp-Source: ABdhPJxKAYU9SoWvYaGBlwi4PEHySNZY5al9wwwUuyPlm4nYIFhyFu57Qgzh74YaIWd9zPEl8Zwgyg==
X-Received: by 2002:a17:90a:e396:: with SMTP id b22mr411114pjz.155.1611854832769;
        Thu, 28 Jan 2021 09:27:12 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:12 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 07/13] HID: playstation: add DualSense Bluetooth support.
Date:   Thu, 28 Jan 2021 09:26:51 -0800
Message-Id: <20210128172657.24516-8-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

This patch adds support for the DualSense when operating in Bluetooth mode.
The device has the same behavior as the DualShock 4 in that by default it
sends a limited input report (0x1), but after requesting calibration data,
it switches to an extended input report (report 49), which adds data for
touchpad, motion sensors, battery and more.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/Kconfig           |  1 +
 drivers/hid/hid-playstation.c | 41 +++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 0c141f2312f7..b3ec01c7a0b7 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -856,6 +856,7 @@ config HID_PLANTRONICS
 config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	depends on HID
+	select CRC32
 	select POWER_SUPPLY
 	help
 	  Provides support for Sony PS5 controllers including support for
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 0c3956756bf0..2da362d3dbda 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/crc32.h>
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input/mt.h>
@@ -45,8 +46,14 @@ struct ps_calibration_data {
 	int sens_denom;
 };
 
+/* Seed values for DualShock4 / DualSense CRC32 for different report types. */
+#define PS_INPUT_CRC32_SEED	0xA1
+#define PS_FEATURE_CRC32_SEED	0xA3
+
 #define DS_INPUT_REPORT_USB			0x01
 #define DS_INPUT_REPORT_USB_SIZE		64
+#define DS_INPUT_REPORT_BT			0x31
+#define DS_INPUT_REPORT_BT_SIZE			78
 
 #define DS_FEATURE_REPORT_CALIBRATION		0x05
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
@@ -292,6 +299,17 @@ static int ps_device_register_battery(struct ps_device *dev)
 	return 0;
 }
 
+/* Compute crc32 of HID data and compare against expected CRC. */
+static bool ps_check_crc32(uint8_t seed, uint8_t *data, size_t len, uint32_t report_crc)
+{
+	uint32_t crc;
+
+	crc = crc32_le(0xFFFFFFFF, &seed, 1);
+	crc = ~crc32_le(crc, data, len);
+
+	return crc == report_crc;
+}
+
 static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
 {
 	struct input_dev *gamepad;
@@ -342,6 +360,17 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 		return -EINVAL;
 	}
 
+	if (hdev->bus == BUS_BLUETOOTH) {
+		/* Last 4 bytes contains crc32. */
+		uint8_t crc_offset = size - 4;
+		uint32_t report_crc = get_unaligned_le32(&buf[crc_offset]);
+
+		if (!ps_check_crc32(PS_FEATURE_CRC32_SEED, buf, crc_offset, report_crc)) {
+			hid_err(hdev, "CRC check failed for reportID=%d\n", report_id);
+			return -EILSEQ;
+		}
+	}
+
 	return 0;
 }
 
@@ -543,6 +572,17 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	if (hdev->bus == BUS_USB && report->id == DS_INPUT_REPORT_USB &&
 			size == DS_INPUT_REPORT_USB_SIZE) {
 		ds_report = (struct dualsense_input_report *)&data[1];
+	} else if (hdev->bus == BUS_BLUETOOTH && report->id == DS_INPUT_REPORT_BT &&
+			size == DS_INPUT_REPORT_BT_SIZE) {
+		/* Last 4 bytes of input report contain crc32 */
+		uint32_t report_crc = get_unaligned_le32(&data[size - 4]);
+
+		if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, report_crc)) {
+			hid_err(hdev, "DualSense input CRC's check failed\n");
+			return -EILSEQ;
+		}
+
+		ds_report = (struct dualsense_input_report *)&data[2];
 	} else {
 		hid_err(hdev, "Unhandled reportID=%d\n", report->id);
 		return -1;
@@ -806,6 +846,7 @@ static void ps_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id ps_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ }
 };
-- 
2.26.2

