Return-Path: <linux-input+bounces-10727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8EA5D65F
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 07:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCD0D17754A
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 06:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0795F1E7C08;
	Wed, 12 Mar 2025 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJYwUTjv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722251E7C07;
	Wed, 12 Mar 2025 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741761341; cv=none; b=sO4x6GAYbEG6g+4HxJPVopGigPWQ3Giv9sUF+3IBX40CMhlqlemrtOxFfRcObAS2GHEJuIXAV3AicOJ8H9u8o3Rcy5HomaraZYAc1U1XA09aYoI9OU6NbRBtLYbpqg1AmwZoAE1uQ9eTJiaXucz2WQ7kylFk8tBnFHTwkt8QHrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741761341; c=relaxed/simple;
	bh=PAKtDelLjryyDmiE7bW+Z5elhP/kZgUbC3zDE5EhCQc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WkLzeNCj6ubanRPQeQCGcjcbV+GZGA4jgSnTozfv432WbgMZaENpPNvNq7BojXNvk0lkYivUaqEUvDX7ssVclCXcf0YEa/s1adxwQiluC3/VvnGUMkEniGHp+i97yl+khiuTtS6U9FQTHOY93E/+n7bTaeiSnJ18DOMuc84quPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJYwUTjv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22435603572so75489055ad.1;
        Tue, 11 Mar 2025 23:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741761340; x=1742366140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Yc9ZMcRdCdL7chCiGTxb0J/Ses21KmLEhmFx4IDiPtw=;
        b=iJYwUTjvFjOoVRTtisMx5Etigru8sMucoHLr4rQWxPWdMvUUez6Am82vg4FX1FNvqe
         5N9VwZDDdVEzxsh/qNfKN/EyBZ0twSY3MEF6sVL87C1/rVJhGYm1uqKJMxqerD1sfHNO
         BSpD066y7la1Rbf40SI7z0jAzyVZRtzTEmL/eN2vi/mEzze9+hvdNsCtvWQH12B45XWe
         eXR6CGt/ZIzkG517B6mKATxi5e5eOZBzveABHfZZ7P7itsb/p0csL7zRxbV06QPj+FtT
         WLt5thUzQyJGqr/9q/z43qfemAA/MX0Rw/WzaYV3l7ms+SVKA6C307pRd+jYjnH9/80r
         6xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741761340; x=1742366140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yc9ZMcRdCdL7chCiGTxb0J/Ses21KmLEhmFx4IDiPtw=;
        b=Ycpf0QZru1v9X6OI462D5RrnV8VT42eDdTwbig6e5OfBi1Ce4OGnEc0wsHFmNp2VNl
         Ztn5qdHuZgsZEjQbiFx2gdWpYtbH0b/5xKcQSVwjD5aqW50Lt1PMSl00+37HvhhK+JnN
         4H/h5Ctb1MGeOQJwjMvjyMB7/fUx0ghrZ2IZuyytLdhnKz8N8zUFZAIjDGK/A/UJn+EB
         7hXUqvGvEPoiSUSsGFGefBPUMKkEdx85t/ZgA1w4iV/aI2jwqS8OjUMJjSb3rBfYxKaD
         +5rJLAonFVWJk1KtOCpqHFZF+UwEZ+SkpLJMjUFYxNNqQmUism38FMHv5It5uB+kPKK7
         cX9w==
X-Forwarded-Encrypted: i=1; AJvYcCVwCTrmtKQf6EWcI++I/EMJYVooU26zWtEkVEMKuh8tmn54PFZSm2jM3+LmNz+4qiNWhI6W12jILUmjYMod@vger.kernel.org, AJvYcCWjX/0CBOG5qZdQ5sARJQFQqWT6r0x5BSVWHVyoC4BQWKGZ862fLA86flQVVjr8gCQjO3u9v+WZMiuN3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk1OJVmo6RhA1ilJx1Aao9/1WH9QPMNPYfry/YIk73liH6ZLDA
	MlXb4A69waXsvemo/DgfSviWh0vQ7qmrKGrzUw8Lf6MjeMhM2gwF
X-Gm-Gg: ASbGncst19sMtDolzDzSp7gsoT0xtaeVys7aYp1tROufpfEoCJXPb7uceaxC542jkbu
	PyD5THE8eJU2T/IF2tREDDZ5CuoTOe0EbGaqcD92Q5sA7HIB1KyCBTHJDReJ/ra2dnfc23IiAYU
	5mgkNc2Hzl/oDrGXr6YUDRDR/TiwSdfWrPTXoydiKG+hiCPRZRIhAekZXpWyCMv5NjwcjH6koyq
	I4qXfhvKeH5gVSZVB0qf0DvoTBdehdWOPSUHoK6wgdSIjkmU1OMYJ1zXpzbHmzMT9CFYm44Pgpc
	4GuMP/D+01LOYePUB0CeAb/nkhE=
X-Google-Smtp-Source: AGHT+IEv7AchllWbBpPDJK3IiT7THjIDNjMEL0EiDclGwopo5ewdtGjBUuFEaTqJpOsNMzBb2uZAKw==
X-Received: by 2002:a17:903:1c1:b0:224:1001:6787 with SMTP id d9443c01a7336-2242888665fmr275220555ad.4.1741761339567;
        Tue, 11 Mar 2025 23:35:39 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e975asm108960135ad.76.2025.03.11.23.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 23:35:38 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: quirks: Add quirk for Chicony Electronics HP 5MP Camera
Date: Wed, 12 Mar 2025 14:35:32 +0800
Message-ID: <20250312063532.551938-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chicony Electronics HP 5MP Camera (USB ID 04F2:B82C) reports a HID
sensor interface that is not actually implemented. Attempting to access
this non-functional sensor via iio_info causes system hangs as runtime PM
tries to wake up an unresponsive sensor.

Add this device to the HID ignore list since the sensor interface is
non-functional by design and should not be exposed to userspace.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e400624908e..5fdea9116a3e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -297,6 +297,7 @@
 #define USB_DEVICE_ID_ASUS_AK1D		0x1125
 #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A	0x1408
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
+#define USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA	0xb82c
 
 #define USB_VENDOR_ID_CHUNGHWAT		0x2247
 #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 5d7a418ccdbe..452fac15550b 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -370,6 +370,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS2) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_ASUS_AK1D) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACER_SWITCH12) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MB_CAMERA) },
 #endif
 #if IS_ENABLED(CONFIG_HID_CMEDIA)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM6533) },
-- 
2.43.0


