Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3758B27D8
	for <lists+linux-input@lfdr.de>; Sat, 14 Sep 2019 00:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389689AbfIMWDW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Sep 2019 18:03:22 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39219 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389617AbfIMWDW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Sep 2019 18:03:22 -0400
Received: by mail-pf1-f196.google.com with SMTP id i1so10073678pfa.6
        for <linux-input@vger.kernel.org>; Fri, 13 Sep 2019 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=25qzplbXApZnP+DKOlWLX+iTXkqbrEK2FpGiW9vlz0c=;
        b=P4dhKWyP4Ub/MZ6AMjDsPu+4zpjqVjT5+JSJvszkLnyJkhnTrKAvWBbD6wZ8exTXmo
         B+5l22PlldcHjMBnQWB/mDb/xj+p+hpHx91A9h0RsvI9KUVmPgzWrlQEDFnTFWWv3xzb
         RQyZVEjJNoL+QwHQ8/dWtl55tNjy7n4XIuRAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=25qzplbXApZnP+DKOlWLX+iTXkqbrEK2FpGiW9vlz0c=;
        b=RvJ7aG1vMQHM+lcchjUW5/CMyOFqKrZ8V3vxLvFlxm2dH5xKPV/tUNqjerPYbGqjpw
         bTHlWbP50Eo83RkIrre8/Sh7a9AzZNtNW+t3ln0em1K3AAkeq1UI2Y1zxhfpkbCUrvt6
         gZbIjtMhRSDC/I/DKvl3FDxIiBdb8CROZ8kzsorWioKl5dYubjWIsXoaCitDLqEuJTiz
         67lSV+I4stF6YFv2GY9QT5ZK/auUD/GcHM6L9o7Iej7zXbquz+wQy26nAFRzeu11qNxC
         aBxaq1xsLVjnBZ+1SNyEMLvVxuUWTG94hyZpvCN67J6wEtUtZFaxE8WSVgZpYTYoPSOQ
         5vSg==
X-Gm-Message-State: APjAAAUVyBOgjqQkJc1K9p9/0KXh+Cvgu3UwvaklquiK2OzpbLbish+2
        IE/pJXMkVRPVez3cVMlS36L73g==
X-Google-Smtp-Source: APXvYqyYA+41djJA2irqj5wpO7M+ULzOQnTc8ElqcWKy1Ruq7000CypPFM4TDB2HUSKSTm1A9MSd3Q==
X-Received: by 2002:a62:780c:: with SMTP id t12mr57332149pfc.211.1568412201427;
        Fri, 13 Sep 2019 15:03:21 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o19sm2524486pjr.23.2019.09.13.15.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 15:03:20 -0700 (PDT)
From:   Dmitry Torokhov <dtor@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] HID: google: whiskers: more robust tablet mode detection
Date:   Fri, 13 Sep 2019 15:03:15 -0700
Message-Id: <20190913220317.58289-1-dtor@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The USB interface may get detected before the platform/EC one, so let's
note the state of the base (if we receive event) and use it to correctly
initialize the tablet mode switch state.

Also let's start the HID interface immediately when probing, this will
ensure that we correctly process "base folded" events that may be sent
as we initialize the base. Note that this requires us to add a release()
function where we stop and close the hardware and switch the LED
registration away from devm interface as we need to make sure that we
destroy the LED instance before we stop the hardware.

Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 71 ++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 84f8c127ebdc..4f64f93ddfcb 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -35,6 +35,7 @@ struct cbas_ec {
 	struct device *dev;	/* The platform device (EC) */
 	struct input_dev *input;
 	bool base_present;
+	bool base_folded;
 	struct notifier_block notifier;
 };
 
@@ -208,7 +209,14 @@ static int __cbas_ec_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	input_report_switch(input, SW_TABLET_MODE, !cbas_ec.base_present);
+	if (!cbas_ec.base_present)
+		cbas_ec.base_folded = false;
+
+	dev_dbg(&pdev->dev, "%s: base: %d, folded: %d\n", __func__,
+		cbas_ec.base_present, cbas_ec.base_folded);
+
+	input_report_switch(input, SW_TABLET_MODE,
+			    !cbas_ec.base_present || cbas_ec.base_folded);
 
 	cbas_ec_set_input(input);
 
@@ -322,10 +330,9 @@ static int hammer_kbd_brightness_set_blocking(struct led_classdev *cdev,
 static int hammer_register_leds(struct hid_device *hdev)
 {
 	struct hammer_kbd_leds *kbd_backlight;
+	int error;
 
-	kbd_backlight = devm_kzalloc(&hdev->dev,
-				     sizeof(*kbd_backlight),
-				     GFP_KERNEL);
+	kbd_backlight = kzalloc(sizeof(*kbd_backlight), GFP_KERNEL);
 	if (!kbd_backlight)
 		return -ENOMEM;
 
@@ -339,7 +346,26 @@ static int hammer_register_leds(struct hid_device *hdev)
 	/* Set backlight to 0% initially. */
 	hammer_kbd_brightness_set_blocking(&kbd_backlight->cdev, 0);
 
-	return devm_led_classdev_register(&hdev->dev, &kbd_backlight->cdev);
+	error = led_classdev_register(&hdev->dev, &kbd_backlight->cdev);
+	if (error)
+		goto err_free_mem;
+
+	hid_set_drvdata(hdev, kbd_backlight);
+	return 0;
+
+err_free_mem:
+	kfree(kbd_backlight);
+	return error;
+}
+
+static void hammer_unregister_leds(struct hid_device *hdev)
+{
+	struct hammer_kbd_leds *kbd_backlight = hid_get_drvdata(hdev);
+
+	if (kbd_backlight) {
+		led_classdev_unregister(&kbd_backlight->cdev);
+		kfree(kbd_backlight);
+	}
 }
 
 #define HID_UP_GOOGLEVENDOR	0xffd10000
@@ -376,8 +402,9 @@ static int hammer_event(struct hid_device *hid, struct hid_field *field,
 	    usage->hid == WHISKERS_KBD_FOLDED) {
 		spin_lock_irqsave(&cbas_ec_lock, flags);
 
+		cbas_ec.base_folded = value;
 		hid_dbg(hid, "%s: base: %d, folded: %d\n", __func__,
-			cbas_ec.base_present, value);
+			cbas_ec.base_present, cbas_ec.base_folded);
 
 		/*
 		 * We should not get event if base is detached, but in case
@@ -436,6 +463,14 @@ static int hammer_probe(struct hid_device *hdev,
 {
 	int error;
 
+	error = hid_parse(hdev);
+	if (error)
+		return error;
+
+	error = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (error)
+		return error;
+
 	/*
 	 * We always want to poll for, and handle tablet mode events from
 	 * Whiskers, even when nobody has opened the input device. This also
@@ -443,16 +478,12 @@ static int hammer_probe(struct hid_device *hdev,
 	 * the device.
 	 */
 	if (hdev->product == USB_DEVICE_ID_GOOGLE_WHISKERS &&
-			hammer_is_keyboard_interface(hdev))
+	    hammer_is_keyboard_interface(hdev)) {
 		hdev->quirks |= HID_QUIRK_ALWAYS_POLL;
-
-	error = hid_parse(hdev);
-	if (error)
-		return error;
-
-	error = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
-	if (error)
-		return error;
+		error = hid_hw_open(hdev);
+		if (error)
+			return error;
+	}
 
 	if (hammer_has_backlight_control(hdev)) {
 		error = hammer_register_leds(hdev);
@@ -465,6 +496,15 @@ static int hammer_probe(struct hid_device *hdev,
 	return 0;
 }
 
+static void hammer_remove(struct hid_device *hdev)
+{
+	if (hdev->product == USB_DEVICE_ID_GOOGLE_WHISKERS &&
+			hammer_is_keyboard_interface(hdev))
+		hid_hw_close(hdev);
+
+	hammer_unregister_leds(hdev);
+	hid_hw_stop(hdev);
+}
 
 static const struct hid_device_id hammer_devices[] = {
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
@@ -483,6 +523,7 @@ static struct hid_driver hammer_driver = {
 	.name = "hammer",
 	.id_table = hammer_devices,
 	.probe = hammer_probe,
+	.remove = hammer_remove,
 	.input_mapping = hammer_input_mapping,
 	.event = hammer_event,
 };
-- 
2.23.0.237.gc6a4ce50a0-goog

