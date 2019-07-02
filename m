Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4BF75CDB2
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 12:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfGBKhW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 06:37:22 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37288 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfGBKhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 06:37:20 -0400
Received: by mail-lj1-f195.google.com with SMTP id 131so16345768ljf.4
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2019 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=90xVZ9+ir65p2BWPppuD5boVOwF2O93uwqQDlDDLmUo=;
        b=U5uSAz1Mi+X0jFnbhvHlQbl6EOqKbgP1nC/bQiU0j1JjKtCbjQJr91jTas344iWvMs
         Red61BS47e5sxPTe2F84UUrd4HYld58LeYBg8d0MGwZVkvLWA/2856FR0P8UXTN9Ss2g
         67mQWSc8kUZC62N27EyEWTzbwU2vPvtUi1JOmwhk1XF8lShEsLMQdiGCIKLaydsVaYGg
         vtjAI5HRNjWtui9vRyxb2Z/S1E7g6Gf/yDVRr5H+oHYsi2mkIBinV1uxArbrPFEinlZL
         IT7FWnw5LIEE9pOKL+MJmkY9RgSNppra7fzGGhmVjcFDmxD4hdvIhJ1r5jvUdY84LMHK
         Ziww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=90xVZ9+ir65p2BWPppuD5boVOwF2O93uwqQDlDDLmUo=;
        b=KJja/Lyt0o8Q38QVa3HxdQFNZEeWIHsP6EhtQelitF4WubB3yQt9omRUeakr13eoGu
         lBDMFNMZCOYMqg4wuCnW03UAGgrJ6t96YOBFKziQGBge77MJ/FXzlCPp5iPcEE8M1rND
         x2gwYE8dhp5QvTXmID2eVTjbtUBZn7+YiP6aw1TDJn7QrgxHoMSjODQ9hB/ANYHGQGpV
         OnTEAlKimyW9CjjLBNhJi06OwfQtOhmN0IoQNjKhFOwp7H20yIaTK3z2Hc3Yw+SFnW/F
         UfqGtcyDySKYXnbLD3Gy2Qww6PbhxHArrtr2yagyZ4enwxmccRsVWS01hV7J1afIz8B5
         mb1Q==
X-Gm-Message-State: APjAAAXzSE5sEwkGo53QVY18Uk9iolBVV7S0eo/lIqYVbVkgFu8pV+dH
        uayKmnJ3bR0n6kX57VGJ4eaZnKklgev19Q==
X-Google-Smtp-Source: APXvYqyIKMwckQ3zLq/XuDTb+xIdFn3kW9emlb/Fo/nESj8F7pcGfdH9cp9FhBmrtmMAZyaMeEQxlw==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr16518779lji.71.1562063838644;
        Tue, 02 Jul 2019 03:37:18 -0700 (PDT)
Received: from lahvuun.homenetwork ([93.76.175.10])
        by smtp.gmail.com with ESMTPSA id y18sm3696639ljh.1.2019.07.02.03.37.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 03:37:17 -0700 (PDT)
Date:   Tue, 2 Jul 2019 13:37:16 +0300
From:   Ilya Trukhanov <lahvuun@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2] HID: Add 044f:b320 ThrustMaster, Inc. 2 in 1 DT
Message-ID: <20190702103716.qhiq6lgef4jzqpde@lahvuun.homenetwork>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable force feedback for the Thrustmaster Dual Trigger 2 in 1 Rumble Force
gamepad. Compared to other Thrustmaster devices, left and right rumble
motors here are swapped.

Signed-off-by: Ilya Trukhanov <lahvuun@gmail.com>
---
Changes since v1:
- Drop PID entry from drivers/hid/hid-quirks.c
- Use local #define for the PID in drivers/hid/hid-tmff.c

 drivers/hid/hid-tmff.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
index e12f2588ddeb..bdfc5ff3b2c5 100644
--- a/drivers/hid/hid-tmff.c
+++ b/drivers/hid/hid-tmff.c
@@ -22,6 +22,8 @@
 
 #include "hid-ids.h"
 
+#define THRUSTMASTER_DEVICE_ID_2_IN_1_DT	0xb320
+
 static const signed short ff_rumble[] = {
 	FF_RUMBLE,
 	-1
@@ -76,6 +78,7 @@ static int tmff_play(struct input_dev *dev, void *data,
 	struct hid_field *ff_field = tmff->ff_field;
 	int x, y;
 	int left, right;	/* Rumbling */
+	int motor_swap;
 
 	switch (effect->type) {
 	case FF_CONSTANT:
@@ -100,6 +103,13 @@ static int tmff_play(struct input_dev *dev, void *data,
 					ff_field->logical_minimum,
 					ff_field->logical_maximum);
 
+		/* 2-in-1 strong motor is left */
+		if (hid->product == THRUSTMASTER_DEVICE_ID_2_IN_1_DT) {
+			motor_swap = left;
+			left = right;
+			right = motor_swap;
+		}
+
 		dbg_hid("(left,right)=(%08x, %08x)\n", left, right);
 		ff_field->value[0] = left;
 		ff_field->value[1] = right;
@@ -226,6 +236,8 @@ static const struct hid_device_id tm_devices[] = {
 		.driver_data = (unsigned long)ff_rumble },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb304),   /* FireStorm Dual Power 2 (and 3) */
 		.driver_data = (unsigned long)ff_rumble },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, THRUSTMASTER_DEVICE_ID_2_IN_1_DT),   /* Dual Trigger 2-in-1 */
+		.driver_data = (unsigned long)ff_rumble },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb323),   /* Dual Trigger 3-in-1 (PC Mode) */
 		.driver_data = (unsigned long)ff_rumble },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb324),   /* Dual Trigger 3-in-1 (PS3 Mode) */
-- 
2.22.0

