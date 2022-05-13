Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDE9525F86
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379111AbiEMJkC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379114AbiEMJjx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:53 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A0B2A76A3
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:52 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h16so9962019wrb.2
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0o8FpS3T+wY71hcSpCIcEDwQdqsdO67K+SEUgTCk0dA=;
        b=J/hnV2NN/n8X+SPLKFYwrE/NnO1akb5SU2m9feZ4Ii49/2XORIYEZAtSszndEkwvel
         S7xEhfbkKlZYcp5+UTTvBlo5d8ZT373IMftv9vm0VA0wUoFVeEguCp0+WFv0tU5cJek2
         g3XJMlwokdHFOQFP5WsrOXVb6+PnjQq6lSGLaDA240r+75wuniS19uq+B3qRQTlaxt6W
         fpDdaFoI+cfSmp8aPmUCPCUxnnEqw0cL55k79SrGdUBAR9BwHPdl1gT9L++5hLSIIpOo
         +ESflKc3ZEtCm+cvNMHhYL5mkRJ+2/c8FHpIEbPc+22nuefdqcghopLRgq/jXARaF3e1
         PEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0o8FpS3T+wY71hcSpCIcEDwQdqsdO67K+SEUgTCk0dA=;
        b=RmabbzlJ5tCMuw5gmPvDJ9ANU6QrCzjywN29Q/Z3El3pwCY+3tPmCio5Cyw9bOaBG6
         R3tITrUiu3DMOg4nNh1shcEdn0dv0gGiEhbb27m5BAA+903Y8gvmYj/y3Ubie4TOEtyy
         9LnNbopUIvqhzU1xdWIZgsEL4gtm79BmNgyy7UOWEZdvEzPjvlWt98QEgbXLYn1OugAS
         S+zwlXA13SWQBuABDBo91ffC2oCTKDwr/o86HrjU1Kkb69Smk2/VPQo4CG74Kj06OMNj
         k+JVx3HrrFMm5Bne/FcEbwRpsG7tmoqqVfSnEysfUjwboH4U54ImHNu2+anf66TXlFMY
         Dnjw==
X-Gm-Message-State: AOAM5324OLV5b29UiGkpa405zCb4WqCLFrBwRVEMXH6WvOirByFvcc5q
        DD/3YfLMzMobrj77Vkvn0CDgCbO7qwKEVm5wT8w=
X-Google-Smtp-Source: ABdhPJzEFq/ztb+R9kp7HpduT1ULzN0dnmju++bz5ou7P6A6t3w8+yIpmnVh4ENqBwvoB86ZkquPmw==
X-Received: by 2002:a05:6000:1f0f:b0:20c:87b6:df9d with SMTP id bv15-20020a0560001f0f00b0020c87b6df9dmr3345916wrb.115.1652434790847;
        Fri, 13 May 2022 02:39:50 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:50 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 11/17] HID: haptic: add hid_haptic_switch_mode
Date:   Fri, 13 May 2022 09:39:21 +0000
Message-Id: <20220513093927.1632262-12-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index 9b89a1f8a631..3d26bd5d15a4 100644
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
index c26093e3773d..96757a4655ec 100644
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
2.36.0.550.gb090851708-goog

