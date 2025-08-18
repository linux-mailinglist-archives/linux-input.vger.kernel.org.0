Return-Path: <linux-input+bounces-14099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D347B2AB46
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5630B5A3790
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 14:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7B1322DDF;
	Mon, 18 Aug 2025 14:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yYwH4BXL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24048322DA9
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527353; cv=none; b=ZgXgoLecENAFqZABIuq5X76aXpaf9rYwIgXiSj9OAD9/MvdoWV2vxNWsTug4pmZGOl/jAs1y+4CODdkCDn+tA3TSrflyTaCuz8n+GOIGuyy0KPE7d+VE7NIqidlmQnQ8h/OKM+YeO6OUQ+lq61iyXHwfr8RsOxUShogynPfQWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527353; c=relaxed/simple;
	bh=LLDKD3jhhd01cSyNnUJ72AfCscFxZnYBV4yXzLlYTqo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c95LoKDDJ157xDrAkF+JkrOWosznv9YpuAHqoiTLfBnAiAFmcZ/pY/N33MoBmKLH4gKOEf6MQKpONvr3OBCsO/3pym6g+rwbKSMurPdDal3Kuw8lZYlMsvNpF/+E7eM9RidjwcbEMcqYmlswN4cbxSYiX7JUIz/FwSWJXl4vZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yYwH4BXL; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3e570014392so128834175ab.2
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527351; x=1756132151; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6sergV1NCFzSiZ+q+TgB6G9QZTiH10/oQ/v7cI0WS4=;
        b=yYwH4BXLRpPkdDTd8DPpEQ8nykfudYucIX2MC7fKyHBu785pvk5A7KcxpwwIU2y961
         xJAJCa1U53oHvJuTmKnWLCsKy2CfyIlmaldhpnCu1+GbhEOQcAd8sjHbKAyIfvBOLXYo
         3Td+v3ek2eio8RVHObiquTCKxujsRp+iWdgSpnw7P3+p++piRu9ioyWSjwhBUjbZjmPg
         VPJhe+edYIsshlBUs7KyjKZsnlO3iZ/BaKuYfsj4yiBp5/GSuDVRua7lWJOESPXAC6iE
         tYVFYYiC9b9CHPOI7FYuLh2V6O91j6DpNYla5AIiTK/+ne5IVsXM82GFhh8h+XoHNcbG
         VGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527351; x=1756132151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6sergV1NCFzSiZ+q+TgB6G9QZTiH10/oQ/v7cI0WS4=;
        b=PlLWCf5BnWnyVYtWSlFtLaFmLhTXNuXnUReq2Judzyl8KKzs2qwlyOb+tg7aNT/x7F
         pjxuMfJpQQfV9ojZhpuANantuCyMv+fDhsAwiC6XvbyD5W8ehDC5TuqLJ5jAn+WrWwvL
         +4/IK9kTbVfeX4KA5Sj6rI11+VxYRgvqQVd7TcumJUFhO/HusoOLpAsaC0/pNY2k8rBv
         NemWf3QJOTEHRGHm9CV4SARcPPmGscrHMgxLM46SnuCp7eLbmLIITXgJTN03e4+p9Zhl
         UjXQP2KPU0zxy3nh8u+mkn3QEannRPb5ndJuQkn6EG4TxRxgMheh7JCkjAaQDMPkuyGz
         MN1A==
X-Gm-Message-State: AOJu0Yz5iFMzYR38GgznQ7fB9QU1bmlRrR0xUHxuktDpNW/OkOqCjSRx
	fEPNDU6+IZZUs0NZg/685PLRFakO7z+vy/8zzEpkNFk8nlvQFqVDxPYhTSAb+RuZ8yhdr9aBrLZ
	45AMU/rk1TQ==
X-Google-Smtp-Source: AGHT+IEVI4czH0v4ysw3PzKSt8mNpOp3N0G7bFAqtIz9bfKarZAPIeOxGROw17qMCYOdTJuFKSBK+rdcnw2i
X-Received: from jabhb19.prod.google.com ([2002:a05:6638:6c13:b0:4fd:c6b9:3df7])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1b03:b0:3e5:4631:549e
 with SMTP id e9e14a558f8ab-3e57e8b109cmr245148445ab.12.1755527350269; Mon, 18
 Aug 2025 07:29:10 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:11 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-11-ca2546e319d5@google.com>
Subject: [PATCH v2 11/11] HID: multitouch: add haptic multitouch support
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

If CONFIG_HID_HAPTIC is configured, and the device is recognized to have
simple haptic capabilities, try initializing the haptic device, check
input frames for pressure and handle it using hid_haptic_* API.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-haptic.h     | 16 ++++++++++-----
 drivers/hid/hid-multitouch.c | 47 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 73601f429de16bae3b1d877445f7eebf41a69d94..6fbe07a8df42c2dc77681b013a6f948357253bf8 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -107,19 +107,25 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 {
 	return 0;
 }
+static inline
+void hid_haptic_reset(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{}
+static inline
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr)
 {
 	return 0;
 }
 static inline
-void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
-{}
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic) {}
 static inline
-void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
-{}
+bool hid_haptic_handle_input(struct hid_haptic_device *haptic)
+{
+	return false;
+}
+static inline
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic) {}
 static inline
 void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
 				  __s32 pressure)
 {}
 #endif
-
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index b41001e02da7e02d492bd85743b359ed7ec16e7f..bbbd5c49dbd480ecad2a0c074b2f973f099dc054 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -49,6 +49,8 @@ MODULE_LICENSE("GPL");
 
 #include "hid-ids.h"
 
+#include "hid-haptic.h"
+
 /* quirks to control the device */
 #define MT_QUIRK_NOT_SEEN_MEANS_UP	BIT(0)
 #define MT_QUIRK_SLOT_IS_CONTACTID	BIT(1)
@@ -167,11 +169,13 @@ struct mt_report_data {
 struct mt_device {
 	struct mt_class mtclass;	/* our mt device class */
 	struct timer_list release_timer;	/* to release sticky fingers */
+	struct hid_haptic_device *haptic;	/* haptic related configuration */
 	struct hid_device *hdev;	/* hid_device we're attached to */
 	unsigned long mt_io_flags;	/* mt flags (MT_IO_FLAGS_*) */
 	__u8 inputmode_value;	/* InputMode HID feature value */
 	__u8 maxcontacts;
 	bool is_buttonpad;	/* is this device a button pad? */
+	bool is_haptic_touchpad;	/* is this device a haptic touchpad? */
 	bool serial_maybe;	/* need to check for serial protocol */
 
 	struct list_head applications;
@@ -525,6 +529,8 @@ static void mt_feature_mapping(struct hid_device *hdev,
 			mt_get_feature(hdev, field->report);
 		break;
 	}
+
+	hid_haptic_feature_mapping(hdev, td->haptic, field, usage);
 }
 
 static void set_abs(struct input_dev *input, unsigned int code,
@@ -856,6 +862,9 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case HID_DG_TIPPRESSURE:
 			set_abs(hi->input, ABS_MT_PRESSURE, field,
 				cls->sn_pressure);
+			td->is_haptic_touchpad =
+				hid_haptic_check_pressure_unit(td->haptic,
+							       hi, field);
 			MT_STORE_FIELD(p);
 			return 1;
 		case HID_DG_SCANTIME:
@@ -980,6 +989,8 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
 
 	app->num_received = 0;
 	app->left_button_state = 0;
+	if (td->is_haptic_touchpad)
+		hid_haptic_pressure_reset(td->haptic);
 
 	if (test_bit(MT_IO_FLAGS_ACTIVE_SLOTS, &td->mt_io_flags))
 		set_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags);
@@ -1137,6 +1148,9 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 			minor = minor >> 1;
 		}
 
+		if (td->is_haptic_touchpad)
+			hid_haptic_pressure_increase(td->haptic, *slot->p);
+
 		x = hdev->quirks & HID_QUIRK_X_INVERT ?
 			input_abs_get_max(input, ABS_MT_POSITION_X) - *slot->x :
 			*slot->x;
@@ -1324,6 +1338,9 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (cls->is_indirect)
 		app->mt_flags |= INPUT_MT_POINTER;
 
+	if (td->is_haptic_touchpad)
+		app->mt_flags |= INPUT_MT_TOTAL_FORCE;
+
 	if (app->quirks & MT_QUIRK_NOT_SEEN_MEANS_UP)
 		app->mt_flags |= INPUT_MT_DROP_UNUSED;
 
@@ -1359,6 +1376,7 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	struct mt_device *td = hid_get_drvdata(hdev);
 	struct mt_application *application;
 	struct mt_report_data *rdata;
+	int ret;
 
 	rdata = mt_find_report_data(td, field->report);
 	if (!rdata) {
@@ -1421,6 +1439,11 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (field->physical == HID_DG_STYLUS)
 		hi->application = HID_DG_STYLUS;
 
+	ret = hid_haptic_input_mapping(hdev, td->haptic, hi, field, usage, bit,
+				       max);
+	if (ret != 0)
+		return ret;
+
 	/* let hid-core decide for the others */
 	return 0;
 }
@@ -1635,6 +1658,14 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	struct hid_report *report;
 	int ret;
 
+	if (td->is_haptic_touchpad && (td->mtclass.name == MT_CLS_WIN_8 ||
+	    td->mtclass.name == MT_CLS_WIN_8_FORCE_MULTI_INPUT)) {
+		if (hid_haptic_input_configured(hdev, td->haptic, hi) == 0)
+			td->is_haptic_touchpad = false;
+	} else {
+		td->is_haptic_touchpad = false;
+	}
+
 	list_for_each_entry(report, &hi->reports, hidinput_list) {
 		rdata = mt_find_report_data(td, report);
 		if (!rdata) {
@@ -1777,6 +1808,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
 		return -ENOMEM;
 	}
+	td->haptic = devm_kzalloc(&td->hdev->dev, sizeof(*(td->haptic)), GFP_KERNEL);
+	if (!td->haptic)
+		return -ENOMEM;
+
+	td->haptic->hdev = hdev;
 	td->hdev = hdev;
 	td->mtclass = *mtclass;
 	td->inputmode_value = MT_INPUTMODE_TOUCHSCREEN;
@@ -1840,6 +1876,17 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
 
+	if (td->is_haptic_touchpad) {
+		if (hid_haptic_init(hdev, &td->haptic)) {
+			dev_warn(&hdev->dev, "Cannot allocate haptic for %s\n",
+				 hdev->name);
+			td->is_haptic_touchpad = false;
+			devm_kfree(&td->hdev->dev, td->haptic);
+		}
+	} else {
+		devm_kfree(&td->hdev->dev, td->haptic);
+	}
+
 	return 0;
 }
 

-- 
2.51.0.rc1.163.g2494970778-goog


