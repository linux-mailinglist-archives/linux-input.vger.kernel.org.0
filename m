Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3F9C96E3
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 05:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfJCDST (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 23:18:19 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37406 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfJCDSS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 23:18:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id u20so802401plq.4
        for <linux-input@vger.kernel.org>; Wed, 02 Oct 2019 20:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIn7NiyI8xbDV3NNqnM2aeG/Q5yob7NbX8qZedDLm0E=;
        b=XdrIQOHl/QihUD3r9eNtQ8O2AIEJVaCkgqPrzZBvB6kw6kg5m93pzaOTwB3y21PhCu
         07ik2VCJsMIqMlu9UP1U4GI9Dv0XNNvlXTgUpuvmgtEDWsaNSQue/KZRQNw3mMEtJfZf
         XyUhF1P9sWVFcmRIjvLzlltVji+oVK/DhJImg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIn7NiyI8xbDV3NNqnM2aeG/Q5yob7NbX8qZedDLm0E=;
        b=r7y7fqK6vM1BAQUcjYVTNVDjmPWgO/Edb01ZmPD9W5/p+bdqvVz5Zf5AXKdDWhwd3c
         IPS1PsF1mwEeFUN8htx2RjXDDO0iRqW5JFg24uC9kcuqbufuqpr1b23spdPAm2XjPDdS
         mKNafSvbQ16tSWwa+3I7UwgcfVtGmCUHfSUj4JJVob2sDAzbNa8V38awMZOVNxC8Odsj
         GdAhulhY5Og2cIPVJBOmaTuMYMLg0VgPp5/3QGufSvgvO5mWj/PVTWH6W1Yycd7Z0od4
         SB96v08CGIVdTvxv0GnlKblG2T7ez7FxFZIwiu+geHzGfxiGZcrfHvPXE03Tc9WOtBmK
         4saA==
X-Gm-Message-State: APjAAAX3+L8yQLxcT3T3/s+iAY9GhOb4Ssk6WtY5XF41cIhkfsQVy5tr
        p0wtUmdq0eEA/qOcInm0BHkgBQ==
X-Google-Smtp-Source: APXvYqwf+HHwk/ySlDMaSV/jilnX9p2XkYgq4gRZD8ZzoWMrLc1xrrc3AIYGXq814HMMDGRSI1L0hA==
X-Received: by 2002:a17:902:7895:: with SMTP id q21mr7094740pll.94.1570072696247;
        Wed, 02 Oct 2019 20:18:16 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id z12sm880999pfj.41.2019.10.02.20.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:15 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dtor@chromium.org, ikjn@chromium.org
Subject: [PATCH 2/2] HID: google: Detect base folded usage instead of hard-coding whiskers
Date:   Thu,  3 Oct 2019 11:18:00 +0800
Message-Id: <20191003031800.120237-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
In-Reply-To: <20191003031800.120237-1-drinkcat@chromium.org>
References: <20191003031800.120237-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some other hammer-like device will emit a similar code, let's look for
the folded event in HID usage table, instead of hard-coding whiskers
in many places.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 53 ++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index a52535ebc6fe92c..2aa4ed157aec875 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -370,7 +370,7 @@ static void hammer_unregister_leds(struct hid_device *hdev)
 
 #define HID_UP_GOOGLEVENDOR	0xffd10000
 #define HID_VD_KBD_FOLDED	0x00000019
-#define WHISKERS_KBD_FOLDED	(HID_UP_GOOGLEVENDOR | HID_VD_KBD_FOLDED)
+#define HID_USAGE_KBD_FOLDED	(HID_UP_GOOGLEVENDOR | HID_VD_KBD_FOLDED)
 
 /* HID usage for keyboard backlight (Alphanumeric display brightness) */
 #define HID_AD_BRIGHTNESS	0x00140046
@@ -380,8 +380,7 @@ static int hammer_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 				struct hid_usage *usage,
 				unsigned long **bit, int *max)
 {
-	if (hdev->product == USB_DEVICE_ID_GOOGLE_WHISKERS &&
-	    usage->hid == WHISKERS_KBD_FOLDED) {
+	if (usage->hid == HID_USAGE_KBD_FOLDED) {
 		/*
 		 * We do not want to have this usage mapped as it will get
 		 * mixed in with "base attached" signal and delivered over
@@ -398,8 +397,7 @@ static int hammer_event(struct hid_device *hid, struct hid_field *field,
 {
 	unsigned long flags;
 
-	if (hid->product == USB_DEVICE_ID_GOOGLE_WHISKERS &&
-	    usage->hid == WHISKERS_KBD_FOLDED) {
+	if (usage->hid == HID_USAGE_KBD_FOLDED) {
 		spin_lock_irqsave(&cbas_ec_lock, flags);
 
 		/*
@@ -424,33 +422,22 @@ static int hammer_event(struct hid_device *hid, struct hid_field *field,
 	return 0;
 }
 
-static bool hammer_is_keyboard_interface(struct hid_device *hdev)
+static bool hammer_has_usage(struct hid_device *hdev, unsigned int report_type,
+			unsigned application, unsigned usage)
 {
-	struct hid_report_enum *re = &hdev->report_enum[HID_INPUT_REPORT];
-	struct hid_report *report;
-
-	list_for_each_entry(report, &re->report_list, list)
-		if (report->application == HID_GD_KEYBOARD)
-			return true;
-
-	return false;
-}
-
-static bool hammer_has_backlight_control(struct hid_device *hdev)
-{
-	struct hid_report_enum *re = &hdev->report_enum[HID_OUTPUT_REPORT];
+	struct hid_report_enum *re = &hdev->report_enum[report_type];
 	struct hid_report *report;
 	int i, j;
 
 	list_for_each_entry(report, &re->report_list, list) {
-		if (report->application != HID_GD_KEYBOARD)
+		if (report->application != application)
 			continue;
 
 		for (i = 0; i < report->maxfield; i++) {
 			struct hid_field *field = report->field[i];
 
 			for (j = 0; j < field->maxusage; j++)
-				if (field->usage[j].hid == HID_AD_BRIGHTNESS)
+				if (field->usage[j].hid == usage)
 					return true;
 		}
 	}
@@ -458,6 +445,18 @@ static bool hammer_has_backlight_control(struct hid_device *hdev)
 	return false;
 }
 
+static bool hammer_has_folded_event(struct hid_device *hdev)
+{
+	return hammer_has_usage(hdev, HID_INPUT_REPORT,
+				HID_GD_KEYBOARD, HID_USAGE_KBD_FOLDED);
+}
+
+static bool hammer_has_backlight_control(struct hid_device *hdev)
+{
+	return hammer_has_usage(hdev, HID_OUTPUT_REPORT,
+				HID_GD_KEYBOARD, HID_AD_BRIGHTNESS);
+}
+
 static int hammer_probe(struct hid_device *hdev,
 			const struct hid_device_id *id)
 {
@@ -473,12 +472,11 @@ static int hammer_probe(struct hid_device *hdev,
 
 	/*
 	 * We always want to poll for, and handle tablet mode events from
-	 * Whiskers, even when nobody has opened the input device. This also
-	 * prevents the hid core from dropping early tablet mode events from
-	 * the device.
+	 * devices that have folded usage, even when nobody has opened the input
+	 * device. This also prevents the hid core from dropping early tablet
+	 * mode events from the device.
 	 */
-	if (hdev->product == USB_DEVICE_ID_GOOGLE_WHISKERS &&
-	    hammer_is_keyboard_interface(hdev)) {
+	if (hammer_has_folded_event(hdev)) {
 		hdev->quirks |= HID_QUIRK_ALWAYS_POLL;
 		error = hid_hw_open(hdev);
 		if (error)
@@ -500,8 +498,7 @@ static void hammer_remove(struct hid_device *hdev)
 {
 	unsigned long flags;
 
-	if (hdev->product == USB_DEVICE_ID_GOOGLE_WHISKERS &&
-			hammer_is_keyboard_interface(hdev)) {
+	if (hammer_has_folded_event(hdev)) {
 		hid_hw_close(hdev);
 
 		/*
-- 
2.23.0.444.g18eeb5a265-goog

