Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F947525F68
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379097AbiEMJj5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379105AbiEMJjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:51 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0D53A709
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:49 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q23so10666863wra.1
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qemkfG6SKXFq49UM+387xqI+WvSUi4dcCe5TaBc3Q9E=;
        b=trgxbZt3y8lTNh/A9Aa8TusjrC8HuZ1cd00efSUgqM8T8oeqF0E1jGnljzEWLFZ29v
         weF29EIPavOlvGZxCeoHp4DvKh++U+OLdq6Obw+9NIvoSOzpKzPTC7af6SG+UelLcfV8
         EM8sMsnImJU21/1Q6g5oXpHVMd6Ja+j4fIGXT0SNSAPPk0EjQzFSBDfy85qToiC1iiVF
         tkY9aCgvICcCIehrr+FFITCwsaZ+9eXHUGRuWItqTlqD3RWoesM1/UbTZmtSQgGBQSjm
         Awf5IhsRcPhLIC1yH+CpCOstnYNtpe9hJV3j2i6orDWhINPIKBVXMeLULjffO/6QjilY
         c4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qemkfG6SKXFq49UM+387xqI+WvSUi4dcCe5TaBc3Q9E=;
        b=Y6COvO1yVH1yFOHkfn6K7gM+koNrUNbgBVhF5rWma//qxZr+EBXxtYmAyfhtvr9Qv4
         aTxfmXcJtQiTnnyTdAQrqXFZgiV6aig4S4auIAvURT0Wmbm5Tdvu4ApVl+GXsPWeX6l9
         G0XT5/LhgVcNHsYtxXfLPB0rZZrgLFtozyVuz9PO7zib6OBaJRmHUuB99iYxLXfnTV7i
         RoRT33FK0tDuRHYDUrMYEodSUQv9COp+O/QDpYJzXi+JXFNBoji5y5kuzUNgpSwcZtLR
         bkYvI4L4WgLcJJpEUwMZtL+I/jNkg9x2m2xYiURzh0GJheF4Sv2+uan5o31linPNXRnJ
         wyYA==
X-Gm-Message-State: AOAM532B7wLbkrCMIY5EILSFutrnWfs3a5yREaMT/OaR9ShvzpKppuFK
        YPO3OB+sNZjl+RcTVN+3z53NQzSX89+5b4vS94M=
X-Google-Smtp-Source: ABdhPJy43Q4w8L0KViq6+Wu18AY6x0wMJFBd4R2OF7HrR1Qa5i8M+lFD47Fu9BV3MjCs/zSBuAzl+w==
X-Received: by 2002:a5d:47a2:0:b0:20c:5f8c:a645 with SMTP id 2-20020a5d47a2000000b0020c5f8ca645mr3119152wrb.526.1652434787649;
        Fri, 13 May 2022 02:39:47 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:47 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 05/17] HID: haptic: initialize haptic device
Date:   Fri, 13 May 2022 09:39:15 +0000
Message-Id: <20220513093927.1632262-6-acz@semihalf.com>
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

Add hid_haptic_init(). Parse autotrigger report to retrieve ordinals for
press and release waveforms.
Implement force feedback functions.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-haptic.c | 447 +++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-haptic.h |   6 +
 2 files changed, 453 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index ea1004319bc0..327106152d79 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -5,12 +5,16 @@
  *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
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
@@ -63,3 +81,432 @@ bool hid_haptic_input_configured(struct hid_device *hdev,
 	return false;
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
+	for (i = 1; i <= haptic->max_waveform_id; i++) {
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
+	if (!haptic->is_forcepad)
+		return 0;
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
+					sizeof(u16), GFP_KERNEL);
+	if (!haptic->hid_usage_map) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+	haptic->duration_map = kcalloc(haptic->max_duration_id + 1,
+				       sizeof(u32), GFP_KERNEL);
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
index ea96b0fb540f..67096cc8c233 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -82,6 +82,7 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 			     unsigned long **bit, int *max);
 bool hid_haptic_input_configured(struct hid_device *hdev,
 				 struct hid_haptic_device *haptic);
+int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
 #else
 static inline
 void hid_haptic_feature_mapping(struct hid_device *hdev,
@@ -110,4 +111,9 @@ bool hid_haptic_input_configured(struct hid_device *hdev,
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
2.36.0.550.gb090851708-goog

