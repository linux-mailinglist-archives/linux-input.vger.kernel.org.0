Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C8D6124FA
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiJ2Stf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ2Ste (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:34 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC62210C8
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:31 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l6so7298619pjj.0
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ct8mPy5jUdpktdZbUleJg+LHbiBFLcBSbVV+9zfNac=;
        b=dRdhJofqOLJDrZse5CnndpvIBSs5m1tL6G6h2FQM/quKZytlxEAFbauHsvkUPHV2v4
         4qy6COjmoCFPyW4sihUHnrLHiC0k+6nGeBLwVaM1zjnXcTfpJb/ZoKNmCgGhJZeoUBqy
         uaNeZJl4CRqxT84ZmvVwYiQuXCHm6zlok5D3KZvXXLZymNZRzAGLJHsHWj01uHIEASoR
         83RLFm5IbIg8GgPQvlFB6+rBhnzUdYj7pvqiMsdtBrEvzqsNadIxPfc4GZXYa9h5kzbp
         yRswHfxB5KeECvSei2Um/kWglMD9powU8KtMP9pYxCDdwSfX/88rJUdE02+6vFRsDxJf
         rLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ct8mPy5jUdpktdZbUleJg+LHbiBFLcBSbVV+9zfNac=;
        b=MLXHKI9ULuhCQQY/4JnaiDZoE89wNqoacTffCQoA2B+V1/gX9vQwZtoCvJe+d/d0nL
         o+q+AU3d7gqjc7h3TMAb2TptVaopELjaN/smBwpCOSiSy/eu8WTjkzIMsHz6k4pPiHTD
         ZCyM3IBi5du2FJpV8j8QyPrsN3gzg09uHBEdsMbr+UPbtyG5VyMHb4c3npJLfCIr+4Y8
         C6e+Q0bzdXJTPS6snEZ3aVhPYJoXJR+gFHjEOd51UBE9XV7DvV4RWPixcQcHW/diqjXQ
         VnC09sNQ/eYdM32qvg9SpoZacfA3J3aoEyGHED/MNmOGtf8YgkPmD18Xlx2z6ScuXL7Q
         4GFA==
X-Gm-Message-State: ACrzQf2N/bwAR0kM65rwqFFY9nS/geAsTXXVL03cRhFUf1wORx4NYEhZ
        TYIHil2YpQbdkDys+msIj9DNvQ==
X-Google-Smtp-Source: AMsMyM5PG3P1Lzo4Hh6ORXfHEasAaw/KPzZO+75UEK+iGVUqgEprVH3RPE8shx16tmfQCjxVbwUHaQ==
X-Received: by 2002:a17:90b:4a8d:b0:20d:402d:6153 with SMTP id lp13-20020a17090b4a8d00b0020d402d6153mr6113561pjb.44.1667069371363;
        Sat, 29 Oct 2022 11:49:31 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:30 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 08/13] HID: playstation: support DualShock4 lightbar.
Date:   Sat, 29 Oct 2022 11:48:46 -0700
Message-Id: <20221029184851.282366-9-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Expose the lightbar LEDs in the same manner as hid-sony through
individual LEDs for backwards compatibility reasons. There is a
slight change in LED naming to use the input device name as opposed
to the MAC address like hid-sony did. This is expected to not
cause any issues and should make the naming more compliant.

In addition set a default lightbar color based on player ID.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 141 +++++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 662c6f220571..d42fda13580a 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -311,6 +311,8 @@ struct dualsense_output_report {
 
 /* Flags for DualShock4 output report. */
 #define DS4_OUTPUT_VALID_FLAG0_MOTOR		0x01
+#define DS4_OUTPUT_VALID_FLAG0_LED		0x02
+#define DS4_OUTPUT_VALID_FLAG0_LED_BLINK	0x04
 
 /* DualShock4 hardware limits */
 #define DS4_ACC_RES_PER_G	8192
@@ -339,6 +341,14 @@ struct dualshock4 {
 	uint8_t motor_left;
 	uint8_t motor_right;
 
+	/* Lightbar leds */
+	bool update_lightbar;
+	bool lightbar_enabled; /* For use by global LED control. */
+	uint8_t lightbar_red;
+	uint8_t lightbar_green;
+	uint8_t lightbar_blue;
+	struct led_classdev lightbar_leds[4];
+
 	struct work_struct output_worker;
 	bool output_worker_initialized;
 	void *output_report_dmabuf;
@@ -697,8 +707,14 @@ static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
 {
 	int ret;
 
-	led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
-			"%s:%s:%s", ps_dev->input_dev_name, led_info->color, led_info->name);
+	if (led_info->name) {
+		led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
+				"%s:%s:%s", ps_dev->input_dev_name, led_info->color, led_info->name);
+	} else {
+		/* Backwards compatible mode for hid-sony, but not compliant with LED class spec. */
+		led->name = devm_kasprintf(&ps_dev->hdev->dev, GFP_KERNEL,
+				"%s:%s", ps_dev->input_dev_name, led_info->color);
+	}
 
 	if (!led->name)
 		return -ENOMEM;
@@ -1746,6 +1762,60 @@ static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 	return ret;
 }
 
+static enum led_brightness dualshock4_led_get_brightness(struct led_classdev *led)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
+	unsigned int led_index;
+
+	led_index = led - ds4->lightbar_leds;
+	switch (led_index) {
+	case 0:
+		return ds4->lightbar_red;
+	case 1:
+		return ds4->lightbar_green;
+	case 2:
+		return ds4->lightbar_blue;
+	case 3:
+		return ds4->lightbar_enabled;
+	}
+
+	return -1;
+}
+
+static int dualshock4_led_set_brightness(struct led_classdev *led, enum led_brightness value)
+{
+	struct hid_device *hdev = to_hid_device(led->dev->parent);
+	struct dualshock4 *ds4 = hid_get_drvdata(hdev);
+	unsigned long flags;
+	unsigned int led_index;
+
+	spin_lock_irqsave(&ds4->base.lock, flags);
+
+	led_index = led - ds4->lightbar_leds;
+	switch (led_index) {
+	case 0:
+		ds4->lightbar_red = value;
+		break;
+	case 1:
+		ds4->lightbar_green = value;
+		break;
+	case 2:
+		ds4->lightbar_blue = value;
+		break;
+	case 3:
+		ds4->lightbar_enabled = !!value;
+	}
+
+	ds4->update_lightbar = true;
+
+	spin_unlock_irqrestore(&ds4->base.lock, flags);
+
+	dualshock4_schedule_work(ds4);
+
+	return 0;
+}
+
 static void dualshock4_init_output_report(struct dualshock4 *ds4,
 		struct dualshock4_output_report *rp, void *buf)
 {
@@ -1784,6 +1854,18 @@ static void dualshock4_output_worker(struct work_struct *work)
 		ds4->update_rumble = false;
 	}
 
+	if (ds4->update_lightbar) {
+		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED;
+		/* Comptabile behavior with hid-sony, which used a dummy global LED to
+		 * allow enabling/disabling the lightbar. The global LED maps to
+		 * lightbar_enabled.
+		 */
+		common->lightbar_red = ds4->lightbar_enabled ? ds4->lightbar_red : 0;
+		common->lightbar_green = ds4->lightbar_enabled ? ds4->lightbar_green : 0;
+		common->lightbar_blue = ds4->lightbar_enabled ? ds4->lightbar_blue : 0;
+		ds4->update_lightbar = false;
+	}
+
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 
 	hid_hw_output_report(ds4->base.hdev, report.data, report.len);
@@ -1998,12 +2080,52 @@ static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 }
 
+/* Set default lightbar color based on player. */
+static void dualshock4_set_default_lightbar_colors(struct dualshock4 *ds4)
+{
+	/* Use same player colors as PlayStation 4.
+	 * Array of colors is in RGB.
+	 */
+	static const int player_colors[4][3] = {
+		{ 0x00, 0x00, 0x40 }, /* Blue */
+		{ 0x40, 0x00, 0x00 }, /* Red */
+		{ 0x00, 0x40, 0x00 }, /* Green */
+		{ 0x20, 0x00, 0x20 }  /* Pink */
+	};
+
+	uint8_t player_id = ds4->base.player_id % ARRAY_SIZE(player_colors);
+
+	ds4->lightbar_enabled = true;
+	ds4->lightbar_red = player_colors[player_id][0];
+	ds4->lightbar_green = player_colors[player_id][1];
+	ds4->lightbar_blue = player_colors[player_id][2];
+
+	ds4->update_lightbar = true;
+	dualshock4_schedule_work(ds4);
+}
+
 static struct ps_device *dualshock4_create(struct hid_device *hdev)
 {
 	struct dualshock4 *ds4;
 	struct ps_device *ps_dev;
 	uint8_t max_output_report_size;
-	int ret;
+	int i, ret;
+
+	/* The DualShock4 has an RGB lightbar, which the original hid-sony driver
+	 * exposed as a set of 4 LEDs for the 3 color channels and a global control.
+	 * Ideally this should have used the multi-color LED class, which didn't exist
+	 * yet. In addition the driver used a naming scheme not compliant with the LED
+	 * naming spec by using "<mac_address>:<color>", which contained many colons.
+	 * We use a more compliant by using "<device_name>:<color>" name now. Ideally
+	 * would have been "<device_name>:<color>:indicator", but that would break
+	 * existing applications (e.g. Android). Nothing matches against MAC address.
+	 */
+	static const struct ps_led_info lightbar_leds_info[] = {
+		{ NULL, "red", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
+		{ NULL, "green", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
+		{ NULL, "blue", 255, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
+		{ NULL, "global", 1, dualshock4_led_get_brightness, dualshock4_led_set_brightness },
+	};
 
 	ds4 = devm_kzalloc(&hdev->dev, sizeof(*ds4), GFP_KERNEL);
 	if (!ds4)
@@ -2060,6 +2182,9 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	/* Use gamepad input device name as primary device name for e.g. LEDs */
+	ps_dev->input_dev_name = dev_name(&ds4->gamepad->dev);
+
 	ds4->sensors = ps_sensors_create(hdev, DS4_ACC_RANGE, DS4_ACC_RES_PER_G,
 			DS4_GYRO_RANGE, DS4_GYRO_RES_PER_DEG_S);
 	if (IS_ERR(ds4->sensors)) {
@@ -2077,12 +2202,22 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	for (i = 0; i < ARRAY_SIZE(lightbar_leds_info); i++) {
+		const struct ps_led_info *led_info = &lightbar_leds_info[i];
+
+		ret = ps_led_register(ps_dev, &ds4->lightbar_leds[i], led_info);
+		if (ret < 0)
+			goto err;
+	}
+
 	ret = ps_device_set_player_id(ps_dev);
 	if (ret) {
 		hid_err(hdev, "Failed to assign player id for DualShock4: %d\n", ret);
 		goto err;
 	}
 
+	dualshock4_set_default_lightbar_colors(ds4);
+
 	/*
 	 * Reporting hardware and firmware is important as there are frequent updates, which
 	 * can change behavior.
-- 
2.37.3

