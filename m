Return-Path: <linux-input+bounces-13576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D14AB0813D
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 02:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B724F189D651
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 00:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74523DDAB;
	Thu, 17 Jul 2025 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="SQnViuAA"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD280635
	for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752710574; cv=none; b=SBBjZIl/SNvdArCYLZBHDnfX39lMcriix/1ZQID03I2QUTQauMIMuaPIbvFYouqK2itemucf/X+r8ATa/aTo9wl+3RFeG18LzdbZrs8rJB8QZgi9MhzlvFPt1GZz5Hva2JfRnobpBRHajbHAQC1ouLHVfKqyZ2oniY17Xdw0Q0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752710574; c=relaxed/simple;
	bh=Dah4r8fEsHVax3BbUzIFceY+F1kvxdQPVCrEwuNDePU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bO+MSR0E5jqIW9d06ysv8tK30WGpqA051cDG0ymgKewtPw2j9Vs1a+J94WLnJcPE5Q4sjhhjf4sn8AGEy+x76OSWuEYir4Rb2BcfdhLoLcQ/vApgsN7iWH8APsQ965c2ojSth5HpxxalwnAXUjbaicWkPgs7c/7rGUpK/1tnvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=SQnViuAA; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1752710572; bh=Dah4r8fEsHVax3BbUzIFceY+F1kvxdQPVCrEwuNDePU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQnViuAAYOOda9EHzNR97b9WMljhEtPwNCn3uDZQfP9z4KQzwSr0jhC6IYI4ht7k6
	 rkZPuSiXNW1aEPjXprh4h31lN6gbttTrf9jnylo/KNjrn5zTbfGckpmu3kry5PJ5D3
	 a5o4MTscaqEhiGvkY/M95/8piAavfD1kAxP9SwImBkGYtWVfgua/C8YLfJzULwUbJA
	 +jq1aKpZobZRkvha6HdiMY8N+BvFFUFP1ogVcfWDWSNAK6jzdKHzU2LZLI04pPpEM/
	 zOcMBGoyYqlCHLe1NQ3UvoDFoL4sOHi6i4w1Ejykbkn6Jvltloo0socygYunIxAikM
	 jxsAEboLg+6Wg==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id C23C513208B;
	Wed, 16 Jul 2025 17:02:51 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 3/3] HID: hid-steam: Use new BTN_GRIP* buttons
Date: Wed, 16 Jul 2025 17:01:40 -0700
Message-ID: <20250717000143.1902875-4-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717000143.1902875-1-vi@endrift.com>
References: <20250717000143.1902875-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 949d307c66a8..197126d6e081 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -755,15 +755,12 @@ static int steam_input_register(struct steam_device *steam)
 	input_set_capability(input, EV_KEY, BTN_THUMBL);
 	input_set_capability(input, EV_KEY, BTN_THUMB);
 	input_set_capability(input, EV_KEY, BTN_THUMB2);
+	input_set_capability(input, EV_KEY, BTN_GRIPL);
+	input_set_capability(input, EV_KEY, BTN_GRIPR);
 	if (steam->quirks & STEAM_QUIRK_DECK) {
 		input_set_capability(input, EV_KEY, BTN_BASE);
-		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY1);
-		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY2);
-		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY3);
-		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY4);
-	} else {
-		input_set_capability(input, EV_KEY, BTN_GEAR_DOWN);
-		input_set_capability(input, EV_KEY, BTN_GEAR_UP);
+		input_set_capability(input, EV_KEY, BTN_GRIPL2);
+		input_set_capability(input, EV_KEY, BTN_GRIPR2);
 	}
 
 	input_set_abs_params(input, ABS_X, -32767, 32767, 0, 0);
@@ -1419,8 +1416,8 @@ static inline s16 steam_le16(u8 *data)
  *  9.4  | BTN_SELECT | menu left
  *  9.5  | BTN_MODE   | steam logo
  *  9.6  | BTN_START  | menu right
- *  9.7  | BTN_GEAR_DOWN | left back lever
- * 10.0  | BTN_GEAR_UP   | right back lever
+ *  9.7  | BTN_GRIPL  | left back lever
+ * 10.0  | BTN_GRIPR  | right back lever
  * 10.1  | --         | left-pad clicked
  * 10.2  | BTN_THUMBR | right-pad clicked
  * 10.3  | BTN_THUMB  | left-pad touched (but see explanation below)
@@ -1485,8 +1482,8 @@ static void steam_do_input_event(struct steam_device *steam,
 	input_event(input, EV_KEY, BTN_SELECT, !!(b9 & BIT(4)));
 	input_event(input, EV_KEY, BTN_MODE, !!(b9 & BIT(5)));
 	input_event(input, EV_KEY, BTN_START, !!(b9 & BIT(6)));
-	input_event(input, EV_KEY, BTN_GEAR_DOWN, !!(b9 & BIT(7)));
-	input_event(input, EV_KEY, BTN_GEAR_UP, !!(b10 & BIT(0)));
+	input_event(input, EV_KEY, BTN_GRIPL, !!(b9 & BIT(7)));
+	input_event(input, EV_KEY, BTN_GRIPR, !!(b10 & BIT(0)));
 	input_event(input, EV_KEY, BTN_THUMBR, !!(b10 & BIT(2)));
 	input_event(input, EV_KEY, BTN_THUMBL, !!(b10 & BIT(6)));
 	input_event(input, EV_KEY, BTN_THUMB, lpad_touched || lpad_and_joy);
@@ -1547,8 +1544,8 @@ static void steam_do_input_event(struct steam_device *steam,
  *  9.4  | BTN_SELECT | menu left
  *  9.5  | BTN_MODE   | steam logo
  *  9.6  | BTN_START  | menu right
- *  9.7  | BTN_TRIGGER_HAPPY3 | left bottom grip button
- *  10.0 | BTN_TRIGGER_HAPPY4 | right bottom grip button
+ *  9.7  | BTN_GRIPL2 | left bottom grip button
+ *  10.0 | BTN_GRIPR2 | right bottom grip button
  *  10.1 | BTN_THUMB  | left pad pressed
  *  10.2 | BTN_THUMB2 | right pad pressed
  *  10.3 | --         | left pad touched
@@ -1573,8 +1570,8 @@ static void steam_do_input_event(struct steam_device *steam,
  *  12.6 | --         | unknown
  *  12.7 | --         | unknown
  *  13.0 | --         | unknown
- *  13.1 | BTN_TRIGGER_HAPPY1 | left top grip button
- *  13.2 | BTN_TRIGGER_HAPPY2 | right top grip button
+ *  13.1 | BTN_GRIPL  | left top grip button
+ *  13.2 | BTN_GRIPR  | right top grip button
  *  13.3 | --         | unknown
  *  13.4 | --         | unknown
  *  13.5 | --         | unknown
@@ -1659,8 +1656,8 @@ static void steam_do_deck_input_event(struct steam_device *steam,
 	input_event(input, EV_KEY, BTN_SELECT, !!(b9 & BIT(4)));
 	input_event(input, EV_KEY, BTN_MODE, !!(b9 & BIT(5)));
 	input_event(input, EV_KEY, BTN_START, !!(b9 & BIT(6)));
-	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY3, !!(b9 & BIT(7)));
-	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY4, !!(b10 & BIT(0)));
+	input_event(input, EV_KEY, BTN_GRIPL2, !!(b9 & BIT(7)));
+	input_event(input, EV_KEY, BTN_GRIPR2, !!(b10 & BIT(0)));
 	input_event(input, EV_KEY, BTN_THUMBL, !!(b10 & BIT(6)));
 	input_event(input, EV_KEY, BTN_THUMBR, !!(b11 & BIT(2)));
 	input_event(input, EV_KEY, BTN_DPAD_UP, !!(b9 & BIT(0)));
@@ -1669,8 +1666,8 @@ static void steam_do_deck_input_event(struct steam_device *steam,
 	input_event(input, EV_KEY, BTN_DPAD_DOWN, !!(b9 & BIT(3)));
 	input_event(input, EV_KEY, BTN_THUMB, !!(b10 & BIT(1)));
 	input_event(input, EV_KEY, BTN_THUMB2, !!(b10 & BIT(2)));
-	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY1, !!(b13 & BIT(1)));
-	input_event(input, EV_KEY, BTN_TRIGGER_HAPPY2, !!(b13 & BIT(2)));
+	input_event(input, EV_KEY, BTN_GRIPL, !!(b13 & BIT(1)));
+	input_event(input, EV_KEY, BTN_GRIPR, !!(b13 & BIT(2)));
 	input_event(input, EV_KEY, BTN_BASE, !!(b14 & BIT(2)));
 
 	input_sync(input);
-- 
2.49.0


