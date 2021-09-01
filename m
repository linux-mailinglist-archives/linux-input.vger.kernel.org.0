Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968D43FE587
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 00:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhIAWbx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 18:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbhIAWbt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 18:31:49 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B562AC061757
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 15:30:52 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id t1so991921pgv.3
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 15:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oRuhT6i1tBBxLhxOXeUFVO7p2TBVNmAAOTAtaIiqi0M=;
        b=sS4XnGqBkVd9N8XpnQdp+udPfiw04J0fhuKzY/0bWkITYkwOoRWBYl/iwMBViPNXdP
         o5+1vrE5/0n6228t0HrprCgIK43oVwqaT36RGhAFtjjhfj67Zx+YrAP5vOoV5Xh1WZSD
         IKPAA6flB0jQR88GIcICYnPmCVVgut0V/FAbJ03NNPVObe6BjsnWV5KCLTQACjJ27L9U
         BfOUrOBpXBXLEVu6FKOjaIxf8biGDu3KLvcAEuQxNPitFHmsK+Ay4Bf9ybcZcfQWeAPu
         O2R/Ehs4Lzsp0l4hbYnQZcEFb3BY9KSO4thwAM/oTBI9vvgLn94giqFyVr8cGN0sRXq9
         /I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oRuhT6i1tBBxLhxOXeUFVO7p2TBVNmAAOTAtaIiqi0M=;
        b=iLWI2b6Sa1gzRiWZT2PbUbJt+Qj+6WNOiDkeIhaNmW/gbQnJoravCvwEApZC/u6D+j
         5QZ14gx4OjpgkMpKyisvdK5tgdQstRjvU0zw+q10iGu3UjF6bgpClr47OSQjCO0E+M7J
         teaPMc7Dwo5EkZC//90TeqOoObnJJ6Hoy2X8IIQQP3252lSpoNd74SarAJl7tpSUvwUZ
         mpuG9LvS4wUJYGFg4BTRhG/S7iQDsh2NnTNXCFx6HsKhvx+YhO/kp5BuunJnEvFWqYWw
         KS7F8/qJ0AhnS4laiD9/2ahQ/Dx5MYg5ReD3yf/XCqcfHBWxadxEkwafVSP+GxnBoXDF
         L30Q==
X-Gm-Message-State: AOAM530vPwDGr4s2uZJ7lVHtFajwdZmq2APR0sJH+yGR345ZfnjE/GdE
        kOAPtzmV+yRnk7tyhderconfxA==
X-Google-Smtp-Source: ABdhPJx0nc9xXVzQLBT+sMMRaf4O9VpuXvYPLNaTaJnJ0p7aLO5pG6RvM7inCN8F7AzIe/QCyxMVtg==
X-Received: by 2002:a62:32c6:0:b0:3fd:7c78:2a9a with SMTP id y189-20020a6232c6000000b003fd7c782a9amr163376pfy.33.1630535452299;
        Wed, 01 Sep 2021 15:30:52 -0700 (PDT)
Received: from localhost.localdomain (rrcs-24-43-218-40.west.biz.rr.com. [24.43.218.40])
        by smtp.gmail.com with ESMTPSA id j2sm9623pfe.201.2021.09.01.15.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 15:30:51 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 3/3] HID: playstation: expose DualSense player LEDs through LED class.
Date:   Wed,  1 Sep 2021 15:30:37 -0700
Message-Id: <20210901223037.2964665-4-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
References: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

