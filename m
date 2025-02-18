Return-Path: <linux-input+bounces-10129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB32A3A92E
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDD571899F65
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25521F3BA3;
	Tue, 18 Feb 2025 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnJF9GI0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BF21DB37B;
	Tue, 18 Feb 2025 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910394; cv=none; b=nyZkWPpvvkdVxFOJH+Bps0kCel4pHOqqu2ZgnGk3s5WKnniLwLpKL5lz64V+vkTo8mXs18zhlIfi1AtAFhyLUUPDiEuxEM9rsBSnioWT7SNsQ0/XLFfbytj6dalM4ZsPHeIf+11wBnMx728NLHEY+xXThSUMaq6+sWF+WbO2QDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910394; c=relaxed/simple;
	bh=OgFAUTqFF3LdTRTOO5ZdAmG2PjdIkoKvvuaRA59lPfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bIUnQI8chbs/6tHkT6Bj0pC7RzZoBupteqG1m4V7sruHW5ogg+HchHmSkBQwEp2GjXpvSYc5WsYQ2IotpWaeFqW3o9V+17dhBt3QQ5rP3+QWhicbI8gw/Ub+gzUh/9HnP5hd2YUpSHa+ddLoWm4DBcMfDROuF/AcKReO2UF0TyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnJF9GI0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1115C4CEE2;
	Tue, 18 Feb 2025 20:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910394;
	bh=OgFAUTqFF3LdTRTOO5ZdAmG2PjdIkoKvvuaRA59lPfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SnJF9GI0X83Xo+GQUgFOThnvxG5rhH5aP9dzD+GDT5RTP+afHzvlM3kvpPziOVTN2
	 3SqGD/nWj3c51PBG8gIp8JlfRl2wHNY9DZBqfuyyEeytYO7iYu+39sKFKCH3GtbABf
	 g8ekW8y9vB9PB/fb9N7Jx+6gd2KDSBoGrxprHuITgkml4RHUH65n0+u6eadzWjE6AP
	 yFX8cK0/2l5BWoUPjyq5N6lzS+a3npR1Um8bxP89/IqlyNPKJguJcxTwwFIuoZ6TVD
	 pz7ZEi7wXVNzVokNPxYIHeSRI5BfOXgBCFi3blo+St8txxAhuciPPcSICkD9ageZGc
	 XTdgflQhj4qRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>,
	Eugeny Shcheglov <eugenyshcheglov@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 05/31] HID: hid-steam: Fix issues with disabling both gamepad mode and lizard mode
Date: Tue, 18 Feb 2025 15:25:51 -0500
Message-Id: <20250218202619.3592630-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202619.3592630-1-sashal@kernel.org>
References: <20250218202619.3592630-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.15
Content-Transfer-Encoding: 8bit

From: Vicki Pfau <vi@endrift.com>

[ Upstream commit 05c4ede6951b5d8e083b6bb237950cac59bdeb92 ]

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
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-steam.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index bf8b633114be6..749e44dad75f1 100644
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
@@ -1598,7 +1598,7 @@ static void steam_do_deck_input_event(struct steam_device *steam,
 		schedule_delayed_work(&steam->mode_switch, 45 * HZ / 100);
 	}
 
-	if (!steam->gamepad_mode)
+	if (!steam->gamepad_mode && lizard_mode)
 		return;
 
 	lpad_touched = b10 & BIT(3);
@@ -1668,7 +1668,7 @@ static void steam_do_deck_sensors_event(struct steam_device *steam,
 	 */
 	steam->sensor_timestamp_us += 4000;
 
-	if (!steam->gamepad_mode)
+	if (!steam->gamepad_mode && lizard_mode)
 		return;
 
 	input_event(sensors, EV_MSC, MSC_TIMESTAMP, steam->sensor_timestamp_us);
-- 
2.39.5


