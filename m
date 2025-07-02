Return-Path: <linux-input+bounces-13327-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2AAF098E
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 06:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36EED4E3570
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 04:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B01184;
	Wed,  2 Jul 2025 04:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="glqbcToA"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A7813635E
	for <linux-input@vger.kernel.org>; Wed,  2 Jul 2025 04:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428937; cv=none; b=LJrhp/XIS/wVxvhiyYBdKAeeqfNOEpaYnTGpiNXkvfcFGN+urlJjgr74U6bnGvC5dTCOzXl0xqnEfq9Tr9lJA7AtZHVBZcsxmA9UFN0CCviXdoHWUl4cMI+2fGr1mcHVrHh9chm3ieKOcxFEf9/6wd4drTDxrvSP7P0nZli4IL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428937; c=relaxed/simple;
	bh=IIAbdE1pYyrf5c8qMI1ZBM9Jwcc2qcMWslWOX7IZI6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UebopsgfQTUsqsczyDKOKCe3XXf4UdCaSojnsJx6D/F4Zl19RA6WBprcy8ombQzRjrIMy7AMZDXuMmDR90BnxB8N1yEBYULLKoKo5T+MEWMwez0GBQc76IX6LOvuO8FRJoO9yYuzkn3QFMe0ti/sJ8kviCLSqFC8C5TcA8ugQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=glqbcToA; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751428935; bh=IIAbdE1pYyrf5c8qMI1ZBM9Jwcc2qcMWslWOX7IZI6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=glqbcToAxLLfvLmZfnL4XSCYZCBeYnahQ/3KzXGHMsq7RaUEzNmkTUurci0234HQL
	 I3EGfkmxyd6cjPCDB1qdDWcsg9D9F2x/rw1fBdpOoiplRPZCP0VYXYGHqytbkaRnGf
	 qrBT4FY8FDdHyBmUmwE4Dvwx27mrZwQder6L/p62bYbV2u74uPYQCKhJvi0oviFFv4
	 MRxsRFVO5423j10ifLFPcD5yzJS7AgFCLadQEtKJJozMKV6280gKutN4hoYsNU8XXP
	 gakjG1hQAZH2nk4KjgpjtYZlzp1flv1ahhtpsEnN4NX+GP96qFczRKNRybzH/9q+tx
	 wV+9o2/g6ZI4Q==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 4F4A6A287;
	Tue,  1 Jul 2025 21:02:15 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 3/3] HID: hid-steam: Use new BTN_GRIP* buttons
Date: Tue,  1 Jul 2025 21:01:02 -0700
Message-ID: <20250702040102.125432-4-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702040102.125432-1-vi@endrift.com>
References: <20250702040102.125432-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 949d307c66a8..dd6595487bef 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -757,10 +757,10 @@ static int steam_input_register(struct steam_device *steam)
 	input_set_capability(input, EV_KEY, BTN_THUMB2);
 	if (steam->quirks & STEAM_QUIRK_DECK) {
 		input_set_capability(input, EV_KEY, BTN_BASE);
-		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY1);
-		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY2);
-		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY3);
-		input_set_capability(input, EV_KEY, BTN_TRIGGER_HAPPY4);
+		input_set_capability(input, EV_KEY, BTN_GRIPL);
+		input_set_capability(input, EV_KEY, BTN_GRIPL2);
+		input_set_capability(input, EV_KEY, BTN_GRIPR);
+		input_set_capability(input, EV_KEY, BTN_GRIPR2);
 	} else {
 		input_set_capability(input, EV_KEY, BTN_GEAR_DOWN);
 		input_set_capability(input, EV_KEY, BTN_GEAR_UP);
@@ -1547,8 +1547,8 @@ static void steam_do_input_event(struct steam_device *steam,
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
@@ -1573,8 +1573,8 @@ static void steam_do_input_event(struct steam_device *steam,
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
@@ -1659,8 +1659,8 @@ static void steam_do_deck_input_event(struct steam_device *steam,
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
@@ -1669,8 +1669,8 @@ static void steam_do_deck_input_event(struct steam_device *steam,
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


