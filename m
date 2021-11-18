Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C668455598
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 08:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243837AbhKRHd0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 02:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243829AbhKRHdY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 02:33:24 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82A1C061764;
        Wed, 17 Nov 2021 23:30:24 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id a9so9636851wrr.8;
        Wed, 17 Nov 2021 23:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ANZfmiJEuYbiJAjvu7GWyhRBWRTLycUg8BazMnQnz2k=;
        b=CjIltvkkk3+eUk++IomWzqDTRpSpeml3NrVvjsStUQACaucXFbNtPTI/2YVhiJcy3u
         fr+5OlT8+/MZK/uHe8a6RmHoYEykR62GxDgZff/SRA1M0SFGO6w7rLe6quQVDsBQ1mKc
         xn6u4jY0QYMxvzIrPzoGsYWxIWP5HLuK+rUEVI6vdSLacZubMLZogXK7ThD5yRUC185Z
         vn2KwzGPOMbMrvCSvxI1I+LQ3sTnSspovwFDCw7LPnWjaJj9j0PTFdFRCABoHSVzYFuE
         ynIIaaYv0AHnanIQDTQy9DbgMdMTOjRkLMmVKj2FfADyxLKc8zr/sHiIufUo3+cffeJs
         3o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANZfmiJEuYbiJAjvu7GWyhRBWRTLycUg8BazMnQnz2k=;
        b=S54n9tZvMH8dZiHrwiLwA4xag8CYgkBHIZfseZRFut2gePkHlv0HkAoflSCppOFIfI
         a9ACFY7JW4mi22OP98bEsVoAMZn6SvS7cEj3mvap2MzKJqUAhPVdHUYdqEUUFv6J3mOt
         sCFS4uVR1lrqi8FRQFopACxiGxzoHaNt0OvLmyXUihLsINxbd1c894W6Rlzw1pHxDpXe
         D0rA0dOWOeg03RQbPpY/sgA2gS4sDPPHmECrolKsoHvvd4xeTpuRCJuZ6KuhR1hLnToA
         7fDOydctsIR1ZdPTcyURneKM3s6CkiymmQRNpbC8fDONdfxzmxGCCNZesfKRMeM8fr6v
         PvQA==
X-Gm-Message-State: AOAM532BvFhaq23my2hVmDAYIPQLIY/AKOY1t64oR23lP+FZdjvGLUo/
        ugAtG228GZ718xACx2C6uXQ=
X-Google-Smtp-Source: ABdhPJwzwAEcfSGoKe1/6oAjXded40b5COFarj62lvUgsRZxTiaEi90VJfARx9WtfwjQOgHFtGqczg==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr28512988wrb.42.1637220622885;
        Wed, 17 Nov 2021 23:30:22 -0800 (PST)
Received: from localhost.localdomain ([94.73.39.244])
        by smtp.gmail.com with ESMTPSA id p12sm2223438wro.33.2021.11.17.23.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 23:30:22 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, alexhenrie24@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 3/3] HID: apple: Report Magic Keyboard battery over USB
Date:   Thu, 18 Nov 2021 08:29:55 +0100
Message-Id: <20211118072955.29708-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118072955.29708-1-jose.exposito89@gmail.com>
References: <20211118072955.29708-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When connected over USB, the Apple Magic Keyboard 2015 registers 3
different interfaces. One of them is used to report the battery level.

However, unlike when connected over Bluetooth, the battery level is not
reported automatically and it is required to fetch it manually.

Add a new quirk to fix the battery report descriptor and a timer to
fetch the battery level.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-apple.c | 87 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index b34aeed292a2..2bd8276411e0 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -16,8 +16,10 @@
 
 #include <linux/device.h>
 #include <linux/hid.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/timer.h>
 
 #include "hid-ids.h"
 
@@ -30,10 +32,12 @@
 #define APPLE_INVERT_HWHEEL	BIT(6)
 /* BIT(7) reserved, was: APPLE_IGNORE_HIDINPUT */
 #define APPLE_NUMLOCK_EMULATION	BIT(8)
+#define APPLE_RDESC_BATTERY	BIT(9)
 
 #define APPLE_FLAG_FKEY		0x01
 
 #define HID_COUNTRY_INTERNATIONAL_ISO	13
+#define APPLE_BATTERY_TIMEOUT_MS	60000
 
 static unsigned int fnmode = 1;
 module_param(fnmode, uint, 0644);
@@ -58,10 +62,12 @@ MODULE_PARM_DESC(swap_fn_leftctrl, "Swap the Fn and left Control keys. "
 		"[0] = as-is, Mac layout, 1 = swapped, PC layout)");
 
 struct apple_sc {
+	struct hid_device *hdev;
 	unsigned long quirks;
 	unsigned int fn_on;
 	unsigned int fn_found;
 	DECLARE_BITMAP(pressed_numlock, KEY_CNT);
+	struct timer_list battery_timer;
 };
 
 struct apple_key_translation {
@@ -333,6 +339,43 @@ static int apple_event(struct hid_device *hdev, struct hid_field *field,
 	return 0;
 }
 
+static int apple_fetch_battery(struct hid_device *hdev)
+{
+#ifdef CONFIG_HID_BATTERY_STRENGTH
+	struct apple_sc *asc = hid_get_drvdata(hdev);
+	struct hid_report_enum *report_enum;
+	struct hid_report *report;
+
+	if (!(asc->quirks & APPLE_RDESC_BATTERY) || !hdev->battery)
+		return -1;
+
+	report_enum = &hdev->report_enum[hdev->battery_report_type];
+	report = report_enum->report_id_hash[hdev->battery_report_id];
+
+	if (!report || report->maxfield < 1)
+		return -1;
+
+	if (hdev->battery_capacity == hdev->battery_max)
+		return -1;
+
+	hid_hw_request(hdev, report, HID_REQ_GET_REPORT);
+	return 0;
+#else
+	return -1;
+#endif
+}
+
+static void apple_battery_timer_tick(struct timer_list *t)
+{
+	struct apple_sc *asc = from_timer(asc, t, battery_timer);
+	struct hid_device *hdev = asc->hdev;
+
+	if (apple_fetch_battery(hdev) == 0) {
+		mod_timer(&asc->battery_timer,
+			  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
+	}
+}
+
 /*
  * MacBook JIS keyboard has wrong logical maximum
  * Magic Keyboard JIS has wrong logical maximum
@@ -354,6 +397,30 @@ static __u8 *apple_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 			 "fixing up MacBook JIS keyboard report descriptor\n");
 		rdesc[53] = rdesc[59] = 0xe7;
 	}
+
+	/*
+	 * Change the usage from:
+	 *   0x06, 0x00, 0xff, // Usage Page (Vendor Defined Page 1)  0
+	 *   0x09, 0x0b,       // Usage (Vendor Usage 0x0b)           3
+	 * To:
+	 *   0x05, 0x01,       // Usage Page (Generic Desktop)        0
+	 *   0x09, 0x06,       // Usage (Keyboard)                    2
+	 */
+	if ((asc->quirks & APPLE_RDESC_BATTERY) && *rsize == 83 &&
+	    rdesc[46] == 0x84 && rdesc[58] == 0x85) {
+		hid_info(hdev,
+			 "fixing up Magic Keyboard battery report descriptor\n");
+		*rsize = *rsize - 1;
+		rdesc = kmemdup(rdesc + 1, *rsize, GFP_KERNEL);
+		if (!rdesc)
+			return NULL;
+
+		rdesc[0] = 0x05;
+		rdesc[1] = 0x01;
+		rdesc[2] = 0x09;
+		rdesc[3] = 0x06;
+	}
+
 	return rdesc;
 }
 
@@ -447,6 +514,7 @@ static int apple_probe(struct hid_device *hdev,
 		return -ENOMEM;
 	}
 
+	asc->hdev = hdev;
 	asc->quirks = quirks;
 
 	hid_set_drvdata(hdev, asc);
@@ -463,9 +531,23 @@ static int apple_probe(struct hid_device *hdev,
 		return ret;
 	}
 
+	timer_setup(&asc->battery_timer, apple_battery_timer_tick, 0);
+	mod_timer(&asc->battery_timer,
+		  jiffies + msecs_to_jiffies(APPLE_BATTERY_TIMEOUT_MS));
+	apple_fetch_battery(hdev);
+
 	return 0;
 }
 
+static void apple_remove(struct hid_device *hdev)
+{
+	struct apple_sc *asc = hid_get_drvdata(hdev);
+
+	del_timer_sync(&asc->battery_timer);
+
+	hid_hw_stop(hdev);
+}
+
 static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MIGHTYMOUSE),
 		.driver_data = APPLE_MIGHTYMOUSE | APPLE_INVERT_HWHEEL },
@@ -540,11 +622,11 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ANSI),
@@ -650,6 +732,7 @@ static struct hid_driver apple_driver = {
 	.id_table = apple_devices,
 	.report_fixup = apple_report_fixup,
 	.probe = apple_probe,
+	.remove = apple_remove,
 	.event = apple_event,
 	.input_mapping = apple_input_mapping,
 	.input_mapped = apple_input_mapped,
-- 
2.25.1

