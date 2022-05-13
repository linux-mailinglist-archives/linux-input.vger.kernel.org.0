Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1E7525EE7
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354780AbiEMJkD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379115AbiEMJjx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:53 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FA2291CE2
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:51 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v12so10620690wrv.10
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jvbL12JBsvUnjK8beQwP9IotG1D9vlXC3JgbiZAuuyg=;
        b=5YEQGMyjgZrhyRZvmVXnqRC69A41SxRxTMAdTlg8IPsVZxO9oiPbUlCertmV3XXrJF
         waDkfNUtYggyyUpKsloIHtq2OcG7iSPB95rT+enmUgGXX8ba/9FBmTHu8Ogw87X08++w
         8gzR7BS6Nxrw6MkhkYBaC+ivzt5j/xoLUre/kOSCMhYhTvJNzWTs+kev5IcopAKYQ/09
         oI3I2HITl5lckb5YEI+8p7NI0YLX0bZM+lH3jeAzDUxDaUw2bmZoMPVC9B+NugWUlAWb
         ucDK5RzbKWM/9T/3vPfZi//IvYfWwUFFamBOejCqxk0PbEOxmZJPJUBykppQjh0taHBk
         YusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jvbL12JBsvUnjK8beQwP9IotG1D9vlXC3JgbiZAuuyg=;
        b=XJaehWE4D+8TYatnV5uwuWHGIBUTNLLOEwlD5SxVw0Qo1zWHcauPta3Ki9KtltiVma
         Ejk/ta2/VnXGC9OLUol6mBh2WEqYPjSXBFZbw7ePH9vlMJycxpBvV59q5RiN4tcvM3iI
         da4sSx3BCNDWsY6AD0CrLGoIv9URzjvUkUuqMIGG5dpbdmausk5nSv2xo4251OoH2Yzt
         AjzZqJ2wOK4lk4lPQG1c3XmP+s/UREyyZ4krsriBpPV7v43pEHqwhkTKRtTV0q4qwoP1
         AR+hMm7zd7xuwLwWdpFNi57/4VQNMiLh5AQ94iK06BkUIQDd3gIUUFkHYhnzhbyIuyE9
         mqRw==
X-Gm-Message-State: AOAM533wN471Ik8qiDY4rYBddcnblqZb/jxIoPH5iRUZirvmh/0MsWKn
        ijsRiEdpBI8q9TLwDSh3XcVBdXITYMWtQtstMBs=
X-Google-Smtp-Source: ABdhPJzCQKRCbA1VOr0B4ecjh8Qbkk5OUGA1kJKccj6ERvdSC88vI9ivWHZw62h4REmtO7W8NlCArQ==
X-Received: by 2002:adf:f0c6:0:b0:20a:d31b:6 with SMTP id x6-20020adff0c6000000b0020ad31b0006mr3147243wro.162.1652434791332;
        Fri, 13 May 2022 02:39:51 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:51 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 12/17] HID: multitouch: add haptic multitouch support
Date:   Fri, 13 May 2022 09:39:22 +0000
Message-Id: <20220513093927.1632262-13-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index c892cfea3bb5..58f42489bdb1 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -768,6 +768,17 @@ config HID_MULTITOUCH
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
index 99eabfb4145b..7546c98de503 100644
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
@@ -501,6 +506,8 @@ static void mt_feature_mapping(struct hid_device *hdev,
 			mt_get_feature(hdev, field->report);
 		break;
 	}
+
+	hid_haptic_feature_mapping(hdev, td->haptic, field, usage);
 }
 
 static void set_abs(struct input_dev *input, unsigned int code,
@@ -831,6 +838,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case HID_DG_TIPPRESSURE:
 			set_abs(hi->input, ABS_MT_PRESSURE, field,
 				cls->sn_pressure);
+			td->is_forcepad =
+				hid_haptic_is_forcepad(td->haptic, hi, field);
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
+			hid_haptic_pressure_update(td->haptic, *slot->p);
+
 		input_event(input, EV_ABS, ABS_MT_POSITION_X, *slot->x);
 		input_event(input, EV_ABS, ABS_MT_POSITION_Y, *slot->y);
 		input_event(input, EV_ABS, ABS_MT_TOOL_X, *slot->cx);
@@ -1278,6 +1300,10 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (cls->is_indirect)
 		app->mt_flags |= INPUT_MT_POINTER;
 
+	/* Get rid of and use default behaviour? */
+	if (td->is_haptic_touchpad)
+		app->mt_flags |= INPUT_MT_MAX_FORCE;
+
 	if (app->quirks & MT_QUIRK_NOT_SEEN_MEANS_UP)
 		app->mt_flags |= INPUT_MT_DROP_UNUSED;
 
@@ -1313,6 +1339,7 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	struct mt_device *td = hid_get_drvdata(hdev);
 	struct mt_application *application;
 	struct mt_report_data *rdata;
+	int ret;
 
 	rdata = mt_find_report_data(td, field->report);
 	if (!rdata) {
@@ -1375,6 +1402,11 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
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
@@ -1568,6 +1600,17 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
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
@@ -1713,6 +1756,9 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
 		return -ENOMEM;
 	}
+	td->haptic = kzalloc(sizeof(*(td->haptic)), GFP_KERNEL);
+	if (!td->haptic)
+		return -ENOMEM;
 	td->hdev = hdev;
 	td->mtclass = *mtclass;
 	td->inputmode_value = MT_INPUTMODE_TOUCHSCREEN;
@@ -1764,6 +1810,17 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
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
 
@@ -1771,6 +1828,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
+	struct hid_haptic_device *haptic = td->haptic;
 
 	/* High latency is desirable for power savings during S3/S0ix */
 	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
@@ -1779,18 +1837,31 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
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
@@ -1799,6 +1870,9 @@ static int mt_resume(struct hid_device *hdev)
 
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
 
+	if (td->is_haptic_touchpad)
+		hid_haptic_resume(hdev, haptic);
+
 	return 0;
 }
 #endif
-- 
2.36.0.550.gb090851708-goog

