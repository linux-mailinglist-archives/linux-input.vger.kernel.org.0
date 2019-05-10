Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 399471A547
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2019 00:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfEJWe4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 May 2019 18:34:56 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42556 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfEJWe4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 May 2019 18:34:56 -0400
Received: by mail-pg1-f193.google.com with SMTP id 145so3649082pgg.9
        for <linux-input@vger.kernel.org>; Fri, 10 May 2019 15:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1cQ1cQO4SPEv1RsQR3GwyI/hiE3blJZLusjhMvS5drI=;
        b=sPTGm/VCnJ5t9DyIEOahE0/7IoDB869NRD/VSvJXn68RjQHW+k5HsXiO3qhmB5VeTL
         +qQc05o73JZpLnmpQfSftoJ1L+dvJI+s6punwfbkxluJT7BollonNgXFACKfFEbLZLEl
         07wrBzOGpohIGOkuvq8Ec2cPJPQ+GcfThaQkmwyMa7H7k9hR2u7patAyLXWr0Ym5brZW
         4ISrJa9UI23t/Zu+5JHR4+CallfNum/aueIP2NRtLu4XNGxGYW/7S3mJmBL08sLRqHKE
         rqOWSvEEmig31KppEJmgVjvxXpMp5Ip0GB6ZJ3FBlVQaNYA6JVqZ8vlTB1LSMfIHOtCO
         AkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1cQ1cQO4SPEv1RsQR3GwyI/hiE3blJZLusjhMvS5drI=;
        b=eAJyqAigyjLNMVY+JRNE6PK5k11m2TZ6C5pC0tBw/DzZpsl7UMjlKSSGHTemd7MNom
         GNEhGjPO4cpZEKoHAgXQcu2sVEY9kE7aKHek6/kWrJKv7OEXqXAiwwqimBn8tV4ki5VN
         OFV+zmWaWjEdw73Q3MzIz3dndZ02UxqTp4sqWCInJf0L0oog1DEdfW/B8g0JWPZktcfn
         A1iAYE5oHxvA4eOX+ZykYzcWzTXag3OK4++ZwoOYwZeQDEfH/dlFD5f0Guyj27VRAGz5
         EiX3OzIM1QHKGhrK0fIXYGCdhGYPxfDzOANJ2aYl7+AagsjFOG8pt5phVe91K5wf4H9O
         xAxw==
X-Gm-Message-State: APjAAAUbfXlkoBF++VpsXwmUmtpmTY5GTClv5jYEkPLGVUzYKsby7B9V
        RcgD9gVRCiew+GEHoCXwV2oLbNsc
X-Google-Smtp-Source: APXvYqzXlOAy8Lv22m3EkCVh9A+Y8h9qGfCJNhNh6/Nz4VizAKH664f5TU2tDtUEb/qkOUDjpzcQIg==
X-Received: by 2002:a63:c94a:: with SMTP id y10mr16466295pgg.168.1557527695267;
        Fri, 10 May 2019 15:34:55 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id n13sm7192405pgh.6.2019.05.10.15.34.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 10 May 2019 15:34:54 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, pinglinux@gmail.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH 4/4] HID: wacom: Add 2nd gen Intuos Pro Small support
Date:   Fri, 10 May 2019 15:34:19 -0700
Message-Id: <1557527659-9417-3-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557527659-9417-1-git-send-email-aaron.skomra@wacom.com>
References: <1557527659-9417-1-git-send-email-aaron.skomra@wacom.com>
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
index 447394cc4222..da0dc2620086 100644
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
@@ -1272,7 +1273,8 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
 			input_report_abs(pen_input, ABS_X, get_unaligned_le16(&frame[1]));
 			input_report_abs(pen_input, ABS_Y, get_unaligned_le16(&frame[3]));
 
-			if (wacom->features.type == INTUOSP2_BT) {
+			if (wacom->features.type == INTUOSP2_BT ||
+			    wacom->features.type == INTUOSP2S_BT) {
 				/* Fix rotation alignment: userspace expects zero at left */
 				int16_t rotation =
 					(int16_t)get_unaligned_le16(&frame[9]);
@@ -1293,7 +1295,8 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
 
 		if (wacom->tool[0]) {
 			input_report_abs(pen_input, ABS_PRESSURE, get_unaligned_le16(&frame[5]));
-			if (wacom->features.type == INTUOSP2_BT) {
+			if (wacom->features.type == INTUOSP2_BT ||
+			    wacom->features.type == INTUOSP2S_BT) {
 				input_report_abs(pen_input, ABS_DISTANCE,
 						 range ? frame[13] : wacom->features.distance_max);
 			} else {
@@ -1460,7 +1463,8 @@ static int wacom_intuos_pro2_bt_irq(struct wacom_wac *wacom, size_t len)
 	}
 
 	wacom_intuos_pro2_bt_pen(wacom);
-	if (wacom->features.type == INTUOSP2_BT) {
+	if (wacom->features.type == INTUOSP2_BT ||
+	    wacom->features.type == INTUOSP2S_BT) {
 		wacom_intuos_pro2_bt_touch(wacom);
 		wacom_intuos_pro2_bt_pad(wacom);
 		wacom_intuos_pro2_bt_battery(wacom);
@@ -3228,6 +3232,7 @@ void wacom_wac_irq(struct wacom_wac *wacom_wac, size_t len)
 		break;
 
 	case INTUOSP2_BT:
+	case INTUOSP2S_BT:
 	case INTUOSHT3_BT:
 		sync = wacom_intuos_pro2_bt_irq(wacom_wac, len);
 		break;
@@ -3408,7 +3413,8 @@ void wacom_setup_device_quirks(struct wacom *wacom)
 	if (features->type == REMOTE)
 		features->device_type = WACOM_DEVICETYPE_PAD;
 
-	if (features->type == INTUOSP2_BT) {
+	if (features->type == INTUOSP2_BT ||
+	    features->type == INTUOSP2S_BT) {
 		features->device_type |= WACOM_DEVICETYPE_PEN |
 					 WACOM_DEVICETYPE_PAD |
 					 WACOM_DEVICETYPE_TOUCH;
@@ -3589,6 +3595,7 @@ int wacom_setup_pen_input_capabilities(struct input_dev *input_dev,
 	case INTUOS5S:
 	case INTUOSPS:
 	case INTUOSP2_BT:
+	case INTUOSP2S_BT:
 		input_set_abs_params(input_dev, ABS_DISTANCE, 0,
 				      features->distance_max,
 				      features->distance_fuzz, 0);
@@ -3700,6 +3707,7 @@ int wacom_setup_touch_input_capabilities(struct input_dev *input_dev,
 
 	switch (features->type) {
 	case INTUOSP2_BT:
+	case INTUOSP2S_BT:
 		input_dev->evbit[0] |= BIT_MASK(EV_SW);
 		__set_bit(SW_MUTE_DEVICE, input_dev->swbit);
 
@@ -3715,6 +3723,12 @@ int wacom_setup_touch_input_capabilities(struct input_dev *input_dev,
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
 
@@ -4024,6 +4038,7 @@ int wacom_setup_pad_input_capabilities(struct input_dev *input_dev,
 	case INTUOS5S:
 	case INTUOSPS:
 	case INTUOSP2_BT:
+	case INTUOSP2S_BT:
 		input_set_abs_params(input_dev, ABS_WHEEL, 0, 71, 0, 0);
 		break;
 
@@ -4601,6 +4616,10 @@ static const struct wacom_features wacom_features_0x37A =
 static const struct wacom_features wacom_features_0x37B =
 	{ "Wacom One by Wacom M", 21600, 13500, 2047, 63,
 	  BAMBOO_PEN, WACOM_INTUOS_RES, WACOM_INTUOS_RES };
+static const struct wacom_features wacom_features_0x393 =
+	{ "Wacom Intuos Pro S", 31920, 19950, 8191, 63,
+	  INTUOSP2S_BT, WACOM_INTUOS3_RES, WACOM_INTUOS3_RES, 7,
+	  .touch_max = 10 };
 
 static const struct wacom_features wacom_features_HID_ANY_ID =
 	{ "Wacom HID", .type = HID_GENERIC, .oVid = HID_ANY_ID, .oPid = HID_ANY_ID };
@@ -4773,6 +4792,7 @@ const struct hid_device_id wacom_ids[] = {
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
2.7.4

