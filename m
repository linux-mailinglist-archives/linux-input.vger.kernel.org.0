Return-Path: <linux-input+bounces-5065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2293343D
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 00:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E2DC2816B7
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 22:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B73D1E480;
	Tue, 16 Jul 2024 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERfw6Vwx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FC14A84
	for <linux-input@vger.kernel.org>; Tue, 16 Jul 2024 22:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721169072; cv=none; b=RsrEm9A9L/6YG3WucaHwKfgfVkSn3SMGhURvUncbFuGnBzseLJ8M3AsHVuv6BGCyUvmwOboZl3me8h3BScjP1vEyN+x3axUKElPbvNW4xJcLJ7YOKE7QVjkzhD5PTGLtpK+CSWiKZdYV7R0+IZmYdjdFfqFs5OT9wu+bhVwSclY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721169072; c=relaxed/simple;
	bh=DtkYRUaynQcx1aElumoBW1u2unNOlZpeMLfSdiql8ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4zCzw6QZmlIKTove47qho60gGqvNsMv+0Aml6EKEvFzSa4IG6kSqEOFCU7CJ5azUEyTDA5Wrr5vs9glvYGTkqD0Q+O7vdKndS7ym5BBUMKb9F0/61F/dX3do+2O+MWmQYGyaH/A28yx5FmKPJZieU4OnhaMi9eCA+0+pbTVNt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERfw6Vwx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso45360525e9.2
        for <linux-input@vger.kernel.org>; Tue, 16 Jul 2024 15:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721169069; x=1721773869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3PBFW1iDtzu1L/ywkrq7RqrkC5HRGgK/k8GQhgLfCA=;
        b=ERfw6VwxEIY/hRsGoPZLx9aCnSfbrGQa+hlMXGR8+SxFuqCRKeUbqYz3in0O6FUTQk
         0l4z0b6HD2oDW6XVAYfplTsZ/jA5Ev86Ic8ezl/C1LhZ9e78iUqkyT2gHFIrjugE5hkS
         9g12z34uh0VolgZN1nGYhvDaWpEbp8Spv5rgIpOEqRIsLS7rybHGpEsyIEm3HEtAjLbW
         XoWfNIJlh2TLsDV38kL4PN7aQkvXjF1Nufhav77V+srlhcrZ5VkJIECvYUHwUU2gMf0d
         2pYofOffLzkrSNOwQqIaZUfw47kcgLMKCq7dehzQ+Fvd+d+TVJbWrJiSJjgRgM433EKs
         il7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721169069; x=1721773869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3PBFW1iDtzu1L/ywkrq7RqrkC5HRGgK/k8GQhgLfCA=;
        b=Ezthx+2mPEqvxJcSIPHpmZ8KkOFqxT3SKNCaausV6tBL4yl4q9zngL/LY0slvFl2hu
         qUdVRI7Eizm01QOD5gdrZR7JpBGCeCB3acahi47I4zkBHHzSjA3ezUInbH/7wO74KLAZ
         gsoYC/amlTaeSVS4hpwUq4nlbaGhtXCw8i/7XT1EL3992Xu28dfYfbEceNo6muS4Intn
         c5N1KBQn2OzlhpBkVWpl7nlMqcyrZrOp8C+/gfrxPfP7NBQl8EfYz81SPyQ0UY9hH+oK
         T8RBksUEu8GoVKkGHsMKDuHYLVdzkbhoJIL0bp56ND4swyLib83zMGVWHDrLIqRFgbs3
         Zf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWaEwsIeSAhH++HU6qmHDPZ+FJytWK5OwyJStJES6kN3TBb0WYkAjLc4LbMH7pyyzX4/n7Nn42f25Jgsi5nqAq1TVB6yTCr2Q1Tsc=
X-Gm-Message-State: AOJu0YxCSn1yDN3KPJ9v72m0O4DlHi3mUtvKqxx5a5ZLh0YQfgHTRKgN
	w3McM9GC2d8woZcSePbNC9RKiRMTlyKMA/rieYUrnYwH4V/ypkxBGdkiS5/3
X-Google-Smtp-Source: AGHT+IGwebNwZmCofAHoIFzqs+fHJn1CAMbJ+vxq9xjw4EnUscuecTUwJVNEbAiFTYxZfgOCNLklGA==
X-Received: by 2002:a05:600c:6d94:b0:426:6ed2:6130 with SMTP id 5b1f17b1804b1-427ba687cb1mr20570545e9.14.1721169069562;
        Tue, 16 Jul 2024 15:31:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:c010:c300:105d:dc14:8157:17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef57aesm141827885e9.45.2024.07.16.15.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 15:31:09 -0700 (PDT)
From: Dmitry Savin <envelsavinds@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Cc: terry.wong2@yahoo.com,
	Dmitry Savin <envelsavinds@gmail.com>
Subject: [PATCH 1/1] HID: multitouch: Add support for GT7868Q
Date: Tue, 16 Jul 2024 23:27:57 +0100
Message-ID: <20240716222757.22931-2-envelsavinds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716222757.22931-1-envelsavinds@gmail.com>
References: <20240716222757.22931-1-envelsavinds@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GT7868Q has incorrect data in the report and needs a fixup.
The change enables haptic touchpad on Lenovo ThinkBook 13x Gen 4
and has been tested on the device.

Signed-off-by: Dmitry Savin <envelsavinds@gmail.com>
---
 drivers/hid/hid-ids.h        |  2 ++
 drivers/hid/hid-multitouch.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 72d56ee7ce1b..eebfca375bcd 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -520,6 +520,8 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
 #define I2C_VENDOR_ID_GOODIX		0x27c6
+#define I2C_DEVICE_ID_GOODIX_01E8	0x01e8
+#define I2C_DEVICE_ID_GOODIX_01E9	0x01e9
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
 
 #define USB_VENDOR_ID_GOODTOUCH		0x1aad
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841f24..99812c0f830b 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1441,6 +1441,30 @@ static int mt_event(struct hid_device *hid, struct hid_field *field,
 	return 0;
 }
 
+static __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+			     unsigned int *size)
+{
+	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
+	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
+	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
+		if (rdesc[607] == 0x15) {
+			rdesc[607] = 0x25;
+			dev_info(
+				&hdev->dev,
+				"GT7868Q report descriptor fixup is applied.\n");
+		} else {
+			dev_info(
+				&hdev->dev,
+				"The byte is not expected for fixing the report descriptor. \
+It's possible that the touchpad firmware is not suitable for applying the fix. \
+got: %x\n",
+				rdesc[607]);
+		}
+	}
+
+	return rdesc;
+}
+
 static void mt_report(struct hid_device *hid, struct hid_report *report)
 {
 	struct mt_device *td = hid_get_drvdata(hid);
@@ -2035,6 +2059,14 @@ static const struct hid_device_id mt_devices[] = {
 		MT_BT_DEVICE(USB_VENDOR_ID_FRUCTEL,
 			USB_DEVICE_ID_GAMETEL_MT_MODE) },
 
+	/* Goodix GT7868Q devices */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
+		     I2C_DEVICE_ID_GOODIX_01E8) },
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+	  HID_DEVICE(BUS_I2C, HID_GROUP_ANY, I2C_VENDOR_ID_GOODIX,
+		     I2C_DEVICE_ID_GOODIX_01E8) },
+
 	/* GoodTouch panels */
 	{ .driver_data = MT_CLS_NSMU,
 		MT_USB_DEVICE(USB_VENDOR_ID_GOODTOUCH,
@@ -2270,6 +2302,7 @@ static struct hid_driver mt_driver = {
 	.feature_mapping = mt_feature_mapping,
 	.usage_table = mt_grabbed_usages,
 	.event = mt_event,
+	.report_fixup = mt_report_fixup,
 	.report = mt_report,
 	.suspend = pm_ptr(mt_suspend),
 	.reset_resume = pm_ptr(mt_reset_resume),
-- 
2.45.2


