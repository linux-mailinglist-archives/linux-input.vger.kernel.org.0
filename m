Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438463BEBBB
	for <lists+linux-input@lfdr.de>; Wed,  7 Jul 2021 17:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhGGQBm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jul 2021 12:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbhGGQBl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jul 2021 12:01:41 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB05C061574;
        Wed,  7 Jul 2021 08:58:59 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id d2so3716398wrn.0;
        Wed, 07 Jul 2021 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NumtXqCRVYAzFa0yveavuQ/5Uh323OAnb8TqM4/K4UY=;
        b=KxaHFj4gSebkw76xK7UQrJMoMFCRbJ01khCHJuXvPlflgU+TBz3Yu4rLxUUv1sSuqN
         BVrdF/Za4jjBFhLu+NwL9+k7Ig8U9MkMBYvl/owsQQzeEYsaunvB/IAbVcVZ0qaA/+i8
         XnMlIBDTNSZ7FiwA3EDvX3unQgrYURrOO7+yts5B78f/PM1O6qW2/Pqn5pZCcaFVyPBp
         8je81Sma6xgcc+WAb+dePd7VpkfSnP9g7mfvknZlRPOgnqDJQfSQnan3tLB1aENC/4uq
         As3PQVlRKq/aBYasudrbegkJPTOYXPM5HksfYt/9eeSab6LgDCkaBL2Zo9vG9sbqbxdO
         PGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NumtXqCRVYAzFa0yveavuQ/5Uh323OAnb8TqM4/K4UY=;
        b=PkLJ013dTWwmcfqZGmjbqgkU1QwDu4qpBpby+/pHWISWTnSj42ov4vTzeLt9U/QQ3q
         Hc3gV3XqrBZqgL96228MlL66le9bXAiqAfUJm43DaTW1g3ud8V1TvodWHcIyw4S2/8pJ
         RSnCT4R6VtOnxfYrFAbT1q1+UoiUcBY/hRvnLTBNAse+9rHKVb/66CBvVFBdIAcNr4mx
         O7cUWtrmcMsMOgYq5Dh+YV/KxlB2XZshU+gDJ1ZFOzDvLbJMyyrXha2IsE7ufpjvSITY
         nzSQceJNN/DF7v+F5SRu0yvLby1LAFWFPSt75wifpAplJA6Q48LULuUi8QECvO20qPus
         B19g==
X-Gm-Message-State: AOAM533Ee2B/uBtdBF43C0f0jUESYk8ElYLQ/yKVizXM15VqHzln9Rc/
        +BC0bvks9DysYEwQi+Jt9lg=
X-Google-Smtp-Source: ABdhPJw3sISd19GRg4hEPy6GHoZ0l4hCW0ybJOatjne9nSWBztxiuR7mWinbUJfbFyyxcbHb8aPl0A==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr4087082wrm.362.1625673537966;
        Wed, 07 Jul 2021 08:58:57 -0700 (PDT)
Received: from localhost.localdomain ([94.73.35.100])
        by smtp.gmail.com with ESMTPSA id c9sm13942838wrx.22.2021.07.07.08.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 08:58:57 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] HID: magicmouse: high-resolution scroll threshold
Date:   Wed,  7 Jul 2021 17:58:22 +0200
Message-Id: <20210707155822.7811-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707155822.7811-1-jose.exposito89@gmail.com>
References: <20210707155822.7811-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In order to avoid triggering involuntary high-resolution scroll events
due to tiny touch movement deltas, add a movement threshold.

The value chosen for the threshold, about 1.5 ~ 2 mm, is similar to the
threshold used on touchpads by libinput (see libinput
evdev-mt-touchpad-gestures.c) to try to keep the scroll experience
consistent.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index e95f46dab4ad..686788ebf3e1 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -71,6 +71,7 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 /* Number of high-resolution events for each low-resolution detent. */
 #define SCROLL_HR_STEPS 10
 #define SCROLL_HR_MULT (120 / SCROLL_HR_STEPS)
+#define SCROLL_HR_THRESHOLD 90 /* units */
 #define SCROLL_ACCEL_DEFAULT 7
 
 /* Touch surface information. Dimension is in hundredths of a mm, min and max
@@ -132,6 +133,8 @@ struct magicmouse_sc {
 		short scroll_x_hr;
 		short scroll_y_hr;
 		u8 size;
+		bool scroll_x_active;
+		bool scroll_y_active;
 	} touches[16];
 	int tracking_ids[16];
 
@@ -265,6 +268,8 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 			msc->touches[id].scroll_y = y;
 			msc->touches[id].scroll_x_hr = x;
 			msc->touches[id].scroll_y_hr = y;
+			msc->touches[id].scroll_x_active = false;
+			msc->touches[id].scroll_y_active = false;
 
 			/* Reset acceleration after half a second. */
 			if (scroll_acceleration && time_before(now,
@@ -292,8 +297,16 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 				input_report_rel(input, REL_WHEEL, step_y);
 			}
 
+			if (!msc->touches[id].scroll_x_active &&
+			    abs(step_x_hr) > SCROLL_HR_THRESHOLD) {
+				msc->touches[id].scroll_x_active = true;
+				msc->touches[id].scroll_x_hr = x;
+				step_x_hr = 0;
+			}
+
 			step_x_hr /= step_hr;
-			if (step_x_hr != 0) {
+			if (step_x_hr != 0 &&
+			    msc->touches[id].scroll_x_active) {
 				msc->touches[id].scroll_x_hr -= step_x_hr *
 					step_hr;
 				input_report_rel(input,
@@ -301,8 +314,16 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 						 -step_x_hr * SCROLL_HR_MULT);
 			}
 
+			if (!msc->touches[id].scroll_y_active &&
+			    abs(step_y_hr) > SCROLL_HR_THRESHOLD) {
+				msc->touches[id].scroll_y_active = true;
+				msc->touches[id].scroll_y_hr = y;
+				step_y_hr = 0;
+			}
+
 			step_y_hr /= step_hr;
-			if (step_y_hr != 0) {
+			if (step_y_hr != 0 &&
+			    msc->touches[id].scroll_y_active) {
 				msc->touches[id].scroll_y_hr -= step_y_hr *
 					step_hr;
 				input_report_rel(input,
-- 
2.25.1

