Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1886D2E8901
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 23:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbhABWc4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jan 2021 17:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbhABWc4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 17:32:56 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C832FC06179E
        for <linux-input@vger.kernel.org>; Sat,  2 Jan 2021 14:31:40 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id j1so12479476pld.3
        for <linux-input@vger.kernel.org>; Sat, 02 Jan 2021 14:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+TZH7FARanv5tE8EvnhPVt2+HZa+BTe5BQhTyk9nRBk=;
        b=bzCKrKZ7NtpN7TgAkNc6lElBCKLVAaSYs7IYzgtrYVnDUBUJbLRw7H4oN3NAj6Xftp
         WKnUU0FBJ1Ba4Q+XB08PKRlfB5Dvz8Brwe/it8oQ+8+fIiF9NPhyKcRr+Q066lk3SRer
         2U2ewYRAlryZb2Vh99kpTrQgAdxgY8ynbFiunlxhytn3UAiJBFgm8+HMQtutp37YpL/3
         19Bcl1NJS8QCWNWq2ZCYhHLU2le/NR83wCQtFGjIseHAfmhC2u7vkENPpfZfUcBw+SqX
         UffODI2lR1X+ahK5rSKuTbIyt5E4B/ewZI1TdF9r/x1nKR8Jyxe7wRRvH9guSLlvTgHM
         qGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+TZH7FARanv5tE8EvnhPVt2+HZa+BTe5BQhTyk9nRBk=;
        b=qJyXj7GU2qBUdaQ9tr37HTUS36xMFo4EuT+YxDW3PwqAh36tRL0aiqwWxLZrwqsICm
         buE5rtOvPAVkzT2Nz6/PwhSeEROtxbhhn7+511fzfCYxEI1r/k+6u57XZaW4CtdR5vny
         welme01ltqi95P9is3zaXwlIGziyE78EL4bJL8Medt4sWhENVVoqi9GqI+lmlkTpKojp
         sgEUE9X5SiObhCkIkIC+C/R6LZm5uAscjDz9ynmF5yXa2EMQCOPh9uN1OjTAYwYuYBr3
         y3afLJSs+v7WvlymoL68BVS4iJbkB060v2ApwJfYDkpJwWvZ/taqilmUr//gvMYb5QC0
         OU4g==
X-Gm-Message-State: AOAM531F0JKoHDWnsi9e872+G5slSNI27GIZCq1XJi4HOGn9FOgOPy32
        7aHnaRPl7h+Ob7wJ4bUOub7Ez/U5eV+g8g==
X-Google-Smtp-Source: ABdhPJyMsWuGTueN3Glh/AotTAGje1WxYREQVNqbgJoITmn77jbHio8NqEJlj3doU3Ytt3aflgwuGQ==
X-Received: by 2002:a17:90a:6587:: with SMTP id k7mr23622546pjj.154.1609626700387;
        Sat, 02 Jan 2021 14:31:40 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id r20sm49537931pgb.3.2021.01.02.14.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 14:31:40 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 07/13] HID: playstation: add DualSense Bluetooth support.
Date:   Sat,  2 Jan 2021 14:31:03 -0800
Message-Id: <20210102223109.996781-8-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210102223109.996781-1-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/hid/hid-quirks.c      |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 91f3ed005fce..552a52a50b78 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -47,6 +47,7 @@ struct ps_calibration_data {
 };
 
 #define DS_INPUT_REPORT_USB			0x01
+#define DS_INPUT_REPORT_BT			0x31
 
 #define DS_FEATURE_REPORT_CALIBRATION		5
 #define DS_FEATURE_REPORT_CALIBRATION_SIZE	41
@@ -285,6 +286,17 @@ static int ps_device_register_battery(struct ps_device *dev)
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
@@ -406,6 +418,18 @@ static int dualsense_get_calibration_data(struct dualsense *ds)
 		goto err_free;
 	}
 
+	if (ds->base.hdev->bus == BUS_BLUETOOTH) {
+		/* Last 4 bytes contains crc32 */
+		uint8_t crc_offset = DS_FEATURE_REPORT_CALIBRATION_SIZE - 4;
+		uint32_t report_crc = get_unaligned_le32(&buf[crc_offset]);
+
+		if (!ps_check_crc32(0xa3, buf, crc_offset, report_crc)) {
+			hid_err(ds->base.hdev, "DualSense calibration report CRC's check failed\n");
+			ret = -EILSEQ;
+			goto err_free;
+		}
+	}
+
 	gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
 	gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
 	gyro_roll_bias   = get_unaligned_le16(&buf[5]);
@@ -515,6 +539,16 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	 */
 	if (report->id == DS_INPUT_REPORT_USB && hdev->bus == BUS_USB) {
 		ds_report = (struct dualsense_input_report *)&data[1];
+	} else if (report->id == DS_INPUT_REPORT_BT && hdev->bus == BUS_BLUETOOTH) {
+		/* Last 4 bytes of input report contain crc32 */
+		uint32_t report_crc = get_unaligned_le32(&data[size - 4]);
+
+		if (!ps_check_crc32(0xa1, data, size - 4, report_crc)) {
+			hid_err(hdev, "DualSense input CRC's check failed, size=%d\n", size);
+			return -EILSEQ;
+		}
+
+		ds_report = (struct dualsense_input_report *)&data[2];
 	} else {
 		hid_err(hdev, "Unhandled reportID=%d\n", report->id);
 		return -1;
@@ -774,6 +808,7 @@ static void ps_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id ps_devices[] = {
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ }
 };
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 1ca46cb445be..541c8837debd 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -567,6 +567,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #endif
 #if IS_ENABLED(CONFIG_HID_PLAYSTATION)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
++	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 #endif
 #if IS_ENABLED(CONFIG_HID_PRIMAX)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, USB_DEVICE_ID_PRIMAX_KEYBOARD) },
-- 
2.26.2

