Return-Path: <linux-input+bounces-16009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4203BC4FDE2
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 22:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B95543B4728
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 21:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6115E352F93;
	Tue, 11 Nov 2025 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hSda865D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2631326955
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 21:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762896858; cv=none; b=m5atBlOpY3F0GfX+L2KZQXFl6OH54/bMSjR2os9Z7Ifv7C4pK9xRaP4aNG/8ldj8N41KZ3MpfWuX9MVI3xLanR22Owez9/0j4ZRltQ4/i0Tati3WoPjzJCQPNTxfFhWB2N7lrIzC26LLGxVZIh/KBtBdtPu9dP6kxV0XRJwoADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762896858; c=relaxed/simple;
	bh=pM90KdOVsx60/1xAcxMTwwy+eboy8y718ax5DgEnRwA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IPGFwg2Ri8PEkqf6XfvEpR5MRn1BjagXgu2yaJyUc2CxzdDqnDYb6mgCkp5+VvIK8gExONjNQo7q3x1qBvmydyhTdU1W2YlZtof1/uDSFRw6HEs/V126iZf8tVmLclBj0Dqe6IWILM8FNcu2JqCt9D+XB5Ysz26+nrvWhr7I9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hSda865D; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-3c9aedc1ff1so115755fac.0
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 13:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762896856; x=1763501656; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f/cYCc4RTNOJkKd7yZrii8gnbE8VkJGmYPFJwXfRCz4=;
        b=hSda865DX/cbUgoQ1juPvXUP//DWGiWazu/k7BAL+/ayH8d/+Zc0lrUKKn52o6QvYo
         rjMeMZUjZ/+iCwKwexfh3nsKn/tk6vkbdUXctEvmTb6fjpLoYY9JfbJsLrQ3VeRog1Eu
         k3iYg/CO7/Nzpc3i1OarG8a0J2SRSYCmvtnhxNu6wen9h5MJK2JvqdjYgEva0bJNDLzK
         HbC6evIqHmR7kYGEWD8h6M6qB1m2IEwbnJeKtZ4Yyo3pIE2K5FxIQoy9rDgj0TuBNzNN
         N6DaL/ykUPj5e7kKsN1Hnmv/b4jVzlO97PnApScyTFl1ZVtUH+7834a34u6iLP4+mIEm
         BBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762896856; x=1763501656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/cYCc4RTNOJkKd7yZrii8gnbE8VkJGmYPFJwXfRCz4=;
        b=JRBHpoYB58OqtZlY8P9olKHklybSDw/Y9EIQuCIzFs2kTBxgHC8rinhO9z7OXHNsVl
         Aiyfylfn2vy6kQtP13RDEi5u9OJoqiudzYv90jSn9ZDEZiJBlnCoTpFSs+h3a3DYHAzQ
         FjUstMLesyKv3fC/Xe10hslniHlmKHvRZnr01yslSoClFGYB4BVVywQDTkkgv0Zbm6nc
         B0UesCqtQYM1gPFZPFS0IOHXqCcL6IphM9sGgVqSArKSzOP5c/3gpRyk0DlJwBjetJ0U
         KG1NEOMbUw5XMSwIPnvtPWnmzXn5QFf40+o0Y5h+ea9TpyZhRZc38j1gp3ij4KrjGejG
         4U2g==
X-Gm-Message-State: AOJu0Yz19t/bFaNJgnAqrLN9Kkyy+TNEyxuDeiac61aehzqYQElq/lpt
	3/awaLQ2Pli1XSh7vNJM47xWVbYZojCsWEGU6cPqaEk+oZ4mV6w+xy76qEOCG1/lpBOns4A/qoY
	e3EfDELHGvA==
X-Google-Smtp-Source: AGHT+IEEfcrIwR/YKdvBhQZUMOIfTbg7kdffQiDZuJnymnK2OVm1uebo2yYpONP3k/NS++BoHsazcG1du0jX
X-Received: from oacsi16.prod.google.com ([2002:a05:6871:eb10:b0:3e0:6d19:652f])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:580a:b0:3d9:7dc4:3c21
 with SMTP id 586e51a60fabf-3e833f18264mr319992fac.2.1762896855754; Tue, 11
 Nov 2025 13:34:15 -0800 (PST)
Date: Tue, 11 Nov 2025 21:34:07 +0000
In-Reply-To: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>
Subject: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan touchpad
 on lid event
From: Jonathan Denose <jdenose@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

Many touchpad modules have a pin which is expected to be connected to the
lid angle sensor in laptops. The pin sends a signal to the touchpad module
about the lid state and each touchpad vendor handles this notification in
their firmware.

The Elan touchpad with VID 323b does not always have this aforementioned
pin, which then causes interference between the lid and the touchpad when
the lid is closed. This interference causes a few seconds delay before the
touchpad works again, or it causes it to be come completely unresponsive.
To circumvent this hardware issue in software, implement a device quirk
which will allow the hid-multitouch driver to register a notifier_block
to listen for lid switch events. When the lid switch closes, the
touchpad surface will be turned off and when the lid switch opens, the
touchpad surgace will be turned on. This triggers recalibration which
resolves interference issues when the lid is closed.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-multitouch.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2879e65cf303b1456311ac06115adda5a78a2600..9a89913c193bc110a0a821a901aebd97892c66bd 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -35,6 +35,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/slab.h>
 #include <linux/input/mt.h>
 #include <linux/jiffies.h>
@@ -76,6 +77,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
 #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
+#define MT_QUIRK_REGISTER_LID_NOTIFIER BIT(24)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -183,6 +185,8 @@ struct mt_device {
 	struct list_head reports;
 };
 
+static struct hid_device *lid_notify_hdev;
+
 static void mt_post_parse_default_settings(struct mt_device *td,
 					   struct mt_application *app);
 static void mt_post_parse(struct mt_device *td, struct mt_application *app);
@@ -227,6 +231,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_SMART_TECH			0x0113
 #define MT_CLS_APPLE_TOUCHBAR			0x0114
 #define MT_CLS_SIS				0x0457
+#define MT_CLS_REGISTER_LID_NOTIFIER 0x0115
 
 #define MT_DEFAULT_MAXCONTACT	10
 #define MT_MAX_MAXCONTACT	250
@@ -327,7 +332,9 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_WIN8_PTP_BUTTONS,
 		.export_all_inputs = true },
-
+	{ .name = MT_CLS_REGISTER_LID_NOTIFIER,
+		.quirks = MT_QUIRK_REGISTER_LID_NOTIFIER,
+		.export_all_inputs = true },
 	/*
 	 * vendor specific classes
 	 */
@@ -1840,6 +1847,20 @@ static void mt_expired_timeout(struct timer_list *t)
 	clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
 }
 
+static int mt_input_notifier(struct notifier_block *nb, unsigned long action, void *dev)
+{
+	if (action)
+		mt_set_modes(lid_notify_hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
+	else if (!action)
+		mt_set_modes(lid_notify_hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
+
+	return 0;
+}
+
+static struct notifier_block mt_lid_notifier_block = {
+	.notifier_call = mt_input_notifier
+};
+
 static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret, i;
@@ -1920,6 +1941,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (hdev->vendor == USB_VENDOR_ID_SIS_TOUCH)
 		hdev->quirks |= HID_QUIRK_NOGET;
 
+	if (mtclass->quirks & MT_CLS_REGISTER_LID_NOTIFIER) {
+		lid_notify_hdev = hdev;
+		register_lid_notifier(&mt_lid_notifier_block);
+	}
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret)
 		return ret;
@@ -2150,6 +2176,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_ELAN, 0x32ae) },
 
+	{ .driver_data = MT_CLS_REGISTER_LID_NOTIFIER,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ELAN, 0x323b) },
+
 	/* Elitegroup panel */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,

-- 
2.51.2.1041.gc1ab5b90ca-goog


