Return-Path: <linux-input+bounces-14996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BAB93607
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 23:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A316160985
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 21:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5152831354B;
	Mon, 22 Sep 2025 21:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RvXtD3z+"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243C02F6587;
	Mon, 22 Sep 2025 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758576664; cv=none; b=pOmLg+9p6BPtxRkCmhGE2MWtdr/nZSYHGhJCbmNvTtknRlnqfcSwvONiLZYh5xesd4xRZh55vrUtIsGM/AK3y4gWwQobGVlU/wxoS7FAPCqhqsMo9810Bia1GTX2wyrpB0eAyoSAWzs5DhcWyuxrkA+6dDdPpsjbtXb9RxWdlsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758576664; c=relaxed/simple;
	bh=WvIs+scmNhRFPjzD8+VFafd8InaoaA8XRwVjTYApbHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNtpDtpbEcO8rXVm1rk7aVc55rM7btYVQ4hT+c12DC94DWRygv2PWWQePfwCAyiu7wS2oh1Zl+V+ibjNka2GYGmImjPv2HIEJmUKH6s0UQ8+Zortc/n0kYjrdKfyJ8QFI/DOcPr7b0IC6O3tnd+TtYCbrfxAh/xHx5m9OSr0m6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RvXtD3z+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758576660;
	bh=WvIs+scmNhRFPjzD8+VFafd8InaoaA8XRwVjTYApbHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RvXtD3z+rz1dZOYKsT1rS/tXjlKy1y2EwQJgvOOskDY2Ch4gErUZhJEAxo9uvPkqJ
	 x4dq+5U3OP546JcQG4rzMIXHMWGWjUUhATE47D6Mu8k3Uc4myeB5XAxdDtvPc5y2Th
	 nqWdo6Rs5z90QQN4wdPB49/We/pjpC5aNsh5kU0ws4/wVzyRHo3060U3WOuLt2N5x9
	 xTTqqRo5qBz7yUcnXm97rpH2LPUXl4RA6QGXLQbn2eowykZUp5wbJSB0+h5U4ZdGx1
	 b144ppnbQlxlT496vz3ygp1KA/QQVvs2tA31C0ROio2solWUc3hB55rbLjw6VznYfk
	 3R3ayDeY2VSKQ==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 15B6117E12D4;
	Mon, 22 Sep 2025 23:31:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 23 Sep 2025 00:29:42 +0300
Subject: [PATCH 3/3] HID: playstation: Switch to scoped_guard() in
 {dualsense|dualshock4}_output_worker()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-ps5-hid-fixes-v1-3-4b994c54e512@collabora.com>
References: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
In-Reply-To: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Those functions were initially excepted from using the scoped_guard()
infrastructure as they contain too many long statements, while adding
yet another level of indentation seemed to lower readability without
bringing an immediate benefit.

However, consistency should be more important, hence do the switch and
get rid of the remaining explicit acquires & releases of the spinlocks.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 256 +++++++++++++++++++++---------------------
 1 file changed, 129 insertions(+), 127 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 87038dacebe7bae72621e3a14dfc39693a316782..63f6eb9030d13cb9d0253022a1f1c195676e34e8 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1308,107 +1308,112 @@ static void dualsense_output_worker(struct work_struct *work)
 	struct dualsense *ds = container_of(work, struct dualsense, output_worker);
 	struct dualsense_output_report report;
 	struct dualsense_output_report_common *common;
-	unsigned long flags;
 
 	dualsense_init_output_report(ds, &report, ds->output_report_dmabuf);
 	common = report.common;
 
-	spin_lock_irqsave(&ds->base.lock, flags);
-
-	if (ds->update_rumble) {
-		/* Select classic rumble style haptics and enable it. */
-		common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT;
-		if (ds->use_vibration_v2)
-			common->valid_flag2 |= DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2;
-		else
-			common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
-		common->motor_left = ds->motor_left;
-		common->motor_right = ds->motor_right;
-		ds->update_rumble = false;
-	}
+	scoped_guard(spinlock_irqsave, &ds->base.lock) {
+		if (ds->update_rumble) {
+			/* Select classic rumble style haptics and enable it. */
+			common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT;
+			if (ds->use_vibration_v2)
+				common->valid_flag2 |= DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2;
+			else
+				common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
+			common->motor_left = ds->motor_left;
+			common->motor_right = ds->motor_right;
+			ds->update_rumble = false;
+		}
 
-	if (ds->update_lightbar) {
-		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE;
-		common->lightbar_red = ds->lightbar_red;
-		common->lightbar_green = ds->lightbar_green;
-		common->lightbar_blue = ds->lightbar_blue;
+		if (ds->update_lightbar) {
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE;
+			common->lightbar_red = ds->lightbar_red;
+			common->lightbar_green = ds->lightbar_green;
+			common->lightbar_blue = ds->lightbar_blue;
 
-		ds->update_lightbar = false;
-	}
+			ds->update_lightbar = false;
+		}
 
-	if (ds->update_player_leds) {
-		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
-		common->player_leds = ds->player_leds_state;
+		if (ds->update_player_leds) {
+			common->valid_flag1 |=
+				DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
+			common->player_leds = ds->player_leds_state;
 
-		ds->update_player_leds = false;
-	}
+			ds->update_player_leds = false;
+		}
 
-	if (ds->plugged_state != ds->prev_plugged_state) {
-		u8 val = ds->plugged_state & DS_STATUS1_HP_DETECT;
+		if (ds->plugged_state != ds->prev_plugged_state) {
+			u8 val = ds->plugged_state & DS_STATUS1_HP_DETECT;
 
-		if (val != (ds->prev_plugged_state & DS_STATUS1_HP_DETECT)) {
-			common->valid_flag0 = DS_OUTPUT_VALID_FLAG0_AUDIO_CONTROL_ENABLE;
-			/*
-			 *  _--------> Output path setup in audio_flag0
-			 * /  _------> Headphone (HP) Left channel sink
-			 * | /  _----> Headphone (HP) Right channel sink
-			 * | | /  _--> Internal Speaker (SP) sink
-			 * | | | /
-			 * | | | |     L/R - Left/Right channel source
-			 * 0 L-R X       X - Unrouted (muted) channel source
-			 * 1 L-L X
-			 * 2 L-L R
-			 * 3 X-X R
-			 */
-			if (val) {
-				/* Mute SP and route L+R channels to HP */
-				common->audio_control = 0;
-			} else {
-				/* Mute HP and route R channel to SP */
-				common->audio_control =
-					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS_OUTPUT_PATH_SEL, 0x3);
+			if (val != (ds->prev_plugged_state & DS_STATUS1_HP_DETECT)) {
+				common->valid_flag0 = DS_OUTPUT_VALID_FLAG0_AUDIO_CONTROL_ENABLE;
 				/*
-				 * Set SP hardware volume to 100%.
-				 * Note the accepted range seems to be [0x3d..0x64]
+				 *  _--------> Output path setup in audio_flag0
+				 * /  _------> Headphone (HP) Left channel sink
+				 * | /  _----> Headphone (HP) Right channel sink
+				 * | | /  _--> Internal Speaker (SP) sink
+				 * | | | /
+				 * | | | |     L/R - Left/Right channel source
+				 * 0 L-R X       X - Unrouted (muted) channel source
+				 * 1 L-L X
+				 * 2 L-L R
+				 * 3 X-X R
 				 */
-				common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE;
-				common->speaker_volume = 0x64;
-				/* Set SP preamp gain to +6dB */
-				common->valid_flag1 = DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE;
-				common->audio_control2 =
-					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN, 0x2);
+				if (val) {
+					/* Mute SP and route L+R channels to HP */
+					common->audio_control = 0;
+				} else {
+					/* Mute HP and route R channel to SP */
+					common->audio_control =
+						FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS_OUTPUT_PATH_SEL,
+							   0x3);
+					/*
+					 * Set SP hardware volume to 100%.
+					 * Note the accepted range seems to be [0x3d..0x64]
+					 */
+					common->valid_flag0 |=
+						DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE;
+					common->speaker_volume = 0x64;
+					/* Set SP preamp gain to +6dB */
+					common->valid_flag1 =
+						DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE;
+					common->audio_control2 =
+						FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN,
+							   0x2);
+				}
+
+				input_report_switch(ds->jack, SW_HEADPHONE_INSERT, val);
 			}
 
-			input_report_switch(ds->jack, SW_HEADPHONE_INSERT, val);
+			val = ds->plugged_state & DS_STATUS1_MIC_DETECT;
+			if (val != (ds->prev_plugged_state & DS_STATUS1_MIC_DETECT))
+				input_report_switch(ds->jack, SW_MICROPHONE_INSERT, val);
+
+			input_sync(ds->jack);
+			ds->prev_plugged_state = ds->plugged_state;
 		}
 
-		val = ds->plugged_state & DS_STATUS1_MIC_DETECT;
-		if (val != (ds->prev_plugged_state & DS_STATUS1_MIC_DETECT))
-			input_report_switch(ds->jack, SW_MICROPHONE_INSERT, val);
+		if (ds->update_mic_mute) {
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
+			common->mute_button_led = ds->mic_muted;
 
-		input_sync(ds->jack);
-		ds->prev_plugged_state = ds->plugged_state;
-	}
-
-	if (ds->update_mic_mute) {
-		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
-		common->mute_button_led = ds->mic_muted;
+			if (ds->mic_muted) {
+				/* Disable microphone */
+				common->valid_flag1 |=
+					DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
+				common->power_save_control |= DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+			} else {
+				/* Enable microphone */
+				common->valid_flag1 |=
+					DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
+				common->power_save_control &=
+					~DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+			}
 
-		if (ds->mic_muted) {
-			/* Disable microphone */
-			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
-			common->power_save_control |= DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
-		} else {
-			/* Enable microphone */
-			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
-			common->power_save_control &= ~DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+			ds->update_mic_mute = false;
 		}
-
-		ds->update_mic_mute = false;
 	}
 
-	spin_unlock_irqrestore(&ds->base.lock, flags);
-
 	dualsense_send_output_report(ds, &report);
 }
 
@@ -2264,62 +2269,59 @@ static void dualshock4_output_worker(struct work_struct *work)
 	struct dualshock4 *ds4 = container_of(work, struct dualshock4, output_worker);
 	struct dualshock4_output_report report;
 	struct dualshock4_output_report_common *common;
-	unsigned long flags;
 
 	dualshock4_init_output_report(ds4, &report, ds4->output_report_dmabuf);
 	common = report.common;
 
-	spin_lock_irqsave(&ds4->base.lock, flags);
-
-	/*
-	 * Some 3rd party gamepads expect updates to rumble and lightbar
-	 * together, and setting one may cancel the other.
-	 *
-	 * Let's maximise compatibility by always sending rumble and lightbar
-	 * updates together, even when only one has been scheduled, resulting
-	 * in:
-	 *
-	 *   ds4->valid_flag0 >= 0x03
-	 *
-	 * Hopefully this will maximise compatibility with third-party pads.
-	 *
-	 * Any further update bits, such as 0x04 for lightbar blinking, will
-	 * be or'd on top of this like before.
-	 */
-	if (ds4->update_rumble || ds4->update_lightbar) {
-		ds4->update_rumble = true; /* 0x01 */
-		ds4->update_lightbar = true; /* 0x02 */
-	}
+	scoped_guard(spinlock_irqsave, &ds4->base.lock) {
+		/*
+		 * Some 3rd party gamepads expect updates to rumble and lightbar
+		 * together, and setting one may cancel the other.
+		 *
+		 * Let's maximise compatibility by always sending rumble and lightbar
+		 * updates together, even when only one has been scheduled, resulting
+		 * in:
+		 *
+		 *   ds4->valid_flag0 >= 0x03
+		 *
+		 * Hopefully this will maximise compatibility with third-party pads.
+		 *
+		 * Any further update bits, such as 0x04 for lightbar blinking, will
+		 * be or'd on top of this like before.
+		 */
+		if (ds4->update_rumble || ds4->update_lightbar) {
+			ds4->update_rumble = true; /* 0x01 */
+			ds4->update_lightbar = true; /* 0x02 */
+		}
 
-	if (ds4->update_rumble) {
-		/* Select classic rumble style haptics and enable it. */
-		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_MOTOR;
-		common->motor_left = ds4->motor_left;
-		common->motor_right = ds4->motor_right;
-		ds4->update_rumble = false;
-	}
+		if (ds4->update_rumble) {
+			/* Select classic rumble style haptics and enable it. */
+			common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_MOTOR;
+			common->motor_left = ds4->motor_left;
+			common->motor_right = ds4->motor_right;
+			ds4->update_rumble = false;
+		}
 
-	if (ds4->update_lightbar) {
-		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED;
-		/* Compatible behavior with hid-sony, which used a dummy global LED to
-		 * allow enabling/disabling the lightbar. The global LED maps to
-		 * lightbar_enabled.
-		 */
-		common->lightbar_red = ds4->lightbar_enabled ? ds4->lightbar_red : 0;
-		common->lightbar_green = ds4->lightbar_enabled ? ds4->lightbar_green : 0;
-		common->lightbar_blue = ds4->lightbar_enabled ? ds4->lightbar_blue : 0;
-		ds4->update_lightbar = false;
-	}
+		if (ds4->update_lightbar) {
+			common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED;
+			/* Compatible behavior with hid-sony, which used a dummy global LED to
+			 * allow enabling/disabling the lightbar. The global LED maps to
+			 * lightbar_enabled.
+			 */
+			common->lightbar_red = ds4->lightbar_enabled ? ds4->lightbar_red : 0;
+			common->lightbar_green = ds4->lightbar_enabled ? ds4->lightbar_green : 0;
+			common->lightbar_blue = ds4->lightbar_enabled ? ds4->lightbar_blue : 0;
+			ds4->update_lightbar = false;
+		}
 
-	if (ds4->update_lightbar_blink) {
-		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED_BLINK;
-		common->lightbar_blink_on = ds4->lightbar_blink_on;
-		common->lightbar_blink_off = ds4->lightbar_blink_off;
-		ds4->update_lightbar_blink = false;
+		if (ds4->update_lightbar_blink) {
+			common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED_BLINK;
+			common->lightbar_blink_on = ds4->lightbar_blink_on;
+			common->lightbar_blink_off = ds4->lightbar_blink_off;
+			ds4->update_lightbar_blink = false;
+		}
 	}
 
-	spin_unlock_irqrestore(&ds4->base.lock, flags);
-
 	/* Bluetooth packets need additional flags as well as a CRC in the last 4 bytes. */
 	if (report.bt) {
 		u32 crc;

-- 
2.51.0


