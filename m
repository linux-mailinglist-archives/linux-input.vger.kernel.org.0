Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26C7B44978
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfFMRRg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:36 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46210 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbfFLVTx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:19:53 -0400
Received: by mail-pl1-f196.google.com with SMTP id e5so7137510pls.13
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TgBqO5bqG7zM63JLBbZ1qUW+9HfnA+3bsQPxH+q5gG0=;
        b=b3mvr9//KARy849IUyRRXsqlXlcbvxvEOoSCeriYajvzAWzhO9k+AqNHSQZdg7zDCF
         8AfjYTDgM2DGh9ymO6leV3KGmb3+hT8FAyVvseTrpNL+bLDtACzM/oC61+G0Y3lnQH0d
         eAB5dwALRuW4X6J0HcygnIUKVxfo1EtiHpL/INRlxjuXeimxfRCMAH1LQazivZOCR/0k
         jHhgGQsimrTAud0ApI0c9FVcSeXE1ihqVcys1nPJhxs5i9YkDyb9rc3QolvXTIHFLwxO
         ckTUeJgsjLT+LWWTuQpmO6KEvhHtO2ti8zBkWYJDniJ/QrdUeQTIWoJlcN4YzjSnU6ST
         5rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TgBqO5bqG7zM63JLBbZ1qUW+9HfnA+3bsQPxH+q5gG0=;
        b=ewnYdOdVok4KxtVyzRSshCwsBZZWTchwnWrd8tDooX3syKpMEUMzQyIbi9mM+Dzqn3
         WFOJLTD8AXcTF1yJkdQnUMKTAaD9g+b5NCqViA/MZ5g6vufJpbs2mZb67nqxeJdRPYUo
         PIdmtcAIOQUK2EzaHKaDTutB4EEqShhb/QAxiWZSP3N1vhFXPOz14KKAXbF2X/skAIgh
         WuR/ImczfTFHQiDDrBEA0zvpM5IyrJgBVyAJp2usTagylQL0AhY4+JxsDrtmT5VTlZg5
         uR4VSEHQMwFgn1KdvR8wgKlYAl0Tfg0mUTllh9cS5zsJvn7h4V1E0Kpn262aRIpt7KsB
         F/gA==
X-Gm-Message-State: APjAAAXHm0oD9ce7fqkftWpVLmORBt15/9JY2CIy5NxbhuYMBRpta6xe
        ESiJBvCsnm7uFRpM3gHl0FKLrC1SeP9z8Q==
X-Google-Smtp-Source: APXvYqzuzLDR0cxy5d7BIAPvakuGXfDGNOTRHHOBseKYjfye9e3q9pgMCLPzuMs5AHRDJ4DWAeriVg==
X-Received: by 2002:a17:902:29a7:: with SMTP id h36mr31800872plb.158.1560374392060;
        Wed, 12 Jun 2019 14:19:52 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id m6sm423283pgr.18.2019.06.12.14.19.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 12 Jun 2019 14:19:51 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, pinglinux@gmail.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH 1/4] HID: wacom: Add 2nd gen Intuos Pro Small support
Date:   Wed, 12 Jun 2019 14:19:28 -0700
Message-Id: <1560374371-2688-2-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
References: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The existing INTUOSP2_BT device class supports LEDs and this device
does not. A new device class enum entry, "INTUOSP2S_BT", is created
to avoid the INTUOSP2_BT LED code.

Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 30 +++++++++++++++++++++++++-----
 drivers/hid/wacom_wac.h |  1 +
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index a98ad4fdcf9e..b764e9d72b5b 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1220,7 +1220,8 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
 	unsigned char *data = wacom->data;
 	int i;
 
-	if (wacom->features.type == INTUOSP2_BT) {
+	if (wacom->features.type == INTUOSP2_BT ||
+	    wacom->features.type == INTUOSP2S_BT) {
 		wacom->serial[0] = get_unaligned_le64(&data[99]);
 		wacom->id[0]     = get_unaligned_le16(&data[107]);
 		pen_frame_len = 14;
@@ -1257,7 +1258,8 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
 			input_report_abs(pen_input, ABS_X, get_unaligned_le16(&frame[1]));
 			input_report_abs(pen_input, ABS_Y, get_unaligned_le16(&frame[3]));
 
-			if (wacom->features.type == INTUOSP2_BT) {
+			if (wacom->features.type == INTUOSP2_BT ||
+			    wacom->features.type == INTUOSP2S_BT) {
 				/* Fix rotation alignment: userspace expects zero at left */
 				int16_t rotation =
 					(int16_t)get_unaligned_le16(&frame[9]);
@@ -1276,7 +1278,8 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
 			}
 		}
 		input_report_abs(pen_input, ABS_PRESSURE, get_unaligned_le16(&frame[5]));
-		if (wacom->features.type == INTUOSP2_BT) {
+		if (wacom->features.type == INTUOSP2_BT ||
+		    wacom->features.type == INTUOSP2S_BT) {
 			input_report_abs(pen_input, ABS_DISTANCE,
 					 range ? frame[13] : wacom->features.distance_max);
 		} else {
@@ -1436,7 +1439,8 @@ static int wacom_intuos_pro2_bt_irq(struct wacom_wac *wacom, size_t len)
 	}
 
 	wacom_intuos_pro2_bt_pen(wacom);
-	if (wacom->features.type == INTUOSP2_BT) {
+	if (wacom->features.type == INTUOSP2_BT ||
+	    wacom->features.type == INTUOSP2S_BT) {
 		wacom_intuos_pro2_bt_touch(wacom);
 		wacom_intuos_pro2_bt_pad(wacom);
 		wacom_intuos_pro2_bt_battery(wacom);
@@ -3204,6 +3208,7 @@ void wacom_wac_irq(struct wacom_wac *wacom_wac, size_t len)
 		break;
 
 	case INTUOSP2_BT:
+	case INTUOSP2S_BT:
 	case INTUOSHT3_BT:
 		sync = wacom_intuos_pro2_bt_irq(wacom_wac, len);
 		break;
@@ -3384,7 +3389,8 @@ void wacom_setup_device_quirks(struct wacom *wacom)
 	if (features->type == REMOTE)
 		features->device_type = WACOM_DEVICETYPE_PAD;
 
-	if (features->type == INTUOSP2_BT) {
+	if (features->type == INTUOSP2_BT ||
+	    features->type == INTUOSP2S_BT) {
 		features->device_type |= WACOM_DEVICETYPE_PEN |
 					 WACOM_DEVICETYPE_PAD |
 					 WACOM_DEVICETYPE_TOUCH;
@@ -3565,6 +3571,7 @@ int wacom_setup_pen_input_capabilities(struct input_dev *input_dev,
 	case INTUOS5S:
 	case INTUOSPS:
 	case INTUOSP2_BT:
+	case INTUOSP2S_BT:
 		input_set_abs_params(input_dev, ABS_DISTANCE, 0,
 				      features->distance_max,
 				      features->distance_fuzz, 0);
@@ -3676,6 +3683,7 @@ int wacom_setup_touch_input_capabilities(struct input_dev *input_dev,
 
 	switch (features->type) {
 	case INTUOSP2_BT:
+	case INTUOSP2S_BT:
 		input_dev->evbit[0] |= BIT_MASK(EV_SW);
 		__set_bit(SW_MUTE_DEVICE, input_dev->swbit);
 
@@ -3691,6 +3699,12 @@ int wacom_setup_touch_input_capabilities(struct input_dev *input_dev,
 			input_set_abs_params(input_dev, ABS_MT_POSITION_Y,
 					     0, 5920, 4, 0);
 		}
+		else if (wacom_wac->shared->touch->product == 0x393) {
+			input_set_abs_params(input_dev, ABS_MT_POSITION_X,
+					     0, 6400, 4, 0);
+			input_set_abs_params(input_dev, ABS_MT_POSITION_Y,
+					     0, 4000, 4, 0);
+		}
 		input_abs_set_res(input_dev, ABS_MT_POSITION_X, 40);
 		input_abs_set_res(input_dev, ABS_MT_POSITION_Y, 40);
 
@@ -3997,6 +4011,7 @@ int wacom_setup_pad_input_capabilities(struct input_dev *input_dev,
 	case INTUOS5S:
 	case INTUOSPS:
 	case INTUOSP2_BT:
+	case INTUOSP2S_BT:
 		input_set_abs_params(input_dev, ABS_WHEEL, 0, 71, 0, 0);
 		break;
 
@@ -4574,6 +4589,10 @@ static const struct wacom_features wacom_features_0x37A =
 static const struct wacom_features wacom_features_0x37B =
 	{ "Wacom One by Wacom M", 21600, 13500, 2047, 63,
 	  BAMBOO_PEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
+static const struct wacom_features wacom_features_0x393 =
+	{ "Wacom Intuos Pro S", 31920, 19950, 8191, 63,
+	  INTUOSP2S_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7,
+	  .touch_max = 10 };
 
 static const struct wacom_features wacom_features_HID_ANY_ID =
 	{ "Wacom HID", .type = HID_GENERIC, .oVid = HID_ANY_ID, .oPid = HID_ANY_ID };
@@ -4746,6 +4765,7 @@ const struct hid_device_id wacom_ids[] = {
 	{ BT_DEVICE_WACOM(0x379) },
 	{ USB_DEVICE_WACOM(0x37A) },
 	{ USB_DEVICE_WACOM(0x37B) },
+	{ BT_DEVICE_WACOM(0x393) },
 	{ USB_DEVICE_WACOM(0x4001) },
 	{ USB_DEVICE_WACOM(0x4004) },
 	{ USB_DEVICE_WACOM(0x5000) },
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index f67d871841c0..48f08f8a556d 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -215,6 +215,7 @@ enum {
 	INTUOSPM,
 	INTUOSPL,
 	INTUOSP2_BT,
+	INTUOSP2S_BT,
 	INTUOSHT3_BT,
 	WACOM_21UX2,
 	WACOM_22HD,
-- 
2.17.1

