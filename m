Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C09D5F5E94
	for <lists+linux-input@lfdr.de>; Thu,  6 Oct 2022 04:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiJFCEB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Oct 2022 22:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiJFCCL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Oct 2022 22:02:11 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0F93C144
        for <linux-input@vger.kernel.org>; Wed,  5 Oct 2022 19:02:10 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id i7-20020a17090a65c700b0020ad9666a86so3060121pjs.0
        for <linux-input@vger.kernel.org>; Wed, 05 Oct 2022 19:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8URyf7toD6VW6LEocw1K6tFXyPygf2Z5z5Lo24ndB3Y=;
        b=iGx+6fcLW4Wna41I4K3b839ddgrS0axjRuWbSSJN7v1udpy1hM58MR4vzpVY3l/PY1
         5SkTqDF93wvlTPb4PDJpCRMQlHqHrkzzwMp/5aj0HdzsOcxubEwG0IGgYkU5aRZoM5Ni
         PiwjsyqKg3AZj3gR7/US/ew4CRK6CCH45csbZNESqT+I7c8frHg93AM8bYAiC25d40M+
         xRa4+J/rQtOcbbzLXVN68SUP3cJesnBoEA+FsyqMD30bR8rsIf2/OkcjLxb+nSywCOM8
         LR6VIOiiJr3RcQBC27a+v1rFnEp9+YNUyxXlPOn8OZ6vqKq8t8V6exxQ1VKO8pfjXxKK
         AHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8URyf7toD6VW6LEocw1K6tFXyPygf2Z5z5Lo24ndB3Y=;
        b=l7G5MQ6D58SU5BuuAJ1L2EMaQPbM7xzMSpLn6Td3vpeTihqIB1V9xEUsmmtOxBWXgW
         AqwnmqJOo0g+y5LJE2KIWOywTPc0gYLbuVAhqNYihIGme7x74cAzaZKi33pFBvXTyrEj
         TBtr1bfQUE5/fR1kWuYxe4FcMnRD9x9w774wgzn2HJepkJ7C7Ts1TOHT5KCV5stm8JWl
         nhVvhZPd3jZvIGO93icb6zwZTPxRYhOa47B4KA9EnYwS3HjyaZ4c85j1kHEbYnMFNU1Q
         JqcX3BFlq3CA8CWWSGCsRvWtpP87jI8UWY/vssWbWN67dGYZDD32ARp2u+RcrMm5/Jow
         aNfw==
X-Gm-Message-State: ACrzQf3uY1h3Pu6FBc7IkkGK7XwrZHGLU/lfSQwhprIeniICuZEgx53W
        1e388+4L6PWiVyv7JouV5n5ue8bbeNKB+w==
X-Google-Smtp-Source: AMsMyM4qAjfY40JqbeoxRBJ1yMJQbOvogb0pyrZADr/N5yqNnpYRBUA5BfM9c3Duld8iWNxNboeLnw==
X-Received: by 2002:a17:90b:4c8f:b0:202:bcbb:1984 with SMTP id my15-20020a17090b4c8f00b00202bcbb1984mr7872737pjb.64.1665021729809;
        Wed, 05 Oct 2022 19:02:09 -0700 (PDT)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id w13-20020a63d74d000000b0043be67b6304sm482768pgi.0.2022.10.05.19.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 19:02:09 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 3/3] HID: playstation: support updated DualSense rumble mode.
Date:   Wed,  5 Oct 2022 19:01:51 -0700
Message-Id: <20221006020151.132434-4-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006020151.132434-1-roderick.colenbrander@sony.com>
References: <20221006020151.132434-1-roderick.colenbrander@sony.com>
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

Newer DualSense firmware supports a revised classic rumble mode,
which feels more similar to rumble as supported on previous PlayStation
controllers. It has been made the default on PlayStation and non-PlayStation
devices now (e.g. iOS and Windows). Default to this new mode when
supported.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 39 ++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 396356b6760a..e05c61942971 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -108,6 +108,9 @@ struct ps_led_info {
 #define DS_STATUS_CHARGING		GENMASK(7, 4)
 #define DS_STATUS_CHARGING_SHIFT	4
 
+/* Feature version from DualSense Firmware Info report. */
+#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor & 0xff))
+
 /*
  * Status of a DualSense touch point contact.
  * Contact IDs, with highest bit set are 'inactive'
@@ -126,6 +129,7 @@ struct ps_led_info {
 #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
 #define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
 #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
+#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2 BIT(2)
 #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
 #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
@@ -143,6 +147,9 @@ struct dualsense {
 	struct input_dev *sensors;
 	struct input_dev *touchpad;
 
+	/* Update version is used as a feature/capability version. */
+	__le16 update_version;
+
 	/* Calibration data for accelerometer and gyroscope. */
 	struct ps_calibration_data accel_calib_data[3];
 	struct ps_calibration_data gyro_calib_data[3];
@@ -153,6 +160,7 @@ struct dualsense {
 	uint32_t sensor_timestamp_us;
 
 	/* Compatible rumble state */
+	bool use_vibration_v2;
 	bool update_rumble;
 	uint8_t motor_left;
 	uint8_t motor_right;
@@ -812,6 +820,14 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
 	ds->base.hw_version = get_unaligned_le32(&buf[24]);
 	ds->base.fw_version = get_unaligned_le32(&buf[28]);
 
+	/* Update version is some kind of feature version. It is distinct from
+	 * the firmware version as there can be many different variations of a
+	 * controller over time with the same physical shell, but with different
+	 * PCBs and other internal changes. The update version (internal name) is
+	 * used as a means to detect what features are available and change behavior.
+	 */
+	ds->update_version = get_unaligned_le16(&buf[44]);
+
 err_free:
 	kfree(buf);
 	return ret;
@@ -974,7 +990,10 @@ static void dualsense_output_worker(struct work_struct *work)
 	if (ds->update_rumble) {
 		/* Select classic rumble style haptics and enable it. */
 		common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT;
-		common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
+		if (ds->use_vibration_v2)
+			common->valid_flag2 |= DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2;
+		else
+			common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
 		common->motor_left = ds->motor_left;
 		common->motor_right = ds->motor_right;
 		ds->update_rumble = false;
@@ -1348,6 +1367,24 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		return ERR_PTR(ret);
 	}
 
+#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor & 0xff))
+	/* Original DualSense firmware simulated classic controller rumble through
+	 * its new haptics hardware. It felt different from classic rumble users
+	 * were used to. Since then new firmwares were introduced to change behavior
+	 * and make this new 'v2' behavior default on PlayStation and other platforms.
+	 * The original DualSense requires a new enough firmware as bundled with PS5
+	 * software released in 2021. DualSense edge supports it out of the box.
+	 */
+	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
+		/* Feature version 2.21 introduced new vibration method. */
+		if (ds->update_version < DS_FEATURE_VERSION(2, 21))
+			ds->use_vibration_v2 = false;
+		else
+			ds->use_vibration_v2 = true;
+	} else if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
+		ds->use_vibration_v2 = true;
+	}
+
 	ret = ps_devices_list_add(ps_dev);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.37.3

