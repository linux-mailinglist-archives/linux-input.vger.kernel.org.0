Return-Path: <linux-input+bounces-16452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4895C9D95C
	for <lists+linux-input@lfdr.de>; Wed, 03 Dec 2025 03:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 831943A710A
	for <lists+linux-input@lfdr.de>; Wed,  3 Dec 2025 02:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE7223D294;
	Wed,  3 Dec 2025 02:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A81orjzh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCE736D507
	for <linux-input@vger.kernel.org>; Wed,  3 Dec 2025 02:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764729377; cv=none; b=OidLDL6LNNFfsnHAa/Hh83d9bIBS05Xg6MiNMm0S6zjIGRKyx0bLt9WhGvpLCHh8QvJhflSoDwSKwB616Vigwf12yvs8zBftWJ5B+N2w7DDa85dsJSwxUR8/fZKVp57hNdcmRak6bcjDEo220PD0swh67FzwtE2OkhI3dQDBP2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764729377; c=relaxed/simple;
	bh=33aK+/KheimodCNRLHF5OOYmZyTLKzPFAT1pP4UoQkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGdUq3Po6XUXpl7y1YdK+A2jsDfpyvMU6IYGHQnfr6cF6LtTnE8frss//53mvhexcU7HzbKpV6d+dA4G3JsO1wti5luKAU8xtzXstS0cYXwlv6Oa7AwWhI5qn5xmEYhAd/pA29a3y6SJv739QccdwpuanqcGXcoqsfJM5KcKcb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A81orjzh; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8824ce9812cso68379786d6.0
        for <linux-input@vger.kernel.org>; Tue, 02 Dec 2025 18:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764729375; x=1765334175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmMZjxCZjBz/s5G9zO0aKdtP7/irw7vLaYUXpjTSIAc=;
        b=A81orjzhnl5vULJLw86XAq+FIq+OM5r1Nf1jyhAn8y/L3vkvnNuTzntcIPG6ddrWuV
         N8IisaYC6ckgrXckKJY9LXwMVMlXql1sWMaqyF6Zf4ovBfia1oLrtb4GhZE3FKn4OZWL
         DiDQ9g5W63m7orfvXxCVmditTxtOUXOkwi47JC7BikdIs+i1pKBYijI4PYY/SejOHp8J
         vqQJYNF6e/licGk/RiiPUx8nPpK2Nhle229ylmbgXOcU7xcUE9+BrmK8Ebl3Set5jJj3
         WHeazItDIu45/uvxmVFbYLNnTXqyOd+o1z2rPdi96+INs7qFEoPWkajJuXZ8mdJgfXpH
         p29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764729375; x=1765334175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmMZjxCZjBz/s5G9zO0aKdtP7/irw7vLaYUXpjTSIAc=;
        b=Z2SXh6eIpb3MNz0A1tAOnD0UOFVrUuFWjJxHkWx8nAuCQSzN5CQxfYjPx/9cKLTPMO
         /8TQBqkPHnCqrW0uFfLSkPwKMFIDMBz0c957HcLMllJAJdrjSKv2fsZIMJ6mL6T/+qws
         viPrT62rnlsYkbNffQc9f6x4zLi+WmJU7FS4i2dxzy7KAhmftLqfGHVAcguTdSgR+56P
         Hvw5EES/BX/kzEpKnxDgbL+VYzMNcxhjIRuLhmtZzS7JV0L0UtrdSr7hzMB04Oqu3DnJ
         f+UhYt5nerbHIsimz+Vv7QeeyZ0VC8NvfNWeo6D5lFlCaMw33wO4wuVpBAheMm4HDeIW
         EzFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWayNkA7xXRqzv8SDV3zGaMn3TmawzBR3cc0JettFJsMPIDBRuylIe/bD8QAn0wXCDt1RLJCYZaFq8SFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+5R/Xy39VtA3rj7j/dKOiWAtIR0KOaddcnmN0PmpyX6Mzl4Dp
	I3IEPTFfNCkOfXnqMFSR7LmRnbJ1VTcBBFuCOfuhPS4c6YbRKfHPEgAM
X-Gm-Gg: ASbGncv3EshiDmlq192KYBhoA//Pm5mN035LGmm7/DKuymF7Mj1LWKFpz1n/TNhs1Wq
	g8HvL0XtmYCbRhgN+NSdjxu//yS8lhOOOu8MZdEuBaDlUunZGlbHs2yqO3tBAA2vt5XDtglQMCC
	038op+lqPRTWCcg5Opo5IIts4QVNSkuHk6N8sODguPJXdsKzfBTbr3swMCUPKUORDnj2scwZbfs
	PkVtRfuF40/iqOXWMldVBzcddN34XDsFnUBMnV6jg81pzdL6Vae641096aZ4dt0/nQN6IlNHGSM
	NPybr+hRLuG/HX+U5YFBTTub/tvvVMzr/TVFdg7THC/WLiRpo1oZux5mkfbnyZbQWPLxfJOSu/R
	e4JtWW0Yu6R/+jyo4hRibe0lyYGXTSJZkq1ijWNdLbANuLdUSfBa2PDdZmYtaj1Knnz0Nbb1qV8
	c0FOMoX1sczDOABCXxDEqKLviUgzlNwKiIUTAmyeScSq3wKjhFgeWwG5I9m4Ch15pN
X-Google-Smtp-Source: AGHT+IG99ccS/zuDPMJyGs7PAuHwW5JvFqF/82yahrggLp8kL/Nv3mGoN5JDkd0PS9xVn5PfGJVjzw==
X-Received: by 2002:a05:6214:19e9:b0:882:4a63:63a0 with SMTP id 6a1803df08f44-888195720a3mr11278066d6.58.1764729374626;
        Tue, 02 Dec 2025 18:36:14 -0800 (PST)
Received: from hamCommander.lan (pool-100-36-128-72.washdc.fios.verizon.net. [100.36.128.72])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-88652b4b017sm117055356d6.30.2025.12.02.18.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 18:36:14 -0800 (PST)
From: Brian Howard <blhoward2@gmail.com>
To: jikos@kernel.org
Cc: Brian Howard <blhoward2@gmail.com>,
	Kris Fredrick <linux.baguette800@slmail.me>,
	Andrei Shumailov <gentoo1993@gmail.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: multitouch: add quirks for Lenovo Yoga Book 9i
Date: Tue,  2 Dec 2025 21:35:47 -0500
Message-ID: <20251203023601.1657343-1-blhoward2@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6243251s-2rp7-7092-r489-1n4531qn0826@xreary.bet>
References: <6243251s-2rp7-7092-r489-1n4531qn0826@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book 9i is a dual-screen laptop, with a single composite
USB device providing both touch and tablet interfaces for both screens.
All inputs report through a single device, differentiated solely by report
numbers. As there is no way for udev to differentiate the inputs based on
USB vendor/product ID or interface numbers, custom naming is required to
match against for downstream configuration. A firmware bug also results
in an erroneous InRange message report being received after the stylus
leaves proximity, blocking later touch events. Add required quirks for
Gen 8 to Gen 10 models, including a new quirk providing for custom input
device naming and dropping erroneous InRange reports.

Signed-off-by: Brian Howard <blhoward2@gmail.com>
Tested-by: Brian Howard <blhoward2@gmail.com>
Tested-by: Kris Fredrick <linux.baguette800@slmail.me>
Reported-by: Andrei Shumailov <gentoo1993@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220386
---

V1->V2 Changes:
- Changed definition of f and i varliables to the loop scope.

 drivers/hid/hid-ids.h        |  1 +
 drivers/hid/hid-multitouch.c | 72 ++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..e896a6310bb2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -833,6 +833,7 @@
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_X12_TAB	0x60fe
 #define USB_DEVICE_ID_LENOVO_X12_TAB2	0x61ae
+#define USB_DEVICE_ID_LENOVO_YOGABOOK9I	0x6161
 #define USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E	0x600e
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 179dc316b4b5..4b3e7c212a48 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -76,6 +76,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
 #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
+#define MT_QUIRK_YOGABOOK9I		BIT(24)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -229,6 +230,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
 #define MT_CLS_APPLE_TOUCHBAR			0x0114
+#define MT_CLS_YOGABOOK9I			0x0115
 #define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
@@ -424,6 +426,14 @@ static const struct mt_class mt_classes[] = {
 		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
 			MT_QUIRK_ALWAYS_VALID |
 			MT_QUIRK_CONTACT_CNT_ACCURATE,
+	},
+		{ .name = MT_CLS_YOGABOOK9I,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_FORCE_MULTI_INPUT |
+			MT_QUIRK_SEPARATE_APP_REPORT |
+			MT_QUIRK_HOVERING |
+			MT_QUIRK_YOGABOOK9I,
+		.export_all_inputs = true
 	},
 	{ }
 };
@@ -1565,6 +1575,38 @@ static void mt_report(struct hid_device *hid, struct hid_report *report)
 	if (rdata && rdata->is_mt_collection)
 		return mt_touch_report(hid, rdata);
 
+	/* Lenovo Yoga Book 9i requires consuming and dropping certain bogus reports */
+	if (rdata && rdata->application &&
+		(rdata->application->quirks & MT_QUIRK_YOGABOOK9I)) {
+
+		bool all_zero_report = true;
+
+		for (int f = 0; f < report->maxfield && all_zero_report; f++) {
+			struct hid_field *fld = report->field[f];
+
+			for (int i = 0; i < fld->report_count; i++) {
+				unsigned int usage = fld->usage[i].hid;
+
+				if (usage == HID_DG_INRANGE ||
+					usage == HID_DG_TIPSWITCH ||
+					usage == HID_DG_BARRELSWITCH ||
+					usage == HID_DG_BARRELSWITCH2 ||
+					usage == HID_DG_CONTACTID ||
+					usage == HID_DG_TILT_X ||
+					usage == HID_DG_TILT_Y) {
+
+					if (fld->value[i] != 0) {
+						all_zero_report = false;
+						break;
+					}
+				}
+			}
+		}
+
+		if (all_zero_report)
+			return;
+	}
+
 	if (field && field->hidinput && field->hidinput->input)
 		input_sync(field->hidinput->input);
 }
@@ -1761,6 +1803,30 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 		break;
 	}
 
+	/* Lenovo Yoga Book 9i requires custom naming to allow differentiation in udev */
+	if (hi->report && td->mtclass.quirks & MT_QUIRK_YOGABOOK9I) {
+		switch (hi->report->id) {
+		case 48:
+			suffix = "Touchscreen Top";
+			break;
+		case 56:
+			suffix = "Touchscreen Bottom";
+			break;
+		case 20:
+			suffix = "Stylus Top";
+			break;
+		case 40:
+			suffix = "Stylus Bottom";
+			break;
+		case 80:
+			suffix = "Emulated Touchpad";
+			break;
+		default:
+			suffix = "";
+			break;
+		}
+	}
+
 	if (suffix) {
 		hi->input->name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 						 "%s %s", hdev->name, suffix);
@@ -2266,6 +2332,12 @@ static const struct hid_device_id mt_devices[] = {
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X12_TAB2) },
 
+	/* Lenovo Yoga Book 9i */
+	{ .driver_data = MT_CLS_YOGABOOK9I,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_LENOVO,
+			   USB_DEVICE_ID_LENOVO_YOGABOOK9I) },
+
 	/* Logitech devices */
 	{ .driver_data = MT_CLS_NSMU,
 		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
-- 
2.49.0

