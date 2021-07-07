Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393163BEBB8
	for <lists+linux-input@lfdr.de>; Wed,  7 Jul 2021 17:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhGGQBj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jul 2021 12:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhGGQBi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jul 2021 12:01:38 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D799C061574;
        Wed,  7 Jul 2021 08:58:58 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id j34so2168670wms.5;
        Wed, 07 Jul 2021 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZjJvkP2zSgmCjg+xemLcfykoNEygSi31xcm40krHH7s=;
        b=fiaQN6kDXJLjqLUXL/UYd1Ht8yG0jtci7XbXnFvpFsA6mNJOZ3oWHG50DWA7EunQhK
         cUHBqe8kXQBgFAKYKFKOlIxleN8tQnHPKjgp7egqFjhGY+Suz+G+j4qwCKoFeMZho5w/
         xfut121ooxamZmKTLjFQCLblcaTNZN5WS0If9DIr7X27YFqJdSwhu0Adwg0zgFG2XFn7
         dixfzuj14pX8aC0QSS25y7Tk+EtrWs8uIAeTQkuC/ee/Jh4/ZjSEdnSIHbr2NtWR2Ymg
         YSconRZaP8sw8uMaXoC5eEp6dRL3IXozCel6k7I8IXsZdDseTGbQ6gLFqhTx978P1WCw
         bWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZjJvkP2zSgmCjg+xemLcfykoNEygSi31xcm40krHH7s=;
        b=kCURfEOaXUsE+UVCqMnuuoC/j7Be9t06dDBKb4WgzqIdCQLsv6aYj9CUx3eGWY+Z9l
         q5cMg05b/0FgGtZzZvOW1jLF7piqXARR5g3qEdM0ILrj5gAh9U+jsPBEYrhm883cz+0y
         U4WjTEX0HLrJ2PhuImMEFFGo5aon9XkDdRIefggutQM4TcXhsLZ7CKnwPY29plTme2Wo
         fpiFrm9Gkr5c2Thb/JZvwWs/LS1xBFCwQ89QpX8EqxdQww2uJGkB/I3AAQXW4hapb4yB
         vO3mvCJtyLWBjGlw6VNV+kugXdDWiN+Q2LpmJ7RJOE2a4xepCrImjDr0ok8aNzYSD3QS
         uNpA==
X-Gm-Message-State: AOAM533cGCQFntKtieyFx6Pp3zBpGVTT3kZbz40/MOnRXbQw8NhOJW2U
        4SCKw3THNbO4JuKPmt3B/80=
X-Google-Smtp-Source: ABdhPJzPNu005i0+zS757F6QauF5cm9MB6FjbFyTt4b5Y2jAAuPSsHAP6CqRxnVzgC6zO5K00fccew==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr27649340wmb.60.1625673537018;
        Wed, 07 Jul 2021 08:58:57 -0700 (PDT)
Received: from localhost.localdomain ([94.73.35.100])
        by smtp.gmail.com with ESMTPSA id c9sm13942838wrx.22.2021.07.07.08.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 08:58:56 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/2] HID: magicmouse: enable high-resolution scroll
Date:   Wed,  7 Jul 2021 17:58:21 +0200
Message-Id: <20210707155822.7811-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Magic Mouse, generations 1 and 2, doesn't have a physical scroll
wheel, instead, the REL_WHEEL and REL_HWHEEL events are emulated
when sliding a finger on the surface of the mouse.
However, the smooth movement of the finger is transformed into a step
based scroll on the screen, leading to a suboptimal user experience.

Emulate high-resolution scroll by sending REL_WHEEL_HI_RES and
REL_HWHEEL_HI_RES events so the scroll on the screen is closer to the
finger movement.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 8bcaee4ccae0..e95f46dab4ad 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -68,6 +68,9 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 #define TOUCH_STATE_START 0x30
 #define TOUCH_STATE_DRAG  0x40
 
+/* Number of high-resolution events for each low-resolution detent. */
+#define SCROLL_HR_STEPS 10
+#define SCROLL_HR_MULT (120 / SCROLL_HR_STEPS)
 #define SCROLL_ACCEL_DEFAULT 7
 
 /* Touch surface information. Dimension is in hundredths of a mm, min and max
@@ -126,6 +129,8 @@ struct magicmouse_sc {
 		short y;
 		short scroll_x;
 		short scroll_y;
+		short scroll_x_hr;
+		short scroll_y_hr;
 		u8 size;
 	} touches[16];
 	int tracking_ids[16];
@@ -248,12 +253,18 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 		unsigned long now = jiffies;
 		int step_x = msc->touches[id].scroll_x - x;
 		int step_y = msc->touches[id].scroll_y - y;
+		int step_hr = ((64 - (int)scroll_speed) * msc->scroll_accel) /
+			      SCROLL_HR_STEPS;
+		int step_x_hr = msc->touches[id].scroll_x_hr - x;
+		int step_y_hr = msc->touches[id].scroll_y_hr - y;
 
 		/* Calculate and apply the scroll motion. */
 		switch (state) {
 		case TOUCH_STATE_START:
 			msc->touches[id].scroll_x = x;
 			msc->touches[id].scroll_y = y;
+			msc->touches[id].scroll_x_hr = x;
+			msc->touches[id].scroll_y_hr = y;
 
 			/* Reset acceleration after half a second. */
 			if (scroll_acceleration && time_before(now,
@@ -280,6 +291,24 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 				msc->scroll_jiffies = now;
 				input_report_rel(input, REL_WHEEL, step_y);
 			}
+
+			step_x_hr /= step_hr;
+			if (step_x_hr != 0) {
+				msc->touches[id].scroll_x_hr -= step_x_hr *
+					step_hr;
+				input_report_rel(input,
+						 REL_HWHEEL_HI_RES,
+						 -step_x_hr * SCROLL_HR_MULT);
+			}
+
+			step_y_hr /= step_hr;
+			if (step_y_hr != 0) {
+				msc->touches[id].scroll_y_hr -= step_y_hr *
+					step_hr;
+				input_report_rel(input,
+						 REL_WHEEL_HI_RES,
+						 step_y_hr * SCROLL_HR_MULT);
+			}
 			break;
 		}
 	}
@@ -481,6 +510,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 		if (emulate_scroll_wheel) {
 			__set_bit(REL_WHEEL, input->relbit);
 			__set_bit(REL_HWHEEL, input->relbit);
+			__set_bit(REL_WHEEL_HI_RES, input->relbit);
+			__set_bit(REL_HWHEEL_HI_RES, input->relbit);
 		}
 	} else if (input->id.product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2) {
 		/* setting the device name to ensure the same driver settings
-- 
2.25.1

