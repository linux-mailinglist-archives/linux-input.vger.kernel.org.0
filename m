Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B463127A7
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 22:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBGVug (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 16:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBGVug (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 16:50:36 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E76BC061793
        for <linux-input@vger.kernel.org>; Sun,  7 Feb 2021 13:49:22 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id e9so7669950pjj.0
        for <linux-input@vger.kernel.org>; Sun, 07 Feb 2021 13:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p7ggurAf5bsEOh7zB9EYQ8z4341vv6oOv+y6CbFtfpk=;
        b=ifzrkIrfnyaqO53fYQ8SwX8jeY3wnGJALDZxRf2sf6yVY7ZUq9jtmddMX/rhTyyD0x
         QN/FgzRSG6ers3uUsWSycPC4+n1k0pOPOPUOV7/Oc3rjwhXwdabfpEEZZ9QLK5XR8oES
         RvFbtPO0lWLOdvFAC4RPWVn4uUp1JjOzt6B61xrV4Nun+fnKA6mMTKK5ITJ1XNgFhT+L
         KDNh09gGM0HpRKWlg163lG/PFm+y+25PDK2Ei46SHv98l78io5GPTMo0ex9cK8yt6vS7
         FDezsB7wBmyswgDevvaqLv8lSlfkwF9ehKJSZHjobmLwMV66HyG4Pqgb7pO3cKTZeVzD
         Gxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7ggurAf5bsEOh7zB9EYQ8z4341vv6oOv+y6CbFtfpk=;
        b=JTeSpeapIgCpqoGBOB740ZEPxcM6po+XR162sjrNfd93YDl7zBYabTdATIjcTurO3P
         /Suij2w1bR922mqMcYvzoKt3oqAx9AscJ1QlehSaJrSiZv+P4FRS5bCEPXHGuTv+eKOO
         /EvNZ5a3ZtIriEIIY0j6xHme34HHmpJOSYy/9m8H7MuosSdatVnH8oSUxwpCtSSBbtRN
         Wu2eQYDhBhi7cJhFwgSWTsMgOMhvpKh7zx4LeC2iNbgAqaEifH7T7MSA2SJbT7CCIL7e
         TRU/jrtYjKEuKHBTWgDOP0PSL1soNA8Clu61FH/MCoE3JONKIZdSS7kxh2YxoMFGieb7
         f76A==
X-Gm-Message-State: AOAM530+ZYm9P64CaSlaf2fZGzepZQKGT9zBQx/YIJtB78tdq1f7FYGt
        QRvQlGL2Du/5Oy3VZ+7pingRyQ==
X-Google-Smtp-Source: ABdhPJyXZ1Vt3Fbx/y1ff449bZJm3sFOb3rVM0X182MXQjVwYfnxLu1+th9+hX2oVyXGiOyD0lO8SQ==
X-Received: by 2002:a17:90b:17cb:: with SMTP id me11mr13506780pjb.64.1612734561671;
        Sun, 07 Feb 2021 13:49:21 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a141sm16578991pfa.189.2021.02.07.13.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 13:49:21 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 07/13] HID: playstation: add DualSense Bluetooth support.
Date:   Sun,  7 Feb 2021 13:49:02 -0800
Message-Id: <20210207214908.79573-8-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207214908.79573-1-roderick@gaikai.com>
References: <20210207214908.79573-1-roderick@gaikai.com>
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
index 20fe29fc61c0..a4ef9fae7a36 100644
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
@@ -300,6 +307,17 @@ static int ps_device_register_battery(struct ps_device *dev)
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
@@ -351,6 +369,17 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
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
 
@@ -552,6 +581,17 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
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
@@ -815,6 +855,7 @@ static void ps_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id ps_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ }
 };
-- 
2.26.2

