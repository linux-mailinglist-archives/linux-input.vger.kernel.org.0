Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F3E307C7A
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbhA1RaI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:30:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233174AbhA1R16 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:58 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C31C061353
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:18 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id u4so4722364pjn.4
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8uWzu9vKdpdES5yOOv1+bEICi0eIoodD8PhCeHIQ1lQ=;
        b=Za0sT9OJmv06pmOJyEHstjTk6gulDYqVK9/r7gDJH20hRaxYfdLkQizDXaeaBd2In/
         YvUaueO3Z5cgwZjULXLrls5cB28cqT7GfdzNK+9lHN4C/N/fW/bzHf9b29kM2YLPbzAd
         8yUOXS4ZxTODoGNG2lf/8+pd0uefzVTucA4b6uY4LoAgWHXkgSfiREjuj6qznpcahzYY
         EMTKN9flgWMB14ogn/3UB/9uz09XR26JmbhgDVxW1qBjDLBjcKARztidnOLrX2KypRPt
         Zoic4pDu+EQTtB6H8MlLF+rvUB52tFUEsYEIKFkIgc2ndAuvCGjGyofKXlG51swdIc6+
         J3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8uWzu9vKdpdES5yOOv1+bEICi0eIoodD8PhCeHIQ1lQ=;
        b=FYsHWTd1sdLOnu/AE1YASmzNoi25CUZEWajmT8N2YS30j7CeS7BaYXTCz0WjtS++50
         kmpV/q/BztkbpqOWbPouhqw2Lxoix6fl3x1bJhYRy11Z72vOGLlzuIk0/kxIHmk/eqf/
         zw1GNxC1MeBMeJVCxi4M6JVJ5LSaY+klT0oasB5U8zJG0g/8p6YocIOCIcfsLiVJ/p50
         ezjwek37dc3K3Qth9sNhKNzU2v4iJcGvQez7AG82fwtqNEGGP+gyN0RCTsTw2lv1Os6W
         6l3jUNOKj/khmRaosZpLwqoyszR0FSN1bObYbnQp0AVzGLV7S0oUbPrWujRO0F8686oL
         nNvw==
X-Gm-Message-State: AOAM531S7oa1N86X7e2wqXkv5khQbhjjqII0p+mm50RDBwbbzEBj9zUf
        +e5Baueo6/2EgYFy+nxerUY/ug==
X-Google-Smtp-Source: ABdhPJxQpBbMA7tiMjXCfsz/IHOg6f4q9fycPzqi/Zf2+bo5/D7AV1TFXH2tl2T1Vj78RyQisYx6aw==
X-Received: by 2002:a17:90a:bf17:: with SMTP id c23mr409391pjs.96.1611854837544;
        Thu, 28 Jan 2021 09:27:17 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:17 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 11/13] HID: playstation: add DualSense player LEDs support.
Date:   Thu, 28 Jan 2021 09:26:55 -0800
Message-Id: <20210128172657.24516-12-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128172657.24516-1-roderick@gaikai.com>
References: <20210128172657.24516-1-roderick@gaikai.com>
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
index 8a250526b382..966d1a5aee18 100644
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
+		ds->player_leds_state &= ~BIT(led_index);
+	else
+		ds->player_leds_state |= BIT(led_index);
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

