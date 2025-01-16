Return-Path: <linux-input+bounces-9263-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C0A130C6
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 02:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48EAD1888A2E
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 01:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BF2F9EC;
	Thu, 16 Jan 2025 01:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="eJEcBzi4"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8DA24A7ED
	for <linux-input@vger.kernel.org>; Thu, 16 Jan 2025 01:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990913; cv=none; b=bt7IsOP13P64O6li0Bh7iEn7OQDFn20XZachu3oWC4FIZa11qASpIr7Wj5ZaXNyWJiOs6Mf4Ud1ORdbPzbGlo15EIcpljB7sxxHNYVJymG+UrToaqzBVviAgOI/IXeJQxO/qYqlRb1bUAt2MNa4i0KIohjOXbES6Wj7qLBZnRek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990913; c=relaxed/simple;
	bh=H+0YAExnjokthDQ3VcYRNEGdJ961oUKLCSNh7kck5vM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uwKilajgp2GEwjConQtOEVI+GR+aOiw/YtzfQrbsCoBpckIESJmPJ8rCovL+I0nQD1aDoJcn8kD4FmWPPq9A+k67cAhO4EFvm3dbpYx3oQPVoYo+LetdL7chzy9Ikat8t+ynXcz1pmnXDegN5Aoskk/B8PuGl6YR7qm4MnZndq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=eJEcBzi4; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1736990910; bh=H+0YAExnjokthDQ3VcYRNEGdJ961oUKLCSNh7kck5vM=;
	h=From:To:Cc:Subject:Date:From;
	b=eJEcBzi4eQuvANSRIR6RV0mb3MG34mhy37R4N0mOZb3Ga/Kc73XxWyMSjfOyGBpru
	 jH6b5udRXK43SkcRCy0E+SgEGhOX1V7Fmusjo7CtiSHyZC3Ui6XgUNu3Nl6nedi0Hr
	 OqRGVY7OihsiWE7fvQHzhbRwhQgS1VJPcwxX6iYYQIPtCQFqcEGgvn/zsI3U2yyh5d
	 h0GiGI6XFmqECGYsT6HV5cHgZXrZdu8akF58ldKl4d10loH7WyApcdVZOGuTyuKR43
	 UjO+E5oj6PuG/m6dXjxSkz9C4Jjfw/9rGR0M3XLrULXdVtDDqXaHOeNvDDMC2yVL2+
	 lNLOpue3HpAKA==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 12BFD13208B;
	Wed, 15 Jan 2025 17:28:30 -0800 (PST)
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>,
	Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Subject: [PATCH] HID: hid-steam: Fix issues with disabling both gamepad mode and lizard mode
Date: Wed, 15 Jan 2025 17:28:16 -0800
Message-ID: <20250116012816.3478021-1-vi@endrift.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When lizard mode is disabled, there were two issues:

1. Switching between gamepad mode and desktop mode still functioned, even
though desktop mode did not. This lead to the ability to "break" gamepad mode
by holding down the Options key even while lizard mode is disabled

2. If you were in desktop mode when lizard mode is disabled, you would
immediately enter this faulty mode.

This patch properly disables the ability to switch between gamepad mode and the
faulty desktop mode by holding the Options key, as well as effectively removing
the faulty mode by bypassing the early returns if lizard mode is disabled.

Reported-by: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-steam.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index af38fc8eb34f..b008fd0834b9 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1050,10 +1050,10 @@ static void steam_mode_switch_cb(struct work_struct *work)
 							struct steam_device, mode_switch);
 	unsigned long flags;
 	bool client_opened;
-	steam->gamepad_mode = !steam->gamepad_mode;
 	if (!lizard_mode)
 		return;
 
+	steam->gamepad_mode = !steam->gamepad_mode;
 	if (steam->gamepad_mode)
 		steam_set_lizard_mode(steam, false);
 	else {
@@ -1599,7 +1599,7 @@ static void steam_do_deck_input_event(struct steam_device *steam,
 		schedule_delayed_work(&steam->mode_switch, 45 * HZ / 100);
 	}
 
-	if (!steam->gamepad_mode)
+	if (!steam->gamepad_mode && lizard_mode)
 		return;
 
 	lpad_touched = b10 & BIT(3);
@@ -1669,7 +1669,7 @@ static void steam_do_deck_sensors_event(struct steam_device *steam,
 	 */
 	steam->sensor_timestamp_us += 4000;
 
-	if (!steam->gamepad_mode)
+	if (!steam->gamepad_mode && lizard_mode)
 		return;
 
 	input_event(sensors, EV_MSC, MSC_TIMESTAMP, steam->sensor_timestamp_us);
-- 
2.47.1


