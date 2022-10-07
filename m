Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B392A5F7D62
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiJGSac (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiJGSa0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:26 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF93C8227
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:22 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id f11so8480001wrm.6
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6rpZCk23DAd4uxYBcpQwglvD4SXC9N8TOJY5DIzZYw=;
        b=On1y+nVe0bhmiG2K1vH3+gr85TCesWhNbQzcW2J6Uo+j39eqClPfaUO42dYRvW7u0M
         j6JJzvxTzQwByX3aUDQS6MzF9xfrMnDk3uJU1vBAcdMO4rx4Fj9uivc0q+NuiyUlWTdy
         qRuVzRQgRB+IYrZvMZDntPcpgS7m3RxnMDfp3XU3OpeOdUECa5GDIx7jLMZ9L6h6HX8M
         KxvZVkh8Ask7Loo+yZ6VdoIUS/PXob4VJe0OrFAoFWQO0afnSVwlHzXj2HKeJLOA7VxB
         ciF4qskb0jlw6VvSy+tFdEUOxpTfR0+qdo/Rd6dP1P5dJGEun6nwRAGbabTKLVvYfuq7
         H6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6rpZCk23DAd4uxYBcpQwglvD4SXC9N8TOJY5DIzZYw=;
        b=m+FryXEE8CLI/D25ImjNap/gR1bKcfblOmZPFxzDgMkE7V8XJxbY6btdAYxQYpvtvc
         q5QwNHIfbmF/5IPuAESb5oGE+QvwNme1rsKQgA9Ffkrv9Qna31zkSmnJeo8/qJ2f7eKT
         M1+CnXE7DE0tZEU4pg0OgZTns7X2SedoRjQBvXyUT4LB/+eHrwWFtPLLm+SDbcGncMJf
         pEK5vGptmLKFI/c28xyli414+halGPUvT5Av4L7fPtx7kyJVMzPX32k1KBJExXuRcsbu
         hppQwB4ykqn7TLsKvjqzKimse9aCWDLnnp/skTjoyMiOPT0sr+DowgeffHPsnWlheY/V
         Q2zg==
X-Gm-Message-State: ACrzQf0JlCq280tpL97g/6RD/MgpuScpfQbKuNjK2T54+Kvl3l0+AcE/
        YSl1tk3XsTIhINUwVcxQGI2HPEuHhOJTBDq7
X-Google-Smtp-Source: AMsMyM4p9YAnutBTiE+/QxwN+TN1BSYh2UkmEofNXyzkcfELDNi7Xrg4/KyfgxDjgUdd1QgT999ESQ==
X-Received: by 2002:adf:dd04:0:b0:22e:4671:f092 with SMTP id a4-20020adfdd04000000b0022e4671f092mr4106822wrm.604.1665167420689;
        Fri, 07 Oct 2022 11:30:20 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:20 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 12/17] HID: multitouch: add haptic multitouch support
Date:   Fri,  7 Oct 2022 18:29:40 +0000
Message-Id: <20221007182945.1654046-13-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
 drivers/hid/Kconfig          | 11 +++++
 drivers/hid/hid-multitouch.c | 78 +++++++++++++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 1b47e5d0d1c07..1dee1fa4589ea 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -776,6 +776,17 @@ config HID_MULTITOUCH
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
index 2e72922e36f56..c50425a4de62c 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -48,6 +48,8 @@ MODULE_LICENSE("GPL");
 
 #include "hid-ids.h"
 
+#include "hid-haptic.h"
+
 /* quirks to control the device */
 #define MT_QUIRK_NOT_SEEN_MEANS_UP	BIT(0)
 #define MT_QUIRK_SLOT_IS_CONTACTID	BIT(1)
@@ -159,11 +161,14 @@ struct mt_report_data {
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
+	bool is_forcepad;	/* is this device a forcepad? */
 	bool serial_maybe;	/* need to check for serial protocol */
 
 	struct list_head applications;
@@ -511,6 +516,8 @@ static void mt_feature_mapping(struct hid_device *hdev,
 			mt_get_feature(hdev, field->report);
 		break;
 	}
+
+	hid_haptic_feature_mapping(hdev, td->haptic, field, usage);
 }
 
 static void set_abs(struct input_dev *input, unsigned int code,
@@ -842,6 +849,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case HID_DG_TIPPRESSURE:
 			set_abs(hi->input, ABS_MT_PRESSURE, field,
 				cls->sn_pressure);
+			td->is_forcepad =
+				hid_haptic_is_forcepad(td->haptic, hi, field);
 			MT_STORE_FIELD(p);
 			return 1;
 		case HID_DG_SCANTIME:
@@ -955,8 +964,16 @@ static void mt_release_pending_palms(struct mt_device *td,
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
@@ -966,6 +983,8 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
 
 	app->num_received = 0;
 	app->left_button_state = 0;
+	if (td->is_haptic_touchpad)
+		hid_haptic_pressure_reset(td->haptic);
 
 	if (test_bit(MT_IO_FLAGS_ACTIVE_SLOTS, &td->mt_io_flags))
 		set_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags);
@@ -1115,6 +1134,9 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 			minor = minor >> 1;
 		}
 
+		if (td->is_haptic_touchpad)
+			hid_haptic_pressure_update(td->haptic, *slot->p);
+
 		input_event(input, EV_ABS, ABS_MT_POSITION_X, *slot->x);
 		input_event(input, EV_ABS, ABS_MT_POSITION_Y, *slot->y);
 		input_event(input, EV_ABS, ABS_MT_TOOL_X, *slot->cx);
@@ -1289,6 +1311,10 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (cls->is_indirect)
 		app->mt_flags |= INPUT_MT_POINTER;
 
+	/* Get rid of and use default behaviour? */
+	if (td->is_haptic_touchpad)
+		app->mt_flags |= INPUT_MT_MAX_FORCE;
+
 	if (app->quirks & MT_QUIRK_NOT_SEEN_MEANS_UP)
 		app->mt_flags |= INPUT_MT_DROP_UNUSED;
 
@@ -1324,6 +1350,7 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	struct mt_device *td = hid_get_drvdata(hdev);
 	struct mt_application *application;
 	struct mt_report_data *rdata;
+	int ret;
 
 	rdata = mt_find_report_data(td, field->report);
 	if (!rdata) {
@@ -1386,6 +1413,11 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
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
@@ -1579,6 +1611,17 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	struct hid_report *report;
 	int ret;
 
+	/* check if hi application is touchpad? */
+	if (hi->application == HID_DG_TOUCHPAD) {
+		if (td->is_forcepad && (td->mtclass.name == MT_CLS_WIN_8 ||
+		    td->mtclass.name == MT_CLS_WIN_8_FORCE_MULTI_INPUT)) {
+			if (hid_haptic_input_configured(hdev, td->haptic))
+				td->is_haptic_touchpad = true;
+		} else {
+			td->is_haptic_touchpad = false;
+		}
+	}
+
 	list_for_each_entry(report, &hi->reports, hidinput_list) {
 		rdata = mt_find_report_data(td, report);
 		if (!rdata) {
@@ -1724,6 +1767,9 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
 		return -ENOMEM;
 	}
+	td->haptic = kzalloc(sizeof(*(td->haptic)), GFP_KERNEL);
+	if (!td->haptic)
+		return -ENOMEM;
 	td->hdev = hdev;
 	td->mtclass = *mtclass;
 	td->inputmode_value = MT_INPUTMODE_TOUCHSCREEN;
@@ -1775,6 +1821,17 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
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
 
@@ -1782,6 +1839,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
+	struct hid_haptic_device *haptic = td->haptic;
 
 	/* High latency is desirable for power savings during S3/S0ix */
 	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
@@ -1790,18 +1848,31 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 	else
 		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
 
+	if (td->is_haptic_touchpad)
+		hid_haptic_suspend(hdev, haptic);
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
@@ -1810,6 +1881,9 @@ static int mt_resume(struct hid_device *hdev)
 
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
 
+	if (td->is_haptic_touchpad)
+		hid_haptic_resume(hdev, haptic);
+
 	return 0;
 }
 #endif
-- 
2.38.0.rc1.362.ged0d419d3c-goog

