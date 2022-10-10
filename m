Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A175FA6E9
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 23:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJJVXZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 17:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiJJVXY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 17:23:24 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6216B173
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 14:23:23 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id v10-20020a17090a634a00b00205e48cf845so14138953pjs.4
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 14:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1skcEQK88vg7nItFRdAvtm5BwaRD5tJdY28H62/40V0=;
        b=iuwpCJiznFulodI7MqlIT4/2iWUaG9KhBp51ouagJqaVB0askHQaPS8GpwZI5Wtl+G
         moxq1nKeVWcZlkt7Np3IEQbnZrBh/GZERl0mCuLTTWx8M/bPCAumUIuZ5y3TSjiDZC7i
         EkIzV7NyNfG4+45pNIXpmqE1ZAI+lwULK9HvEv444orFTV+nt8IeIQvCCxnAylzGaKGc
         e2iBOhLbvKjuMWgwxQEB74SQoZhN1Z6IUZ/l5EdiyQ50lUKIufHWye+igxNodxmf09gY
         LFz9hazKwvBm6Jmw9/v1oRy8uy26MnJS9jAh97w2vt7Itlw+4WxMqgrOOfVH2M0pYYaj
         1Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1skcEQK88vg7nItFRdAvtm5BwaRD5tJdY28H62/40V0=;
        b=wZWrkyLJTUE2YCGY0cNLDyOmbHeHhl1wdLVsvX2mFM2DPLmgLGQ5VaOeIS0ySDG1Pk
         WZg0TwLy0/rH1gYdRTx0SbYn7EG2OlG68y0IPXNKuE3ECzkDDzfFNHfHY5vP+QtxmXU3
         B/n2mwurb5uZYsCqo+0xQoiocps5N04lSF+gnaEgyp3OJ4Yj8LYXutX3Jh0Hdx+nGLu3
         Fcjk5xgtv7CKWEbGXmlDh7T/ftBYC9wmRA2qUeM2q7x+mES3D3rHBsPHXbTN4h5qexLC
         1o39ASk0o0OfV1qZGxk1xgYOsdOJ0h0B5haNWgLWqbwtjcSGunMbW+JaY4kHyy1HaF5Z
         LZ5Q==
X-Gm-Message-State: ACrzQf2PyCblWTt8Aa3fIPkNUiUhYXesiiDN4GbQzfHGWEBTpzljkOd5
        TapL/K8gAdIoopH4p7GKZrBBug==
X-Google-Smtp-Source: AMsMyM6JGYLne3FiLaR64ai8jg6i4YooCu760VTkn00tOUowZWbBFu6xFx+LQ0Kc8oB+fc6xWd2Knw==
X-Received: by 2002:a17:903:22cc:b0:178:18a1:d16c with SMTP id y12-20020a17090322cc00b0017818a1d16cmr21182053plg.155.1665437002857;
        Mon, 10 Oct 2022 14:23:22 -0700 (PDT)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id d17-20020a621d11000000b0054097cb2da6sm7383876pfd.38.2022.10.10.14.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 14:23:22 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 3/3] HID: playstation: support updated DualSense rumble mode.
Date:   Mon, 10 Oct 2022 14:23:13 -0700
Message-Id: <20221010212313.78275-4-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010212313.78275-1-roderick.colenbrander@sony.com>
References: <20221010212313.78275-1-roderick.colenbrander@sony.com>
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
 drivers/hid/hid-playstation.c | 37 ++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 396356b6760a..2a9870a62301 100644
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
+	uint16_t update_version;
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
@@ -812,6 +820,15 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
 	ds->base.hw_version = get_unaligned_le32(&buf[24]);
 	ds->base.fw_version = get_unaligned_le32(&buf[28]);
 
+	/* Update version is some kind of feature version. It is distinct from
+	 * the firmware version as there can be many different variations of a
+	 * controller over time with the same physical shell, but with different
+	 * PCBs and other internal changes. The update version (internal name) is
+	 * used as a means to detect what features are available and change behavior.
+	 * Note: the version is different between DualSense and DualSense Edge.
+	 */
+	ds->update_version = get_unaligned_le16(&buf[44]);
+
 err_free:
 	kfree(buf);
 	return ret;
@@ -974,7 +991,10 @@ static void dualsense_output_worker(struct work_struct *work)
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
@@ -1348,6 +1368,21 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 		return ERR_PTR(ret);
 	}
 
+	/* Original DualSense firmware simulated classic controller rumble through
+	 * its new haptics hardware. It felt different from classic rumble users
+	 * were used to. Since then new firmwares were introduced to change behavior
+	 * and make this new 'v2' behavior default on PlayStation and other platforms.
+	 * The original DualSense requires a new enough firmware as bundled with PS5
+	 * software released in 2021. DualSense edge supports it out of the box.
+	 * Both devices also support the old mode, but it is not really used.
+	 */
+	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
+		/* Feature version 2.21 introduced new vibration method. */
+		ds->use_vibration_v2 = ds->update_version >= DS_FEATURE_VERSION(2, 21) ? true : false;
+	} else if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
+		ds->use_vibration_v2 = true;
+	}
+
 	ret = ps_devices_list_add(ps_dev);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.37.3

