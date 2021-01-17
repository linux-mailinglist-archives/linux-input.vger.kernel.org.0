Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A15C2F9663
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbhAQXrs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730861AbhAQXpe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:45:34 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDD4C061786
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:52 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id p18so9812085pgm.11
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cNKqIw6ugIal02C0IYOquVrlhL2XdUdboi965bfSOcY=;
        b=kSPhPurTOhG1fP964APchKVax9fyZXcWHbhu3JDJ6qV94K3REcXkZma8HWhQkP/xp5
         Wwoo121+K9KZ8qiFl23/DKMei58zK79sUYhukYqgoI+kwNAEFgBWCcF+fE+LmApH2s5O
         ffZeoMt1whFTVTxUnPXJGWewnKW5h2p0n16IQrUsAvnR44FBuQqeLTy5s0Lbx2IvoGxX
         ilVpU1yzl2R79qxGrmt+ac4TSiQXqqwKa2ul6zBYgzth/Qxm8CeErKQyw8dkaVmKJVzj
         6b4ENQOGbvOfDnL1Zeg98oT9yEXl2by9GFpS5sBmSuxn5WvJSrHvJawkdM9ngpxT9y/G
         oAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cNKqIw6ugIal02C0IYOquVrlhL2XdUdboi965bfSOcY=;
        b=A8f79EXw/uzbu2vjc1RdEvaS27EIngON9Bkrc2Ug7cH0M285kYSSwUnn0TlItZF7zh
         r2+eTnWephVXuU+SxzGuqWwYjkVpbctx3wnnLz4iUThX28y5Yt7oi6/h6XVuP9eDWcyf
         0DmRs8H5YRBszCPW0pDF8BWGEqS0YpJtqJJ1AYKB4Htvo4CzH0veG6C3dNrICbRxGR5P
         bAIy434pa+OGzH3ff47Uuf71qJ4y5yJol9MCZKaeWSICG0b99tMHsVpgHErQe6SLXzN6
         R85Yqx1XVwlE4/dg6LPI79Cnm7d7KkhZJkzLPYczcIPimP/Mkvvqx5zvjVth/li77Nx2
         KRKg==
X-Gm-Message-State: AOAM532v8AxBjXbdtuInnGiZOw/JkF9T+efJC5ZpewD6XlQCYkjxuAZ2
        RgmawWMGK5GszZQIjVwzBBkrtVF+DilqHA==
X-Google-Smtp-Source: ABdhPJxYh8AOYeTif3t3/N/5DdlmfxBoIk7LrRuzyc26a/upYKKh+rXIeznSHLG3TcBI6ZZtefGlZg==
X-Received: by 2002:a63:7051:: with SMTP id a17mr2181139pgn.26.1610927092088;
        Sun, 17 Jan 2021 15:44:52 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id i2sm14721568pjd.21.2021.01.17.15.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:44:51 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v4 07/13] HID: playstation: add DualSense Bluetooth support.
Date:   Sun, 17 Jan 2021 15:44:29 -0800
Message-Id: <20210117234435.180294-8-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117234435.180294-1-roderick@gaikai.com>
References: <20210117234435.180294-1-roderick@gaikai.com>
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
index 483f790aca71..2f16a650f247 100644
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
 
@@ -506,6 +535,17 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
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
@@ -769,6 +809,7 @@ static void ps_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id ps_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ }
 };
-- 
2.26.2

