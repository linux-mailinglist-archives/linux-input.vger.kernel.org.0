Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D2F4137A4
	for <lists+linux-input@lfdr.de>; Tue, 21 Sep 2021 18:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhIUQfW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Sep 2021 12:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhIUQfV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Sep 2021 12:35:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C31C061574;
        Tue, 21 Sep 2021 09:33:52 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id w29so41031255wra.8;
        Tue, 21 Sep 2021 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xkOYayTUXE8FXeS0HkJiFMUyE0P/EeUIyIfzXkEamSg=;
        b=VBv1HkuHcAC9P2f/9nJZjPtjDkdMEwkBk6HnEWcVg1/yiw3aJBmcNocLOQWdCMLwBq
         1MwJeIP9ypPSNJulleViPP7YC8lX/QrYJsJTpwK2QWX5aHbi4+FMQgeEX1SEe5nffxdp
         2I7gWRhSE2xUWx0rTiWBY7yaK3+fqEulWbWlUkPBOrGP8g6Ig/Em5lamKXO/j6RXJd2t
         hzB/UoNSi/vVwlKHaI+KE++QAYNy2emIrgRGAWHONf1exnM1xD+NLzpBaq53x+goq7UQ
         HGcy2AwQFrhYzdKcnvTtFkZ3IXds9ofOK43ZcVysrOx4231+unFKs/cnMm43MGHhUBdL
         PIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xkOYayTUXE8FXeS0HkJiFMUyE0P/EeUIyIfzXkEamSg=;
        b=BjxVpXxV9ZKwKPfA5a35irXsH2Pm4D0waZcxTZ+4VLkuBb08peqQkf7ppUi0gHdLTM
         ZR5utntkfkY+C+KlfqM16/9WzKcxmKwgmcq8ByJ19E+nb0yFQtG0xE7XJe1jWdACXUsp
         ckDW44UfrNjvaDLTyKBtLDyuml2qD01pFWQfWvqM1jmnQtWJVaMmebjYbP4UUrh/qOGC
         vNICpnt106yNtSI5PcTE9lA6+uReP7qCteKb3WSJlwVhTew+Vf5H0TZ/u1APyxTmRsgf
         3bukcIPrJbbjOXth3ruL6drZw/uUQCoAd2l+ybyWnN/fQG7R35Mf12T6AgC9p8ozq3aQ
         WuuQ==
X-Gm-Message-State: AOAM531yV3s36UrvWGHtMFpZKA8kHz1OT9Cdivi7QeKUCdYPTgAbQqhJ
        HD2kwxG9pZ479V28M5HfSzE=
X-Google-Smtp-Source: ABdhPJx92e3qspCxJd9hONE3SKczQd2201vObImah7VYbroWfik9nyGPOFzJg32TgXFbMJ3ZJV8UhQ==
X-Received: by 2002:a05:600c:2d45:: with SMTP id a5mr5631207wmg.39.1632242031439;
        Tue, 21 Sep 2021 09:33:51 -0700 (PDT)
Received: from localhost.localdomain ([94.73.35.139])
        by smtp.gmail.com with ESMTPSA id z13sm23149308wrs.90.2021.09.21.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:33:51 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH RESEND 1/2] HID: magicmouse: fix checkpatch errors
Date:   Tue, 21 Sep 2021 18:33:46 +0200
Message-Id: <20210921163347.7317-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix errors reported by checkpatch in hid-magicmouse.c:

hid-magicmouse.c:35:  ERROR: open brace '{' following function
                      definitions go on the next line

hid-magicmouse.c:46:  ERROR: do not initialise statics to false

hid-magicmouse.c:79:  ERROR: Macros with complex values should be
                      enclosed in parentheses

hid-magicmouse.c:83:  ERROR: Macros with complex values should be
                      enclosed in parentheses

hid-magicmouse.c:88:  ERROR: Macros with complex values should be
                      enclosed in parentheses

hid-magicmouse.c:93:  ERROR: Macros with complex values should be
                      enclosed in parentheses

hid-magicmouse.c:99:  ERROR: Macros with complex values should be
                      enclosed in parentheses

hid-magicmouse.c:104: ERROR: Macros with complex values should be
                      enclosed in parentheses

hid-magicmouse.c:185: ERROR: do not use assignment in if condition

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 686788ebf3e1..b1ae61f9e675 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -33,7 +33,8 @@ MODULE_PARM_DESC(emulate_scroll_wheel, "Emulate a scroll wheel");
 
 static unsigned int scroll_speed = 32;
 static int param_set_scroll_speed(const char *val,
-				  const struct kernel_param *kp) {
+				  const struct kernel_param *kp)
+{
 	unsigned long speed;
 	if (!val || kstrtoul(val, 0, &speed) || speed > 63)
 		return -EINVAL;
@@ -43,7 +44,7 @@ static int param_set_scroll_speed(const char *val,
 module_param_call(scroll_speed, param_set_scroll_speed, param_get_uint, &scroll_speed, 0644);
 MODULE_PARM_DESC(scroll_speed, "Scroll speed, value from 0 (slow) to 63 (fast)");
 
-static bool scroll_acceleration = false;
+static bool scroll_acceleration;
 module_param(scroll_acceleration, bool, 0644);
 MODULE_PARM_DESC(scroll_acceleration, "Accelerate sequential scroll events");
 
@@ -76,32 +77,32 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 
 /* Touch surface information. Dimension is in hundredths of a mm, min and max
  * are in units. */
-#define MOUSE_DIMENSION_X (float)9056
+#define MOUSE_DIMENSION_X ((float)9056)
 #define MOUSE_MIN_X -1100
 #define MOUSE_MAX_X 1258
 #define MOUSE_RES_X ((MOUSE_MAX_X - MOUSE_MIN_X) / (MOUSE_DIMENSION_X / 100))
-#define MOUSE_DIMENSION_Y (float)5152
+#define MOUSE_DIMENSION_Y ((float)5152)
 #define MOUSE_MIN_Y -1589
 #define MOUSE_MAX_Y 2047
 #define MOUSE_RES_Y ((MOUSE_MAX_Y - MOUSE_MIN_Y) / (MOUSE_DIMENSION_Y / 100))
 
-#define TRACKPAD_DIMENSION_X (float)13000
+#define TRACKPAD_DIMENSION_X ((float)13000)
 #define TRACKPAD_MIN_X -2909
 #define TRACKPAD_MAX_X 3167
 #define TRACKPAD_RES_X \
 	((TRACKPAD_MAX_X - TRACKPAD_MIN_X) / (TRACKPAD_DIMENSION_X / 100))
-#define TRACKPAD_DIMENSION_Y (float)11000
+#define TRACKPAD_DIMENSION_Y ((float)11000)
 #define TRACKPAD_MIN_Y -2456
 #define TRACKPAD_MAX_Y 2565
 #define TRACKPAD_RES_Y \
 	((TRACKPAD_MAX_Y - TRACKPAD_MIN_Y) / (TRACKPAD_DIMENSION_Y / 100))
 
-#define TRACKPAD2_DIMENSION_X (float)16000
+#define TRACKPAD2_DIMENSION_X ((float)16000)
 #define TRACKPAD2_MIN_X -3678
 #define TRACKPAD2_MAX_X 3934
 #define TRACKPAD2_RES_X \
 	((TRACKPAD2_MAX_X - TRACKPAD2_MIN_X) / (TRACKPAD2_DIMENSION_X / 100))
-#define TRACKPAD2_DIMENSION_Y (float)11490
+#define TRACKPAD2_DIMENSION_Y ((float)11490)
 #define TRACKPAD2_MIN_Y -2478
 #define TRACKPAD2_MAX_Y 2587
 #define TRACKPAD2_RES_Y \
@@ -182,14 +183,17 @@ static void magicmouse_emit_buttons(struct magicmouse_sc *msc, int state)
 			/* The button was released. */
 		} else if (last_state != 0) {
 			state = last_state;
-		} else if ((id = magicmouse_firm_touch(msc)) >= 0) {
-			int x = msc->touches[id].x;
-			if (x < middle_button_start)
-				state = 1;
-			else if (x > middle_button_stop)
-				state = 2;
-			else
-				state = 4;
+		} else {
+			id = magicmouse_firm_touch(msc);
+			if (id >= 0) {
+				int x = msc->touches[id].x;
+				if (x < middle_button_start)
+					state = 1;
+				else if (x > middle_button_stop)
+					state = 2;
+				else
+					state = 4;
+			}
 		} /* else: we keep the mouse's guess */
 
 		input_report_key(msc->input, BTN_MIDDLE, state & 4);
-- 
2.25.1

