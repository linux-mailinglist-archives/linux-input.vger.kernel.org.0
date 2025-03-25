Return-Path: <linux-input+bounces-11259-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EEEA708B1
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07A971892C66
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735D7265CC8;
	Tue, 25 Mar 2025 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAkMI9gF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA641264A81;
	Tue, 25 Mar 2025 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742925728; cv=none; b=HPuo+t/S7QsQXbpkkcVUBb3uCTwikvFS/qqY74mF6LptppFoPTyYlt5JPlBHsbb3Evz8FGTfxNuqx6I7piMpmAmE5XQNDuEsbl0OYxeJ7ocGxtkW2UYrYdWfp5WalXeWFQLaA568Q8PG0NDBMMj0HrXCoRCVG6nvJsiDTsrSd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742925728; c=relaxed/simple;
	bh=8/uMRBh3mK796+LKtfMh2T6yfdl7GLGGRlyEhsLeeyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPqm2V2n3Z1+Mi2LlpwGTcof+0ZmlKcKGNoMMfx797waJExGCwHe+NPKd6zmZpq8A9S+zMWVEjS8VQ3HrG/9v/aSz7EZeiDFcucpLs/MhNepvNaX0A+dDZRReJ9l27RHJ5xpDOKg/1E1o35CdaHzO4C1JWLskNC135MaZWywGEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAkMI9gF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso9791878a91.0;
        Tue, 25 Mar 2025 11:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742925726; x=1743530526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYYHBv15Cr/EVMsakWkXkgVhCcei5/+8+zGzUiU2emo=;
        b=CAkMI9gFHaS2upH3WGzQQuUIQLKp5v6sGbZBTjCFT6Yio0Jk5bKHjE5SzbHTxOSTue
         T3ZGd47+qKbhzigWpZno76MsJ3rHH5lkf/LYj6AjDC9RdYe9SBosFVvbhhQRv7PbCKO/
         mmoCs6NYEnZ6o7Orf+smSMlAWpjRUGxxsq0tGPtoQdbnoHgJYydive2ugmh8wI/mcSDb
         dS6bGa3Utrpi/xajgWMYUDZGMxbuE1XWV7UrBJ+pRz960TtJ9BcqLgrM+6GP9MTXpb6C
         bnJMKLTPWhCO4y5V69QpM5JOdrChlXs9K0HmuJ0kKEVvPEQNzFLbKMwAH5HqWZDd9OYp
         G+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925726; x=1743530526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYYHBv15Cr/EVMsakWkXkgVhCcei5/+8+zGzUiU2emo=;
        b=YzP/WH2KYYq9argJeXbMQ7wXd913GSv87VtB/RDgz7L9WYG+YB0y12T0CQSDd3Pghu
         EUNXIlHnkYM0EhSsv2EtKrMqESk1sMdVE9s8UyCGMq048o1F/pCG7AjzOZawlE7ThgA0
         mGJBqf1SByJ7QYZ4orJVgy0GeYMMHqTnQXD+CnzBVjy4Gnb0a0zbGL1Nbg447yEFmAeK
         lEVYhjytPWOt4C7Bn7n53O1i5s78snt6rvEY5gqnesqy81+hlbSR/ReiwMKfdQKhx0P3
         IE9hY8LgrIRH+c1vf8u+okX/K28tphCwsqcSEnN6ZMSjsa42EbgFlxsb3GN6PnJHcKDU
         SWkg==
X-Forwarded-Encrypted: i=1; AJvYcCWa9FYv8PC4ONRRWcmxPICbvRbXGNb3H6AwJcAEyjCeTVlrD0bjgY+y/6fuiDMLsJyFtvou0oVyaLYoMQ==@vger.kernel.org, AJvYcCXCONBzMLtw0V5PVqnh1ImL//J65wnp6EoprfCegZH+QIkNp2FCLhH2n7Wr/JjY83RgJTbBJ6UG+9f17Jxa@vger.kernel.org
X-Gm-Message-State: AOJu0YxNOm6Kw8Pna05HGXHauiV9Y8Cw1/VDey/h2qhvlcUyA6BRMwwO
	WVHZ5ul47NjPSFnrSpMwLMhr6cnadbqpW085kuB3t1IU4iOIRvsb
X-Gm-Gg: ASbGnctp3/KUkhzMz2Kz/hN0QtGMPBWBrPCWFNp7yNKy1cUAs2L2juMe4GUxrP1yal8
	SD0tuWjvu3dIKwg+p0y9IPhphrcdUOhI+qBUKoq78ZmYpXP9BzKWGbiGRObnvkFPbdXARn+x2YW
	N7IgdRsX75l4XcWkpUH094OIZHZtjkvF5aFmEBNA8OEnXZ72nmYIw39PydkBK2A0lBo2XLfFD0n
	67+2qHX0A8Hmpxor3tMjveoMqriSFrMstk13wDaJjP8MjdQjltqsqginy9Vlo+q9f5NrdNk6c1R
	EMGaD/DObzJMLB5ws2AD3P0cPM4VczNRB64K+cc8asbq/BJYXuZeSHDXky1fAgCN4MqiL+S+aXh
	xZ2Ycy4RQoy7xqnfjz/FJPBZvxOy8JYGSnGlZlixv92UNcw==
X-Google-Smtp-Source: AGHT+IHYM47qfm1E7ymcU+Xe9BxK1rGyJ7v8oKs+A1gv2ti8YqR2w6RZbB5tB4bwdDjes8NbVLJslg==
X-Received: by 2002:a17:90b:2541:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-3030fe56936mr26729547a91.4.1742925725407;
        Tue, 25 Mar 2025 11:02:05 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d8287sm10683796a91.15.2025.03.25.11.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:02:05 -0700 (PDT)
From: adityagarg1208@gmail.com
X-Google-Original-From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: gargaditya08@live.com,
	kekrby@gmail.com,
	orlandoch.dev@gmail.com,
	admin@kodeit.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] HID: multitouch: add device ID for Apple Touch Bar
Date: Tue, 25 Mar 2025 17:57:28 +0000
Message-ID: <20250325180138.15113-6-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325180138.15113-1-gargaditya08@live.com>
References: <20250325180138.15113-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kerem Karabay <kekrby@gmail.com>

This patch adds the device ID of Apple Touch Bar found on x86 MacBook Pros
to the hid-multitouch driver.

Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
appreciated.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a50325270..403f4517f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -769,6 +769,7 @@ config HID_MULTITOUCH
 	  Say Y here if you have one of the following devices:
 	  - 3M PCT touch screens
 	  - ActionStar dual touch panels
+	  - Apple Touch Bar on x86 MacBook Pros
 	  - Atmel panels
 	  - Cando dual touch panels
 	  - Chunghwa panels
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 66e33a482..41d206f80 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -221,6 +221,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_APPLE_TOUCHBAR			0x0114
 #define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
@@ -406,6 +407,12 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name = MT_CLS_APPLE_TOUCHBAR,
+		.quirks = MT_QUIRK_HOVERING |
+			MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE |
+			MT_QUIRK_APPLE_TOUCHBAR,
+		.maxcontacts = 11,
+	},
 	{ .name = MT_CLS_SIS,
 		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
 			MT_QUIRK_ALWAYS_VALID |
@@ -1858,6 +1865,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret != 0)
 		return ret;
 
+	if (mtclass->name == MT_CLS_APPLE_TOUCHBAR &&
+	    !hid_find_field(hdev, HID_INPUT_REPORT,
+			    HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
+		return -ENODEV;
+
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
 
@@ -2339,6 +2351,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
 			USB_DEVICE_ID_XIROKU_CSR2) },
 
+	/* Apple Touch Bar */
+	{ .driver_data = MT_CLS_APPLE_TOUCHBAR,
+		HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+			USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
+
 	/* Google MT devices */
 	{ .driver_data = MT_CLS_GOOGLE,
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
-- 
2.49.0


