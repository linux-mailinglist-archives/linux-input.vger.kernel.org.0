Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068E048EFF5
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243134AbiANScn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243143AbiANScf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:35 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417F7C06161C
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:35 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id l4so7657234wmq.3
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g3sB5uCnTT9ZtnzwIjCaF04FDLQYv1DqM96R/bmNdOo=;
        b=mst0nTvIMYtNxl/2nems0zhFYKhZyM9+RBMtHEQDMdMs4gyOwP4CO1v7abin4ov98k
         xVXQSMw5TY6IAowM96ceMm9mKMPR3TON8/T49AWKB+7BT5vHjpGJCUGjxlmC0PeK67BA
         blN2BxhzONQoKfFGr7e+q+S0eqaPB2jqAGhGUfzNZ+HJLYpwIoMOiKOut7O39e1bSOWK
         jdvcyigvWWaWZlZS6bCsrj/pFFSGYg5zCRWkuv5SLGuMo0Cew0e6ni4U62Xhv6b7Y/an
         S9Ege/i+RiHUDe0VCeFM1J06O2Ly5uli/uQXTQGwiJA8C4NSlJ1XiY0Rm4+PoQQwrIJm
         ED0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g3sB5uCnTT9ZtnzwIjCaF04FDLQYv1DqM96R/bmNdOo=;
        b=V1V8M0EQL212ck6gz/kxM8bVIuqPb3PwH0F3ofqm+/M3A8Rgy3iJu2rKekw2fZ5Tan
         VOKWRYeX2r2zTh0s+kmeQYwPTiZ9RX/kUVqm+YZx6Zfx2Mxo54dAYgXg6ef4lda24Ke0
         pRbcjcHMboVnI8Zm4ch90cx2JYKtI3/6giaF1DK1Pgvg25UxgW1eioUQ+RmqPBLe3OoO
         0ZQGeCllXMp4qxlk245GUHtn/r0jZkuiAopmzP1vnDcRVYJlnCnjKj+I4uSCgONkb/pr
         21j1C97hYz1D2Amy0HDb2J8DkGcGKk9TVSOaqpsa6ikHLqTl8UkJa9/gc58nnVhLXcfC
         J4Gw==
X-Gm-Message-State: AOAM533POP/w6Kvy5n//Y5sb11czhwwNH4Aal6ecmHTMgBtIEM0jh6DW
        xYOeSSzqG/J+2Z3qHeiEIbRqdqjA2AH7LJamiXY=
X-Google-Smtp-Source: ABdhPJx58RzTWrweVwG33CLHhBMxCS/6XcUMb1+Waevh/1u1ah0SIhjG1D4AHlx8gfe9VKxhluA8Mw==
X-Received: by 2002:a5d:6612:: with SMTP id n18mr9218152wru.366.1642185153867;
        Fri, 14 Jan 2022 10:32:33 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:33 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 12/16] HID: haptic: add hid_haptic_switch_mode
Date:   Fri, 14 Jan 2022 18:31:48 +0000
Message-Id: <20220114183152.1691659-13-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Function hid_haptic_switch_mode() can be used to turn off and on the
autonomoums mode for the device. If the device supports press and release
waveforms, let the kernel handle generation of haptic feedback instead of
the device itself.
Implement hid_haptic_resume() and hid_haptic_suspend() so that the
autonomous mode gets switched off at resume and switched on at suspend.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 88 ++++++++++++++++++++++++++++++++++++----
 drivers/hid/hid-haptic.h | 10 +++++
 2 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 4a5d5e7b92d1..2035b8a6037f 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -5,6 +5,7 @@
  *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
  */
 
+#include <linux/input/mt.h>
 #include <linux/module.h>
 
 #include "hid-haptic.h"
@@ -199,9 +200,58 @@ static void fill_effect_buf(struct hid_haptic_device *haptic,
 	mutex_unlock(&haptic->manual_trigger_mutex);
 }
 
+static void switch_mode(struct hid_device *hdev, struct hid_haptic_device *haptic,
+			int mode)
+{
+	struct hid_report *rep = haptic->auto_trigger_report;
+	struct hid_field *field;
+	s32 value;
+	int i, j;
+
+	if (mode == HID_HAPTIC_MODE_KERNEL)
+		value = HID_HAPTIC_ORDINAL_WAVEFORMSTOP;
+	else
+		value = haptic->default_auto_trigger;
+
+	mutex_lock(&haptic->auto_trigger_mutex);
+	for (i = 0; i < rep->maxfield; i++) {
+		field = rep->field[i];
+		/* Ignore if report count is out of bounds. */
+		if (field->report_count < 1)
+			continue;
+
+		for (j = 0; j < field->maxusage; j++) {
+			if (field->usage[j].hid == HID_HP_AUTOTRIGGER)
+				field->value[j] = value;
+		}
+	}
+
+	/* send the report */
+	hid_hw_request(hdev, rep, HID_REQ_SET_REPORT);
+	mutex_unlock(&haptic->auto_trigger_mutex);
+	haptic->mode = mode;
+}
+
+#ifdef CONFIG_PM
+void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{
+	if (haptic->press_ordinal_cur && haptic->release_ordinal_cur)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(hid_haptic_resume);
+
+void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{
+	if (haptic->press_ordinal_cur && haptic->release_ordinal_cur)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+}
+EXPORT_SYMBOL_GPL(hid_haptic_suspend);
+#endif
+
 static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *effect,
 				    struct ff_effect *old)
 {
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_device *ff = dev->ff;
 	struct hid_haptic_device *haptic = ff->private;
 	int i, ordinal = 0;
@@ -227,6 +277,20 @@ static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *eff
 	fill_effect_buf(haptic, &effect->u.hid, &haptic->effect[effect->id],
 			ordinal);
 
+	if (effect->id == HID_HAPTIC_RELEASE_EFFECT_ID) {
+		if (haptic->press_ordinal_cur &&
+		    haptic->mode == HID_HAPTIC_MODE_DEVICE) {
+			switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+		}
+		haptic->release_ordinal_cur = ordinal;
+	} else if (effect->id == HID_HAPTIC_PRESS_EFFECT_ID) {
+		if (haptic->release_ordinal_cur &&
+		    haptic->mode == HID_HAPTIC_MODE_DEVICE) {
+			switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+		}
+		haptic->press_ordinal_cur = ordinal;
+	}
+
 	return 0;
 }
 
@@ -292,6 +356,7 @@ static void effect_set_default(struct ff_effect *effect)
 static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 {
 	struct hid_haptic_device *haptic = dev->ff->private;
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_effect effect;
 	int ordinal;
 
@@ -299,21 +364,29 @@ static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 	switch (effect_id) {
 	case HID_HAPTIC_RELEASE_EFFECT_ID:
 		ordinal = haptic->release_ordinal_orig;
-		if (!ordinal)
+		haptic->release_ordinal_cur = ordinal;
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
-		else
+			if (haptic->mode == HID_HAPTIC_MODE_KERNEL)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		} else {
 			effect.u.hid.hid_usage = HID_HP_WAVEFORMRELEASE &
 				HID_USAGE;
+		}
 		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
 				ordinal);
 		break;
 	case HID_HAPTIC_PRESS_EFFECT_ID:
 		ordinal = haptic->press_ordinal_orig;
-		if (!ordinal)
+		haptic->press_ordinal_cur = ordinal;
+		if (!ordinal) {
 			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
-		else
+			if (haptic->mode == HID_HAPTIC_MODE_KERNEL)
+				switch_mode(hdev, haptic, HID_HAPTIC_MODE_DEVICE);
+		} else {
 			effect.u.hid.hid_usage = HID_HP_WAVEFORMPRESS &
 				HID_USAGE;
+		}
 		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
 				ordinal);
 		break;
@@ -405,6 +478,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMSTOP] =
 		HID_HP_WAVEFORMSTOP & HID_USAGE;
 
+	mutex_init(&haptic->auto_trigger_mutex);
 	for (r = 0; r < haptic->auto_trigger_report->maxfield; r++)
 		parse_auto_trigger_field(haptic, haptic->auto_trigger_report->field[r]);
 
@@ -580,13 +654,13 @@ void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
 	if (!prev_pressed_state && haptic->pressed_state &&
 	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
 		spin_lock_irqsave(&input->event_lock, flags);
-		input->ff->playback(input, PRESS_HID_EFFECT_ID, 1);
+		input->ff->playback(input, HID_HAPTIC_PRESS_EFFECT_ID, 1);
 		spin_unlock_irqrestore(&input->event_lock, flags);
 	}
 	if (prev_pressed_state && !haptic->pressed_state &&
 	    haptic->mode == HID_HAPTIC_MODE_KERNEL) {
 		spin_lock_irqsave(&input->event_lock, flags);
-		input->ff->playback(input, RELEASE_HID_EFFECT_ID, 1);
+		input->ff->playback(input, HID_HAPTIC_RELEASE_EFFECT_ID, 1);
 		spin_unlock_irqrestore(&input->event_lock, flags);
 	}
 }
@@ -597,8 +671,6 @@ bool hid_haptic_handle_input(struct hid_haptic_device *haptic)
 	if (haptic->mode == HID_HAPTIC_MODE_KERNEL) {
 		input_event(haptic->input_dev, EV_KEY, BTN_LEFT,
 			    haptic->pressed_state);
-		input_event(haptic->input_dev, EV_ABS, ABS_PRESSURE,
-			    haptic->pressure_sum);
 		return true;
 	}
 	return false;
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 586f20be0061..280534be7e81 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -82,6 +82,10 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 int hid_haptic_input_configured(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_input *hi);
+#ifdef CONFIG_PM
+void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic);
+void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic);
+#endif
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
 void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
 bool hid_haptic_handle_input(struct hid_haptic_device *haptic);
@@ -117,6 +121,12 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 {
 	return 0;
 }
+#ifdef CONFIG_PM
+static inline
+void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic) {}
+static inline
+void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic) {}
+#endif
 static inline
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr)
 {
-- 
2.34.1.703.g22d0c6ccf7-goog

