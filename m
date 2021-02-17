Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C955031DE69
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbhBQRgR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59911 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234544AbhBQReC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583155;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZqUM20Jnpq/LUhZZfBQ2FAbfuIXf/VVhp2IoFI1zVAE=;
        b=gQdD0iBI5OjCHXKfTVvIhD2+1CUxFdArU4VslN5vxZcVDHAxMyaH5qVk3zLVOx/zCXLkNA
        UT7LvZC/iLIlaaDMVYMSioX2rxgseAxEi8QGpypsyEarNJw9oTtyXDr/Tu6ANuEbectkQX
        Ym+DUdZmwmYOzIdF0mJW577Ic02IK/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-Sa7LZTvfNCm7EfEkhmSyjg-1; Wed, 17 Feb 2021 12:32:31 -0500
X-MC-Unique: Sa7LZTvfNCm7EfEkhmSyjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9C051020C20;
        Wed, 17 Feb 2021 17:32:29 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 45E5060C61;
        Wed, 17 Feb 2021 17:32:28 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 10/11] HID: playstation: add microphone mute support for DualSense.
Date:   Wed, 17 Feb 2021 18:31:57 +0100
Message-Id: <20210217173158.3122868-11-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense controller has a built-in microphone exposed as an
audio device over USB (or HID using Bluetooth). A dedicated
button on the controller handles mute, but software has to configure
the device to mute the audio stream.

This patch captures the mute button and schedules an output report
to mute/unmute the audio stream as well as toggle the mute LED.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Reviewed-by: Barnabás Pőcze <pobrn@protonmail.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-playstation.c | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index b141b1be6453..04743fa0e03d 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -85,6 +85,7 @@ struct ps_calibration_data {
 #define DS_BUTTONS1_R3		BIT(7)
 #define DS_BUTTONS2_PS_HOME	BIT(0)
 #define DS_BUTTONS2_TOUCHPAD	BIT(1)
+#define DS_BUTTONS2_MIC_MUTE	BIT(2)
 
 /* Status field of DualSense input report. */
 #define DS_STATUS_BATTERY_CAPACITY	GENMASK(3, 0)
@@ -103,9 +104,12 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE BIT(0)
+#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
+#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
 /* DualSense hardware limits */
@@ -142,6 +146,11 @@ struct dualsense {
 	uint8_t lightbar_green;
 	uint8_t lightbar_blue;
 
+	/* Microphone */
+	bool update_mic_mute;
+	bool mic_muted;
+	bool last_btn_mic_state;
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -815,6 +824,23 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
+	if (ds->update_mic_mute) {
+		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
+		common->mute_button_led = ds->mic_muted;
+
+		if (ds->mic_muted) {
+			/* Disable microphone */
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
+			common->power_save_control |= DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+		} else {
+			/* Enable microphone */
+			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE;
+			common->power_save_control &= ~DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE;
+		}
+
+		ds->update_mic_mute = false;
+	}
+
 	spin_unlock_irqrestore(&ds->base.lock, flags);
 
 	dualsense_send_output_report(ds, &report);
@@ -829,6 +855,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	uint8_t battery_data, battery_capacity, charging_status, value;
 	int battery_status;
 	uint32_t sensor_timestamp;
+	bool btn_mic_state;
 	unsigned long flags;
 	int i;
 
@@ -884,6 +911,23 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
 	input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
 	input_sync(ds->gamepad);
 
+	/*
+	 * The DualSense has an internal microphone, which can be muted through a mute button
+	 * on the device. The driver is expected to read the button state and program the device
+	 * to mute/unmute audio at the hardware level.
+	 */
+	btn_mic_state = !!(ds_report->buttons[2] & DS_BUTTONS2_MIC_MUTE);
+	if (btn_mic_state && !ds->last_btn_mic_state) {
+		spin_lock_irqsave(&ps_dev->lock, flags);
+		ds->update_mic_mute = true;
+		ds->mic_muted = !ds->mic_muted; /* toggle */
+		spin_unlock_irqrestore(&ps_dev->lock, flags);
+
+		/* Schedule updating of microphone state at hardware level. */
+		schedule_work(&ds->output_worker);
+	}
+	ds->last_btn_mic_state = btn_mic_state;
+
 	/* Parse and calibrate gyroscope data. */
 	for (i = 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
 		int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);
-- 
2.29.2

