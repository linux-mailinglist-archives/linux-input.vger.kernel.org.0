Return-Path: <linux-input+bounces-4373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44866909E9F
	for <lists+linux-input@lfdr.de>; Sun, 16 Jun 2024 18:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B763E1F211B1
	for <lists+linux-input@lfdr.de>; Sun, 16 Jun 2024 16:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3CC1BC57;
	Sun, 16 Jun 2024 16:40:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033012B87;
	Sun, 16 Jun 2024 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718556025; cv=none; b=PhpsOtNYdtO09PMP9onq020XPsy+tBtfJQD2xlZTA7kK/01tmwdepWcYQmZW/Rlxvc98VznmJVb+o+o6theHMV4QLjr/aUCKYwnAocS491Omn1qgbZS6Tajn3d9lM9uQbSV4lsWg3gZyBMgoG3SO77L2jETF8ctZShKaDV7cqUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718556025; c=relaxed/simple;
	bh=vE0MV0w/SvFtkLPjjo6OLBeSwyoJVF2VeTLOljvFEoM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cwwJKhOAWaqgbuq5u/UXGheYaBdruNQ8h/FdgLDFN81dtvkZ2F7l/Un3I5+04AvoiucbJVsc8sUV5tw8I4iZTosp4mBlUvBywjpfQj8hRDYq4MSkJS1jfTRDsvMN8Hk8hjZl0vUQxYjQJf3YbbD6TBZj+qZ8VQe4ZTYH0NkqbKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id B4C271014D6;
	Sun, 16 Jun 2024 16:31:10 +0000 (UTC)
From: Max Staudt <max@enpas.org>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	max@enpas.org
Subject: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar together
Date: Mon, 17 Jun 2024 01:30:55 +0900
Message-Id: <20240616163055.75174-1-max@enpas.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some 3rd party gamepads expect updates to rumble and lightbar together,
and setting one may cancel the other.

This patch maximises compatibility by always sending rumble and lightbar
updates whenever updates are sent to the gamepad: valid_flag0 is always
>= 0x03.

Further background reading:

- Apparently the PS4 always sends rumble and lightbar updates together:

  https://eleccelerator.com/wiki/index.php?title=DualShock_4#0x11_2

- 3rd party gamepads may not implement lightbar_blink, and may simply
  ignore updates with 0x07 set, according to:

  https://github.com/Ryochan7/DS4Windows/pull/1839

This patch leaves the lightbar blink feature as-is: Likely, most users
are unaware that it exists, hence it's unlikely that a packet with
0x07 set will even be sent in practice. Let's leave the function there,
so users of first-party gamepads can continue to use it.
---
 drivers/hid/hid-playstation.c | 55 ++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index e7c309cfe3a0..986a4ca8b664 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -387,12 +387,10 @@ struct dualshock4 {
 	bool update_bt_poll_interval;
 	uint8_t bt_poll_interval;
 
-	bool update_rumble;
 	uint8_t motor_left;
 	uint8_t motor_right;
 
 	/* Lightbar leds */
-	bool update_lightbar;
 	bool update_lightbar_blink;
 	bool lightbar_enabled; /* For use by global LED control. */
 	uint8_t lightbar_red;
@@ -2092,8 +2090,6 @@ static int dualshock4_led_set_brightness(struct led_classdev *led, enum led_brig
 		}
 	}
 
-	ds4->update_lightbar = true;
-
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 
 	dualshock4_schedule_work(ds4);
@@ -2143,26 +2139,39 @@ static void dualshock4_output_worker(struct work_struct *work)
 
 	spin_lock_irqsave(&ds4->base.lock, flags);
 
-	if (ds4->update_rumble) {
-		/* Select classic rumble style haptics and enable it. */
-		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_MOTOR;
-		common->motor_left = ds4->motor_left;
-		common->motor_right = ds4->motor_right;
-		ds4->update_rumble = false;
-	}
+	/*
+	 * PS4 seems to send 0xf3 updates by default, according to a HCI trace:
+	 *   https://eleccelerator.com/wiki/index.php?title=DualShock_4#0x11_2
+	 *
+	 * This seems to be a very compatible value with third-party pads:
+	 *   https://github.com/Ryochan7/DS4Windows/pull/1839
+	 *
+	 * However, hid-playstation in v6.10 does not set the upper nibble,
+	 * and neither does hid-sony in v6.2, or BlueRetro. We should stick
+	 * to that for now, to minimise the chance of unexpected changes.
+	 *
+	 * So let's always update rumble and lightbar at the same time, with
+	 * the upper nibble cleared, resulting in valid_flag0 == 0x03.
+	 * Hopefully this will maximise compatibility with third-party pads.
+	 */
+	common->valid_flag0 = DS4_OUTPUT_VALID_FLAG0_MOTOR |
+			      DS4_OUTPUT_VALID_FLAG0_LED;
 
-	if (ds4->update_lightbar) {
-		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED;
-		/* Comptabile behavior with hid-sony, which used a dummy global LED to
-		 * allow enabling/disabling the lightbar. The global LED maps to
-		 * lightbar_enabled.
-		 */
-		common->lightbar_red = ds4->lightbar_enabled ? ds4->lightbar_red : 0;
-		common->lightbar_green = ds4->lightbar_enabled ? ds4->lightbar_green : 0;
-		common->lightbar_blue = ds4->lightbar_enabled ? ds4->lightbar_blue : 0;
-		ds4->update_lightbar = false;
-	}
+	common->motor_left = ds4->motor_left;
+	common->motor_right = ds4->motor_right;
+
+	/* Compatible behavior with hid-sony, which used a dummy global LED to
+	 * allow enabling/disabling the lightbar. The global LED maps to
+	 * lightbar_enabled.
+	 */
+	common->lightbar_red = ds4->lightbar_enabled ? ds4->lightbar_red : 0;
+	common->lightbar_green = ds4->lightbar_enabled ? ds4->lightbar_green : 0;
+	common->lightbar_blue = ds4->lightbar_enabled ? ds4->lightbar_blue : 0;
 
+	/*
+	 * Output reports updating lightbar_blink will simply be ignored
+	 * by incompatible controllers, since valid_flag0 == 0x07.
+	 */
 	if (ds4->update_lightbar_blink) {
 		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED_BLINK;
 		common->lightbar_blink_on = ds4->lightbar_blink_on;
@@ -2459,7 +2468,6 @@ static int dualshock4_play_effect(struct input_dev *dev, void *data, struct ff_e
 		return 0;
 
 	spin_lock_irqsave(&ds4->base.lock, flags);
-	ds4->update_rumble = true;
 	ds4->motor_left = effect->u.rumble.strong_magnitude / 256;
 	ds4->motor_right = effect->u.rumble.weak_magnitude / 256;
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
@@ -2520,7 +2528,6 @@ static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4)
 	ds4->lightbar_green = player_colors[player_id][1];
 	ds4->lightbar_blue = player_colors[player_id][2];
 
-	ds4->update_lightbar = true;
 	dualshock4_schedule_work(ds4);
 }
 
-- 
2.39.2


