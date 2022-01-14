Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6622048EFF3
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243164AbiANSch (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243088AbiANScd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:33 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C00C06173F
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:33 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id q141-20020a1ca793000000b00347b48dfb53so7265029wme.0
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JL2oUXxSmPHvaHeRcPzyrtG4kTUnGJI+q7n4E7t0vwc=;
        b=NcsT6YxY1wcPVgNtDPXf6ubOts3rLji7vUUxZrIDpKJD7GV7oWvqo1UYRsD2kL7cat
         gg9Z+n3spO0F8Gfd/iMqByUOL//bN1NIsZL3s79rNzPC3g4aVGzRGG7FzAXlDq9Rb/x2
         hIRgPVNbq8S6HfcqC5tWU0RVtjW9mnXxiJ4WhlFRUbtjqgweq3tHBCue/I40/Q/JbFXj
         YeTlvGRt5hA9Ps8lGHnxADDFGfB4tUCn3cOa6cqXkGhqcS5HvscM26bbCs08jr3O2/TL
         X507aAwLQfBLT8PXK8wz1/xV77UX0JfH3JCAJG3ATOOAUqbI7fnqElpvcCgV2nPRbcSV
         bKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JL2oUXxSmPHvaHeRcPzyrtG4kTUnGJI+q7n4E7t0vwc=;
        b=QkZcZzeVQgGB0WEytDAibDplLK/cINS/5Gx5sBzDPHSX/MjGcYm2zaeTkwLW7u2eZf
         HhYFCMxENMn6oYCNQDwpVjTWf4jzJ+8jVP0Ty7TqfIOHPi8Vy/9rZBb6tINbFOvUsc4b
         IdgVq2WnQ75qc8C+tpivEts9hauYmt3QL99VRlxMJxV91wnvP98xR3TRkImgB4J6VMCN
         6Hu7hR4PryOl25k0jUGvKAFCVU9Bx6Ez1HJJeh4t7qiST1r9lU8sLWsN6vjgAiZaMkGS
         AIU+BKz1UaF1s8GGjJxPX0VeEzK1k2rlg5csHrogcaLK7efBs31H9O8SdQh03+rr/Fyi
         dKEg==
X-Gm-Message-State: AOAM533l1+JtCyZ9foc0mvWdXDGvVOhD5WXXyqvtl3rOKHlJQ8AxuGmp
        RK4A/zbcWgZ9Ocint34yQUj/p+Sm95VXS9KoumI=
X-Google-Smtp-Source: ABdhPJwcCA5N6gGsLgK+9tlAcda/TBhg+yyBgaisKOeFUGLg1OtAalXeqXql0gd2cGJkyKghCy7ifA==
X-Received: by 2002:a05:6000:15c9:: with SMTP id y9mr7795879wry.5.1642185151844;
        Fri, 14 Jan 2022 10:32:31 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:31 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 10/16] HID: haptic: add functions handling events
Date:   Fri, 14 Jan 2022 18:31:46 +0000
Message-Id: <20220114183152.1691659-11-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Implement hid_haptic_handle_press_release() which generates haptic feedback
as well as saves the pressed state of the haptic device.
Function hid_haptic_handle_input() inserts BTN_LEFT and ABS_PRESSURE events
if the device is in kernel mode.
Add functions to increase and reset the state of the pressure detected by
the device.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 71 +++++++++++++++++++++++++++++++++++++++-
 drivers/hid/hid-haptic.h | 18 ++++++++++
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 64e354cb3f2e..4a5d5e7b92d1 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -50,8 +50,13 @@ EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
 bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
 				    struct hid_input *hi, struct hid_field *field)
 {
-	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
+	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON) {
+		haptic->force_logical_minimum = field->logical_minimum;
+		haptic->force_physical_minimum = field->physical_minimum;
+		haptic->force_resolution = input_abs_get_res(hi->input,
+							     ABS_MT_PRESSURE);
 		return true;
+	}
 	return false;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
@@ -350,6 +355,12 @@ static void hid_haptic_destroy(struct ff_device *ff)
 	module_put(THIS_MODULE);
 }
 
+static u32 convert_force_to_logical(struct hid_haptic_device *haptic, u32 value)
+{
+	return (value - haptic->force_physical_minimum) *
+		haptic->force_resolution + haptic->force_logical_minimum;
+}
+
 int hid_haptic_init(struct hid_device *hdev,
 		    struct hid_haptic_device **haptic_ptr)
 {
@@ -457,6 +468,13 @@ int hid_haptic_init(struct hid_device *hdev,
 	fill_effect_buf(haptic, &stop_effect, &haptic->stop_effect,
 			HID_HAPTIC_ORDINAL_WAVEFORMSTOP);
 
+	haptic->mode = HID_HAPTIC_MODE_DEVICE;
+	haptic->press_threshold = convert_force_to_logical(haptic,
+							   HID_HAPTIC_PRESS_THRESH);
+	haptic->release_threshold = convert_force_to_logical(haptic,
+							     HID_HAPTIC_RELEASE_THRESH);
+
+
 	input_set_capability(dev, EV_FF, FF_HID);
 
 	flush = dev->flush;
@@ -548,3 +566,54 @@ int hid_haptic_init(struct hid_device *hdev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_init);
+
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
+{
+	int prev_pressed_state = haptic->pressed_state;
+	struct input_dev *input = haptic->input_dev;
+	unsigned long flags;
+
+	if (haptic->pressure_sum > haptic->press_threshold)
+		haptic->pressed_state = 1;
+	else if (haptic->pressure_sum < haptic->release_threshold)
+		haptic->pressed_state = 0;
+	if (!prev_pressed_state && haptic->pressed_state &&
+	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
+		spin_lock_irqsave(&input->event_lock, flags);
+		input->ff->playback(input, PRESS_HID_EFFECT_ID, 1);
+		spin_unlock_irqrestore(&input->event_lock, flags);
+	}
+	if (prev_pressed_state && !haptic->pressed_state &&
+	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
+		spin_lock_irqsave(&input->event_lock, flags);
+		input->ff->playback(input, RELEASE_HID_EFFECT_ID, 1);
+		spin_unlock_irqrestore(&input->event_lock, flags);
+	}
+}
+EXPORT_SYMBOL_GPL(hid_haptic_handle_press_release);
+
+bool hid_haptic_handle_input(struct hid_haptic_device *haptic)
+{
+	if (haptic->mode == HID_HAPTIC_MODE_KERNEL) {
+		input_event(haptic->input_dev, EV_KEY, BTN_LEFT,
+			    haptic->pressed_state);
+		input_event(haptic->input_dev, EV_ABS, ABS_PRESSURE,
+			    haptic->pressure_sum);
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_handle_input);
+
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{
+	haptic->pressure_sum = 0;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_reset);
+
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				 __s32 pressure)
+{
+	haptic->pressure_sum += pressure;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_increase);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index e686f7ec42b9..586f20be0061 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -83,6 +83,11 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_input *hi);
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
+bool hid_haptic_handle_input(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				  __s32 pressure);
 #else
 static inline
 void hid_haptic_feature_mapping(struct hid_device *hdev,
@@ -117,4 +122,17 @@ int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_p
 {
 	return 0;
 }
+static inline
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic) {}
+static inline
+bool hid_haptic_handle_input(struct hid_haptic_device *haptic)
+{
+	return false;
+}
+static inline
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic) {}
+static inline
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				  __s32 pressure)
+{}
 #endif
-- 
2.34.1.703.g22d0c6ccf7-goog

