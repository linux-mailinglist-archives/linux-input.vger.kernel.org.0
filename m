Return-Path: <linux-input+bounces-10121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6FAA3A8C5
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87211174DB0
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8831D7E5C;
	Tue, 18 Feb 2025 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0AJdCpo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8431D7E41;
	Tue, 18 Feb 2025 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910310; cv=none; b=Li6LnhLK9WESFZAHsdqcjTveJSQ5Iv8kJGpQyvWrs3mvvN+gAhMaPSA7HPcUKz/V6s5wCAVVWbIYFkNGwsU6jqQQlGhVwdWL+k7t6wJnTazE8K4/q/igB7as2/LZOdJPmc0347Dei+k3u26QzPngQhbLfJ2elo0OfswJRawm0Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910310; c=relaxed/simple;
	bh=5M/ddZDQ08lU6ounbfLagPxU3NzsYSK02sQGKQJmEuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hQeXEXRpYuybHlh32yeRdiI8Dqe345Po39NJ7NtbNmDrzbwse1d7IV5IZ7v7ocfjeiQIvimLv32JNrGSyeJU30I45jLMMEcT3TL2vpW2g3lj7AwRPgpwNp79AunVS4vT1CtPESyKSJ5BG6DKkxeoPALf5hWI1Vt+CJwrKsF6Zx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0AJdCpo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B0EC4CEE2;
	Tue, 18 Feb 2025 20:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910309;
	bh=5M/ddZDQ08lU6ounbfLagPxU3NzsYSK02sQGKQJmEuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M0AJdCpofWvdlgVWEh1vd1zJFMxVbhP5Rh+1iNAWq1M7k/I2jqZB57na34fP34O1P
	 XopxG6tKwQNO48Mg/+uoBmfJIHJaHVwJAFRu0b98xZmrac5lV9gxPgrLz23UaM//aQ
	 +IwKVsz/lQp8bp+qe0anpb3jxQ0YogSUfmHIIchlRbw92AQFhlKaXC70qcgcp9kZwl
	 tZhdgzPnPUqSQPthDSskBIanwRf4hUzMzw2AL4ipojy6/Zd3bFordnS8jaVP0mND3a
	 PaUO3BWa1qJEa1CqxajhL9OajYJoB12J2spOMqzpYAGUl09lPc5USErrIVxd9scjkK
	 Fu/HSIpQH54Ow==
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
Subject: [PATCH AUTOSEL 6.13 05/31] HID: hid-steam: Fix issues with disabling both gamepad mode and lizard mode
Date: Tue, 18 Feb 2025 15:24:25 -0500
Message-Id: <20250218202455.3592096-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
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
index 6439913372a8a..e09734957921e 100644
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


