Return-Path: <linux-input+bounces-13026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DDAE71E0
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DEBC189AE25
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA4725D1F0;
	Tue, 24 Jun 2025 21:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QE4g8waB"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA325B31A;
	Tue, 24 Jun 2025 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802278; cv=none; b=fCgRZggufE9qIx0gbix2XSz2Vz1lc4bqMmS7KPxVySA+2NKIyMGXGcMeEFifwn5akjPbTkY7bHjqqc6Tu+6OXsZyKB3J7er82cBnSR4RiPWS2QE4s3m0JVdMlIlbSN680BewWCICGfFrAR6Ul1oOr2lv96olV0wA7XbJGqBMcrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802278; c=relaxed/simple;
	bh=dPWgYoZkxeThgoQi0shU+b5pVrC0trt1SLeMICTeLEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4a4IYn9ewmkpngweftvoAp2rFmdzsQtHhXd5dPNCDx2PFBNS0aAAOmTRXbgOnFn5sa+F16UOjSV3jjWTJG/bQP++HzNI9iWC/sKJc3Sn8pQ0KPk9EFXsBp20LpIgsk+h8sjuVf/phh1jhIQTxMNx6yjEskrK94eMb+bX+A7uEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QE4g8waB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802274;
	bh=dPWgYoZkxeThgoQi0shU+b5pVrC0trt1SLeMICTeLEI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QE4g8waBN1mSfyVuDl7GhZGJlJTjEmOMkAXKlPEqHe/5BxCqtkxryNp/9R3uPMB5Q
	 +/jiH9kFuXXY7DZCULwnkbE/eJfxC8JAbRQzaGiy+CMmH+IFsFF7bJG61lOc1VohjO
	 3IpHqomotCBRGdg93D5v9nrQXHTzdQZKlFG+RxOE6EqTXSzVM7HcpmqobzHmoaX4tI
	 jQOuil0WvIEqXeT3Mhzog0snEcpNixxhdgw4Q9027WCIk8/4Egw4moup3rjG+1s1dE
	 nqWCHsoccoFbieanV7PCQd6dt4os9EdWCeOqtbNNLOfb9jg+B5pjcN2zgK1dlwva4D
	 tWb+kDJL6oAIw==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 5817617E0DB9;
	Tue, 24 Jun 2025 23:57:54 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Jun 2025 00:56:54 +0300
Subject: [PATCH v2 10/11] HID: playstation: Support DualSense audio jack
 hotplug detection
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dualsense-hid-jack-v2-10-596c0db14128@collabora.com>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The default audio output path on DualSense controller hardware is set to
headphones, regardless of whether they are actually inserted or not.

Detect when the plugged state of the 3.5mm audio jack changes and toggle
audio output between headphones and internal speaker, as required.  The
latter is achieved by essentially routing the right channel of the audio
source to the mono speaker.

Additionally, adjust the speaker volume since its default level is too
low and, therefore, cannot generate any audible sound.

It's worth noting the audio functionality is currently not supported for
Bluetooth, hence it's limited to USB connectivity.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 91 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index f523ca989a2f1d085a460c4e05db00599d19492d..4285260c7e22bc4097bc755f31a968f57ba16db8 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -112,9 +112,13 @@ struct ps_led_info {
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
 #define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
-/* Battery status field of DualSense input report. */
+/* Status fields of DualSense input report. */
 #define DS_STATUS0_BATTERY_CAPACITY		GENMASK(3, 0)
 #define DS_STATUS0_CHARGING			GENMASK(7, 4)
+#define DS_STATUS1_HP_DETECT			BIT(0)
+#define DS_STATUS1_MIC_DETECT			BIT(1)
+#define DS_STATUS1_JACK_DETECT			(DS_STATUS1_HP_DETECT | DS_STATUS1_MIC_DETECT)
+#define DS_STATUS1_MIC_MUTE			BIT(2)
 
 /* Feature version from DualSense Firmware Info report. */
 #define DS_FEATURE_VERSION_MINOR		GENMASK(7, 0)
@@ -143,13 +147,19 @@ struct ps_led_info {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION		BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT			BIT(1)
+#define DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE		BIT(5)
+#define DS_OUTPUT_VALID_FLAG0_MIC_VOLUME_ENABLE			BIT(6)
+#define DS_OUTPUT_VALID_FLAG0_AUDIO_CONTROL_ENABLE		BIT(7)
 #define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE	BIT(0)
 #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE		BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE		BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS			BIT(3)
 #define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE	BIT(4)
+#define DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE		BIT(7)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE	BIT(1)
 #define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2		BIT(2)
+#define DS_OUTPUT_AUDIO_FLAGS_OUTPUT_PATH_SEL			GENMASK(5, 4)
+#define DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN			GENMASK(2, 0)
 #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE			BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT			BIT(1)
 
@@ -192,6 +202,11 @@ struct dualsense {
 	u8 lightbar_green;
 	u8 lightbar_blue;
 
+	/* Audio Jack plugged state */
+	u8 plugged_state;
+	u8 prev_plugged_state;
+	bool prev_plugged_state_valid;
+
 	/* Microphone */
 	bool update_mic_mute;
 	bool mic_muted;
@@ -251,11 +266,15 @@ struct dualsense_output_report_common {
 	u8 motor_left;
 
 	/* Audio controls */
-	u8 reserved[4];
+	u8 headphone_volume;	/* 0x0 - 0x7f */
+	u8 speaker_volume;	/* 0x0 - 0xff */
+	u8 mic_volume;		/* 0x0 - 0x40 */
+	u8 audio_control;
 	u8 mute_button_led;
 
 	u8 power_save_control;
-	u8 reserved2[28];
+	u8 reserved2[27];
+	u8 audio_control2;
 
 	/* LEDs and lightbar */
 	u8 valid_flag2;
@@ -1303,6 +1322,46 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_player_leds = false;
 	}
 
+	if (ds->plugged_state != ds->prev_plugged_state) {
+		u8 val = ds->plugged_state & DS_STATUS1_HP_DETECT;
+
+		if (val != (ds->prev_plugged_state & DS_STATUS1_HP_DETECT)) {
+			common->valid_flag0 = DS_OUTPUT_VALID_FLAG0_AUDIO_CONTROL_ENABLE;
+			/*
+			 *  _--------> Output path setup in audio_flag0
+			 * /  _------> Headphone (HP) Left channel sink
+			 * | /  _----> Headphone (HP) Right channel sink
+			 * | | /  _--> Internal Speaker (SP) sink
+			 * | | | /
+			 * | | | |     L/R - Left/Right channel source
+			 * 0 L-R X       X - Unrouted (muted) channel source
+			 * 1 L-L X
+			 * 2 L-L R
+			 * 3 X-X R
+			 */
+			if (val) {
+				/* Mute SP and route L+R channels to HP */
+				common->audio_control = 0;
+			} else {
+				/* Mute HP and route R channel to SP */
+				common->audio_control =
+					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS_OUTPUT_PATH_SEL, 0x3);
+				/*
+				 * Set SP hardware volume to 100%.
+				 * Note the accepted range seems to be [0x3d..0x64]
+				 */
+				common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE;
+				common->speaker_volume = 0x64;
+				/* Set SP preamp gain to ~30% */
+				common->valid_flag1 = DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE;
+				common->audio_control2 =
+					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN, 0x2);
+			}
+		}
+
+		ds->prev_plugged_state = ds->plugged_state;
+	}
+
 	if (ds->update_mic_mute) {
 		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
 		common->mute_button_led = ds->mic_muted;
@@ -1406,6 +1465,32 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	}
 	ds->last_btn_mic_state = btn_mic_state;
 
+	/*
+	 * Parse HP/MIC plugged state data for USB use case, since Bluetooth
+	 * audio is currently not supported.
+	 */
+	if (hdev->bus == BUS_USB) {
+		value = ds_report->status[1] & DS_STATUS1_JACK_DETECT;
+
+		if (!ds->prev_plugged_state_valid) {
+			/* Initial handling of the plugged state report */
+			scoped_guard(spinlock_irqsave, &ps_dev->lock) {
+				ds->plugged_state = (~value) & DS_STATUS1_JACK_DETECT;
+				ds->prev_plugged_state_valid = true;
+			}
+		}
+
+		if (value != ds->plugged_state) {
+			scoped_guard(spinlock_irqsave, &ps_dev->lock) {
+				ds->prev_plugged_state = ds->plugged_state;
+				ds->plugged_state = value;
+			}
+
+			/* Schedule audio routing towards active endpoint. */
+			dualsense_schedule_work(ds);
+		}
+	}
+
 	/* Parse and calibrate gyroscope data. */
 	for (i = 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
 		int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);

-- 
2.49.0


