Return-Path: <linux-input+bounces-16168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF83C66FA7
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 03:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E219035DF05
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 02:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB00322A29;
	Tue, 18 Nov 2025 02:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxppdoh7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03B322520
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 02:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763431665; cv=none; b=YIum0Gq4LK3Bnz5lhim76rwswEwOpylikdpOIrbCXt5gM+AHsM25imZmVp6GvcHSMYlPwT/H+U38VTQSv2k6hNcbKmPXkWPTujBtMPxF3IJcixBi0H08DwHxUFsQf9jP+zrY0r46cOoIMh4ju1y1wG0/X6AVLuoKhaFjgMmGoZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763431665; c=relaxed/simple;
	bh=o2QKtTD44YN+e8qaYopfIklkqMVOUdi9rq0+W5hx278=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6dtU5tJSj+pwNqCc1whPx2dU6eo463wbsNwW18pqxghl8Xq2TWTeHsi0GCS8xFEg8p6oaiD54YUYLTjWxa12p+Cr+2t11Cs7dBq7fYM4SqJ8ACm5AthyeMMCL3m7T2UY0etz6/Ey+ep+7AlJNbXEhg22VMWcqSrBkGK8zRVouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxppdoh7; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88043139c35so52421706d6.0
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 18:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763431662; x=1764036462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jh1QIfEZMIp5h4bee6+/t3kNjwgrq8onLyDs47w4Ztw=;
        b=gxppdoh7uTsnQT1+t4kbKOf63wSjkIl7b9Po+kY8AvjfTUkrcm7+ZEGbLWaeIGCOxb
         esaapMasl96HUiipzV6ULNgNKM6naPw/AxKW6VNTaRET08TSariBOkjTSvR1ogqzbXGr
         gmC2jjyB3nlf+kb2cU/UdPPnQr/vhM5JkrOpkrEzm4DLAW49DqkstI3yrAjiWVr/JBGV
         yaBGnPLcrAzvsIkl3zJEpzSeyacKlmPiU5s3ZuONyUP5mpXg1QMSb486qckVJx/KTbfl
         j9fHxCBlMKPMErHTz1XEtI2F+2t84v8sG+5TbDdeCd/ID+zhonOJlurSQXQqxWWzKew+
         PNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763431662; x=1764036462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jh1QIfEZMIp5h4bee6+/t3kNjwgrq8onLyDs47w4Ztw=;
        b=l9o1Q5VbZChZxGhNtTZkLbhv2Xd/CVnSWg5SRN5mjtSuGORQRPNaP8njSuc22vrMT9
         DsA9eCoQMAXTQHFtGkKK7EcyZghl+LgTCdLhJP0ayuvtDHFuM5hPcAPlEzSy9URgSuyb
         HSMG5QerHsSQ9B1uCLmz7IxiMpXtIzkoFdI2qXbFNbrO+UFZXj+mY6H4Te6dr2Dvh9nn
         XIguJOo39qstLq4vUTG7fFxzuSGEMqXcYCQsugbltN07ePgo4+UdGid80s2qVrQJ0meX
         kRW/f9BEP7HfPiLXof1Qc62sG2saCFGSD1ALHi4kcdvZuodvFA5DOEu+1O5ijicEiiYP
         5p5A==
X-Forwarded-Encrypted: i=1; AJvYcCXtzIQzceQEm0LkfU/W6fys7qk516XD0ll0bKO4kk1PEgs+LwtvNq5GSOj31DlRlZRN+NS5oaOEo+Q/wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0BhGZ2Uo8FPW27843H0bFqB8o83PghMNXfG14946l1NVWTON
	LaQZZlV/Vx5hZ2yHyipozaY1KI8GqnRX61XHrtG8U5RJB7yglYSrQov9x+012eu6
X-Gm-Gg: ASbGncskwswJ2zFRlQhN/eA9iX2TRvOJJWNPFcnaybyMO/j5/0K2Gp60jbGAR34nf19
	4TUFM13IKpsx8QDbd/nRBxEZ3/imOYRHsfxvAsxF5sXe+tNfHoQ7uMHAH/uytMJNs45M3YRh+X3
	dLuPKTQWpUTKB8GwEvLl8fF7ZFSewujrM8i9TpFL2tktLvC3uMncr7EOpenY4ChLkubg+BaLQQt
	2q5U0Jn6jXFLqWFaui1/msM+9yu2o5G/501aIcRL1vvm79jQ0ZE86eAjGmeJQZZ6w2Rt+G2knK6
	bb6WaNJlqIYI1O1O//Hr6A1LNEAnoPPf+GFxbnSnRpusQkjYMm+F9cTS0J6+UEQR5o7VDtpHHcX
	MU/kyP0QI90tUJYu+3DKUnq+2sVhf9ZEllqHGA1yrQGfOmS0hf48Gy2t75EeYutzCI8gSTrjXpl
	aWM+l4qybLVkYIMY9oWwBVuWy+625FFLsD4e89h3jTWwKmTNVzsZQm0m2G2dsrpmaa+W4sIvQ=
X-Google-Smtp-Source: AGHT+IGoqcQKgUIUh8dXIrcnrONk2oUR1Q1PCtS89nErtNnSj/oGJUO4MdNBIqxDlaSlVwfRkyKesQ==
X-Received: by 2002:a05:6214:508b:b0:880:57b3:cd04 with SMTP id 6a1803df08f44-88292586a0cmr163975306d6.1.1763431661884;
        Mon, 17 Nov 2025 18:07:41 -0800 (PST)
Received: from localhost.localdomain (pool-100-36-128-72.washdc.fios.verizon.net. [100.36.128.72])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-8828613962esm104966846d6.0.2025.11.17.18.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 18:07:41 -0800 (PST)
From: Brian Howard <blhoward2@gmail.com>
To: 
Cc: blhoward2@gmail.com,
	Andrei Shumailov <gentoo1993@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: multitouch: add quirks for Lenovo Yoga Book 9i
Date: Mon, 17 Nov 2025 21:07:21 -0500
Message-ID: <20251118020723.6600-1-blhoward2@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required quirks for Lenovo Yoga Book 9i Gen 8 to Gen 10 models, 
including a new quirk providing for custom input device naming and 
dropping erroneous InRange reports.

The Lenovo Yoga Book 9i is a dual-screen laptop, with a single composite
USB device providing both touch and tablet interfaces for both screens.
All inputs report through a single device, differentiated solely by report
numbers. As there is no way for udev to differentiate the inputs based on
USB vendor/product ID or interface numbers, custom naming is required to
match against for downstream configuration. A firmware bug also results
in an erroneous InRange message report (with everything other than X/Y 
as 0) being received after the stylus leaves proximity, blocking later 
touch events. 

Signed-off-by: Brian Howard <blhoward2@gmail.com>
Tested-by: Brian Howard <blhoward2@gmail.com>
Reported-by: Andrei Shumailov <gentoo1993@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220386
---
 drivers/hid/hid-ids.h        |  1 +
 drivers/hid/hid-multitouch.c | 73 ++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

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
index 179dc316b4b5..a828aac59cb2 100644
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
+	{ .name = MT_CLS_YOGABOOK9I,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_FORCE_MULTI_INPUT |
+			MT_QUIRK_SEPARATE_APP_REPORT |
+			MT_QUIRK_HOVERING |
+			MT_QUIRK_YOGABOOK9I,
+		.export_all_inputs = true
 	},
 	{ }
 };
@@ -1557,6 +1567,7 @@ static void mt_report(struct hid_device *hid, struct hid_report *report)
 	struct mt_device *td = hid_get_drvdata(hid);
 	struct hid_field *field = report->field[0];
 	struct mt_report_data *rdata;
+	int f, i;
 
 	if (!(hid->claimed & HID_CLAIMED_INPUT))
 		return;
@@ -1565,6 +1576,38 @@ static void mt_report(struct hid_device *hid, struct hid_report *report)
 	if (rdata && rdata->is_mt_collection)
 		return mt_touch_report(hid, rdata);
 
+	/* Lenovo Yoga Book 9i requires consuming and dropping certain bogus reports */
+	if (rdata && rdata->application &&
+		(rdata->application->quirks & MT_QUIRK_YOGABOOK9I)) {
+
+		bool all_zero_report = true;
+
+		for (f = 0; f < report->maxfield && all_zero_report; f++) {
+			struct hid_field *fld = report->field[f];
+
+			for (i = 0; i < fld->report_count; i++) {
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
@@ -1761,6 +1804,30 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
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
@@ -2266,6 +2333,12 @@ static const struct hid_device_id mt_devices[] = {
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


