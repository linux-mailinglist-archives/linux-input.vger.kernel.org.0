Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460A847C75E
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241752AbhLUTRz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbhLUTRz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:55 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054CCC061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:55 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 203-20020a1c01d4000000b00345bf98da86so1161856wmb.3
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rbHTAoCtRAdudEsITz3WZkrHYqvrwmEh06T/gjLvpRk=;
        b=gN+ndH2d4QS3MC6v3wck1U4EpnounPoiDmS5KPhC3uZwb3R0Cw6pAGFX2fjlnQNtid
         npKqh9o2+cfdTwlTTQOiS5HTfIn4shua5XQfFaaQseEqsbTzknz6nrI+2dBTEcEO8G15
         8B3fSjwb8vUd+GF9knz9EXJLlgKFPVrEBxDWkq3Q7ZJs7vP0T4M3ylx97N9uXEMCHDUl
         MnMrbnQ1fSrCmP4Qwj5BvmCx5VB8PqMlnsah8L8Yw0UZeJLmzSrRtygLtqmBiTRn4VFp
         af1k+DF/dBbFc2jrB3ogCS+oCpkQW0MSvsNmNsiYgkp81Br21TRduRmnyVqumsmFFth6
         +JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rbHTAoCtRAdudEsITz3WZkrHYqvrwmEh06T/gjLvpRk=;
        b=O/dbutZ1gx4ICLbGdflQ5JzJ8VbD1VP+bdwyOTqu2AbKtwRUXYO7G96ujRKAK0KkR6
         EUTpsNcOYp05y9Ep+sGPHzVJ16EVEdn4/Hdgw4V1zPjLlpt1fDrbT11BplTo9IqnEQeD
         KbjQllhdu2yKiizRHfC+BG1qEvuvk3KtYYREbpsxUaFpDFD2b2uHwXtCyG+9xKOsTtGx
         oLY4EQqxPZQ2yweLySt1JrhDo/vDSuSqn3A86YJJ2eT8ahCKjTzBlYt9EAyD+XGqn0kb
         q5MZX1+yx2wSbSr6MyxWy96pB38s2lWpWz2f3V046tiE11WUSQccht9x+lbgI0NAc3CD
         GYmw==
X-Gm-Message-State: AOAM533q5vwHZmxWAmhIGrCJ1R4cCZNMSf39Phgs0rILLgyN71DSQXej
        mGcFmuz8gjk2PP+UjvafWJ3AJjnZdyvGxGrNqGc=
X-Google-Smtp-Source: ABdhPJycfHcBpQz4OnU2TbkkYyw/n0Kw71KAyzsDxUdOc0wAFu4cMbWNxf1R8eC4hKBId/626DD4AA==
X-Received: by 2002:a7b:c08e:: with SMTP id r14mr3923328wmh.68.1640114273621;
        Tue, 21 Dec 2021 11:17:53 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:53 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 12/18] HID: haptic: add functions handling events
Date:   Tue, 21 Dec 2021 19:17:37 +0000
Message-Id: <20211221191743.1893185-13-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
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
 drivers/hid/hid-haptic.c | 72 +++++++++++++++++++++++++++++++++++++++-
 drivers/hid/hid-haptic.h | 20 +++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index ad458bc7d4c5..85c4711f685e 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -51,8 +51,13 @@ bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
 				    struct hid_input *hi, struct hid_field *field)
 {
 	/* Accepted units are either grams or newtons. */
-	if (field->unit == 0x0101 || field->unit == 0xe111)
+	if (field->unit == 0x0101 || field->unit == 0xe111) {
+		haptic->force_logical_minimum = field->logical_minimum;
+		haptic->force_physical_minimum = field->physical_minimum;
+		haptic->force_resolution = input_abs_get_res(hi->input,
+							     ABS_MT_PRESSURE);
 		return true;
+	}
 	return false;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
@@ -352,6 +357,13 @@ static void hid_haptic_destroy(struct ff_device *ff)
 	module_put(THIS_MODULE);
 }
 
+static __u32 convert_force_to_logical(struct hid_haptic_device *haptic,
+					 __u32 value)
+{
+	return (value - haptic->force_physical_minimum) *
+		haptic->force_resolution + haptic->force_logical_minimum;
+}
+
 int hid_haptic_init(struct hid_device *hdev,
 		    struct hid_haptic_device **haptic_ptr)
 {
@@ -459,6 +471,13 @@ int hid_haptic_init(struct hid_device *hdev,
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
@@ -550,3 +569,54 @@ int hid_haptic_init(struct hid_device *hdev,
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
index 2581833125dd..27ae1ed576c4 100644
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
@@ -117,4 +122,19 @@ int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_p
 {
 	return 0;
 }
+static inline
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
+{}
+static inline
+bool hid_haptic_handle_input(struct hid_haptic_device *haptic)
+{
+	return false;
+}
+static inline
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{}
+static inline
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				  __s32 pressure)
+{}
 #endif
-- 
2.34.1.307.g9b7440fafd-goog

