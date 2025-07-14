Return-Path: <linux-input+bounces-13522-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CA6B042E2
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7FD18964B6
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADB2259CA0;
	Mon, 14 Jul 2025 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NG15GJgf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C9825D55D
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505787; cv=none; b=KH/ewNxuu0esZ/qthLcvheZwWkinRsxWFIBiDn/X34d6CIoQVOmMWJ8/7KgqTFO4dbq2wq9oTt5PSQCWFRG47NsX8wnwDx7Ks65O48rgnjmVGeeV5n/40s3xTD7/qBWWgk3oXQFSKmt0gn0Zgb9aZN2WDlKuKIC069PbdhhOFjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505787; c=relaxed/simple;
	bh=2UzEQwz6IIWkHcbav6H/O9jHS+oVWKPZ8uY23WilaAI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QWo19b3SAHFrXx9NsdY/g9jyPyNsVW1cLks/lOkWuzBrXZdnaXEz/SyeifyFrAMqzrVlmX5RnkwWiNA8XbN6oZLVIuDMmsM6bEN10y9uTjlskp6nFW3SmWMHQmhtE6i2tntlCKL3NZcAScR5ID/Z/3UJrq2WmgOX+wPshEkuud8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NG15GJgf; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-86f4f032308so806260939f.1
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 08:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505784; x=1753110584; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mediJG1fLNIDC9THV1/kgz6rwnJycfDV8hM8YJ4EjSc=;
        b=NG15GJgfqJe29KZ1dA+hzRVle725vznPm9iJ1n97LT2Y9zqgGDi3kYot7Df+P78S9D
         a1H2UtRPmJ7pXwkL3fIO4v1MvqxhGD9stLCJbeyY2KmirZuLc1Hk9kuGzQkt5BZklbcr
         1BEx7mv5M9qA+umUGpQOWz4EuAnJgzOFa3j8J6t2+Tgqv5njK21L+sQ1WSUumMMxIWv9
         DtOr/6mIIDCahWcJ0ZT27ojmQz9mJ3t2mQFX14WswCEcLk7bWVL7Jyu0apltJ/cbke5d
         QTcHJzddIyOU0/AeVxm0eqT5wJTM+0iXPLohJePgSSxGSVU/RCbxjbrik1z94TDxbBld
         wNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505784; x=1753110584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mediJG1fLNIDC9THV1/kgz6rwnJycfDV8hM8YJ4EjSc=;
        b=gElxHWk/RJk0fXu174PLmEcYf27uNDVgMrRz4A6afAKuFTrbmHUBXSDF/i5u4M23Hd
         pGhG+Jp+yxg6b2ojLaBAkd0kBjzeMzgMkKidLRfbCN9jbZVklHx+GFi0t3J6wbmagjAL
         DCyqwvlqTtDU6fXeEjFf3vbnasZxyCFr2tRuaGWaIKZBqnWEhO92A0kwY1GOk5fRWrCm
         evb8a9NzWtbNcIp5ekcOtys+Ep+4kHwXIuiZlHlX+a7QvdXSroghTCy/dXBrWujwIkBn
         nZ+tryeSD+AZkbp2IzmonhbvwhCmfrCTQBGDQ7Sne7kD26R0Rv1dYSdEhoKhDrpdUyIN
         2Njg==
X-Gm-Message-State: AOJu0YyKbpAjvfKFEU+puzbZV31D9omXXDihNM263WesphLaPUn66mBo
	cX3F1ky+OsBSrr7cQSS3Q8fNNuPN0tc+lZc71xbPCUO6k4+xfqIp5ipgCUc5GIUio7xMugkYpuG
	4lLyoaKuqpw==
X-Google-Smtp-Source: AGHT+IEoUQ32fQIF9+YfICmDAr5NBX2A/eDIFYyTM7mmmTcPLjMke9pMARuRndK9qexL9I2exEycGhwqzoRg
X-Received: from iobbh18.prod.google.com ([2002:a05:6602:3712:b0:875:bba9:7a4f])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:7408:b0:876:8790:6ac8
 with SMTP id ca18e2360f4ac-87977f5f085mr1286176539f.1.1752505784374; Mon, 14
 Jul 2025 08:09:44 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:39 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-6-71c7c05748c9@google.com>
Subject: [PATCH 06/11] HID: haptic: initialize haptic device
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Add hid_haptic_init(). Parse autotrigger report to retrieve ordinals for
press and release waveforms.
Implement force feedback functions.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-haptic.c | 438 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-haptic.h |   1 +
 2 files changed, 439 insertions(+)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index d659a430c1a6b06ded31d49efe4bded909671cb6..923b685f0e1e81b7f95567b11209af264c522373 100644
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
@@ -70,3 +88,423 @@ int hid_haptic_input_configured(struct hid_device *hdev,
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
+					haptic->press_ordinal = usage_hid;
+				} else if (field->value[n] ==
+					   (HID_HP_WAVEFORMRELEASE & HID_USAGE)) {
+					haptic->release_ordinal = usage_hid;
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
+	/* Fill the buffer for the effect id */
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
+	effect_set_default(&effect);
+
+	if (effect.u.hid.hid_usage == (HID_HP_WAVEFORMRELEASE & HID_USAGE)) {
+		ordinal = haptic->release_ordinal;
+		if (!ordinal)
+			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
+		else
+			effect.u.hid.hid_usage = HID_HP_WAVEFORMRELEASE &
+				HID_USAGE;
+		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
+				ordinal);
+	} else if (effect.u.hid.hid_usage == (HID_HP_WAVEFORMPRESS & HID_USAGE)) {
+		ordinal = haptic->press_ordinal;
+		if (!ordinal)
+			ordinal = HID_HAPTIC_ORDINAL_WAVEFORMNONE;
+		else
+			effect.u.hid.hid_usage = HID_HP_WAVEFORMPRESS &
+				HID_USAGE;
+		fill_effect_buf(haptic, &effect.u.hid, &haptic->effect[effect_id],
+				ordinal);
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
index fc8979772d00e8b3238b26060c5541065a61811d..9aa910579d09206a2a882a5f708efd8620428f78 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -72,3 +72,4 @@ int hid_haptic_input_mapping(struct hid_device *hdev,
 int hid_haptic_input_configured(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_input *hi);
+int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);

-- 
2.50.0.727.gbf7dc18ff4-goog


