Return-Path: <linux-input+bounces-12169-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94417AABB39
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 09:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 704421C42C7A
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 07:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244702951CF;
	Tue,  6 May 2025 05:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CakdBRGm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB3F278743;
	Tue,  6 May 2025 05:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510625; cv=none; b=gaves5sUQIfQvPOegFpgpTlecBpDZlzkt7C/PXysGOdQ/ic5mlN5O8GWxtir0RzUXN0HW7K4pJak3Jf4qy3GFsJTGKxn/uEy1TNbq8sUoARXpn54KY6LjqicBuMY3E4sOLwbkg8uWKMaOGrhbmUnZaCiv9sBdQsvGktQRABLHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510625; c=relaxed/simple;
	bh=V5AFJFc3Mt+ezqyhfUKPS9/A9RFkGtN8PAqSt1hwC7M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=BAymfh8n4n+CUP2O9evhaFPxqiVX++uRU9eYVtO5ocjCjPeM48x7W0gRzIa3CUwmLGmWM4iTUvNoA0nxMWnnx5pkK85Gswi4eXMGOznBiCkW+KLPYOCJ95UQHgtPgBRp+Mx3zbiiub1jW2Fsq78O0fByXHzfywO3qtGyNdCB5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CakdBRGm; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4740462b3a.1;
        Mon, 05 May 2025 22:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746510622; x=1747115422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oJxdxFQqaCGcZlTsGLuSVzC1SVQDHdJUoQJ4hC/Wo1Y=;
        b=CakdBRGmPf7Botv4eBXw/r2uz85QtDLv68/LpaB7EKW85OvEKf2kjP3NpMPjwlpdP7
         NEwfLfq43a5TDr9cwFopx+xUQiCQdnzzzRXR0MoTDbVyQtXBw5vtBHX7IHZeSNsYWFxB
         WT6HEMeyUKiv3odo1fT/GYdqVJvTVHIoZU15RMWrRIz5mBTxMa3pixe65QG0wJwZUZYn
         ECOZZpPJToQ3pHcjCvo0vR4MbRWUkYZHDv8IASsCJTLifbbvPbd0CN+NbQT1bkwLy2/q
         YzcLiMf9vqPGoeXC146c2/GjSC3JHXjnwFRysh+5kv2v5OfdxNjx8pN3T95h0cksxY9O
         0J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510622; x=1747115422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJxdxFQqaCGcZlTsGLuSVzC1SVQDHdJUoQJ4hC/Wo1Y=;
        b=RdWpobvHpeAxWuIfD+qTUZWjU0SE+ZIeAD3QdtjEdXQegCzCq6TShUCN+D55SVbvaV
         f6TKdbe6Z3TeFTvULsezG/h1R6nsd7IV8xudg7rV4au84sWjIkLWYc5odk6eBSybAA8s
         WFRlIbgkslD2vFYIywFEB8tJvUVs8Y9WhBFBUh7wQmaFb3QIMyO0jwNvc9QjS78+grMn
         U2WE9MQ0s3ZBACykZYNHVe5c5Xb/8YsdatKLGQctcOMPDoJ+9PQbDSix3o7qrpBnt45B
         pfEjjN8mwBdUdX9/Y0h/EAyLuMV1W82PTnJ4pdybkJXO0ZNzN+WiSrPbUaT1Ew1NyClZ
         YgqA==
X-Forwarded-Encrypted: i=1; AJvYcCUtx/kt7hBy6QMFJT84HczoxWqYIUtCX4uUfmUZAeJC/9OJVuMNwbB9gynRp6RxK5FaZBxTsJaKiaGqf+/Q@vger.kernel.org, AJvYcCVK2O8UbASpJ7pZl5WSGjv6je75rsMoueV8JNAXzIawSXQ5XU66YHgfZ6p3JfaNEoX+O9rLVzNhm7J5KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaUfRnpHb712Tz+WOIFfmE9a+oj6mnstIK9B8A9AwpaNrwmrBy
	6ElJGpB1bXu5gH+WCzR6nY3ZEdQ/eRiNyXnRSFceiQjxOyP6khHXbOu2jHAgxl4=
X-Gm-Gg: ASbGncvbZt29ZvNY61e/hAqKWGzARkzBvT2fRHmuvMRc/KxF0iKzuJfR3rQXib9MpIL
	Rwbl671FOV6qF5IVV9Q3KQmG4GLMkq89TzTLC+Cbas40i/8xKkDbgEFOzh7kH6xVDVytz6KUM7S
	sH0mA8MOqveSecBvBUHZrViKqvXj0ptEKOFETkItg+Jiojl0ZLcgO7GxlT7MS1LlW4wzz3mhN2V
	u3maE+w1lMiZ9/j1iFDNV3CpmI+GT2NRym/Xx8/i25Igp2o2YmZzQViTzYhJumVjKB2oVJ2U+/+
	BPrz1Zn/7oCHbUeNN8ARqZw=
X-Google-Smtp-Source: AGHT+IGrWYJ9sVBI0oVxpUMc3Ou3KDlg7s831IeFtPmi+epwDrRduE5iR2qXrSHiBdojD7UHB8Ns1g==
X-Received: by 2002:a05:6a20:9f48:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-20e97ea6675mr14275288637.39.1746510622345;
        Mon, 05 May 2025 22:50:22 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b51570sm6604541a12.20.2025.05.05.22.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 22:50:21 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: quirks: Add quirk for 2 Chicony Electronics HP 5MP Cameras
Date: Tue,  6 May 2025 13:50:15 +0800
Message-ID: <20250506055015.774509-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chicony Electronics HP 5MP Cameras (USB ID 04F2:B824 & 04F2:B82C)
report a HID sensor interface that is not actually implemented.
Attempting to access this non-functional sensor via iio_info causes
system hangs as runtime PM tries to wake up an unresponsive sensor.

Add these 2 devices to the HID ignore list since the sensor interface is
non-functional by design and should not be exposed to userspace.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
v2. move the quirks to hid_ignore_list[], were misplaced in
    hid_have_special_driver[]
---
 drivers/hid/hid-ids.h    | 2 ++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864cc4..7a57994b937a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -307,6 +307,8 @@
 #define USB_DEVICE_ID_ASUS_AK1D		0x1125
 #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA	0xb824
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2	0xb82c
 
 #define USB_VENDOR_ID_CHUNGHWAT		0x2247
 #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 646171598e41..ebf44575958a 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -755,6 +755,8 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AVERMEDIA, USB_DEVICE_ID_AVER_FM_MR800) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AXENTIA, USB_DEVICE_ID_AXENTIA_FM_RADIO) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
-- 
2.43.0


