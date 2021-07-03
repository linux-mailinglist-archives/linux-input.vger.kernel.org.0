Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310293BAA6D
	for <lists+linux-input@lfdr.de>; Sun,  4 Jul 2021 00:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhGCWFP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 18:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhGCWFG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Jul 2021 18:05:06 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1465CC061762;
        Sat,  3 Jul 2021 15:02:31 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t3so18394683edc.7;
        Sat, 03 Jul 2021 15:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JR2liRXOxmwJp1ZJ/wg7Rq+iYd/du1qufuFzoWCde2U=;
        b=DHknTo8ur7PtmMgDVSZZTeM/L6r9NsipDC3ZO54pRDYgkuxaP2bCEGxCn/u7/pcoAK
         rPLJ8AmxpUOe6FXiz5N8c11RPw9suc7n3ZqxCpr9t6dFy989g6PDIGtmxcn9wLCuSH+C
         JBGL+9OSZzhAMpI6w+EEN2/Vq77DG0iBav0FUzvyZR3WAGkjlL6RCkjX1z1hsSKUpnhB
         ZwVwG3QC6cmMyH3eOQn7ARidCUs+G2UpkKghnCJOMjHRA22Fd4XjflhDP64zN8vKL8iA
         B6882+QJNvS1goBijcRf+UiPpW+mQao4gNHEb7Jef1oWvy4SS3CvlkNu2ZtDcJ25Fmoe
         H6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JR2liRXOxmwJp1ZJ/wg7Rq+iYd/du1qufuFzoWCde2U=;
        b=Rj8bjHSp7AlsKDGIjtIaH/UkT/4X6lt8yC+fws6zpHMHTzKP+FPkow9t6zlgbpewN1
         /VfIcEldmGJro/Y6fypIrwZ0tpi7OykqFb2WCuDOSqn8whtYr5wDJnHPfqUopr6pE4N4
         Lo64Vjo70R7P7+Q6JGDIScPNlVaA/DFh3DtT1Sat4ICaV/3a8+PEAXmPWaod8Q0YpHCT
         weTlYRUe3aRihUKfc93O1kZaJbcwDf7dvU80SChBvm//GcMZn6ugZqjMzlKoBgizqG6M
         bjRvpe1vmt0rxSqaxUvj9rcDB8PYA//9SIz+7W6i1wD7U27A6yE24mNGHSJ5Qr9Bn0aC
         iDZw==
X-Gm-Message-State: AOAM530DfDYgc2N38W/98wXHqfmlaatOhl/X7zyMzTXbvCFnqhmkdf8Y
        rVwEV9Okgpi8DsrzLUohBB8=
X-Google-Smtp-Source: ABdhPJyClyCALMa908kKtzm5KeLC3McFMvWnlClfErsChIKXT9DCjunHg7h7ARNv5EJp8oiAS36jaw==
X-Received: by 2002:a05:6402:411:: with SMTP id q17mr7092227edv.313.1625349749700;
        Sat, 03 Jul 2021 15:02:29 -0700 (PDT)
Received: from warrior.lan ([2a03:7380:2407:bc63:7e28:eb67:305b:8ba0])
        by smtp.gmail.com with ESMTPSA id b25sm3186110edv.9.2021.07.03.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 15:02:29 -0700 (PDT)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 5/6] HID: hid-input: Update LEDs in all HID reports
Date:   Sun,  4 Jul 2021 01:02:01 +0300
Message-Id: <20210703220202.5637-6-maxtram95@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210703220202.5637-1-maxtram95@gmail.com>
References: <20210703220202.5637-1-maxtram95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hidinput_led_worker is scheduled on a work queue to update all LEDs in a
batch. However, it uses hidinput_get_led_field which gets the first LED
field found, and updates only the report this field belongs to. There
are devices that expose multiple LEDs in multiple reports. The current
implementation of the worker fails to update some LEDs on such devices.

Plantronics Blackwire 3220 Series (047f:c056) is an example of such
device. Only mute LED works, but offhook and ring LEDs don't work.

This commit fixes hidinput_led_worker by making it go over all reports
that contain at least one LED field.

Fixes: 4371ea8202e9 ("HID: usbhid: defer LED setting to a workqueue")
Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/hid/hid-input.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 533a7f429a5f..29f59208b34c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1663,22 +1663,29 @@ unsigned int hidinput_count_leds(struct hid_device *hid)
 }
 EXPORT_SYMBOL_GPL(hidinput_count_leds);
 
-static void hidinput_led_worker(struct work_struct *work)
+static bool hidinput_is_led_report(struct hid_report *report)
 {
-	struct hid_device *hid = container_of(work, struct hid_device,
-					      led_work);
 	struct hid_field *field;
-	struct hid_report *report;
+	int i, j;
+
+	for (i = 0; i < report->maxfield; i++) {
+		field = report->field[i];
+		for (j = 0; j < field->maxusage; j++)
+			if (field->usage[j].type == EV_LED)
+				return true;
+	}
+
+	return false;
+}
+
+static void hidinput_led_update(struct hid_device *hid, struct hid_report *report)
+{
 	int ret;
 	u32 len;
 	__u8 *buf;
 
-	field = hidinput_get_led_field(hid);
-	if (!field)
-		return;
-
 	/*
-	 * field->report is accessed unlocked regarding HID core. So there might
+	 * report is accessed unlocked regarding HID core. So there might
 	 * be another incoming SET-LED request from user-space, which changes
 	 * the LED state while we assemble our outgoing buffer. However, this
 	 * doesn't matter as hid_output_report() correctly converts it into a
@@ -1690,8 +1697,6 @@ static void hidinput_led_worker(struct work_struct *work)
 	 * correct value, guaranteed!
 	 */
 
-	report = field->report;
-
 	/* use custom SET_REPORT request if possible (asynchronous) */
 	if (hid->ll_driver->request)
 		return hid->ll_driver->request(hid, report, HID_REQ_SET_REPORT);
@@ -1711,6 +1716,20 @@ static void hidinput_led_worker(struct work_struct *work)
 	kfree(buf);
 }
 
+static void hidinput_led_worker(struct work_struct *work)
+{
+	struct hid_device *hid = container_of(work, struct hid_device,
+					      led_work);
+	struct hid_report *report;
+
+	list_for_each_entry(report,
+			    &hid->report_enum[HID_OUTPUT_REPORT].report_list,
+			    list) {
+		if (hidinput_is_led_report(report))
+			hidinput_led_update(hid, report);
+	}
+}
+
 static int hidinput_input_event(struct input_dev *dev, unsigned int type,
 				unsigned int code, int value)
 {
-- 
2.32.0

