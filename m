Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A51A1240E5
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 09:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbfLRICR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 03:02:17 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45824 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfLRICQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 03:02:16 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so819287pgk.12;
        Wed, 18 Dec 2019 00:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=n363ckt80OC6w9Gla54BO6ui4m8bnWsgDlZFAMHXc0w=;
        b=W8z2T1d4GwL9jbI1cnNLj+IrMd2q4U8J/2ceDn65wufGtPxsRdVevPpduhlbWU8OEE
         5wUPDM1BrG8A7XUWiQmsK/K05J0xdxoy+UMW69kxI7hnJ0AuqeEQHAHuKH/TMUsPKMpG
         4dTxKOkSkmXZfyGFnsD7ueGXnmJKJnhCRxovFhOE4IF4etzugDd3AqLj2CZLfGuXIZaT
         7jkgEj4YY1EkTsxCgjtR05eaqQ1Z+byhoyCCroX5A5FSJFsqULP6CD+6i23MDiQmT7zS
         HQP9k/gBZ31czJthgHWlNAcsqhMF3uEAbQOpL2d0GblKnTuHmHX/8wr5PbUcZ3jiQ90b
         l4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n363ckt80OC6w9Gla54BO6ui4m8bnWsgDlZFAMHXc0w=;
        b=sz4LBoxF0azXwRg+cRjwzp1SI8orFgwTyyF/DW6NCuB+eN3zvczEPc925qjli8MXvL
         c7xk2hSIDvNvmVmZ6BUShhZi8eqsAMj4NrHLl39BVPN/WU/xdV7kgw/aoRxI9tRaPpkm
         oU5J6Pfr6ah0jai6zMlFFkqI3Srz67nBk1sm6zPgYlbsEFXmG0ejd56sJ5JzMoRk/jHY
         uZy7FCW1/LtO5UUaxiHzNcEbgCsjo2NsuK4Q2d33b1SbF81c6iGpan3hmKQVb/b7Mn8G
         fqOxwip545PfukL4lMS/51HlltkXSBPEVyU3tI77dPBx9UHAY4d6OHiMESmDRTGlV8YG
         ZjOw==
X-Gm-Message-State: APjAAAXX4/ENRfbUlw7ZddBcM+emir5umnpblZUePMqH8F+7ahx6a8jS
        z5yO43err0DpUMVUsmGPLoTHVTtoiRS+fw==
X-Google-Smtp-Source: APXvYqyepGVLKB4Cj/YWyjabdX/jvjgmd4g6+3rv+6HhyWk73LFUKohNcDCVUebsKWUUzgJzorptrA==
X-Received: by 2002:a62:3141:: with SMTP id x62mr1634189pfx.214.1576656135864;
        Wed, 18 Dec 2019 00:02:15 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id 11sm1886442pfz.25.2019.12.18.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 00:02:15 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     bonbons@linux-vserver.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] hid: hid-picolcd: fix possible sleep-in-atomic-context bug
Date:   Wed, 18 Dec 2019 16:02:01 +0800
Message-Id: <20191218080201.2508-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver may sleep while holding a read lock.
The function call path (from bottom to top) in Linux 4.19 is:

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-picolcd_leds.c, 56:
	hid_hw_request in picolcd_leds_set
drivers/hid/hid-picolcd_leds.c, 53:
	_raw_spin_lock_irqsave in picolcd_leds_set

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-picolcd_lcd.c, 49: 
	hid_hw_request in picolcd_set_contrast
drivers/hid/hid-picolcd_lcd.c, 46: 
	_raw_spin_lock_irqsave in picolcd_set_contrast

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-picolcd_core.c, 245: 
	hid_hw_request in picolcd_reset
drivers/hid/hid-picolcd_core.c, 235: 
	_raw_spin_lock_irqsave in picolcd_reset

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-picolcd_core.c, 111: 
	hid_hw_request in picolcd_send_and_wait
drivers/hid/hid-picolcd_core.c, 100: 
	_raw_spin_lock_irqsave in picolcd_send_and_wait

hid_alloc_report_buf(GFP_KERNEL) can sleep at runtime.

To fix these bugs, hid_hw_request() is called without holding the
spinlock.

These bugs are found by a static analysis tool STCheck written by myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/hid/hid-picolcd_core.c | 4 ++--
 drivers/hid/hid-picolcd_lcd.c  | 6 ++++--
 drivers/hid/hid-picolcd_leds.c | 6 ++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
index 1b5c63241af0..55d1892daa15 100644
--- a/drivers/hid/hid-picolcd_core.c
+++ b/drivers/hid/hid-picolcd_core.c
@@ -99,8 +99,8 @@ struct picolcd_pending *picolcd_send_and_wait(struct hid_device *hdev,
 		work = NULL;
 	} else {
 		data->pending = work;
-		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
 		spin_unlock_irqrestore(&data->lock, flags);
+		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
 		wait_for_completion_interruptible_timeout(&work->ready, HZ*2);
 		spin_lock_irqsave(&data->lock, flags);
 		data->pending = NULL;
@@ -233,8 +233,8 @@ int picolcd_reset(struct hid_device *hdev)
 		spin_unlock_irqrestore(&data->lock, flags);
 		return -ENODEV;
 	}
-	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
 	spin_unlock_irqrestore(&data->lock, flags);
+	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
 
 	error = picolcd_check_version(hdev);
 	if (error)
diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
index 0c4b76de8ae5..1fd291674ffe 100644
--- a/drivers/hid/hid-picolcd_lcd.c
+++ b/drivers/hid/hid-picolcd_lcd.c
@@ -26,6 +26,7 @@ static int picolcd_get_contrast(struct lcd_device *ldev)
 static int picolcd_set_contrast(struct lcd_device *ldev, int contrast)
 {
 	struct picolcd_data *data = lcd_get_data(ldev);
+	int status;
 	struct hid_report *report = picolcd_out_report(REPORT_CONTRAST, data->hdev);
 	unsigned long flags;
 
@@ -35,9 +36,10 @@ static int picolcd_set_contrast(struct lcd_device *ldev, int contrast)
 	data->lcd_contrast = contrast & 0x0ff;
 	spin_lock_irqsave(&data->lock, flags);
 	hid_set_field(report->field[0], 0, data->lcd_contrast);
-	if (!(data->status & PICOLCD_FAILED))
-		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
+	status = data->status;
 	spin_unlock_irqrestore(&data->lock, flags);
+	if (!(status & PICOLCD_FAILED))
+		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
 	return 0;
 }
 
diff --git a/drivers/hid/hid-picolcd_leds.c b/drivers/hid/hid-picolcd_leds.c
index 6b505a753511..6652aa6b98dd 100644
--- a/drivers/hid/hid-picolcd_leds.c
+++ b/drivers/hid/hid-picolcd_leds.c
@@ -32,6 +32,7 @@
 void picolcd_leds_set(struct picolcd_data *data)
 {
 	struct hid_report *report;
+	int status;
 	unsigned long flags;
 
 	if (!data->led[0])
@@ -42,9 +43,10 @@ void picolcd_leds_set(struct picolcd_data *data)
 
 	spin_lock_irqsave(&data->lock, flags);
 	hid_set_field(report->field[0], 0, data->led_state);
-	if (!(data->status & PICOLCD_FAILED))
-		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
+	status = data->status;
 	spin_unlock_irqrestore(&data->lock, flags);
+	if (!(status & PICOLCD_FAILED))
+		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
 }
 
 static void picolcd_led_set_brightness(struct led_classdev *led_cdev,
-- 
2.17.1

