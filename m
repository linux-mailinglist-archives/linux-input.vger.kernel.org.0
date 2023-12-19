Return-Path: <linux-input+bounces-863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1A819250
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 22:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14BE01F25402
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 21:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD573A292;
	Tue, 19 Dec 2023 21:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM9BN8Pz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E73D0A3;
	Tue, 19 Dec 2023 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-67f3f602bd5so18393806d6.3;
        Tue, 19 Dec 2023 13:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703021629; x=1703626429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+lPZbUpeh1waWV8KlQfnyidlSHaxvRLYCW+sDvxuF1Y=;
        b=jM9BN8Pz+kYeXAEZKtNELvrPUy0jmqdci9ZVQoXaGKwNEEuumy1V5elUztEUcU04Hq
         gDOj8m2mJ70QNApxOy/dipv/OQc7Tm8aeNw6L3og6FV4Xa6CXjurtDB89KIpSv+cEMyU
         nmnggapH2NoDduXZnvA/dM0/ZThH8awrxXDb8RRh8oPWg2ubd7xlSKhqcYEVSHNxHNKC
         +BVZFR2ALRhkFmLoCoyWzD2CK9wKbyP0bXK+JRXktw6AE4SsNFqSKTC9bhLWPqdzXs6q
         MM9GiHAty7sezjHq6/WIBhdUh3ZLBQfHoQKeklAoB/xmdK6tXUh5d0XSXoF/UBxfYqLK
         BqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703021629; x=1703626429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lPZbUpeh1waWV8KlQfnyidlSHaxvRLYCW+sDvxuF1Y=;
        b=pkFjdiiUEE2dzGmeTjoK6XCyH0y2OL4SLXpG/KueUrd+DGmum7kwF6VFCoKlo/410W
         6Rfd5I5RseRTKgEsom+aIsr3bGCbWRADHXKWv8w+jd4NeELCuCPGn5o/FtvmAHRe52h7
         JqmQs/FT8hIwu8izyINwmiJH9Qvi1LdhzlPkRO4oyTVyq1G17G1FQfK9EO5+c0GtR3yt
         CP/QmXGGGqMjhEweZITZOESp+4CBGDteZLlZ/H/1Nt2mmI01I7oYe3nqjP1vMKA3iycK
         yDnogU1JE7OEcNuQL30kdRsw/8HIQFtKuNkDrv+70x1gqJjl9b6GIUKGlDwcRu+wjVcn
         zUGg==
X-Gm-Message-State: AOJu0YwkGy9NyVH98PheXIf8zn5PpYXP0ypH7Rs+jDuzxzzkviuK3kxZ
	4slGFJNSaQiyrdFpvQxtFJ7Q2G0urxE=
X-Google-Smtp-Source: AGHT+IHlcf4jQkGrSDZR5ycZukn5QQwc52Bp8hSdndOaY/gm0NYAtjGptT2urP68W8wMkQi2UGrK9Q==
X-Received: by 2002:ad4:5eca:0:b0:67f:5fa:3817 with SMTP id jm10-20020ad45eca000000b0067f05fa3817mr13900383qvb.11.1703021629634;
        Tue, 19 Dec 2023 13:33:49 -0800 (PST)
Received: from localhost.localdomain ([2607:fb91:1ee4:153c:b0e5:6075:17c0:82cf])
        by smtp.gmail.com with ESMTPSA id dy7-20020ad44e87000000b0067f213933bdsm4083922qvb.2.2023.12.19.13.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 13:33:49 -0800 (PST)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Aaron Skomra <aaron.skomra@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Joshua Dickens <joshua.dickens@wacom.com>,
	Ping Cheng <ping.cheng@wacom.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Joshua Dickens <joshua@joshua-dickens.com>,
	Ping Cheng <pinglinux@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] HID: wacom: Correct behavior when processing some confidence == false touches
Date: Tue, 19 Dec 2023 13:33:43 -0800
Message-ID: <20231219213344.38434-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

There appear to be a few different ways that Wacom devices can deal with
confidence:

  1. If the device looses confidence in a touch, it will first clear
     the tipswitch flag in one report, and then clear the confidence
     flag in a second report. This behavior is used by e.g. DTH-2452.

  2. If the device looses confidence in a touch, it will clear both
     the tipswitch and confidence flags within the same report. This
     behavior is used by some AES devices.

  3. If the device looses confidence in a touch, it will clear *only*
     the confidence bit. The tipswitch bit will remain set so long as
     the touch is tracked. This behavior may be used in future devices.

The driver does not currently handle situation 3 properly. Touches that
loose confidence will remain "in prox" and essentially frozen in place
until the tipswitch bit is finally cleared. Not only does this result
in userspace seeing a stuck touch, but it also prevents pen arbitration
from working properly (the pen won't send events until all touches are
up, but we don't currently process events from non-confident touches).

This commit centralizes the checking of the confidence bit in the
wacom_wac_finger_slot() function and has 'prox' depend on it. In the
case where situation 3 is encountered, the treat the touch as though
it was removed, allowing both userspace and the pen arbitration to
act normally.

Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Fixes: 7fb0413baa7f ("HID: wacom: Use "Confidence" flag to prevent reporting invalid contacts")
Cc: stable@vger.kernel.org
---
 drivers/hid/wacom_wac.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 471db78dbbf0..8289ce763704 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2649,8 +2649,8 @@ static void wacom_wac_finger_slot(struct wacom_wac *wacom_wac,
 {
 	struct hid_data *hid_data = &wacom_wac->hid_data;
 	bool mt = wacom_wac->features.touch_max > 1;
-	bool prox = hid_data->tipswitch &&
-		    report_touch_events(wacom_wac);
+	bool touch_down = hid_data->tipswitch && hid_data->confidence;
+	bool prox = touch_down && report_touch_events(wacom_wac);
 
 	if (touch_is_muted(wacom_wac)) {
 		if (!wacom_wac->shared->touch_down)
@@ -2700,24 +2700,6 @@ static void wacom_wac_finger_slot(struct wacom_wac *wacom_wac,
 	}
 }
 
-static bool wacom_wac_slot_is_active(struct input_dev *dev, int key)
-{
-	struct input_mt *mt = dev->mt;
-	struct input_mt_slot *s;
-
-	if (!mt)
-		return false;
-
-	for (s = mt->slots; s != mt->slots + mt->num_slots; s++) {
-		if (s->key == key &&
-			input_mt_get_value(s, ABS_MT_TRACKING_ID) >= 0) {
-			return true;
-		}
-	}
-
-	return false;
-}
-
 static void wacom_wac_finger_event(struct hid_device *hdev,
 		struct hid_field *field, struct hid_usage *usage, __s32 value)
 {
@@ -2768,14 +2750,8 @@ static void wacom_wac_finger_event(struct hid_device *hdev,
 	}
 
 	if (usage->usage_index + 1 == field->report_count) {
-		if (equivalent_usage == wacom_wac->hid_data.last_slot_field) {
-			bool touch_removed = wacom_wac_slot_is_active(wacom_wac->touch_input,
-				wacom_wac->hid_data.id) && !wacom_wac->hid_data.tipswitch;
-
-			if (wacom_wac->hid_data.confidence || touch_removed) {
-				wacom_wac_finger_slot(wacom_wac, wacom_wac->touch_input);
-			}
-		}
+		if (equivalent_usage == wacom_wac->hid_data.last_slot_field)
+			wacom_wac_finger_slot(wacom_wac, wacom_wac->touch_input);
 	}
 }
 
-- 
2.43.0


