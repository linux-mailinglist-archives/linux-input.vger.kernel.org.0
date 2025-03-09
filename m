Return-Path: <linux-input+bounces-10672-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA61A587F2
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 20:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 297B3188D8B1
	for <lists+linux-input@lfdr.de>; Sun,  9 Mar 2025 19:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67BF217F48;
	Sun,  9 Mar 2025 19:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4Mkpj9g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB7B216E1D;
	Sun,  9 Mar 2025 19:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741549783; cv=none; b=SQns+T3KvFdNv+QkbTgfYnfupH47EVXH75tEWRAz+UxO+gjhWOfqKhi/d0lzDLcCKKMPnDfk5FQG77FShc9t6+6tLxSl/GpkHryufuUDHD3gN6dTxrSfSRM3hLHsCmO006s3jmfRwypOu6VvqVHmzBkiwbRKp1ryqS/SkO6RRuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741549783; c=relaxed/simple;
	bh=qm7NCth7SSiCrGvo8FOAj3ROn2wn+5MSTYC388d6AEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uv7ZJ49M/xOeZOBWFcCzk3abQw+stz3uTylyP58aZrJDqq0T1R74yYRv4oCmjITWntYZxojX1yBMC3u5F4QqpZcUS5GYjK2XuJfCMpsRZpZ0nhRWCzaOBKFKiqiZ0lHrbfDpe0XkjeA5QId5E9gj4+BdUZCFncNivFaRrGaiZqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4Mkpj9g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso20679665e9.0;
        Sun, 09 Mar 2025 12:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741549779; x=1742154579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/cPOi0J564nrBzXobvKmByHB+/vuscxMVR9qYxRb+E=;
        b=M4Mkpj9gRsDvDSoln5IYhYJewJ9QGGeAit5QNyn+zYU5sguFjzqjxP5JEUGJueLArt
         DmDNxtoaelQGr/LYVJ4XhJCj6sBX20VQF3Xp3zDL6VORI85alMLtNsQNiEdk7TNsmNN1
         bNAGYn1ElZDDqVj6Ci51m6GRywd0ezyjXa1qPfJEMrM76JDn3bQaK9PWybtw4YoLcCi6
         Vhq4ZtkPo4kuWUxjEB7XKNYO9LlkOIKNHIiycw16vLJjS/yuAabABrX6w4Ew+aZJoH9N
         z0H/T6tsH1L77U/tQvWqWQo/b+vZGzk1/BvNmGuvMPQcWj5gcGzh++8vs1E1+TrER9+i
         l+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741549779; x=1742154579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/cPOi0J564nrBzXobvKmByHB+/vuscxMVR9qYxRb+E=;
        b=FY271napxNWrV61Y8ZZFFz/nsWsz9+8RkYTNASuRskbSDPrKHu6zoEzfpk2QyJ5YL7
         7Vzv6v881RCDRiR9Jxm77qZUt6UD/hCTxfoceq8AKaE69dGLNypztNIYxs0CnMzXff1p
         AlMrexV93yls3915qau2lPQb6G6ZdG4/+ALqBQjTagKGyt39s+l0grLyZFqv8DfCnp8L
         JK/tNBSBek7CdHlOQEntfiusL3+2+KMmDp/33+2DAoylnFh8DM5ky0r4xvfPocZK7gt1
         I7nPswp4EKwvRIEZhQbvg8+aGuy88Cqnohon8qaZqzMz+RRroLUkgfZvyXAwkOlIPoYG
         SIIg==
X-Forwarded-Encrypted: i=1; AJvYcCUlLWQHviSi1e9bboXTQAGEVsP4uIZaRHQMXVoPCa4MftuiOhzS7YqKS1VMY6oKDSUDDkwushQQIdkDPQ==@vger.kernel.org, AJvYcCXVYUpJfzIeRHqYeDL77gimAlNo5fANdwJjrK2Bwq5UdBYLHy9vPV4fvks2r5DjqoUwoda6hlUvF+ucq2kl@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7DjDhzagrcOUxmbw7bWEeQOh9QwyDj2F6xR8WL9JKOS2qmAk
	uJrswZAJfmUzzOH/QQs5jj2ehpkQX9YkxDVSRgoK16Jj74O0vYP1
X-Gm-Gg: ASbGncvbUl80dS7ToLNp+zuNTMfuhU9+Jvp+sxQTAv6fNz3+DhuT1Q1EBugIj5KIcax
	F56P2dm5IemMvakef76T39b+ap4EAdHaGHCWb9+nOIYXQrSahKbE6hlgDyToJb0eX2ndqdiSQXG
	YrED17zTbbu2Iz1Pm5bdDQ6pERV5KN6ETrMFcJ50fpdwYJkAXE66qby05OY6RTbenHMKOTTvLsO
	qZv5De8ycNy1lb6Wx6K+YUoCHbdmyu/T9iSvsw/1K7o8oAo2InzqqFbsL/g1YpU1CStiDfZEHBD
	QvIFtKF/JuFPN8nqxcQOxncNlSz4nPAST08ug7EyDr9c1UZL1RDK58ohKQFv/Kb2
X-Google-Smtp-Source: AGHT+IFoJ7S+NM+1fld/sDOZSv7i1hwfQMxgAHLpJJzUks/6H9K0NhHJlElFI9KKk6L5kpIID510FQ==
X-Received: by 2002:a05:6000:2c6:b0:391:31f2:b99e with SMTP id ffacd0b85a97d-39132d1fc45mr7466902f8f.2.1741549779006;
        Sun, 09 Mar 2025 12:49:39 -0700 (PDT)
Received: from localhost.localdomain ([176.206.121.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01567fsm12454968f8f.41.2025.03.09.12.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 12:49:38 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Luke D. Jones" <luke@ljones.dev>,
	Ivan Dovgal <iv.dovg@gmail.com>,
	Adrian Freund <adrian@freund.io>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>,
	=?UTF-8?q?Pawe=C5=82=20Kotiuk?= <pawel@kotiuk.pl>
Subject: [PATCH 1/1] HID: amd_sfh: Add support for tablet mode switch sensors
Date: Sun,  9 Mar 2025 20:49:34 +0100
Message-ID: <20250309194934.1759953-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309194934.1759953-1-benato.denis96@gmail.com>
References: <20250309194934.1759953-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch adds support for the tablet mode switch sensors on
convertible devices where that sensor is managed by AMD SFH, like the
Asus Flow X13 and the Lenovo ThinkPad L13 Yoga Gen2 (AMD).

Tested-by: Paweł Kotiuk <pawel@kotiuk.pl>
Co-developed-by: Ivan Dovgal <iv.dovg@gmail.com>
Signed-off-by: Ivan Dovgal <iv.dovg@gmail.com>
Co-developed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Adrian Freund <adrian@freund.io>
Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  2 ++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  1 +
 .../hid_descriptor/amd_sfh_hid_desc.c         | 27 +++++++++++++++++++
 .../hid_descriptor/amd_sfh_hid_desc.h         |  8 ++++++
 .../hid_descriptor/amd_sfh_hid_report_desc.h  | 20 ++++++++++++++
 6 files changed, 62 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 3438d392920f..867019955b10 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -146,6 +146,8 @@ static const char *get_sensor_name(int idx)
 		return "gyroscope";
 	case mag_idx:
 		return "magnetometer";
+	case tms_idx:
+		return "tablet-mode-switch";
 	case als_idx:
 	case ACS_IDX: /* ambient color sensor */
 		return "ALS";
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 48cfd0c58241..72a70f5e3cef 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -28,6 +28,7 @@
 #define ACEL_EN		BIT(0)
 #define GYRO_EN		BIT(1)
 #define MAGNO_EN	BIT(2)
+#define TMS_EN		BIT(15)
 #define HPD_EN		BIT(16)
 #define ALS_EN		BIT(19)
 #define ACS_EN		BIT(22)
@@ -231,6 +232,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 	if (MAGNO_EN & activestatus)
 		sensor_id[num_of_sensors++] = mag_idx;
 
+	if (TMS_EN & activestatus)
+		sensor_id[num_of_sensors++] = tms_idx;
+
 	if (ALS_EN & activestatus)
 		sensor_id[num_of_sensors++] = als_idx;
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 05e400a4a83e..617f0265b707 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -79,6 +79,7 @@ enum sensor_idx {
 	accel_idx = 0,
 	gyro_idx = 1,
 	mag_idx = 2,
+	tms_idx = 15,
 	als_idx = 19
 };
 
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
index ef1f9be8b893..516a07bf3be6 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
@@ -47,6 +47,11 @@ static int get_report_descriptor(int sensor_idx, u8 *rep_desc)
 		memcpy(rep_desc, comp3_report_descriptor,
 		       sizeof(comp3_report_descriptor));
 		break;
+	case tms_idx: /* tablet mode switch */
+		memset(rep_desc, 0, sizeof(tms_report_descriptor));
+		memcpy(rep_desc, tms_report_descriptor,
+		       sizeof(tms_report_descriptor));
+		break;
 	case als_idx: /* ambient light sensor */
 	case ACS_IDX: /* ambient color sensor */
 		memset(rep_desc, 0, sizeof(als_report_descriptor));
@@ -97,6 +102,16 @@ static u32 get_descr_sz(int sensor_idx, int descriptor_name)
 			return sizeof(struct magno_feature_report);
 		}
 		break;
+	case tms_idx:
+		switch (descriptor_name) {
+		case descr_size:
+			return sizeof(tms_report_descriptor);
+		case input_size:
+			return sizeof(struct tms_input_report);
+		case feature_size:
+			return sizeof(struct tms_feature_report);
+		}
+		break;
 	case als_idx:
 	case ACS_IDX: /* ambient color sensor */
 		switch (descriptor_name) {
@@ -140,6 +155,7 @@ static u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
 	struct accel3_feature_report acc_feature;
 	struct gyro_feature_report gyro_feature;
 	struct magno_feature_report magno_feature;
+	struct tms_feature_report tms_feature;
 	struct hpd_feature_report hpd_feature;
 	struct als_feature_report als_feature;
 	u8 report_size = 0;
@@ -175,6 +191,11 @@ static u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
 		memcpy(feature_report, &magno_feature, sizeof(magno_feature));
 		report_size = sizeof(magno_feature);
 		break;
+	case tms_idx:  /* tablet mode switch */
+		get_common_features(&tms_feature.common_property, report_id);
+		memcpy(feature_report, &tms_feature, sizeof(tms_feature));
+		report_size = sizeof(tms_feature);
+		break;
 	case als_idx:  /* ambient light sensor */
 	case ACS_IDX: /* ambient color sensor */
 		get_common_features(&als_feature.common_property, report_id);
@@ -214,6 +235,7 @@ static u8 get_input_report(u8 current_index, int sensor_idx, int report_id,
 	struct accel3_input_report acc_input;
 	struct gyro_input_report gyro_input;
 	struct hpd_input_report hpd_input;
+	struct tms_input_report tms_input;
 	struct als_input_report als_input;
 	struct hpd_status hpdstatus;
 	u8 report_size = 0;
@@ -247,6 +269,11 @@ static u8 get_input_report(u8 current_index, int sensor_idx, int report_id,
 		memcpy(input_report, &magno_input, sizeof(magno_input));
 		report_size = sizeof(magno_input);
 		break;
+case tms_idx: /* tablet mode switch */
+		get_common_inputs(&tms_input.common_property, report_id);
+		report_size = sizeof(tms_input);
+		memcpy(input_report, &tms_input, sizeof(tms_input));
+		break;
 	case als_idx: /* Als */
 	case ACS_IDX: /* ambient color sensor */
 		get_common_inputs(&als_input.common_property, report_id);
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
index 882434b1501f..afcdac989cb6 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
@@ -114,4 +114,12 @@ struct hpd_input_report {
 	u8 human_presence;
 } __packed;
 
+struct tms_feature_report {
+	struct common_feature_property common_property;
+} __packed;
+
+struct tms_input_report {
+	struct common_input_property common_property;
+} __packed;
+
 #endif
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
index 67ec2d6a417d..4dc87d684776 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
@@ -665,6 +665,26 @@ static const u8 als_report_descriptor[] = {
 0xC0			/* HID end collection */
 };
 
+/* TABLET MODE SWITCH */
+__maybe_unused // Used by sfh1.0, but not yet implemented in sfh1.1
+static const u8 tms_report_descriptor[] = {
+0x06, 0x43, 0xFF,  // Usage Page (Vendor Defined 0xFF43)
+0x0A, 0x02, 0x02,  // Usage (0x0202)
+0xA1, 0x01, // Collection (Application)
+0x85, 0x11, //   Report ID (17)
+0x15, 0x00, //   Logical Minimum (0)
+0x25, 0x01, //   Logical Maximum (1)
+0x35, 0x00, //   Physical Minimum (0)
+0x45, 0x01, //   Physical Maximum (1)
+0x65, 0x00, //   Unit (None)
+0x55, 0x00, //   Unit Exponent (0)
+0x75, 0x01, //   Report Size (1)
+0x95, 0x98, //   Report Count (-104)
+0x81, 0x03, //   Input (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)
+0x91, 0x03, //   Output (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)
+0xC1, 0x00, // End Collection
+};
+
 /* BIOMETRIC PRESENCE*/
 static const u8 hpd_report_descriptor[] = {
 0x05, 0x20,          /* Usage page */
-- 
2.48.1


