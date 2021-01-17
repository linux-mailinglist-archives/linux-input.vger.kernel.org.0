Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD672F9624
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 00:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730647AbhAQXLr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Jan 2021 18:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730649AbhAQXLg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Jan 2021 18:11:36 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951D7C061793
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:12 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id be12so7631523plb.4
        for <linux-input@vger.kernel.org>; Sun, 17 Jan 2021 15:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MGzvJoR8AbKsQApEJXykdhjDra9WZV2DkPpDn5El2Uc=;
        b=UKDS+9bv9oyLZ9UJLjmpA5DcC1bfbxzxFLWtgAL48Rhc1JmUvW/h4/28ivZXz9gP3+
         8nMFLPnpntunrwKLooFaGjfg7HVAEbruzsVoS6HwU0cSSJmtseD/YRKWGyXZkdjgVn4j
         BVuohl30l5qKoD+tNz2XUvhQViwceDACgKRISUdoTQ6ajmU4gTDJqO2Wjaxq9uPtrP71
         X/p4HVITaXjJ//P3+2VoLnCXRq0cnrVxuj2FlAYVsqEsN7eF31LVHXmoFOI9DBmUYgpn
         E5JTfekU5GWO8rawTBkR0t1TcIESqRTySj+62OPgUN61ywafHQHdkwWKSacIuTajGptN
         8/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGzvJoR8AbKsQApEJXykdhjDra9WZV2DkPpDn5El2Uc=;
        b=sa2VzzxFxT4zDL8/97cTzdteXohdIJ2Ou819d/l6m9R7nrDTxu0st93+9uLY1pjtqS
         ohvXyD0iIm30Hgb/GiW8zzLLPRkR+i0voDIKv55licr0oYgrxIO+2pGYdCY11gHEQXpl
         HVaQ3AR/giUlAmEtwLKYfwRsotQRLJudgb07YOWq2kB7vqWzs8HFnfwskIJF0Mj9tlDV
         8vUcxR6eqRGxZ/+eXGk/htaEHU4VkuQdgt4QUHTd9u0UYGQ3C+iDLPvdT6i0358nIxUh
         iyPdX8W1pF2tZ1cV9FOp/C8UB+0UDaUvZyoUmWsx0O/D5PPJ+almCW9uaOyFwd7UWOL3
         3iuA==
X-Gm-Message-State: AOAM531yVMksiEkflZ3jNbWTymG6sGk1bgzL7ktdpLJI3+XIAQO/LBh1
        X787hAzLxavk0A0S/urqrLuHsg==
X-Google-Smtp-Source: ABdhPJzpjOHc16q9PNTuZAk1Ypca2n/fAIZuAPsaIASIW0h9nuD+qwq6guY/fZYTISGVBPf3wgRZsg==
X-Received: by 2002:a17:902:bc41:b029:de:1ec2:dac1 with SMTP id t1-20020a170902bc41b02900de1ec2dac1mr23903456plz.9.1610925012208;
        Sun, 17 Jan 2021 15:10:12 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id g3sm14018746pjt.34.2021.01.17.15.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 15:10:11 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 10/12] HID: playstation: add DualSense player LEDs support.
Date:   Sun, 17 Jan 2021 15:09:54 -0800
Message-Id: <20210117230956.173031-11-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117230956.173031-1-roderick@gaikai.com>
References: <20210117230956.173031-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense features 5 player LEDs below its touchpad, which are
meant as player id indications. This patch exposes the player LEDs
as individual LEDs.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 60 ++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 58a34959fa2f..0c2c7f7b1072 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -112,6 +112,7 @@ struct ps_led_info {
 #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
+#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
@@ -157,6 +158,11 @@ struct dualsense {
 	bool last_btn_mic_state;
 	struct led_classdev mute_led;
 
+	/* Player leds */
+	bool update_player_leds;
+	uint8_t player_leds_state;
+	struct led_classdev player_leds[5];
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -766,6 +772,35 @@ static void dualsense_mute_led_set_brightness(struct led_classdev *led, enum led
 
 }
 
+static enum led_brightness dualsense_player_led_get_brightness(struct led_classdev *led)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+
+	return !!(ds->player_leds_state & BIT(led - ds->player_leds));
+}
+
+static void dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+	unsigned long flags;
+	unsigned int led_index;
+
+	spin_lock_irqsave(&ds->base.lock, flags);
+
+	led_index = led - ds->player_leds;
+	if (value == LED_OFF)
+		ds->player_leds_state &= ~(1 << led_index);
+	else
+		ds->player_leds_state |= (1 << led_index);
+
+	ds->update_player_leds = true;
+	spin_unlock_irqrestore(&ds->base.lock, flags);
+
+	schedule_work(&ds->output_worker);
+}
+
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -858,6 +893,13 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
+	if (ds->update_player_leds) {
+		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
+		common->player_leds = ds->player_leds_state;
+
+		ds->update_player_leds = false;
+	}
+
 	if (ds->update_mic_mute) {
 		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
 		common->mute_button_led = ds->mic_muted;
@@ -1107,12 +1149,20 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	struct dualsense *ds;
 	struct ps_device *ps_dev;
 	uint8_t max_output_report_size;
-	int ret;
+	int i, ret;
 
 	static const struct ps_led_info mute_led_info = {
 		"micmute", dualsense_mute_led_get_brightness, dualsense_mute_led_set_brightness
 	};
 
+	static const struct ps_led_info player_leds_info[] = {
+		{ "led1", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
+		{ "led2", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
+		{ "led3", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
+		{ "led4", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness },
+		{ "led5", dualsense_player_led_get_brightness, dualsense_player_led_set_brightness }
+	};
+
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
 	if (!ds)
 		return ERR_PTR(-ENOMEM);
@@ -1194,6 +1244,14 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	for (i = 0; i < ARRAY_SIZE(player_leds_info); i++) {
+		const struct ps_led_info *led_info = &player_leds_info[i];
+
+		ret = ps_led_register(ps_dev, &ds->player_leds[i], led_info);
+		if (ret < 0)
+			goto err;
+	}
+
 	return &ds->base;
 
 err:
-- 
2.26.2

