Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85115F7D61
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiJGSab (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiJGSaY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:24 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78615C8210
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:21 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id e10-20020a05600c4e4a00b003b4eff4ab2cso5048235wmq.4
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGxkm6XBvgDiNW7rLvat9h7MScXofNNR407zemwbG/c=;
        b=bgJkCRztb0Vpoz8P7F/umzlbkkLX4yTxGCMhJk0NIDrZ8ak6iYCp39SQ1PFqiurI4b
         P/4efhC4HiwvMWfzMb1eE7SQd49d5Tiv328N5u2qnp0FbqD6QeCeg7+dnMhyobv7UHdk
         4/YBz9selqTjWAtxqBuoQrKZWNn2A6j0FLyciEjjskmyO2sxrhsbzfeEBuBOqNhF9TUH
         FYOQaXG4Y+5yV3xYQo7f+Y9U0Zjp6q7TGUITjn8APxyBK2xtkadQvkk1rvBNSM++OO5X
         hI2HsQd+WtxBI0wEt+bUPHPz0FCaS+nUnLEFcYuUrIYNQBgLX8UxB4oFEtnGV8lctqpk
         XB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGxkm6XBvgDiNW7rLvat9h7MScXofNNR407zemwbG/c=;
        b=xRz86CaQ8Zd4xVVqvOC/FqkktcPtlwu2vZcW1InaGBGBV6VjaKlxCp+lDK4NsXQkMs
         LsNgPhM54RbV8Zl87D6lFOzFSJSpyFkBoLOcnr3sdiSHqf11TBeR1oVTOcPUXTCir/wj
         grmeE/vnczSudyg844mEwCZf4y/kWjAiJasb3VdDlE3/bIxneFOOnmHgqNVgq1oWGoaZ
         wTtVUCjFhIuaFHwz8pDWjQWSBeJBXOwtPsL7qO4P+5bvTOSlxGHrSnApAT/zGqAUKXje
         px2Q00GvLYBmqY0/mnXprYF37lsdPtumg+jYjjPmVz8DVFPQbkGVLYF+rMRKqDGKzmQ0
         rDiQ==
X-Gm-Message-State: ACrzQf3ZyWlDPN0mQqVqvTDb7kK4XZxCpvj9/JSQnmz/JHjGJNClzudO
        kNz88pMTqJU9QfplBY6xJlclGBIgFpiWvn40
X-Google-Smtp-Source: AMsMyM4nMP3vbQZ/et8UIu7JC9PApvmYmi7VFb1n/xVzvf6lxSYDw8UpjNbP+dV9s7WqNH6GrWLL9g==
X-Received: by 2002:a05:600c:3582:b0:3c2:7002:2cb0 with SMTP id p2-20020a05600c358200b003c270022cb0mr4219949wmq.170.1665167419873;
        Fri, 07 Oct 2022 11:30:19 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:19 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 11/17] HID: haptic: add hid_haptic_switch_mode
Date:   Fri,  7 Oct 2022 18:29:39 +0000
Message-Id: <20221007182945.1654046-12-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Function hid_haptic_switch_mode() can be used to turn off and on the
autonomoums mode for the device. If the device is a forcepad andsupports
press and release waveforms, let the kernel handle generation of haptic
feedback instead of the device itself.
Implement hid_haptic_resume() and hid_haptic_suspend() so that the
autonomous mode gets switched off at resume and switched on at suspend.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 92 +++++++++++++++++++++++++++++++++++++---
 drivers/hid/hid-haptic.h | 10 +++++
 2 files changed, 96 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 9b89a1f8a6316..3d26bd5d15a4f 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -5,6 +5,7 @@
  *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
  */
 
+#include <linux/input/mt.h>
 #include <linux/module.h>
 
 #include "hid-haptic.h"
@@ -192,9 +193,60 @@ static void fill_effect_buf(struct hid_haptic_device *haptic,
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
+	if (haptic->is_forcepad && haptic->press_ordinal_cur &&
+	    haptic->release_ordinal_cur)
+		switch_mode(hdev, haptic, HID_HAPTIC_MODE_KERNEL);
+}
+EXPORT_SYMBOL_GPL(hid_haptic_resume);
+
+void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{
+	if (haptic->is_forcepad && haptic->press_ordinal_cur &&
+	    haptic->release_ordinal_cur)
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
@@ -220,6 +272,24 @@ static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *eff
 	fill_effect_buf(haptic, &effect->u.hid, &haptic->effect[effect->id],
 			ordinal);
 
+	/* Mode switching needed only for forcepads. */
+	if (!haptic->is_forcepad)
+		return 0;
+
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
 
@@ -285,6 +355,7 @@ static void effect_set_default(struct ff_effect *effect)
 static int hid_haptic_erase(struct input_dev *dev, int effect_id)
 {
 	struct hid_haptic_device *haptic = dev->ff->private;
+	struct hid_device *hdev = input_get_drvdata(dev);
 	struct ff_effect effect;
 	int ordinal;
 
@@ -295,21 +366,29 @@ static int hid_haptic_erase(struct input_dev *dev, int effect_id)
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
@@ -401,6 +480,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMSTOP] =
 		HID_HP_WAVEFORMSTOP & HID_USAGE;
 
+	mutex_init(&haptic->auto_trigger_mutex);
 	for (r = 0; r < haptic->auto_trigger_report->maxfield; r++)
 		parse_auto_trigger_field(haptic, haptic->auto_trigger_report->field[r]);
 
@@ -582,13 +662,13 @@ void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
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
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index c26093e3773d1..96757a4655ec7 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -82,6 +82,10 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 			     unsigned long **bit, int *max);
 bool hid_haptic_input_configured(struct hid_device *hdev,
 				 struct hid_haptic_device *haptic);
+#ifdef CONFIG_PM
+void hid_haptic_resume(struct hid_device *hdev, struct hid_haptic_device *haptic);
+void hid_haptic_suspend(struct hid_device *hdev, struct hid_haptic_device *haptic);
+#endif
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
 void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
 bool hid_haptic_handle_input(struct hid_haptic_device *haptic);
@@ -116,6 +120,12 @@ bool hid_haptic_input_configured(struct hid_device *hdev,
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
2.38.0.rc1.362.ged0d419d3c-goog

