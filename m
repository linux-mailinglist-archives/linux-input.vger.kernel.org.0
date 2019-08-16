Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E63E9080A
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 21:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfHPTDG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 15:03:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45285 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfHPTDG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 15:03:06 -0400
Received: by mail-pf1-f194.google.com with SMTP id w26so3543586pfq.12
        for <linux-input@vger.kernel.org>; Fri, 16 Aug 2019 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=C3LLmAcIKh8k3KRtI67dVXjJOXzeBmobuD0DGf05Z3U=;
        b=jhgymBXOW1ztVQ0TOf3u7Rx1sFDszKXd+aBcFfXPizfbapVhKKFwAtig2eoeCAERjg
         c6u5Gz3omm0yd6ZqoX6428N/5ojLheIWC9qbs4p2eHxFHF+m/bZ6q97icxGtjugBFKie
         vyC9N3VVmqTkhgOk/IswE0gBgKaEEfMe8JHbgzgFOg2JOYcgYAQ1FSndUlRNYL+SNp9S
         GcJg7QEr3aA3XrcdU0LlewwfNcUkUrZw/+/Bp77MAVqzg03zxJKZoWdPyU9CtS5E5xHg
         YeS+xf8miCixkxseWoZN8vbb2yaN1LnLs9sRvv3IRcjxUMuVm05KqHioR27OJVq4XXgj
         h+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=C3LLmAcIKh8k3KRtI67dVXjJOXzeBmobuD0DGf05Z3U=;
        b=Uo6EdPPWzy3iPpySgMZjopGESmOdEx12FvNhXl5vcI+9dUni48wsCKU2akjcYY+rUH
         YOFvBVB7yi9jcTCRFB2UiYxVmiSdpYFK6qaYX6CiPygUJJ14zyrbW6sp1/Kr/dgwNA20
         l9/RMj0TBNKtwtu05EXcgrEOgCkBNVny34s2zT6+g8VLaH7mT9L16cFt1m3EJ2G3n5J6
         w7MotYh0CkJZLnU1G4xZo9IPvtqXsnVSzceG215f7ztYLJqK5/B/RcmuqB8lSw5EqGQv
         vNO8RY/1wXZhKoMPUhWdAOfIMF0TDOOQ+pBtnpSNN8/AZqg1aa3+0mWSgbFM5CgQthn6
         /wng==
X-Gm-Message-State: APjAAAWdVXBJSCnGFAZ8Q/gaSeiRFwkUs80xSyNfeQtDyMmRAOnfYkLI
        t/8YfqcAxXNj418BT7pklyJGJN0F
X-Google-Smtp-Source: APXvYqyIlJdOLo0oDvNN1JbJmSkPSE2hn/hMT2yeVy64n7GDdfveol4aIYwBkcLehh7XQMTCGT3xyQ==
X-Received: by 2002:aa7:8488:: with SMTP id u8mr12444717pfn.229.1565982184226;
        Fri, 16 Aug 2019 12:03:04 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id x24sm6106413pgl.84.2019.08.16.12.03.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 16 Aug 2019 12:03:03 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, ping.cheng@wacom.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH] HID: wacom: support named keys on older devices
Date:   Fri, 16 Aug 2019 12:02:50 -0700
Message-Id: <1565982170-29367-1-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Wacom devices have keys with predefined meanings. However, when
support was originally added for these devices, the codes for these
keys were not available yet. These keys were thus reported with
the numbered KEY_PROG* range.

Some missing key codes were added with commit 4eb220cb35a9 ("HID:
wacom: generic: add 3 tablet touch keys") and we are now able to
report the proper key codes. We continue to report the original
KEY_PROG codes so as not to break any unknown applications that
may depend on them.

Also, to support the touch key, track its state in the pad report.

Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Link: https://gitlab.freedesktop.org/libinput/libinput/merge_requests/155
Link: https://github.com/linuxwacom/xf86-input-wacom/pull/46
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 68 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 50074485b88b..abc17f2c8ef0 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -483,6 +483,8 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 	int ring1 = 0, ring2 = 0;
 	int strip1 = 0, strip2 = 0;
 	bool prox = false;
+	bool wrench = false, keyboard = false, mute_touch = false, menu = false,
+	     info = false;
 
 	/* pad packets. Works as a second tool and is always in prox */
 	if (!(data[0] == WACOM_REPORT_INTUOSPAD || data[0] == WACOM_REPORT_INTUOS5PAD ||
@@ -512,10 +514,32 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 		keys = ((data[3] & 0x1C) ? 1<<2 : 0) |
 		       ((data[4] & 0xE0) ? 1<<1 : 0) |
 		       ((data[4] & 0x07) ? 1<<0 : 0);
+		keyboard = !!(data[4] & 0xE0);
+		info = !!(data[3] & 0x1C);
+
+		if (features->oPid) {
+			mute_touch = !!(data[4] & 0x07);
+			if (mute_touch)
+				wacom->shared->is_touch_on =
+					!wacom->shared->is_touch_on;
+		} else {
+			wrench = !!(data[4] & 0x07);
+		}
 	} else if (features->type == WACOM_27QHD) {
 		nkeys = 3;
 		keys = data[2] & 0x07;
 
+		wrench = !!(data[2] & 0x01);
+		keyboard = !!(data[2] & 0x02);
+
+		if (features->oPid) {
+			mute_touch = !!(data[2] & 0x04);
+			if (mute_touch)
+				wacom->shared->is_touch_on =
+					!wacom->shared->is_touch_on;
+		} else {
+			menu = !!(data[2] & 0x04);
+		}
 		input_report_abs(input, ABS_X, be16_to_cpup((__be16 *)&data[4]));
 		input_report_abs(input, ABS_Y, be16_to_cpup((__be16 *)&data[6]));
 		input_report_abs(input, ABS_Z, be16_to_cpup((__be16 *)&data[8]));
@@ -561,6 +585,9 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 			if (features->type == WACOM_22HD) {
 				nkeys = 3;
 				keys = data[9] & 0x07;
+
+				info = !!(data[9] & 0x01);
+				wrench = !!(data[9] & 0x02);
 			}
 		} else {
 			buttons = ((data[6] & 0x10) << 5)  |
@@ -580,6 +607,18 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 	for (i = 0; i < nkeys; i++)
 		input_report_key(input, KEY_PROG1 + i, keys & (1 << i));
 
+	input_report_key(input, KEY_BUTTONCONFIG, wrench);
+	input_report_key(input, KEY_ONSCREEN_KEYBOARD, keyboard);
+	input_report_key(input, KEY_CONTROLPANEL, menu);
+	input_report_key(input, KEY_INFO, info);
+
+	if (wacom->shared && wacom->shared->touch_input) {
+		input_report_switch(wacom->shared->touch_input,
+				    SW_MUTE_DEVICE,
+				    !wacom->shared->is_touch_on);
+		input_sync(wacom->shared->touch_input);
+	}
+
 	input_report_abs(input, ABS_RX, strip1);
 	input_report_abs(input, ABS_RY, strip2);
 
@@ -1481,6 +1520,12 @@ static int wacom_24hdt_irq(struct wacom_wac *wacom)
 	int byte_per_packet = WACOM_BYTES_PER_24HDT_PACKET;
 	int y_offset = 2;
 
+	if (wacom->shared->has_mute_touch_switch &&
+	    !wacom->shared->is_touch_on) {
+		if (!wacom->shared->touch_down)
+			return 0;
+	}
+
 	if (wacom->features.type == WACOM_27QHDT) {
 		current_num_contacts = data[63];
 		num_contacts_left = 10;
@@ -3813,6 +3858,14 @@ int wacom_setup_touch_input_capabilities(struct input_dev *input_dev,
 		/* fall through */
 
 	case WACOM_27QHDT:
+		if (wacom_wac->shared->touch->product == 0x32C ||
+		    wacom_wac->shared->touch->product == 0xF6) {
+			input_dev->evbit[0] |= BIT_MASK(EV_SW);
+			__set_bit(SW_MUTE_DEVICE, input_dev->swbit);
+			wacom_wac->shared->has_mute_touch_switch = true;
+		}
+		/* fall through */
+
 	case MTSCREEN:
 	case MTTPC:
 	case MTTPC_B:
@@ -4048,6 +4101,12 @@ int wacom_setup_pad_input_capabilities(struct input_dev *input_dev,
 		__set_bit(KEY_PROG2, input_dev->keybit);
 		__set_bit(KEY_PROG3, input_dev->keybit);
 
+		__set_bit(KEY_ONSCREEN_KEYBOARD, input_dev->keybit);
+		__set_bit(KEY_INFO, input_dev->keybit);
+
+		if (!features->oPid)
+			__set_bit(KEY_BUTTONCONFIG, input_dev->keybit);
+
 		input_set_abs_params(input_dev, ABS_WHEEL, 0, 71, 0, 0);
 		input_set_abs_params(input_dev, ABS_THROTTLE, 0, 71, 0, 0);
 		break;
@@ -4056,6 +4115,12 @@ int wacom_setup_pad_input_capabilities(struct input_dev *input_dev,
 		__set_bit(KEY_PROG1, input_dev->keybit);
 		__set_bit(KEY_PROG2, input_dev->keybit);
 		__set_bit(KEY_PROG3, input_dev->keybit);
+
+		__set_bit(KEY_ONSCREEN_KEYBOARD, input_dev->keybit);
+		__set_bit(KEY_BUTTONCONFIG, input_dev->keybit);
+
+		if (!features->oPid)
+			__set_bit(KEY_CONTROLPANEL, input_dev->keybit);
 		input_set_abs_params(input_dev, ABS_X, -2048, 2048, 0, 0);
 		input_abs_set_res(input_dev, ABS_X, 1024); /* points/g */
 		input_set_abs_params(input_dev, ABS_Y, -2048, 2048, 0, 0);
@@ -4069,6 +4134,9 @@ int wacom_setup_pad_input_capabilities(struct input_dev *input_dev,
 		__set_bit(KEY_PROG1, input_dev->keybit);
 		__set_bit(KEY_PROG2, input_dev->keybit);
 		__set_bit(KEY_PROG3, input_dev->keybit);
+
+		__set_bit(KEY_BUTTONCONFIG, input_dev->keybit);
+		__set_bit(KEY_INFO, input_dev->keybit);
 		/* fall through */
 
 	case WACOM_21UX2:
-- 
2.17.1

