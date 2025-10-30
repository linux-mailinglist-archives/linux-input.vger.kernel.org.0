Return-Path: <linux-input+bounces-15805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE651C208AE
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 15:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4198B4EF192
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 14:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C0D25A2AE;
	Thu, 30 Oct 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kW4asABi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DDF253F3A
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833446; cv=none; b=qLzH8OLUpeG/P43zrhNrFCazUDIfjW/oHgrmbOBiPxcw7OSQO2KksvTZiZYhKxpa86cX0wyL5/bmQXYFBnMIRoRd/rQNrI4AjQ6FD3yUU+Y3xRlYKJU97ORjRICaRseIt5r/pOSRd1YcrcTiFYej+sEREHKVNIhEYmtSZoFT3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833446; c=relaxed/simple;
	bh=q3jHj61zXvz5MN2y9J6SalSvSDG9xMqxfmXbK044WsM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M0OMVf9QhJLC66VHGFFcn+WMGc/3TRV1mOXafhIS1Lsakn9tGT9I2YpfZgeIqcmH1bnvXl9uKe5d44M/dOK/CTsYP5r4UD2KXbvapAngnPgrGdDEOLUB2YykohWXaLzywn/71E+gcPbMUf7ys2XHb+bpDe/4RIGu7kcsJTQ9TDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kW4asABi; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-927b19c5023so103332339f.1
        for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761833443; x=1762438243; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmuXm6118pY2fmFrwM3cdE3k0F1cDt7ZnMWQFLJv4F8=;
        b=kW4asABiElYUnaGo4ZZcTKPhygn+wuNmHWRMsd9kV+sKIDgCsSjd01yxDLQ/nCssUB
         jEErut2YbI8BxKWWWPa5Kwcchy0pGW/ZKQzN9DxT8aOi4nlOpLp6Laix0FcAGjsTuo71
         J0VuGsR+/UqGtjoZ0a5Tr1iWnmo2MhqtlQbMStsag+kEAsTn6Ju3Hb52md0lSltiP9Wv
         94nq5fb9jeJgFC8E5y+TWduuPqeKO5bDnNDW0FMFE/gyjh/jiZvfxC6vr3//+I8lOK4d
         OmpMy4B4DUW1xc6wplNkxjS5C8+EYm6XqnNoqH4BCfgke7VYFbSUpDNWMzTQQk5K+QHD
         6LoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833443; x=1762438243;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmuXm6118pY2fmFrwM3cdE3k0F1cDt7ZnMWQFLJv4F8=;
        b=STqwNIe2h4eZwtb7jbqZHBhuVJBDc8tXMAtiDwpBmxsKkJyRHvxTXbpWtgxL4QrBC8
         nile45aYR25ikXvBI4AyDFLPhQAMjori8eo8Nxsd/4rfwqXBxK++1uQjqJzxxcYzuQvM
         F1XLlbQO+vxJYy0AdkjM7aTfHRrfKBn8EXVl6qfIwi8kMhY09dcGlyX8rrulKA9yms96
         wGJV9tJSwci8sO0Fiz1lXKHusJrTTr02ujrlt4mFjPsP7R7g6QToqqm8yt3U7e7MMEnM
         7cw5e6nx/lb8r9mHq7E73BgMgYqTLs/VSzm2NEb1lb51w/k4odg89oTv5je1vhNl7lNR
         kOtQ==
X-Gm-Message-State: AOJu0YwRcNbqn3zbfwoXXHVHmRn8Klz4YWstUEd9RcxXlmrgsQlvWkbp
	7di5211ailH6Hp+I4ySoNbNy1jUWXJRsFjXAljvJL4Lh4je0gfCMZK9ZVgSMIap4W7EEOcBGFLg
	4UDt3K9/OXw==
X-Google-Smtp-Source: AGHT+IH6LnWqO+DOElFFG3eH7qSxiHTlugiupzsGZZ7UfXk5ZpCwRsS8lH2J52EOivUvNIfmz+2MU500c8LK
X-Received: from iobjh5.prod.google.com ([2002:a05:6602:7185:b0:93e:8094:6993])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:14c8:b0:945:c311:44e2
 with SMTP id ca18e2360f4ac-945c97e558emr962817139f.13.1761833443503; Thu, 30
 Oct 2025 07:10:43 -0700 (PDT)
Date: Thu, 30 Oct 2025 14:10:41 +0000
In-Reply-To: <20251030-lid-switch-notifier-v1-0-c58dc9b1439d@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030-lid-switch-notifier-v1-0-c58dc9b1439d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251030-lid-switch-notifier-v1-2-c58dc9b1439d@google.com>
Subject: [PATCH 2/2] HID: multitouch: Toggle touch surface on Elan touchpad on
 lid event
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
to listen for lid switch events and turn the touchpad surface on and off
triggering a recalibration of the touchpad. This recalibration resolves
interference issues when the lid is closed.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-multitouch.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2879e65cf303b1456311ac06115adda5a78a2600..feb0a0b65b6355cc412fcf8ea88132dc5bdc6a26 100644
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
+#define MT_QUIRK_REGISTER_INPUT_NOTIFIER BIT(24)
 
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
+#define MT_CLS_REGISTER_INPUT_NOTIFIER 0x0115
 
 #define MT_DEFAULT_MAXCONTACT	10
 #define MT_MAX_MAXCONTACT	250
@@ -327,7 +332,9 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_WIN8_PTP_BUTTONS,
 		.export_all_inputs = true },
-
+	{ .name = MT_CLS_REGISTER_INPUT_NOTIFIER,
+		.quirks = MT_QUIRK_REGISTER_INPUT_NOTIFIER,
+		.export_all_inputs = true },
 	/*
 	 * vendor specific classes
 	 */
@@ -1840,6 +1847,20 @@ static void mt_expired_timeout(struct timer_list *t)
 	clear_bit_unlock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags);
 }
 
+static int mt_input_notifier(struct notifier_block *nb, unsigned long action, void *dev)
+{
+	if (action == LID_SWITCH_CLOSE)
+		mt_set_modes(lid_notify_hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_NONE);
+	else if (action == LID_SWITCH_OPEN)
+		mt_set_modes(lid_notify_hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
+
+	return 0;
+}
+
+static struct notifier_block mt_notifier_block = {
+	.notifier_call = mt_input_notifier
+};
+
 static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret, i;
@@ -1920,6 +1941,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (hdev->vendor == USB_VENDOR_ID_SIS_TOUCH)
 		hdev->quirks |= HID_QUIRK_NOGET;
 
+	if (mtclass->quirks & MT_CLS_REGISTER_INPUT_NOTIFIER) {
+		lid_notify_hdev = hdev;
+		register_input_notifier(&mt_notifier_block);
+	}
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret)
 		return ret;
@@ -2150,6 +2176,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_ELAN, 0x32ae) },
 
+	{ .driver_data = MT_CLS_REGISTER_INPUT_NOTIFIER,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ELAN, 0x323b) },
+
 	/* Elitegroup panel */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,

-- 
2.51.1.851.g4ebd6896fd-goog


