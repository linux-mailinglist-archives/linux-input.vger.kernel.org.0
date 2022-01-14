Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74FB648EFF6
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243143AbiANSco (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243123AbiANScg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:36 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C634C061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:36 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id ay4-20020a05600c1e0400b0034a81a94607so6318232wmb.1
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PayoLFvRwC+37a4oakMmMBF6Q5SFDBpj4RWVePynPxo=;
        b=c4LkiYwffb39zsEmgIz+bGA02zqLWHItPK9DSorW9/8J6tosUJ2whjV8iTipO3HbJA
         nF7pjV4JXt78kGhVgKMDcsCHJbSYVXoqtPODxSDhHE60AuSUrfTyPZ6UncZsiGH710QP
         I9Z33+lk6B+Dv+6dQ0ucBRHF05Y3akW/Ar2xlXBVsFQzrwtNfrgNB443ONlJ5ze1uH7E
         /MCz5AXqSYl5l1kBTON02i+erj66kA9vPDSYi7ZQ+CLgZhxpi1N3PnDb9WF6GcN5kGRx
         j/yMmDUVuRV9gSOXZAZ2CEcgTihIKgIQBBR63eycD/fR107yQXUqycokvpAxqt6h4QPM
         UtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PayoLFvRwC+37a4oakMmMBF6Q5SFDBpj4RWVePynPxo=;
        b=djq8/sXfzbS+Y4366VS1jPRTDWr28zNZDm78BEOBHIlDcpPMxYUWxTXlNpkOX6w9yw
         LURgp1PrinbdtKRW9v0CW2tL6m1BZLejGruoFWCQVPR5Px/XqMo8qro3n5tQu8Ns0YKc
         qIVz7+qQkFYnkWgCsaYYv5ZOE0dmDRkIzfIHumAdvsfC0zbREfPCdwKUO928ovlwKxlv
         Vk2zJ3JfXkHTN2b/WXdGFwtX+Td0sEBQ8u7/rq7xjSgLNsrlfsbakX4g8owxWZyTkYHH
         3pzFd9Ov5oX2JxynQ6IJ/hIBtn8YhsIrBYDTLecHrc4gmtQOYBgYqb3mW5yLvye5eMyo
         doZA==
X-Gm-Message-State: AOAM533LpooI/xepeU3eKi8pGKbsDuBq+qJTxcw5Hgrd0eEYUfmVXVAI
        gVR2XwtreTxYxBwwuWE8t3GmIC4fUp3ECFZSRiU=
X-Google-Smtp-Source: ABdhPJxUumeoJo+uP6/WboGqTv5cQk3DqKo/V6LKfiBxxu2TlsQ8jae67wEBy+kL5Gs00wCwX/ME8w==
X-Received: by 2002:adf:fa02:: with SMTP id m2mr8943201wrr.571.1642185154831;
        Fri, 14 Jan 2022 10:32:34 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:34 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 13/16] HID: multitouch: add haptic multitouch support
Date:   Fri, 14 Jan 2022 18:31:49 +0000
Message-Id: <20220114183152.1691659-14-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
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
 drivers/hid/hid-multitouch.c | 74 +++++++++++++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 3e7555b868e7..a202f01de912 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -755,6 +755,17 @@ config HID_MULTITOUCH
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
index 99eabfb4145b..ec51e189bb1d 100644
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
@@ -501,6 +505,8 @@ static void mt_feature_mapping(struct hid_device *hdev,
 			mt_get_feature(hdev, field->report);
 		break;
 	}
+
+	hid_haptic_feature_mapping(hdev, td->haptic, field, usage);
 }
 
 static void set_abs(struct input_dev *input, unsigned int code,
@@ -831,6 +837,9 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case HID_DG_TIPPRESSURE:
 			set_abs(hi->input, ABS_MT_PRESSURE, field,
 				cls->sn_pressure);
+			td->is_haptic_touchpad =
+				hid_haptic_check_pressure_unit(td->haptic,
+							       hi, field);
 			MT_STORE_FIELD(p);
 			return 1;
 		case HID_DG_SCANTIME:
@@ -944,8 +953,16 @@ static void mt_release_pending_palms(struct mt_device *td,
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
@@ -955,6 +972,8 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
 
 	app->num_received = 0;
 	app->left_button_state = 0;
+	if (td->is_haptic_touchpad)
+		hid_haptic_pressure_reset(td->haptic);
 
 	if (test_bit(MT_IO_FLAGS_ACTIVE_SLOTS, &td->mt_io_flags))
 		set_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags);
@@ -1104,6 +1123,9 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 			minor = minor >> 1;
 		}
 
+		if (td->is_haptic_touchpad)
+			hid_haptic_pressure_increase(td->haptic, *slot->p);
+
 		input_event(input, EV_ABS, ABS_MT_POSITION_X, *slot->x);
 		input_event(input, EV_ABS, ABS_MT_POSITION_Y, *slot->y);
 		input_event(input, EV_ABS, ABS_MT_TOOL_X, *slot->cx);
@@ -1278,6 +1300,9 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (cls->is_indirect)
 		app->mt_flags |= INPUT_MT_POINTER;
 
+	if (td->is_haptic_touchpad)
+		app->mt_flags |= INPUT_MT_TOTAL_FORCE;
+
 	if (app->quirks & MT_QUIRK_NOT_SEEN_MEANS_UP)
 		app->mt_flags |= INPUT_MT_DROP_UNUSED;
 
@@ -1313,6 +1338,7 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	struct mt_device *td = hid_get_drvdata(hdev);
 	struct mt_application *application;
 	struct mt_report_data *rdata;
+	int ret;
 
 	rdata = mt_find_report_data(td, field->report);
 	if (!rdata) {
@@ -1375,6 +1401,11 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
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
@@ -1568,6 +1599,14 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	struct hid_report *report;
 	int ret;
 
+	if (td->is_haptic_touchpad && (td->mtclass.name == MT_CLS_WIN_8 ||
+	    td->mtclass.name == MT_CLS_WIN_8_FORCE_MULTI_INPUT)) {
+		if (hid_haptic_input_configured(hdev, td->haptic, hi) == 0)
+			td->is_haptic_touchpad = false;
+	} else {
+		td->is_haptic_touchpad = false;
+	}
+
 	list_for_each_entry(report, &hi->reports, hidinput_list) {
 		rdata = mt_find_report_data(td, report);
 		if (!rdata) {
@@ -1713,6 +1752,9 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
 		return -ENOMEM;
 	}
+	td->haptic = kzalloc(sizeof(*(td->haptic)), GFP_KERNEL);
+	if (!td->haptic)
+		return -ENOMEM;
 	td->hdev = hdev;
 	td->mtclass = *mtclass;
 	td->inputmode_value = MT_INPUTMODE_TOUCHSCREEN;
@@ -1764,6 +1806,17 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
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
 
@@ -1771,6 +1824,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
+	struct hid_haptic_device *haptic = td->haptic;
 
 	/* High latency is desirable for power savings during S3/S0ix */
 	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
@@ -1779,18 +1833,31 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
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
@@ -1799,6 +1866,9 @@ static int mt_resume(struct hid_device *hdev)
 
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
 
+	if (td->is_haptic_touchpad)
+		hid_haptic_suspend(hdev, haptic);
+
 	return 0;
 }
 #endif
-- 
2.34.1.703.g22d0c6ccf7-goog

