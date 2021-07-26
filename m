Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B1E3D564F
	for <lists+linux-input@lfdr.de>; Mon, 26 Jul 2021 11:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhGZIhM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jul 2021 04:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhGZIhM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jul 2021 04:37:12 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FFFC061757;
        Mon, 26 Jul 2021 02:17:40 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q3so10270512wrx.0;
        Mon, 26 Jul 2021 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8XPlENDnBF1HPtE4GsW4S/+wx4zo9TdSRDpla7XW8r8=;
        b=O/USm/7o6jxe61SJt1Jj+D3Il60b2yUGgSju8iepLIokQccUtYTGLaKrsqF/3mvBYP
         m0wgvGNo87Kw2SgP901qgj67XqJ4WWd4hUSdgn06SWMyTcR47c7muHSACQsI0AUVJ2Yf
         9My9qalcH54FDRo9EgBEylVd+5kj6LV3aMalozcrfOW1oRjEO6q2mCDCpnoGW4rHgnBE
         3YElc1fu7q+U939tT8calANJXgra85NFoapme0SITVE3iDiIFr/VxG/GBPeyJN6S5YF2
         OITpMcMBCN9N35IkPJlhZ5qhFvew9qsxzF/hWZjiHHGSszYbxaPnlvPCQyIuEAULZdAZ
         dgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8XPlENDnBF1HPtE4GsW4S/+wx4zo9TdSRDpla7XW8r8=;
        b=Mae1r2n5N6TIuoE2zN+nteUHijC6fTpkPzE54ArbUiWLt2XTg4zeCDSr8n6jE5PCYH
         wo+GLttgVFJoGl/hmJRggd0uHE/C9jc61m/nVqd3JVrZR1LJuml0wfbFnTTtNda5xUDH
         g2WyD3LXP/jjC415iMGbJa1BZmbrCjUkO+YH8S8HIlHu+UwAhY2WmocCBnAScgzMLu4k
         U2UwLtA5YCL5DSeAus2ul+aKwyFjzuOS3VcfxGs/+CaIaryrsUH2kFBoKaWAMgM7cg/m
         HEJ0qcLLpZV0KnirUOG96j/qiy0m9B3EuvDshn17DVKuc6A5H1LbJioBZFDu3wB0Es+2
         9zOw==
X-Gm-Message-State: AOAM530RQkqhstESQ0Hs8zqwhkZUcCeog82xCr+Pqjk85eRwugLwUWl+
        PM4fT04rimKUw048FS7eKwlQ+pU54Sj+jbQF
X-Google-Smtp-Source: ABdhPJyrHFbUIeEFpjOxyZs18Py0sXKzIfv0f4PEmnVjDj8WPC9OIeGKoO7z87G3I4t5FJpCNDJ8lg==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr9822975wrp.53.1627291058984;
        Mon, 26 Jul 2021 02:17:38 -0700 (PDT)
Received: from localhost.localdomain ([94.73.35.151])
        by smtp.gmail.com with ESMTPSA id g3sm41805869wru.95.2021.07.26.02.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 02:17:38 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH -next 1/2] HID: magicmouse: fix code style errors
Date:   Mon, 26 Jul 2021 11:17:18 +0200
Message-Id: <20210726091719.47886-1-jose.exposito89@gmail.com>
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
 drivers/hid/hid-magicmouse.c | 37 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 686788ebf3e1..3c911c97fe57 100644
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
@@ -182,14 +183,18 @@ static void magicmouse_emit_buttons(struct magicmouse_sc *msc, int state)
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
+
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

