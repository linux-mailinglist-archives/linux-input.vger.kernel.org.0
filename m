Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841A1403E04
	for <lists+linux-input@lfdr.de>; Wed,  8 Sep 2021 18:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350095AbhIHQ5D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Sep 2021 12:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350145AbhIHQ5B (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Sep 2021 12:57:01 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1E5C061575
        for <linux-input@vger.kernel.org>; Wed,  8 Sep 2021 09:55:53 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ot2-20020a17090b3b4200b0019127f8ed87so1598023pjb.1
        for <linux-input@vger.kernel.org>; Wed, 08 Sep 2021 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zf/BZD192Tdy+izLdQGMSbVLOpo6jnM9SDkMc0GIhBk=;
        b=viA+4J9HRLOm2/FFsxl4Lf1GF+mBfxxWeE8H8LT8cyYlqaUunyiKHIJJi2Aj97z62J
         LSWDkkRW6Oxe+4XQnQlCI6whGxDx+LzNGwfjfD3fh5PSuiEINlaGqIWdoPtBImDFr6dO
         i1/Ad5pjToXJAYQHd75BDoyszMGQX5k5mmwQH25wv+Niget9l3ROLlKZBCl4DEy5R4bY
         Es4CuEajYA6eSDWSUEZwN5p1mX6ovAFI2ixdclryHTr68SVM6+WB/Jyh1GBAZ9hkq+56
         Bd//5Rbu4cIkuuFko0jYckkWNrSEjV8v1ds65SsdX25cbsKGsgEx7++JDHBMVsirqMhK
         O36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zf/BZD192Tdy+izLdQGMSbVLOpo6jnM9SDkMc0GIhBk=;
        b=hskmV7nczR4Bu71EOO99060eVe0EO/KYTuwP2kKg8cYRpqT7hNGq4uLEA2z6jGAPw5
         rE/6tIRvOq2jw6SmevSah2tZkb7ZUIllrwQiy+FH+uT01KAqq7VopupUyZQ+Z/qqfG7h
         59rbO5AYvfoeGETjdKBTYMnTcrI5AhFnimhWaNAtQihXbTelrl6H2JWojqjtKXhFzgOK
         BPE9I/XCx8t9Ls4l/fAD4jdI/w7jVpx2HGA5+JiIbDCrDiHpMuGAH0Xu7+HLOHXIkYh1
         dm7S322nemzYp/4PfekWTJRNEDr1RvdL7TiD5T+RKE5HTkbjNI099bAnBlgQkhRQKfd7
         9q9A==
X-Gm-Message-State: AOAM533/jJ0TzVBPTxr2nBDK/Zcti0hz6sv6zdTPxrfd2qF2W+DlDHeA
        4MkUHt4WKjTvOHWJM1DdQDIeKj7jyLoqEg==
X-Google-Smtp-Source: ABdhPJyN+XCfdJB6DXPEs+PQZFFK41PMqvimpw1gN2nwxNdm0lv6FemSLMa4QqPywYJjRoAbBu/XqA==
X-Received: by 2002:a17:902:c643:b0:138:b603:f944 with SMTP id s3-20020a170902c64300b00138b603f944mr3884279pls.45.1631120153354;
        Wed, 08 Sep 2021 09:55:53 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id x19sm3133678pfa.104.2021.09.08.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 09:55:53 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 3/3] HID: playstation: expose DualSense player LEDs through LED class.
Date:   Wed,  8 Sep 2021 09:55:39 -0700
Message-Id: <20210908165539.3102929-4-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
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
index ff2fc315a89d..5cdfa71d1563 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -56,6 +56,13 @@ struct ps_calibration_data {
 	int sens_denom;
 };
 
+struct ps_led_info {
+	const char *name;
+	const char *color;
+	enum led_brightness (*brightness_get)(struct led_classdev *cdev);
+	int (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
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
+	led->brightness_set_blocking = led_info->brightness_set;
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
+static int dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
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
+		{ LED_FUNCTION_PLAYER1, "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness },
+		{ LED_FUNCTION_PLAYER2, "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness },
+		{ LED_FUNCTION_PLAYER3, "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness },
+		{ LED_FUNCTION_PLAYER4, "white", dualsense_player_led_get_brightness,
+				dualsense_player_led_set_brightness },
+		{ LED_FUNCTION_PLAYER5, "white", dualsense_player_led_get_brightness,
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

