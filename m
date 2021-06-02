Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13FCB3980F6
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 08:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhFBGPa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 02:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhFBGP3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 02:15:29 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415C5C06174A
        for <linux-input@vger.kernel.org>; Tue,  1 Jun 2021 23:13:46 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id c13so587578plz.0
        for <linux-input@vger.kernel.org>; Tue, 01 Jun 2021 23:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NphrMj5gDb0rmEpg9zfCKaIjhOM88O65yK/GryJXXag=;
        b=v2KrMpbvl09EObzutxNcAOJS7JlsYctduYzF2VBrEu4P6DZSqM3vtD7cA49E3UYU40
         pTaMh5I8maoWjK0br+jn70PFRw676dW6s5taJqCBS3qQScg3xVwrRaKS8U4brsXO3ce9
         nzjLFt4HxBnrIOc0DJopOUtSgdeB8wCNBkfMqPwuPLKFNqZVK9l51gfa51ln53AThsFx
         UyJD93LvVw+X9gXjp6QUWrIQwt8jOTk2MP5HPmIjcgt6DjEuT9jValMPQWSNRFIPMX85
         kbOIaGpkQ7CO6xPYhw0dCE8uZoiP3k7oM1e7WtVkVdx0xxVh5s7SUDEo8yKlr7rD9orx
         uk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NphrMj5gDb0rmEpg9zfCKaIjhOM88O65yK/GryJXXag=;
        b=rdvZiC+0BLE/uZS0n+7+NI6ogCiGTdd1O44uYQOqNPRRaqDb2x0UBYXUWGPaWLeQXX
         6lwhQX0k+9zzeSgZIercTGraVnANpXNVazNkNVBZTPE3BloqOqhq2hxRQQZCbfDugTwx
         JqJ4ZgotILgZloK0xcm4CgVKKj+Yr9xPRhAxriuBq4EvEGC247/MBmsaao4UCgHWlfdq
         WHhFnjHzGr398dhHRbKMEnspiE8avDj52H/kzFzPkQzWEzt5MkgauAGh4FSoHbTVribd
         UpgFyb9/Sv818L3ittDllMl6GOdwOojfiei/7DwmaCUVCeToNTBpY5Pg4z2bGRrkifvr
         tI1Q==
X-Gm-Message-State: AOAM533OyAmCleHKLzcgwpnPtYiYwa6aKIOdvYsDqgX6cnZE4RJBFzIl
        qpC5by9iosw9uNqZ/kRVRLsFAi5c6yWlqA==
X-Google-Smtp-Source: ABdhPJwB2/oweqEVGjQ6oBPjse8L5a8LZ0flBWjADjGefhEQ7MvqYg59VHn7l2TBHIJaIBM+kecfNg==
X-Received: by 2002:a17:90a:e393:: with SMTP id b19mr3896297pjz.18.1622614425799;
        Tue, 01 Jun 2021 23:13:45 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id k20sm16535374pgl.72.2021.06.01.23.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 23:13:45 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 3/3] HID: playstation: expose DualSense player LEDs through LED class.
Date:   Tue,  1 Jun 2021 23:12:53 -0700
Message-Id: <20210602061253.5747-4-roderick@gaikai.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602061253.5747-1-roderick@gaikai.com>
References: <20210602061253.5747-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DualSense player LEDs were so far not adjustable from user-space.
This patch exposes each LED individually through the LED class. Each
LED uses the new 'player' function resulting in a name like:
'inputX:white:player-1' for the first LED.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 85 ++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index ff2fc315a89d..9b96239bba5f 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -56,6 +56,13 @@ struct ps_calibration_data {
 	int sens_denom;
 };
 
+struct ps_led_info {
+	const char *name;
+	const char *color;
+	enum led_brightness (*brightness_get)(struct led_classdev *cdev);
+	void (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
+};
+
 /* Seed values for DualShock4 / DualSense CRC32 for different report types. */
 #define PS_INPUT_CRC32_SEED	0xA1
 #define PS_OUTPUT_CRC32_SEED	0xA2
@@ -531,6 +538,32 @@ static int ps_get_report(struct hid_device *hdev, uint8_t report_id, uint8_t *bu
 	return 0;
 }
 
+static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
+		const struct ps_led_info *led_info)
+{
+	int ret;
+
+	led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
+			"%s:%s:%s", ps_dev->input_dev_name, led_info->color, led_info->name);
+
+	if (!led->name)
+		return -ENOMEM;
+
+	led->brightness = 0;
+	led->max_brightness = 1;
+	led->flags = LED_CORE_SUSPENDRESUME;
+	led->brightness_get = led_info->brightness_get;
+	led->brightness_set = led_info->brightness_set;
+
+	ret = devm_led_classdev_register(&ps_dev->hdev->dev, led);
+	if (ret) {
+		hid_err(ps_dev->hdev, "Failed to register LED %s: %d\n", led_info->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /* Register a DualSense/DualShock4 RGB lightbar represented by a multicolor LED. */
 static int ps_lightbar_register(struct ps_device *ps_dev, struct led_classdev_mc *lightbar_mc_dev,
 	int (*brightness_set)(struct led_classdev *, enum led_brightness))
@@ -822,6 +855,35 @@ static int dualsense_lightbar_set_brightness(struct led_classdev *cdev,
 	return 0;
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
@@ -1207,7 +1269,20 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	struct dualsense *ds;
 	struct ps_device *ps_dev;
 	uint8_t max_output_report_size;
-	int ret;
+	int i, ret;
+
+	static const struct ps_led_info player_leds_info[] = {
+		{ LED_FUNCTION_PLAYER "-1", "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness },
+		{ LED_FUNCTION_PLAYER "-2", "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness },
+		{ LED_FUNCTION_PLAYER "-3", "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness },
+		{ LED_FUNCTION_PLAYER "-4", "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness },
+		{ LED_FUNCTION_PLAYER "-5", "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness }
+	};
 
 	ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
 	if (!ds)
@@ -1297,6 +1372,14 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	/* Set default lightbar color. */
 	dualsense_set_lightbar(ds, 0, 0, 128); /* blue */
 
+	for (i = 0; i < ARRAY_SIZE(player_leds_info); i++) {
+		const struct ps_led_info *led_info = &player_leds_info[i];
+
+		ret = ps_led_register(ps_dev, &ds->player_leds[i], led_info);
+		if (ret < 0)
+			goto err;
+	}
+
 	ret = ps_device_set_player_id(ps_dev);
 	if (ret) {
 		hid_err(hdev, "Failed to assign player id for DualSense: %d\n", ret);
-- 
2.31.1

