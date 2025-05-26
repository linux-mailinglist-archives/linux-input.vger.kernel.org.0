Return-Path: <linux-input+bounces-12581-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA5AC3FB1
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E369D1899969
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9B2213240;
	Mon, 26 May 2025 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GwSWUDoB"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D43420E71E;
	Mon, 26 May 2025 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263924; cv=none; b=sKQMkoikRKe4W8/Ea2HVvLvrmTAg5I/SJbMQ/mn3gMS+lEWhfdAZpuJB8qqfVhnUPF/tFTIbEz6OnTYQ/TGF1Nqh2RmYB4RdZpdl0eBnCUIlkWBTGlN28xwgM3CmaGreO702HeclWHLgj5zWlyQCfzI7W72ksV56iBDi88pYo3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263924; c=relaxed/simple;
	bh=BWxg4QBBCWe84x/hE6Kl/tMHr9mDWi/BNW2BMWynlnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilrHoOrg5rHQOGDZfEb4yKaYXtnWNeSEch1+z7J5hTUniTYGnWxR9KYRxoCj26XkheA6VcmVR9diQ1oqxFtsQ/OKTmY87AF3T3wcCzQJC5aEocGJrls7ZxGr1tr+D33sitExg12oG91afGhaF3EAuTt9ZJnmlZePqyq8tkTtevg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GwSWUDoB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263920;
	bh=BWxg4QBBCWe84x/hE6Kl/tMHr9mDWi/BNW2BMWynlnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GwSWUDoBovBTGWfC4y9IJQQjvhYlgU31ARH+xsMcB02AoZuw5UowQPqZ7uj/4QDf/
	 8xqAE9Jp8rln1LJyF3G3FyF6W5MCOs2BLyUdYqSyi1o8v8MwS3nnc49Jzon1hcUbU3
	 Fo+h57JL1jZ79ebDuyGHstRGNuofMCZ16r8r0MNb2VJWhvUnXX5O4yga8oLUs2NGlI
	 Uc7T4J+I7E7Y4ZUe/WFOZ/XVrPvEAU0EFUxC5hwYVXyxBmrjE8w7TKgxBw/caZsUoS
	 mIqhAO4Lo6IWlz548Gok8zCt1G6ysJ2gUWoU3MhBtxDVecN2oxmNW+r8EzocLyWSfA
	 BvGa5ATpJpqFA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 8A07517E36C1;
	Mon, 26 May 2025 14:52:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:33 +0300
Subject: [PATCH 10/11] HID: playstation: Support DualSense audio jack
 hotplug detection
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-10-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
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
 drivers/hid/hid-playstation.c | 86 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index b7777d3230b2fe277a4a2217ef6b1eff9cfad182..ed8e67c5bf5d3a9e9721da31a6bd84f0b6802b14 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -117,6 +117,12 @@ struct ps_led_info {
 #define DS_STATUS_BATTERY_CHARGING		GENMASK(7, 4)
 #define DS_STATUS_BATTERY_CHARGING_SHIFT	4
 
+/* Plugged status field of DualSense input report. */
+#define DS_STATUS_PLUGGED_HEADPHONES		BIT(0)
+#define DS_STATUS_PLUGGED_MIC			BIT(1)
+#define DS_STATUS_PLUGGED_JACK			(DS_STATUS_PLUGGED_HEADPHONES | \
+						 DS_STATUS_PLUGGED_MIC)
+
 /* Feature version from DualSense Firmware Info report. */
 #define DS_FEATURE_VERSION_MINOR		GENMASK(7, 0)
 #define DS_FEATURE_VERSION_MAJOR		GENMASK(15, 8)
@@ -144,13 +150,18 @@ struct ps_led_info {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION		BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT			BIT(1)
+#define DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE		BIT(5)
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
 
@@ -193,6 +204,11 @@ struct dualsense {
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
@@ -237,7 +253,8 @@ struct dualsense_input_report {
 
 	u8 reserved3[12];
 	u8 status_battery;
-	u8 reserved4[10];
+	u8 status_plugged;
+	u8 reserved4[9];
 } __packed;
 /* Common input report size shared equals the size of the USB report minus 1 byte for ReportID. */
 static_assert(sizeof(struct dualsense_input_report) == DS_INPUT_REPORT_USB_SIZE - 1);
@@ -252,11 +269,15 @@ struct dualsense_output_report_common {
 	u8 motor_left;
 
 	/* Audio controls */
-	u8 reserved[4];
+	u8 headphone_audio_volume;		/* 0-0x7f */
+	u8 speaker_audio_volume;		/* 0-0xff */
+	u8 internal_microphone_volume;	/* 0-0x40 */
+	u8 audio_flags;
 	u8 mute_button_led;
 
 	u8 power_save_control;
-	u8 reserved2[28];
+	u8 reserved2[27];
+	u8 audio_flags2;
 
 	/* LEDs and lightbar */
 	u8 valid_flag2;
@@ -1304,6 +1325,46 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_player_leds = false;
 	}
 
+	if (ds->plugged_state != ds->prev_plugged_state) {
+		u8 val = ds->plugged_state & DS_STATUS_PLUGGED_HEADPHONES;
+
+		if (val != (ds->prev_plugged_state & DS_STATUS_PLUGGED_HEADPHONES)) {
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
+				common->audio_flags = 0;
+			} else {
+				/* Mute HP and route R channel to SP */
+				common->audio_flags =
+					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS_OUTPUT_PATH_SEL, 0x3);
+				/*
+				 * Set SP hardware volume to 100%.
+				 * Note the accepted range seems to be [0x3d..0x64]
+				 */
+				common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE;
+				common->speaker_audio_volume = 0x64;
+				/* Set SP preamp gain to ~30% */
+				common->valid_flag1 = DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE;
+				common->audio_flags2 =
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
@@ -1407,6 +1468,25 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	}
 	ds->last_btn_mic_state = btn_mic_state;
 
+	/* Parse HP/MIC plugged state data */
+	value = ds_report->status_plugged & DS_STATUS_PLUGGED_JACK;
+	if (!ds->prev_plugged_state_valid) {
+		/* Initial handling of the plugged state report */
+		scoped_guard(spinlock_irqsave, &ps_dev->lock) {
+			ds->plugged_state = (~value) & DS_STATUS_PLUGGED_JACK;
+			ds->prev_plugged_state_valid = true;
+		}
+	}
+	if (value != ds->plugged_state) {
+		scoped_guard(spinlock_irqsave, &ps_dev->lock) {
+			ds->prev_plugged_state = ds->plugged_state;
+			ds->plugged_state = value;
+		}
+
+		/* Schedule audio routing towards active endpoint. */
+		dualsense_schedule_work(ds);
+	}
+
 	/* Parse and calibrate gyroscope data. */
 	for (i = 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
 		int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);

-- 
2.49.0


