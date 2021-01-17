Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE3F2F961D
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730600AbhAQXLa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:11:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730637AbhAQXL1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:11:27 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97C0C0613D3
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:07 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id e9so3464416plh.3
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKqVlmvDQSVjNcyvBxmr1V2FCXCfg/xfm/EniWCMKPQ=;
        b=jlnkQvw7Ktm4WCkZytMto666fHg844GWf7w0jEAvveqsm9MW9ntL6TIEJ6usHtf2Le
         am4dWlLRXpWCE4x0TmcL4n5RPNXGAr7P7HCuOhqYiPmW0YDX7/YE/OoZTsOm9+0y/uIR
         4wc4S4FuY3Ou+TZObJh5w2Px16l7Lw+V3O/0dly8aH/2Q4IAtdE6VyKOBYP3xfb4EtaS
         +zoMh0OIbyyLGnJxo1aNExYArdT28eYIrdI0xblVxTcn0Y4IulDjqpbQqdOPz/S6M23V
         iTaKf2X9uOhBfdqi3n2fpINCEWMCLU2DP7jyqi/LZEf/evJ2V40ChSEgJYpqNdbyv2fF
         reYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKqVlmvDQSVjNcyvBxmr1V2FCXCfg/xfm/EniWCMKPQ=;
        b=XHLTc7VD3yf6sj41F+2tflpwtGRLWOSSee9TkPuJC0A+y2eBtlsSJUKROp+nI7QOwE
         liooXY+XSvu5ZrNgXgMdxPGcbjpbYnjtitsHpsXK/yL71sGLH3VcLCgXWEb8aVdr0MsO
         2w01jlNWemK2DHMn2L1GId0A44GhHn9M95Xftrr8UhtD8k5lnUW60yIlMWNAH4HHMQSm
         3xYheDxPHap2gBd8cakTsgvh1BGSGbElv1SCLjVrhhUdV+N6xUS4rgeIt3T7Ibz8O53T
         TzEykSQyZZJAy58HPt0RATrzv94p6fS6LVLzFDAXghTZopKHWflj1OvPkDoQYGjAXC/X
         1WmA==
X-Gm-Message-State: AOAM533i+Q7b9cmkqY8q2W7kLA7jrwS7W6ieNSt/ZYHdY1gwf3BG/+d3
        drMIrmGyW054jrOHF6fPBOmU+g==
X-Google-Smtp-Source: ABdhPJxGygy9NnVrkqrmhxK1ExXj4Y6o7bWnl094+U5XHG5yr3WplyFlrR8Zk4LnyLLPa6Ta/qa5MQ==
X-Received: by 2002:a17:90a:46c2:: with SMTP id x2mr23642463pjg.15.1610925007420;
        Sun, 17 Jan 2021 15:10:07 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id g3sm14018746pjt.34.2021.01.17.15.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:10:07 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 06/12] HID: playstation: add DualSense Bluetooth support.
Date:   Sun, 17 Jan 2021 15:09:50 -0800
Message-Id: <20210117230956.173031-7-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117230956.173031-1-roderick@gaikai.com>
References: <20210117230956.173031-1-roderick@gaikai.com>
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
index a14c33a52c8f..bcf93836beb2 100644
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

