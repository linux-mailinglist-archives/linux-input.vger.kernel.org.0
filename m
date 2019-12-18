Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049741241A7
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 09:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfLRI3z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 03:29:55 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44994 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfLRI3y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 03:29:54 -0500
Received: by mail-pl1-f195.google.com with SMTP id az3so640467plb.11;
        Wed, 18 Dec 2019 00:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lH+Y2/G2UYGZoYI1w1l9sZIcWDOhpO7sY4AaAk4DvGs=;
        b=o7kY1tEg3TuY2CQm+hzoVYruwmEVjVhw/kydXeQdNcx3BNdCSrLPxDIxJfu/K/i/6B
         v2kSwTR0jBHaWuZLjpHz+tG48mS8Yn9642UGR6uckmMCT5nnSTOk/d8FZT6XXke0PnKP
         9UXjlfQbaYUa7dzjh4T2ZB7ROYAdTlgvjnaGev3UFNIdGZyzi9EaDtli2vGti+Uv7dHr
         8WawEkmFXZShA77txCyOGBYhV2fbw0MQGFIZ39IgpZdodCtNDU/c5k1c70MXSx6ocP5W
         JIZkY+3kSnU/WMLxNCoPRiDdG1P7NRPteDfQomZ+pkCuFBMh77pNDNm5kuu44//3Ivly
         1Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lH+Y2/G2UYGZoYI1w1l9sZIcWDOhpO7sY4AaAk4DvGs=;
        b=C21Qgv0Or0yBEUIjOZsy4Zmwdx1SqPQEtj5Vw4emBohF7N+y8xHLJvbZLvUp/my5uW
         JMLG7u5/KqxUoNYTzXj0b7hTG0dyN7BvvTGO68UkO2ZFwp87FDDXP2u8U3Xk3XyDTdfi
         GiQbz8aHkgh54cOAe7IDu30n56GQha/NlTZt+dm8F3oIdWOmt8GBvaeouFfR/hbyonBt
         xEXsXdpYyPfeMV29Qm/41SpgtEG8wQ0LafrUJV50UfDMgyi21m2y601VKfI21btVXZc2
         zmtrZ+Oogpimv/Kr0jU2noguR3FTX8RfJz8sx8b5ruqW/QyzdnQCmhREhyM5FrdbLVoH
         Ns7A==
X-Gm-Message-State: APjAAAU+mr2gsc/LHV3IyRHRzYlHs61u9Qv0UUM4SngnpL5t8py3P8Sk
        cR0Wvc1OHJBUdZENqKXmWFM=
X-Google-Smtp-Source: APXvYqzOY74pb7vDbFevgf7i/InEm6jtKJrnNqCX3ArrEd0fnIRm7smgN1WkuH/SDdN87wscnymxsA==
X-Received: by 2002:a17:902:904c:: with SMTP id w12mr1318418plz.133.1576657793845;
        Wed, 18 Dec 2019 00:29:53 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id b98sm1656919pjc.16.2019.12.18.00.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 00:29:53 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] hid: hid-lg4ff: fix possible sleep-in-atomic-context bug
Date:   Wed, 18 Dec 2019 16:29:20 +0800
Message-Id: <20191218082920.3095-1-baijiaju1990@gmail.com>
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
drivers/hid/hid-lg4ff.c, 538: 
	hid_hw_request in lg4ff_set_autocenter_default
drivers/hid/hid-lg4ff.c, 497: 
	_raw_spin_lock_irqsave in lg4ff_set_autocenter_default

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-lg4ff.c, 585: 
	hid_hw_request in lg4ff_set_autocenter_ffex
drivers/hid/hid-lg4ff.c, 576: 
	_raw_spin_lock_irqsave in lg4ff_set_autocenter_ffex

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-lg4ff.c, 1116: 
	hid_hw_request in lg4ff_set_leds
drivers/hid/hid-lg4ff.c, 1108: 
	_raw_spin_lock_irqsave in lg4ff_set_leds

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-lg4ff.c, 465: 
	hid_hw_request in lg4ff_play
drivers/hid/hid-lg4ff.c, 441: 
	_raw_spin_lock_irqsave in lg4ff_play

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-lg4ff.c, 664: 
	hid_hw_request in lg4ff_set_range_dfp
drivers/hid/hid-lg4ff.c, 648: 
	_raw_spin_lock_irqsave in lg4ff_set_range_dfp

drivers/hid/hid-core.c, 1459: 
	hid_alloc_report_buf(GFP_KERNEL) in __hid_request
./include/linux/hid.h, 1051: 
	__hid_request in hid_hw_request
drivers/hid/hid-lg4ff.c, 620: 
	hid_hw_request in lg4ff_set_range_g25
drivers/hid/hid-lg4ff.c, 611: 
	_raw_spin_lock_irqsave in lg4ff_set_range_g25

hid_alloc_report_buf(GFP_KERNEL) can sleep at runtime.

To fix these bugs, hid_hw_request() is called without holding the
spinlock.

These bugs are found by a static analysis tool STCheck written by myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/hid/hid-lg4ff.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index 5e6a0cef2a06..047a19da3aed 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -443,8 +443,8 @@ static int lg4ff_play(struct input_dev *dev, void *data, struct ff_effect *effec
 			value[5] = 0x00;
 			value[6] = 0x00;
 
-			hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 			spin_unlock_irqrestore(&entry->report_lock, flags);
+			hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 			return 0;
 		}
 
@@ -456,8 +456,8 @@ static int lg4ff_play(struct input_dev *dev, void *data, struct ff_effect *effec
 		value[5] = 0x00;
 		value[6] = 0x00;
 
-		hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 		spin_unlock_irqrestore(&entry->report_lock, flags);
+		hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 		break;
 	}
 	return 0;
@@ -498,8 +498,8 @@ static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
 		value[5] = 0x00;
 		value[6] = 0x00;
 
-		hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 		spin_unlock_irqrestore(&entry->report_lock, flags);
+		hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 		return;
 	}
 
@@ -529,7 +529,9 @@ static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
 	value[5] = 0x00;
 	value[6] = 0x00;
 
+	spin_unlock_irqrestore(&entry->report_lock, flags);
 	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
+	spin_lock_irqsave(&entry->report_lock, flags);
 
 	/* Activate Auto-Center */
 	value[0] = 0x14;
@@ -540,8 +542,8 @@ static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 magnitude)
 	value[5] = 0x00;
 	value[6] = 0x00;
 
-	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 	spin_unlock_irqrestore(&entry->report_lock, flags);
+	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 }
 
 /* Sends autocentering command compatible with Formula Force EX */
@@ -576,8 +578,8 @@ static void lg4ff_set_autocenter_ffex(struct input_dev *dev, u16 magnitude)
 	value[5] = 0x00;
 	value[6] = 0x00;
 
-	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 	spin_unlock_irqrestore(&entry->report_lock, flags);
+	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 }
 
 /* Sends command to set range compatible with G25/G27/Driving Force GT */
@@ -611,8 +613,8 @@ static void lg4ff_set_range_g25(struct hid_device *hid, u16 range)
 	value[5] = 0x00;
 	value[6] = 0x00;
 
-	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 	spin_unlock_irqrestore(&entry->report_lock, flags);
+	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 }
 
 /* Sends commands to set range compatible with Driving Force Pro wheel */
@@ -655,7 +657,9 @@ static void lg4ff_set_range_dfp(struct hid_device *hid, u16 range)
 		value[1] = 0x02;
 		full_range = 200;
 	}
+	spin_unlock_irqrestore(&entry->report_lock, flags);
 	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
+	spin_lock_irqsave(&entry->report_lock, flags);
 
 	/* Prepare "fine" limit command */
 	value[0] = 0x81;
@@ -667,8 +671,8 @@ static void lg4ff_set_range_dfp(struct hid_device *hid, u16 range)
 	value[6] = 0x00;
 
 	if (range == 200 || range == 900) {	/* Do not apply any fine limit */
-		hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 		spin_unlock_irqrestore(&entry->report_lock, flags);
+		hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 		return;
 	}
 
@@ -682,8 +686,8 @@ static void lg4ff_set_range_dfp(struct hid_device *hid, u16 range)
 	value[5] = (start_right & 0xe) << 4 | (start_left & 0xe);
 	value[6] = 0xff;
 
-	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 	spin_unlock_irqrestore(&entry->report_lock, flags);
+	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 }
 
 static const struct lg4ff_compat_mode_switch *lg4ff_get_mode_switch_command(const u16 real_product_id, const u16 target_product_id)
@@ -1107,8 +1111,8 @@ static void lg4ff_set_leds(struct hid_device *hid, u8 leds)
 	value[4] = 0x00;
 	value[5] = 0x00;
 	value[6] = 0x00;
-	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 	spin_unlock_irqrestore(&entry->report_lock, flags);
+	hid_hw_request(hid, entry->report, HID_REQ_SET_REPORT);
 }
 
 static void lg4ff_led_set_brightness(struct led_classdev *led_cdev,
-- 
2.17.1

