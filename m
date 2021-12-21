Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E8547C761
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241756AbhLUTR5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbhLUTR4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:56 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65308C06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:56 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v7so21606053wrv.12
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmh8/R/qHcPfy44OFdiEPZyLcrT1H1MLJrXU2WV1zms=;
        b=UaU6tivnvFoKJpe3xBaTtB70fv7QBrhVqf+07hwnd2zWwcRBHNGBi3qzpUSomrj/0T
         ZTvuWuKYBCnc00l91ZTrr7QTlsBMon29eQJW7mf5fV6gihH9np1tdyG6ve2BRUhsFr5v
         RB2YCgm4NtRQQv2DCvMXs2Dlpymb/3oEBzq8Pc0yYJBPEc3eTrAuOqCtlgyyxtEY+3Sq
         IgGRwtImFy4MA0MrWB9l0NPYuSY0+1le5pBWL0UqOpRrZu1ZuI3v1TRFDNXYufTm4n6P
         HEz0RjXEB6ytWxreMwuoSjAobZ0peyRfF33BzJ1VQVf2eGLg+mgRq03G9znNiHsm1HNn
         +3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmh8/R/qHcPfy44OFdiEPZyLcrT1H1MLJrXU2WV1zms=;
        b=OtTA9Y4cc9g6Utpm7mN40FpzeO7w8gF/MXLPrKaIeIuNkalCFR1m52UWDns96Bcidl
         sbmpCEoOQHPexJSVd7UUwjaRJ15RUu//NExkawmi3wCSqNhmDCK1M0PzRzhjunlV0H2O
         AZXURqt3Ov1UARn5ZvgGmlanHZ3WOUkHur2EGuYOp6bXHHYDqiYJcc1HMrBsPoXERKVX
         P/hIe90U9ko4nJtCbCjFsf5mtQ/AkFPbe3QLaI7re6sjVfqgHlgQjSW6+H9U/S6AO7Pl
         zCh8DLeby/gt2y7q3NsaiHHhAzfQq3p4VEGWFAMziNBDGu5q2gjbUcNtu5c6DAXcNKmo
         PdyA==
X-Gm-Message-State: AOAM531X1Mz0W2oypWAQHReoHWrRygl7sgw5UsgRXpd8e0F9TBsGb5Y2
        GSX0Fozp6zrBhaNny+QdDdV/uDvYhflF3wyUjtc=
X-Google-Smtp-Source: ABdhPJyeFQ5dm0wdsfg6tBash2q2DBAUY7d+KvhjA00j/nVGwZY/NF/thQUfK8neSE/cX/MRO1IAmA==
X-Received: by 2002:a05:6000:1845:: with SMTP id c5mr3687879wri.499.1640114274960;
        Tue, 21 Dec 2021 11:17:54 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:54 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 15/18] HID: multitouch: add haptic multitouch support
Date:   Tue, 21 Dec 2021 19:17:40 +0000
Message-Id: <20211221191743.1893185-16-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add new option (MULTITOUCH_HAPTIC) to mark whether hid-multitouch
should try and configure simple haptic device.
Once this option is configured, and the device is recognized to have simple
haptic capabilities, check input frames for pressure and handle it using
hid_haptic_* API.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/Kconfig          | 11 ++++++
 drivers/hid/hid-multitouch.c | 71 +++++++++++++++++++++++++++++++++++-
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 8d1eb4491a7f..d64e316eb2ca 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -742,6 +742,17 @@ config HID_MULTITOUCH
 	  To compile this driver as a module, choose M here: the
 	  module will be called hid-multitouch.
 
+config MULTITOUCH_HAPTIC
+	bool "Simple haptic multitouch support"
+	depends on HID_MULTITOUCH
+	select HID_HAPTIC
+	default n
+	help
+	Support for simple multitouch haptic devices.
+	Adds extra parsing and FF device for the hid multitouch driver.
+	It can be used for Elan 2703 haptic touchpad.
+	To enable, say Y.
+
 config HID_NINTENDO
 	tristate "Nintendo Joy-Con and Pro Controller support"
 	depends on HID
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 7beb3dfc3e67..260e5d9b891d 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -48,6 +48,8 @@ MODULE_LICENSE("GPL");
 
 #include "hid-ids.h"
 
+#include "hid-haptic.h"
+
 /* quirks to control the device */
 #define MT_QUIRK_NOT_SEEN_MEANS_UP	BIT(0)
 #define MT_QUIRK_SLOT_IS_CONTACTID	BIT(1)
@@ -159,11 +161,13 @@ struct mt_report_data {
 struct mt_device {
 	struct mt_class mtclass;	/* our mt device class */
 	struct timer_list release_timer;	/* to release sticky fingers */
+	struct hid_haptic_device *haptic;	/* haptic related configuration */
 	struct hid_device *hdev;	/* hid_device we're attached to */
 	unsigned long mt_io_flags;	/* mt flags (MT_IO_FLAGS_*) */
 	__u8 inputmode_value;	/* InputMode HID feature value */
 	__u8 maxcontacts;
 	bool is_buttonpad;	/* is this device a button pad? */
+	bool is_haptic_touchpad;	/* is this device a haptic touchpad? */
 	bool serial_maybe;	/* need to check for serial protocol */
 
 	struct list_head applications;
@@ -469,6 +473,8 @@ static void mt_feature_mapping(struct hid_device *hdev,
 			hid_get_feature(hdev, field->report);
 		break;
 	}
+
+	hid_haptic_feature_mapping(hdev, td->haptic, field, usage);
 }
 
 static void set_abs(struct input_dev *input, unsigned int code,
@@ -799,6 +805,9 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case HID_DG_TIPPRESSURE:
 			set_abs(hi->input, ABS_MT_PRESSURE, field,
 				cls->sn_pressure);
+			td->is_haptic_touchpad =
+				hid_haptic_check_pressure_unit(td->haptic,
+							       hi, field);
 			MT_STORE_FIELD(p);
 			return 1;
 		case HID_DG_SCANTIME:
@@ -912,8 +921,16 @@ static void mt_release_pending_palms(struct mt_device *td,
 static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
 			  struct input_dev *input)
 {
-	if (app->quirks & MT_QUIRK_WIN8_PTP_BUTTONS)
-		input_event(input, EV_KEY, BTN_LEFT, app->left_button_state);
+	if (td->is_haptic_touchpad)
+		hid_haptic_handle_press_release(td->haptic);
+
+	if (app->quirks & MT_QUIRK_WIN8_PTP_BUTTONS) {
+		if (!(td->is_haptic_touchpad &&
+		    hid_haptic_handle_input(td->haptic))) {
+			input_event(input, EV_KEY, BTN_LEFT,
+				    app->left_button_state);
+		}
+	}
 
 	input_mt_sync_frame(input);
 	input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
@@ -923,6 +940,8 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
 
 	app->num_received = 0;
 	app->left_button_state = 0;
+	if (td->is_haptic_touchpad)
+		hid_haptic_pressure_reset(td->haptic);
 
 	if (test_bit(MT_IO_FLAGS_ACTIVE_SLOTS, &td->mt_io_flags))
 		set_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags);
@@ -1072,6 +1091,9 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 			minor = minor >> 1;
 		}
 
+		if (td->is_haptic_touchpad)
+			hid_haptic_pressure_increase(td->haptic, *slot->p);
+
 		input_event(input, EV_ABS, ABS_MT_POSITION_X, *slot->x);
 		input_event(input, EV_ABS, ABS_MT_POSITION_Y, *slot->y);
 		input_event(input, EV_ABS, ABS_MT_TOOL_X, *slot->cx);
@@ -1281,6 +1303,7 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	struct mt_device *td = hid_get_drvdata(hdev);
 	struct mt_application *application;
 	struct mt_report_data *rdata;
+	int ret;
 
 	rdata = mt_find_report_data(td, field->report);
 	if (!rdata) {
@@ -1343,6 +1366,11 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (field->physical == HID_DG_STYLUS)
 		hi->application = HID_DG_STYLUS;
 
+	ret = hid_haptic_input_mapping(hdev, td->haptic, hi, field, usage, bit,
+				       max);
+	if (ret != 0)
+		return ret;
+
 	/* let hid-core decide for the others */
 	return 0;
 }
@@ -1593,6 +1621,14 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 		}
 	}
 
+	if (td->is_haptic_touchpad && (td->mtclass.name == MT_CLS_WIN_8 ||
+	    td->mtclass.name == MT_CLS_WIN_8_FORCE_MULTI_INPUT)) {
+		if (hid_haptic_input_configured(hdev, td->haptic, hi) == 0)
+			td->is_haptic_touchpad = false;
+	} else {
+		td->is_haptic_touchpad = false;
+	}
+
 	return 0;
 }
 
@@ -1684,6 +1720,9 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
 		return -ENOMEM;
 	}
+	td->haptic = kzalloc(sizeof(*(td->haptic)), GFP_KERNEL);
+	if (!td->haptic)
+		return -ENOMEM;
 	td->hdev = hdev;
 	td->mtclass = *mtclass;
 	td->inputmode_value = MT_INPUTMODE_TOUCHSCREEN;
@@ -1735,6 +1774,17 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
 
+	if (td->is_haptic_touchpad) {
+		if (hid_haptic_init(hdev, &td->haptic)) {
+			dev_warn(&hdev->dev, "Cannot allocate haptic for %s\n",
+				 hdev->name);
+			td->is_haptic_touchpad = false;
+			kfree(td->haptic);
+		}
+	} else {
+		kfree(td->haptic);
+	}
+
 	return 0;
 }
 
@@ -1742,6 +1792,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
+	struct hid_haptic_device *haptic = td->haptic;
 
 	/* High latency is desirable for power savings during S3/S0ix */
 	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
@@ -1750,18 +1801,31 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 	else
 		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
 
+	if (td->is_haptic_touchpad)
+		hid_haptic_resume(hdev, haptic);
+
 	return 0;
 }
 
 static int mt_reset_resume(struct hid_device *hdev)
 {
+	struct mt_device *td = hid_get_drvdata(hdev);
+	struct hid_haptic_device *haptic = td->haptic;
+
 	mt_release_contacts(hdev);
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+
+	if (td->is_haptic_touchpad)
+		hid_haptic_resume(hdev, haptic);
+
 	return 0;
 }
 
 static int mt_resume(struct hid_device *hdev)
 {
+	struct mt_device *td = hid_get_drvdata(hdev);
+	struct hid_haptic_device *haptic = td->haptic;
+
 	/* Some Elan legacy devices require SET_IDLE to be set on resume.
 	 * It should be safe to send it to other devices too.
 	 * Tested on 3M, Stantum, Cypress, Zytronic, eGalax, and Elan panels. */
@@ -1770,6 +1834,9 @@ static int mt_resume(struct hid_device *hdev)
 
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
 
+	if (td->is_haptic_touchpad)
+		hid_haptic_suspend(hdev, haptic);
+
 	return 0;
 }
 #endif
-- 
2.34.1.307.g9b7440fafd-goog

