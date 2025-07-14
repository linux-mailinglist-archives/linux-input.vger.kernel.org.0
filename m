Return-Path: <linux-input+bounces-13527-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B9B04318
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589D816EF7B
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FB226462C;
	Mon, 14 Jul 2025 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bok1OWWY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97F025B663
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505792; cv=none; b=sBtnMzJyfoo8cXpjxlEhvmeN97Igef+ndMiZbeJAs7H4hhTa1gthuzJdJPT+g7zk+q76242K4ZFFR3t7HLvfW7NamRCgTpYZM2QhRr5UbbWqEppcq6RuTjELtgVoRZNJU6E2Snrm/d3dmHu1V2KrrJvQnSiIvIPFZTzlA+RI5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505792; c=relaxed/simple;
	bh=tCeGjqnFdNQ0NPSFczvXaBFfpko5DBPet4fKc/RqNQE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jpjryvcX4gcjlmuVt6HoGKdO/qMxMCK3+2PbsvHz29akiosv/ZvuKCueDwdtfqw1opo1R05sJ/JmQrfOHTuoYj+Tkskdy3YdyNAMQPS6MMsDR7n7U/dcecfVYMihKrAByRQCcDMbXAvgZ9bYib5+ZpWvLKNVwRhPJKtkQN8IDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bok1OWWY; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-86d126265baso412738839f.0
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505790; x=1753110590; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nHnoetcpMIxLyjvjZ8ksTCx7rsHXxHPVxp+v8N4Zr/k=;
        b=bok1OWWYRR1xbSD0m0PevtoFw1UNYu/uK5sXSdrPXGZN6byU/WOQCwzMw7lwY7OvkK
         WmCpUZ8Gmji8GDypxY9ktPa0+Y+jcS+JYlJVQxCWORpxxgZH1qMS48uVs2LOfq7Xuace
         YfQHjlSyYQtfHG0jgESpz8lWe9jp2EJIhAbtSFB/Uk6qBSF94ONYp57JfbaZl9Yq6cRe
         diVXzl1332uv7JdbwhO/qpdM9Z7zqYMY++eiD00l2aoq2RfYRSTNYDy7+FWtP5004DB6
         ikScXx6WLKS9zeqRrnXws/MoVno0ZkEd9sBJ7CZxktdgyJkvMSbFvo5+yS3WYfwuEO9R
         voUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505790; x=1753110590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHnoetcpMIxLyjvjZ8ksTCx7rsHXxHPVxp+v8N4Zr/k=;
        b=gZlJ0jh6LP64pttGGF7kBlgb0v4Ev2LTLUUOkj8YieiT4/Dd956BT9RfA9HaioS2PQ
         qaUEoEGmWhwEC/BsRHW1Ek+jzpIiy9M1EgISsQQH6PJPorvWE3v+aj4jgZ7A8embXZd6
         DBV47vRqCogDFPo5P+wiPGqpUNiSCpoBfe8UQrWxBkSuBDTp14NTkQCYTJzFpLwQSerc
         wGxMdi1A+xp0REtEIAY4akZN9dxUqxq4/ww+Ppo3VGZTRPzhab1IfC1CL2wIgB8qTtLK
         YDdiMB7twO/QKn/JudWz+Iij/bIqwEg6qgSj/fveOC8Jr7HG5KRf1qT1QPaTfM7RzV86
         2TUA==
X-Gm-Message-State: AOJu0YyySQc31bsj3TCytXVy5EWn2egFqLU6Tmc5JCVrW4hBr2Fj0tUm
	/oP6teHDhnrvwUlZO90fTMgbVvCq5oEm0KNEb1Gk9/kgtlBLtGmyFXE9raC/UJtVdLzHoXq0BzD
	oyBrQkl3y3Q==
X-Google-Smtp-Source: AGHT+IGb4Ih01RYOXIIFyvcMicKVfqZ7k8uINJiabawClKus6rgEQT02suwBT6IS5Nkz1ZVRzviT8K9QrZdY
X-Received: from iovt22.prod.google.com ([2002:a05:6602:1416:b0:86c:fede:130b])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:6b0f:b0:86c:f8ba:5f08
 with SMTP id ca18e2360f4ac-87977f65e0amr1476438839f.1.1752505789851; Mon, 14
 Jul 2025 08:09:49 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:44 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com>
Subject: [PATCH 11/11] HID: multitouch: add haptic multitouch support
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Add new option (MULTITOUCH_HAPTIC) to mark whether hid-multitouch
should try and configure simple haptic device.
Once this option is configured, and the device is recognized to have simple
haptic capabilities, check input frames for pressure and handle it using
hid_haptic_* API.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/Kconfig          |  11 ++++
 drivers/hid/hid-haptic.h     |  52 +++++++++++++++++
 drivers/hid/hid-multitouch.c | 136 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 198 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index ad6bcc4248cc111705d7cfde2b1481b46353e2d7..b7452f11a4f914f92af582ed054d42ecbcd6cb9e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -817,6 +817,17 @@ config HID_MULTITOUCH
 	  To compile this driver as a module, choose M here: the
 	  module will be called hid-multitouch.
 
+config MULTITOUCH_HAPTIC
+	bool "Simple haptic multitouch support"
+	depends on HID_MULTITOUCH
+	select HID_HAPTIC
+	default n
+	help
+	Support for simple multitouch haptic devices.
+	Adds extra parsing and FF device for the hid multitouch driver.
+	It can be used for Elan 2703 haptic touchpad.
+	To enable, say Y.
+
 config HID_NINTENDO
 	tristate "Nintendo Joy-Con, NSO, and Pro Controller support"
 	depends on NEW_LEDS
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 0a34b0c6d706a985630962acc41f7a8eb73cd343..808cec0b4e51eba1f58b839f3e552493655b7899 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -58,6 +58,7 @@ struct hid_haptic_device {
 	struct hid_haptic_effect stop_effect;
 };
 
+#ifdef CONFIG_MULTITOUCH_HAPTIC
 void hid_haptic_feature_mapping(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_field *field, struct hid_usage
@@ -77,3 +78,54 @@ void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
 void hid_haptic_pressure_reset(struct hid_haptic_device *haptic);
 void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
 				  __s32 pressure);
+#else
+static inline
+void hid_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage
+				*usage)
+{}
+static inline
+bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field)
+{
+	return false;
+}
+static inline
+int hid_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max)
+{
+	return 0;
+}
+static inline
+int hid_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi)
+{
+	return 0;
+}
+static inline
+void hid_haptic_reset(struct hid_device *hdev, struct hid_haptic_device *haptic)
+{}
+static inline
+int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr)
+{
+	return 0;
+}
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
+#endif
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index b41001e02da7e02d492bd85743b359ed7ec16e7f..4ff9ac5022b13a0739dbc7ae5f6ebd84f0114a73 100644
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
@@ -490,6 +494,95 @@ static void mt_get_feature(struct hid_device *hdev, struct hid_report *report)
 	kfree(buf);
 }
 
+#if defined(CONFIG_MULTITOUCH_HAPTIC)
+static int mt_haptic_init(struct hid_device *hdev,
+				struct hid_haptic_device **haptic_ptr)
+{
+	return hid_haptic_init(hdev, haptic_ptr);
+}
+
+static void mt_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage *usage)
+{
+	return hid_haptic_feature_mapping(hdev, haptic, field, usage);
+}
+
+static bool mt_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field)
+{
+	return hid_haptic_check_pressure_unit(haptic, hi, field);
+}
+
+static void mt_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{
+	return hid_haptic_pressure_reset(haptic);
+}
+
+static void mt_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				 __s32 pressure)
+{
+	return hid_haptic_pressure_increase(haptic, pressure);
+}
+
+static int mt_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max)
+{
+	return hid_haptic_input_mapping(hdev, haptic, hi, field, usage, bit, max);
+}
+
+static int mt_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi)
+{
+	return hid_haptic_input_configured(hdev, haptic, hi);
+}
+#else
+static int mt_haptic_init(struct hid_device *hdev,
+				struct hid_haptic_device **haptic_ptr)
+{
+	return 0;
+}
+
+static void mt_haptic_feature_mapping(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_field *field, struct hid_usage *usage)
+{}
+
+static bool mt_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
+				    struct hid_input *hi, struct hid_field *field)
+{
+	return 0;
+}
+
+static void mt_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{}
+
+static void mt_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				 __s32 pressure)
+{}
+
+static int mt_haptic_input_mapping(struct hid_device *hdev,
+			     struct hid_haptic_device *haptic,
+			     struct hid_input *hi,
+			     struct hid_field *field, struct hid_usage *usage,
+			     unsigned long **bit, int *max)
+{
+	return 0;
+}
+
+static int mt_haptic_input_configured(struct hid_device *hdev,
+				struct hid_haptic_device *haptic,
+				struct hid_input *hi)
+{
+	return 0;
+}
+#endif
+
+
 static void mt_feature_mapping(struct hid_device *hdev,
 		struct hid_field *field, struct hid_usage *usage)
 {
@@ -525,6 +618,8 @@ static void mt_feature_mapping(struct hid_device *hdev,
 			mt_get_feature(hdev, field->report);
 		break;
 	}
+
+	mt_haptic_feature_mapping(hdev, td->haptic, field, usage);
 }
 
 static void set_abs(struct input_dev *input, unsigned int code,
@@ -856,6 +951,9 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case HID_DG_TIPPRESSURE:
 			set_abs(hi->input, ABS_MT_PRESSURE, field,
 				cls->sn_pressure);
+			td->is_haptic_touchpad =
+				mt_haptic_check_pressure_unit(td->haptic,
+							       hi, field);
 			MT_STORE_FIELD(p);
 			return 1;
 		case HID_DG_SCANTIME:
@@ -980,6 +1078,8 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
 
 	app->num_received = 0;
 	app->left_button_state = 0;
+	if (td->is_haptic_touchpad)
+		mt_haptic_pressure_reset(td->haptic);
 
 	if (test_bit(MT_IO_FLAGS_ACTIVE_SLOTS, &td->mt_io_flags))
 		set_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags);
@@ -1137,6 +1237,9 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
 			minor = minor >> 1;
 		}
 
+		if (td->is_haptic_touchpad)
+			mt_haptic_pressure_increase(td->haptic, *slot->p);
+
 		x = hdev->quirks & HID_QUIRK_X_INVERT ?
 			input_abs_get_max(input, ABS_MT_POSITION_X) - *slot->x :
 			*slot->x;
@@ -1324,6 +1427,9 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (cls->is_indirect)
 		app->mt_flags |= INPUT_MT_POINTER;
 
+	if (td->is_haptic_touchpad)
+		app->mt_flags |= INPUT_MT_TOTAL_FORCE;
+
 	if (app->quirks & MT_QUIRK_NOT_SEEN_MEANS_UP)
 		app->mt_flags |= INPUT_MT_DROP_UNUSED;
 
@@ -1359,6 +1465,7 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	struct mt_device *td = hid_get_drvdata(hdev);
 	struct mt_application *application;
 	struct mt_report_data *rdata;
+	int ret;
 
 	rdata = mt_find_report_data(td, field->report);
 	if (!rdata) {
@@ -1421,6 +1528,11 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	if (field->physical == HID_DG_STYLUS)
 		hi->application = HID_DG_STYLUS;
 
+	ret = mt_haptic_input_mapping(hdev, td->haptic, hi, field, usage, bit,
+				       max);
+	if (ret != 0)
+		return ret;
+
 	/* let hid-core decide for the others */
 	return 0;
 }
@@ -1635,6 +1747,14 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	struct hid_report *report;
 	int ret;
 
+	if (td->is_haptic_touchpad && (td->mtclass.name == MT_CLS_WIN_8 ||
+	    td->mtclass.name == MT_CLS_WIN_8_FORCE_MULTI_INPUT)) {
+		if (mt_haptic_input_configured(hdev, td->haptic, hi) == 0)
+			td->is_haptic_touchpad = false;
+	} else {
+		td->is_haptic_touchpad = false;
+	}
+
 	list_for_each_entry(report, &hi->reports, hidinput_list) {
 		rdata = mt_find_report_data(td, report);
 		if (!rdata) {
@@ -1764,7 +1884,6 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	int ret, i;
 	struct mt_device *td;
 	const struct mt_class *mtclass = mt_classes; /* MT_CLS_DEFAULT */
-
 	for (i = 0; mt_classes[i].name ; i++) {
 		if (id->driver_data == mt_classes[i].name) {
 			mtclass = &(mt_classes[i]);
@@ -1777,6 +1896,10 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
 		return -ENOMEM;
 	}
+	td->haptic = kzalloc(sizeof(*(td->haptic)), GFP_KERNEL);
+	if (!td->haptic)
+		return -ENOMEM;
+	td->haptic->hdev = hdev;
 	td->hdev = hdev;
 	td->mtclass = *mtclass;
 	td->inputmode_value = MT_INPUTMODE_TOUCHSCREEN;
@@ -1840,6 +1963,17 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
 
+	if (td->is_haptic_touchpad) {
+		if (mt_haptic_init(hdev, &td->haptic)) {
+			dev_warn(&hdev->dev, "Cannot allocate haptic for %s\n",
+				 hdev->name);
+			td->is_haptic_touchpad = false;
+			kfree(td->haptic);
+		}
+	} else {
+		kfree(td->haptic);
+	}
+
 	return 0;
 }
 

-- 
2.50.0.727.gbf7dc18ff4-goog


