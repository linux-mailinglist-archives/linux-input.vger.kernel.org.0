Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B630A47C75A
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241744AbhLUTRx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241746AbhLUTRx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:53 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A413C061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:53 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id g132so77475wmg.2
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ev2sZ7oE+x7h39+b3vSh344SBuXP/y6vNWeQ9ZHs/jg=;
        b=lolj1jLA41ETxNfWP32IIPMycTwfurdXH/ieAedFyM4SQ7Q5rq1lDGoXW3lxmW5/Dt
         fgURVJxBIW5qF0PazUvwgF3s8IoQ0jABxgGhNxf2lTXUI5FxVvAad65929UIkrj0DZDj
         q038aRi/q4sDrf2/LG12ddni0u5sKYnnF+JWeOeRW4zHD9ZARyaKathti/MZnZosYOlT
         xfqh54lK+4721oqi2jVDWj4iFHbXVrrL1sY0P7q4/kJNytcghqPOzP4wIrSddbJA9VZ4
         TdyScTEIxwi5zwrTMWZdRa68sZSjSHhXo9Rtx+C+qkneytde35ByqT4z7nwLBErhzKyR
         4/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ev2sZ7oE+x7h39+b3vSh344SBuXP/y6vNWeQ9ZHs/jg=;
        b=p5cMkWnPMz0xL3amCR5g1bcgjS+Sm2NMUTB7xUBW/K3L9mju3VpoPTnnq6YpUmRKDx
         +taUF2KX6D8Z5ybwOJJDTrlPDSRRdD6GBAC7T5mBapMCbBXHnz/h7wBVgqSmNcuExajU
         8B2gvcQSBFuQI99aLnbG4ClrvilT4Xd5fq37ncKs1Y1KrlE42F/2mUymBjmm2ron7u/V
         ewkohg7NwQp0jQAWhYB4mfaoBZ7lUsKa0u8H54UXKMzZs51q9AwMlz71499vWhgtTTyQ
         OK8tWv5SGWVKKOXG088TQuuqLTnGLm7iJq5KTB2KoWE8+Pj2Bb8SkzRYYkJY46er5qN3
         rL7g==
X-Gm-Message-State: AOAM531ute4Fj2SAEU2hiQdQt2X2IjZXjccSi4P5O/ZbkYCaJeo/q0UG
        dR5ZoNvVJJ9sSTPSMROGp1IcHv84qyk+pR25dlw=
X-Google-Smtp-Source: ABdhPJwPKxF3wLDLlFH1yMsZHaW7+NGn7VIObvgqDWe0rlz0VZLQVSsTn8caEPDgnrc7sT7POEHKyg==
X-Received: by 2002:a05:600c:3acd:: with SMTP id d13mr4058163wms.37.1640114271786;
        Tue, 21 Dec 2021 11:17:51 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:51 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 08/18] HID: haptic: initialize haptic device
Date:   Tue, 21 Dec 2021 19:17:33 +0000
Message-Id: <20211221191743.1893185-9-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add hid_haptic_init(). Parse autotrigger report to retrieve ordinals for
press and release waveforms.
Implement force feedback functions.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 445 +++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-haptic.h |   6 +
 2 files changed, 451 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index f130ec96a240..b66bde7475e4 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -8,12 +8,16 @@
 /*
  */
 
+#include <linux/module.h>
+
 #include "hid-haptic.h"
 
 void hid_haptic_feature_mapping(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_field *field, struct hid_usage *usage)
 {
+	u16 usage_hid;
+
 	if (usage->hid == HID_HP_AUTOTRIGGER) {
 		if (usage->usage_index >= field->report_count) {
 			dev_err(&hdev->dev,
@@ -25,6 +29,20 @@ void hid_haptic_feature_mapping(struct hid_device *hdev,
 		haptic->default_auto_trigger =
 			field->value[usage->usage_index];
 		haptic->auto_trigger_report = field->report;
+	} else if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ORDINAL) {
+		usage_hid = usage->hid & HID_USAGE;
+		switch (field->logical) {
+		case HID_HP_WAVEFORMLIST:
+			if (usage_hid > haptic->max_waveform_id)
+				haptic->max_waveform_id = usage_hid;
+			break;
+		case HID_HP_DURATIONLIST:
+			if (usage_hid > haptic->max_duration_id)
+				haptic->max_duration_id = usage_hid;
+			break;
+		default:
+			break;
+		}
 	}
 }
 EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
@@ -71,3 +89,430 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 	return -1;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_input_configured);
+
+static void parse_auto_trigger_field(struct hid_haptic_device *haptic,
+				     struct hid_field *field)
+{
+	int count = field->report_count;
+	int n;
+	u16 usage_hid;
+
+	for (n = 0; n < count; n++) {
+		switch (field->usage[n].hid & HID_USAGE_PAGE) {
+		case HID_UP_ORDINAL:
+			usage_hid = field->usage[n].hid & HID_USAGE;
+			switch (field->logical) {
+			case HID_HP_WAVEFORMLIST:
+				haptic->hid_usage_map[usage_hid] = field->value[n];
+				if (field->value[n] ==
+				    (HID_HP_WAVEFORMPRESS & HID_USAGE)) {
+					haptic->press_ordinal_orig = usage_hid;
+					haptic->press_ordinal_cur = usage_hid;
+				} else if (field->value[n] ==
+					   (HID_HP_WAVEFORMRELEASE & HID_USAGE)) {
+					haptic->release_ordinal_orig = usage_hid;
+					haptic->release_ordinal_cur = usage_hid;
+				}
+				break;
+			case HID_HP_DURATIONLIST:
+				haptic->duration_map[usage_hid] =
+					field->value[n];
+				break;
+			default:
+				break;
+			}
+			break;
+		case HID_UP_HAPTIC:
+			switch (field->usage[n].hid) {
+			case HID_HP_WAVEFORMVENDORID:
+				haptic->vendor_id = field->value[n];
+				break;
+			case HID_HP_WAVEFORMVENDORPAGE:
+				haptic->vendor_page = field->value[n];
+				break;
+			default:
+				break;
+			}
+			break;
+		default:
+			/* Should not really happen */
+			break;
+		}
+	}
+}
+
+static void fill_effect_buf(struct hid_haptic_device *haptic,
+			    struct ff_hid_effect *effect,
+			    struct hid_haptic_effect *haptic_effect,
+			    int waveform_ordinal)
+{
+	struct hid_report *rep = haptic->manual_trigger_report;
+	struct hid_usage *usage;
+	struct hid_field *field;
+	s32 value;
+	int i, j;
+	u8 *buf = haptic_effect->report_buf;
+
+	mutex_lock(&haptic->manual_trigger_mutex);
+	for (i = 0; i < rep->maxfield; i++) {
+		field = rep->field[i];
+		/* Ignore if report count is out of bounds. */
+		if (field->report_count < 1)
+			continue;
+
+		for (j = 0; j < field->maxusage; j++) {
+			usage = &field->usage[j];
+
+			switch (usage->hid) {
+			case HID_HP_INTENSITY:
+				if (effect->intensity > 100) {
+					value = field->logical_maximum;
+				} else {
+					value = field->logical_minimum +
+						effect->intensity *
+						(field->logical_maximum -
+						 field->logical_minimum) / 100;
+				}
+				break;
+			case HID_HP_REPEATCOUNT:
+				value = effect->repeat_count;
+				break;
+			case HID_HP_RETRIGGERPERIOD:
+				value = effect->retrigger_period;
+				break;
+			case HID_HP_MANUALTRIGGER:
+				value = waveform_ordinal;
+				break;
+			default:
+				break;
+			}
+
+			field->value[j] = value;
+		}
+	}
+
+	hid_output_report(rep, buf);
+	mutex_unlock(&haptic->manual_trigger_mutex);
+}
+
+static int hid_haptic_upload_effect(struct input_dev *dev, struct ff_effect *effect,
+				    struct ff_effect *old)
+{
+	struct ff_device *ff = dev->ff;
+	struct hid_haptic_device *haptic = ff->private;
+	int i, ordinal = 0;
+
+	/* If vendor range, check vendor id and page */
+	if (effect->u.hid.hid_usage >= (HID_HP_VENDORWAVEFORMMIN & HID_USAGE) &&
+	    effect->u.hid.hid_usage <= (HID_HP_VENDORWAVEFORMMAX & HID_USAGE) &&
+	    (effect->u.hid.vendor_id != haptic->vendor_id ||
+	     effect->u.hid.vendor_waveform_page != haptic->vendor_page))
+		return -EINVAL;
+
+	/* Check hid_usage */
+	for (i = 1; i < haptic->max_waveform_id; i++) {
+		if (haptic->hid_usage_map[i] == effect->u.hid.hid_usage) {
+			ordinal = i;
+			break;
+		}
+	}
+	if (ordinal < 1)
+		return -EINVAL;
+
+	/* Fill the buffer for the efect id */
+	fill_effect_buf(haptic, &effect->u.hid, &haptic->effect[effect->id],
+			ordinal);
+
+	return 0;
+}
+
+static int play_effect(struct hid_device *hdev, struct hid_haptic_device *haptic,
+		       struct hid_haptic_effect *effect)
+{
+	int ret;
+
+	ret = hid_hw_output_report(hdev, effect->report_buf,
+				   haptic->manual_trigger_report_len);
+	if (ret < 0) {
+		ret = hid_hw_raw_request(hdev,
+					 haptic->manual_trigger_report->id,
+					 effect->report_buf,
+					 haptic->manual_trigger_report_len,
+					 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+
+	}
+
+	return ret;
+}
+
+static void haptic_work_handler(struct work_struct *work)
+{
+
+	struct hid_haptic_effect *effect = container_of(work,
+							struct hid_haptic_effect,
+							work);
+	struct input_dev *dev = effect->input_dev;
+	struct hid_device *hdev = input_get_drvdata(dev);
+	struct hid_haptic_device *haptic = dev->ff->private;
+
+	mutex_lock(&haptic->manual_trigger_mutex);
+	if (effect != &haptic->stop_effect)
+		play_effect(hdev, haptic, &haptic->stop_effect);
+
+	play_effect(hdev, haptic, effect);
+	mutex_unlock(&haptic->manual_trigger_mutex);
+
+}
+
+static int hid_haptic_playback(struct input_dev *dev, int effect_id, int value)
+{
+	struct hid_haptic_device *haptic = dev->ff->private;
+
+	if (value)
+		queue_work(haptic->wq, &haptic->effect[effect_id].work);
+	else
+		queue_work(haptic->wq, &haptic->stop_effect.work);
+
+	return 0;
+}
+
+static void effect_set_default(struct ff_effect *effect)
+{
+	effect->type = FF_HID;
+	effect->id = -1;
+	effect->u.hid.hid_usage = HID_HP_WAVEFORMNONE & HID_USAGE;
+	effect->u.hid.intensity = 100;
+	effect->u.hid.retrigger_period = 0;
+	effect->u.hid.repeat_count = 0;
+}
+
+static int hid_haptic_erase(struct input_dev *dev, int effect_id)
+{
+	struct hid_haptic_device *haptic = dev->ff->private;
+	struct ff_effect effect;
+	int ordinal;
+
+	effect_set_default(&effect);
+	switch (effect_id) {
+	case HID_HAPTIC_RELEASE_EFFECT_ID:
+		ordinal = haptic->release_ordinal_orig;
+		if (!ordinal)
+			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
+		else
+			effect.u.hid.hid_usage = HID_HP_WAVEFORMRELEASE &
+				HID_USAGE;
+		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
+				ordinal);
+		break;
+	case HID_HAPTIC_PRESS_EFFECT_ID:
+		ordinal = haptic->press_ordinal_orig;
+		if (!ordinal)
+			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
+		else
+			effect.u.hid.hid_usage = HID_HP_WAVEFORMPRESS &
+				HID_USAGE;
+		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
+				ordinal);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void hid_haptic_destroy(struct ff_device *ff)
+{
+	struct hid_haptic_device *haptic = ff->private;
+	struct hid_device *hdev = haptic->hdev;
+	int r;
+
+	if (hdev)
+		put_device(&hdev->dev);
+
+	kfree(haptic->stop_effect.report_buf);
+	haptic->stop_effect.report_buf = NULL;
+
+	if (haptic->effect) {
+		for (r = 0; r < ff->max_effects; r++)
+			kfree(haptic->effect[r].report_buf);
+		kfree(haptic->effect);
+	}
+	haptic->effect = NULL;
+
+	destroy_workqueue(haptic->wq);
+	haptic->wq = NULL;
+
+	kfree(haptic->duration_map);
+	haptic->duration_map = NULL;
+
+	kfree(haptic->hid_usage_map);
+	haptic->hid_usage_map = NULL;
+
+	module_put(THIS_MODULE);
+}
+
+int hid_haptic_init(struct hid_device *hdev,
+		    struct hid_haptic_device **haptic_ptr)
+{
+	struct hid_haptic_device *haptic = *haptic_ptr;
+	struct input_dev *dev = NULL;
+	struct hid_input *hidinput;
+	struct ff_device *ff;
+	int ret = 0, r;
+	struct ff_hid_effect stop_effect = {
+		.hid_usage = HID_HP_WAVEFORMSTOP & HID_USAGE,
+	};
+	const char *prefix = "hid-haptic";
+	char *name;
+	int (*flush)(struct input_dev *dev, struct file *file);
+	int (*event)(struct input_dev *dev, unsigned int type, unsigned int code, int value);
+
+	haptic->hdev = hdev;
+	haptic->max_waveform_id = max(2u, haptic->max_waveform_id);
+	haptic->max_duration_id = max(2u, haptic->max_duration_id);
+
+	haptic->hid_usage_map = kcalloc(haptic->max_waveform_id + 1,
+					sizeof(__u16), GFP_KERNEL);
+	if (!haptic->hid_usage_map) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+	haptic->duration_map = kcalloc(haptic->max_duration_id + 1,
+				       sizeof(__u32), GFP_KERNEL);
+	if (!haptic->duration_map) {
+		ret = -ENOMEM;
+		goto usage_map;
+	}
+
+	if (haptic->max_waveform_id != haptic->max_duration_id)
+		dev_warn(&hdev->dev,
+			 "Haptic duration and waveform lists have different max id (%u and %u).\n",
+			 haptic->max_duration_id, haptic->max_waveform_id);
+
+	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMNONE] =
+		HID_HP_WAVEFORMNONE & HID_USAGE;
+	haptic->hid_usage_map[HID_HAPTIC_ORDINAL_WAVEFORMSTOP] =
+		HID_HP_WAVEFORMSTOP & HID_USAGE;
+
+	for (r = 0; r < haptic->auto_trigger_report->maxfield; r++)
+		parse_auto_trigger_field(haptic, haptic->auto_trigger_report->field[r]);
+
+	list_for_each_entry(hidinput, &hdev->inputs, list) {
+		if (hidinput->application == HID_DG_TOUCHPAD) {
+			dev = hidinput->input;
+			break;
+		}
+	}
+
+	if (!dev) {
+		dev_err(&hdev->dev, "Failed to find the input device\n");
+		ret = -ENODEV;
+		goto duration_map;
+	}
+
+	haptic->input_dev = dev;
+	haptic->manual_trigger_report_len =
+		hid_report_len(haptic->manual_trigger_report);
+	mutex_init(&haptic->manual_trigger_mutex);
+	name = kmalloc(strlen(prefix) + strlen(hdev->name) + 2, GFP_KERNEL);
+	if (name) {
+		sprintf(name, "%s %s", prefix, hdev->name);
+		haptic->wq = create_singlethread_workqueue(name);
+		kfree(name);
+	}
+	if (!haptic->wq) {
+		ret = -ENOMEM;
+		goto duration_map;
+	}
+	haptic->effect = kcalloc(FF_MAX_EFFECTS,
+				 sizeof(struct hid_haptic_effect), GFP_KERNEL);
+	if (!haptic->effect) {
+		ret = -ENOMEM;
+		goto output_queue;
+	}
+	for (r = 0; r < FF_MAX_EFFECTS; r++) {
+		haptic->effect[r].report_buf =
+			hid_alloc_report_buf(haptic->manual_trigger_report,
+					     GFP_KERNEL);
+		if (!haptic->effect[r].report_buf) {
+			dev_err(&hdev->dev,
+				"Failed to allocate a buffer for an effect.\n");
+			ret = -ENOMEM;
+			goto buffer_free;
+		}
+		haptic->effect[r].input_dev = dev;
+		INIT_WORK(&haptic->effect[r].work, haptic_work_handler);
+	}
+	haptic->stop_effect.report_buf =
+		hid_alloc_report_buf(haptic->manual_trigger_report,
+				     GFP_KERNEL);
+	if (!haptic->stop_effect.report_buf) {
+		dev_err(&hdev->dev,
+			"Failed to allocate a buffer for stop effect.\n");
+		ret = -ENOMEM;
+		goto buffer_free;
+	}
+	haptic->stop_effect.input_dev = dev;
+	INIT_WORK(&haptic->stop_effect.work, haptic_work_handler);
+	fill_effect_buf(haptic, &stop_effect, &haptic->stop_effect,
+			HID_HAPTIC_ORDINAL_WAVEFORMSTOP);
+
+	input_set_capability(dev, EV_FF, FF_HID);
+
+	flush = dev->flush;
+	event = dev->event;
+	ret = input_ff_create(dev, FF_MAX_EFFECTS);
+	if (ret) {
+		dev_err(&hdev->dev, "Failed to create ff device.\n");
+		goto stop_buffer_free;
+	}
+
+	ff = dev->ff;
+	ff->private = haptic;
+	ff->upload = hid_haptic_upload_effect;
+	ff->playback = hid_haptic_playback;
+	ff->erase = hid_haptic_erase;
+	ff->destroy = hid_haptic_destroy;
+	if (!try_module_get(THIS_MODULE)) {
+		dev_err(&hdev->dev, "Failed to increase module count.\n");
+		goto input_free;
+	}
+	if (!get_device(&hdev->dev)) {
+		dev_err(&hdev->dev, "Failed to get hdev device.\n");
+		module_put(THIS_MODULE);
+		goto input_free;
+	}
+	return 0;
+
+input_free:
+	input_ff_destroy(dev);
+	/* Do not let double free happen, input_ff_destroy will call
+	 * hid_haptic_destroy.
+	 */
+	*haptic_ptr = NULL;
+	/* Restore dev flush and event */
+	dev->flush = flush;
+	dev->event = event;
+	return ret;
+stop_buffer_free:
+	kfree(haptic->stop_effect.report_buf);
+	haptic->stop_effect.report_buf = NULL;
+buffer_free:
+	while (--r >= 0)
+		kfree(haptic->effect[r].report_buf);
+	kfree(haptic->effect);
+	haptic->effect = NULL;
+output_queue:
+	destroy_workqueue(haptic->wq);
+	haptic->wq = NULL;
+duration_map:
+	kfree(haptic->duration_map);
+	haptic->duration_map = NULL;
+usage_map:
+	kfree(haptic->hid_usage_map);
+	haptic->hid_usage_map = NULL;
+exit:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_init);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 4645d6cfd55a..2581833125dd 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -82,6 +82,7 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 int hid_haptic_input_configured(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_input *hi);
+int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
 #else
 static inline
 void hid_haptic_feature_mapping(struct hid_device *hdev,
@@ -111,4 +112,9 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 {
 	return 0;
 }
+static inline
+int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr)
+{
+	return 0;
+}
 #endif
-- 
2.34.1.307.g9b7440fafd-goog

