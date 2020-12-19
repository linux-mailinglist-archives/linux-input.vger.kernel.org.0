Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F242DED7D
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 07:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgLSGZE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 01:25:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgLSGZE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 01:25:04 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9851C0611CE
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:51 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id r4so2566209pls.11
        for <linux-input@vger.kernel.org>; Fri, 18 Dec 2020 22:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZUKL/13xV95cM1sWntWj1MR3ONIRKenw+TMjqyz+9o4=;
        b=VQ41VQxxIVpToT4lCdawRvkIv/pSd1r+Lz7G5T8Ad/yjYYDCvVgHq7H8zTseohIPLb
         bov+bG1cF4azenMJgGpQX7nJxSWA9xflMI9TXNfCeajS5M+MmMX54Dd8bh3rLHvaxrp6
         3oaR1XaZ1OWoEqoEgxBLfsvPbLMmz8Lwg8TqC3GunEJASAyJnyXf2ZOWnngjAbRUlnPL
         JsnmjudS3bt4o3Cw45HjxFh2wL66s6cMH+HDSJ7kaHfOvf/sWm65x+RWwJ5Rwdnf+98h
         eVJtqfzDvp9JEeW5IaoV/lHci4gAWuH/21d1NQ3OVsUd/u9UJL9SHcO9chZdOMP7/6n2
         pa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZUKL/13xV95cM1sWntWj1MR3ONIRKenw+TMjqyz+9o4=;
        b=U4Nrdfbo7SdhHEPBC6zeiOOvSs6U4fHrNq15DsrFLO+Fan9u77/W7sI7EwATjMcT3d
         XLJ9qF7B4Xbi13KA4RyfzC9MjNDeMtzTfQSGQ64Zw+xq2zy+b0ir8dajs2V7114zyZ7R
         kSYFlZs0zfaeo8vdesBNJIiQOT/btA+0XqC+m0fPtXPHWIEg5mOwk/wBRSEOmoaaybye
         hFcZD0f0p8p1dGhInxkJMsSrz3zVRCpR+VGCZeI+Mqnbc5Ybk3ssSvPc8mnjxGqbbJJE
         puEkOdAY3mAWBZm3dr+4uNQO4rv13RYClfU/OhoB2+P8JA56LU7hnfEYQ1PjLzo/h/Jm
         DILg==
X-Gm-Message-State: AOAM531WM1dLDPj+wZK2r+XKU9jIY3tRNiu8l1HpmQcZcztLsGaD3Zcb
        P60XMufx5GxIrAzsogXdFP6WAA==
X-Google-Smtp-Source: ABdhPJwWERAvW0PGz+W3pi3GPHRvLgo0s4IWIrGEMWXRSaLxlv6Pk0i/BKCvLmKOCwk/K/gFtdmYbQ==
X-Received: by 2002:a17:902:52a:b029:da:989f:6c01 with SMTP id 39-20020a170902052ab02900da989f6c01mr7601723plf.45.1608359031359;
        Fri, 18 Dec 2020 22:23:51 -0800 (PST)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id bf3sm9655302pjb.45.2020.12.18.22.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 22:23:51 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 11/13] HID: playstation: add DualSense player LEDs support.
Date:   Fri, 18 Dec 2020 22:23:34 -0800
Message-Id: <20201219062336.72568-12-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201219062336.72568-1-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com>
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
 drivers/hid/hid-playstation.c | 64 ++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index ad8eedd3d2bf..384449e3095d 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -90,6 +90,7 @@ struct ps_led_info {
 #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
+#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
 #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 
@@ -134,6 +135,11 @@ struct dualsense {
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
@@ -707,6 +713,39 @@ static enum led_brightness dualsense_mute_led_get_brightness(struct led_classdev
 	return ds->mic_muted;
 }
 
+static enum led_brightness dualsense_player_led_get_brightness(struct led_classdev *led)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ds->player_leds); i++) {
+		if (&ds->player_leds[i] == led)
+			return !!(ds->player_leds_state & BIT(i));
+	}
+
+	return LED_OFF;
+}
+
+static void dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualsense *ds = hid_get_drvdata(hdev);
+	uint8_t player_leds_state = 0;
+	unsigned long flags;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ds->player_leds); i++)
+		player_leds_state |= (ds->player_leds[i].brightness << i);
+
+	spin_lock_irqsave(&ds->base.lock, flags);
+	ds->player_leds_state = player_leds_state;
+	ds->update_player_leds = true;
+	spin_unlock_irqrestore(&ds->base.lock, flags);
+
+	schedule_work(&ds->output_worker);
+}
+
 static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_output_report *rp,
 		void *buf)
 {
@@ -797,6 +836,13 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_lightbar = false;
 	}
 
+	if (ds->update_player_leds) {
+		r->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE;
+		r->player_leds = ds->player_leds_state;
+
+		ds->update_player_leds = false;
+	}
+
 	if (ds->update_mic_mute) {
 		if (ds->mic_muted) {
 			common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE;
@@ -1042,10 +1088,18 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
 	uint8_t max_output_report_size;
-	int ret;
+	int i, ret;
 
 	struct ps_led_info mute_led_info = { "micmute", dualsense_mute_led_get_brightness, NULL };
 
+	struct ps_led_info player_leds_info[] = {
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
@@ -1126,6 +1180,14 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret < 0)
 		goto err;
 
+	for (i = 0; i < ARRAY_SIZE(player_leds_info); i++) {
+		struct ps_led_info *led_info = &player_leds_info[i];
+
+		ret = ps_led_register((struct ps_device *)ds, &ds->player_leds[i], led_info);
+		if (ret < 0)
+			goto err;
+	}
+
 	return (struct ps_device *)ds;
 
 err:
-- 
2.26.2

