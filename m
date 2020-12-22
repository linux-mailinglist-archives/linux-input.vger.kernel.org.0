Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED88D2E06DE
	for <lists+linux-input@lfdr.de>; Tue, 22 Dec 2020 08:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgLVHmO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Dec 2020 02:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgLVHmN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Dec 2020 02:42:13 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDDCC0613D3
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 23:41:33 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id t8so7976101pfg.8
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 23:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msNvM5pzbAJYWbn5mWuzMEGirWXPRzYqMruqrj8OX6c=;
        b=lQXUHk2Fsfs1sA+mkfafYI2CaAd1zQA6DfenVJTnQTN0i9Ss480VRYI/ng1ieVmoQ8
         3PbGUHzhrLuxq2RX8DXV4q8TCLxDfx5wmJ3HV/aAvkT6mhJeugfpSea5sXsksPncLx1H
         OskM58B1/4bzJjCExLl1lORWvSY2WCp8O5UUzALyeB5Uu8UyBJ50FurGtspMylRjGFBx
         RYlDZZ16+RcXVb2ISf/QG//OQSVQtXrCnbJzRqTpyxmBOASWgan3o4bUFVEjJLJ5tDsS
         6kXktKT5TcUL0QXyuo/fY70EZWzT3bbGR0b4dJPibUSwEHx+VWG+zn/4Ht7WWDQgtDYC
         9c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msNvM5pzbAJYWbn5mWuzMEGirWXPRzYqMruqrj8OX6c=;
        b=tgM9bwgJeG+T/eQRhA1L1gTuxSgL5H2hEGS4JiPyXBDY7OmZ7yzronl2lo4akSDf36
         FH4OBRgvoU6C2AEjaVYAJ954vxFd+ihrEAOFGRJauVFPXU0TCooWSuyKVUhbekcQ8uPx
         y0yK9TzfZQLT4k9qaV6mXOc9WU3k1wVvte8MOP4blf21efU60073qnLcfWRFIfefocAb
         9elUjN2RH7K3esvV1L+sNW4cNWzzuboeIWEqtNTgdfguRwDJBxtkeagGDMuVd46zJ7Cf
         6njS+TyVkLTwxPAqZMqKKoeX/riFbgTMeq9dml6TFF4jqtmKNH6t8wUwTdMCpB6Zr//h
         VGQw==
X-Gm-Message-State: AOAM533AAY400xvISF3DseGdxrIVFrEFSFo4YMm5VJvJ/WU1sKVam2QV
        GEUpMarZRllLdlxMuh3Eb1o8ag==
X-Google-Smtp-Source: ABdhPJxIYOi2lMUhqM9FA9/s/YZgH4HhW0Ae+PRwIKVYgSaINEIiuKkYxnhczYPlCkvy0omsr7HE3g==
X-Received: by 2002:a63:da58:: with SMTP id l24mr18497739pgj.178.1608622893189;
        Mon, 21 Dec 2020 23:41:33 -0800 (PST)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.googlemail.com with ESMTPSA id cq15sm17680984pjb.27.2020.12.21.23.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 23:41:32 -0800 (PST)
From:   Jian-Hong Pan <jhp@endlessos.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessos.org, Jian-Hong Pan <jhp@endlessos.org>
Subject: [PATCH] HID: Add Wireless Radio Control feature for Chicony devices
Date:   Tue, 22 Dec 2020 15:38:56 +0800
Message-Id: <20201222073855.98490-1-jhp@endlessos.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Chicony's keyboards support airplane mode hotkey (Fn+F2) with
"Wireless Radio Control" feature. For example, the wireless keyboard
[04f2:1236] shipped with ASUS all-in-one desktop.

After consulting Chicony for this hotkey, learned the device will send
with 0x11 as the report ID and 0x1 as the value when the key is pressed
down.

This patch maps the event as KEY_RFKILL.

Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 drivers/hid/hid-chicony.c | 58 +++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h     |  1 +
 2 files changed, 59 insertions(+)

diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
index 3f0ed6a95223..aca963aa0f1e 100644
--- a/drivers/hid/hid-chicony.c
+++ b/drivers/hid/hid-chicony.c
@@ -21,6 +21,42 @@
 
 #include "hid-ids.h"
 
+#define KEY_PRESSED			0x01
+#define CH_WIRELESS_CTL_REPORT_ID	0x11
+
+static int ch_report_wireless(struct hid_report *report, u8 *data, int size)
+{
+	struct hid_device *hdev = report->device;
+	struct input_dev *input;
+
+	if (report->id != CH_WIRELESS_CTL_REPORT_ID ||
+	    report->maxfield != 1 ||
+	    *report->field[0]->value != KEY_PRESSED)
+		return 0;
+
+	input = report->field[0]->hidinput->input;
+	if (!input) {
+		hid_warn(hdev, "can't find wireless radio control's input");
+		return 0;
+	}
+
+	input_report_key(input, KEY_RFKILL, 1);
+	input_sync(input);
+	input_report_key(input, KEY_RFKILL, 0);
+	input_sync(input);
+
+	return 1;
+}
+
+static int ch_raw_event(struct hid_device *hdev,
+		struct hid_report *report, u8 *data, int size)
+{
+	if (report->application == HID_GD_WIRELESS_RADIO_CTLS)
+		return ch_report_wireless(report, data, size);
+
+	return 0;
+}
+
 #define ch_map_key_clear(c)	hid_map_usage_clear(hi, usage, bit, max, \
 					EV_KEY, (c))
 static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
@@ -77,10 +113,30 @@ static __u8 *ch_switch12_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	return rdesc;
 }
 
+static int ch_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+
+	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "Chicony hid parse failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hdev, "Chicony hw start failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
 
 static const struct hid_device_id ch_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_TACTICAL_PAD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS3) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACER_SWITCH12) },
 	{ }
 };
@@ -91,6 +147,8 @@ static struct hid_driver ch_driver = {
 	.id_table = ch_devices,
 	.report_fixup = ch_switch12_report_fixup,
 	.input_mapping = ch_input_mapping,
+	.probe = ch_probe,
+	.raw_event = ch_raw_event,
 };
 module_hid_driver(ch_driver);
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4c5f23640f9c..06d90301a3dc 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -270,6 +270,7 @@
 #define USB_DEVICE_ID_CHICONY_PIXART_USB_OPTICAL_MOUSE	0x1053
 #define USB_DEVICE_ID_CHICONY_PIXART_USB_OPTICAL_MOUSE2	0x0939
 #define USB_DEVICE_ID_CHICONY_WIRELESS2	0x1123
+#define USB_DEVICE_ID_CHICONY_WIRELESS3	0x1236
 #define USB_DEVICE_ID_ASUS_AK1D		0x1125
 #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
-- 
2.29.2

