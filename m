Return-Path: <linux-input+bounces-9959-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162DA30E6D
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47B83166ACF
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49165250C11;
	Tue, 11 Feb 2025 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gt4VidWc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34D250BF5;
	Tue, 11 Feb 2025 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284525; cv=none; b=g5Iz+uf9ofX48/MrXMoVi55PXYY06wktNt4sStjBCleeMHwYgGJ9bfz86wvHCYFWspUcgHlRTKaHrW8R4kQqtir+hqaeTTinWxYVt3vraFbsxMe7/wLnV24fbO73Aw6IaW2PJH+4/PsY69yzzgCz8O7bu+AhX8Y6TjXTzb89B5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284525; c=relaxed/simple;
	bh=63N2CLR+q6W1xHPej8KWz2+AOl28NpDYsKe9GLcAMvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzAIPnBUc+Yc2dgEeWIOizeY3I7GCTx5m/KFSB2ZlcTbCpm2GWhWh1bKfjTwutXzdcMtH0FWnjG7GzjuDZmNy2IrhKY+jQQq+qQfwGmG0yeCDzalzO7eT2UjSfsfMdQZBIxngH4LVZ8CtmXBB4TmgF602Y2LPQW6eKDSSRVFd/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gt4VidWc; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-308e4bcd978so3324981fa.1;
        Tue, 11 Feb 2025 06:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739284521; x=1739889321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kdkw8SKc2jEdMzydhzBcIQXPPdM4NJNLnID5/f9u6lI=;
        b=gt4VidWckzF3cZKomr2Ojzt/ZydYiGHB9KGw92+VOCu7Vl97gaAAAwBbiUhsvboUbk
         JcZj9pL5Bf5u3rP8iIIF05OyldQQNXyIX5OFA84R2+ylAI/Vnj6OrXoa9UW/nul/HGH9
         GgRHdJ2Z/BoJ8vkFp2mJHUjqMjgJ/LHWib0lKni906rYoVELGVfdIjEOorwrr0OMk6bp
         0L56PI68GJLXsUHN2fiEDPIXKf3ftkUfNmrctypzyJDspqqeMPj7sILqX6bQ3nCauFcs
         jySHCRM3ftSEsVrjVsfeGfgh5rV7i/DXBoyGEHutjgFhSqOvsGn68eZB8nH2sXxWwyno
         mlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284521; x=1739889321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kdkw8SKc2jEdMzydhzBcIQXPPdM4NJNLnID5/f9u6lI=;
        b=RZbBTLVCdh1pWD420z6y9taBK7+NR6J2Z5GUNp5u+WoPvForp0w7mMui1+m5SZd4B8
         +re5mDV8etL89myL3jMajEosYXVbzaOb/E8/QlVKxUSx/SKgfXBv968p1ds9wAEbe4GN
         hNVp8hnddr2pgyBCZXM2aXHIiYxr5t8vyjVkclkvHYoLFL1p6v0AmmB13ZuMGBrYAEFr
         SvSaX8P406tF1F5WZqq9ZixFOZK++Bv/Qnb7FPa1c8VFDUakcLh3YFwJ4Ii+lCm3Bi6+
         AJypc7R8dhAiQVn2QSt+PjDPrF001QZxqT0PTBBYDmEcGFvAYTx6owUICAgbbwYKzgfU
         OdZw==
X-Forwarded-Encrypted: i=1; AJvYcCVUHtUSqQ8s/Jo/iJpNDNGKQVv/YbFNZidn7RzYlNiJXXwCpztwIzF+mCQopQRWPYqgNflXi57K83znig==@vger.kernel.org, AJvYcCW4q0EQywnKI3RiS0yGGY0wscXvpOq92k+JsuUfK0Uwbb53Y4Ir7qDZOozPezI7SEscNYGrLJW/US29@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+8XCx2So+QUSA8oPEM638CwHFZPzfGF7ZbB3t5vuUe3a/oNYO
	UyVjaiOGu109ob2qupK3bZ+92FuOJhCCRb0ODh+egfKmSTMMF7BJ
X-Gm-Gg: ASbGncstwACytmwVlqGT+9/9iz1XzjZARBRi64URAgAUIGfFSrjHOw4yqtJGRAp8kX5
	1pm20PW961xAIX+nNPuGqq7bEiC7fVWgxEfKo+oSCwikkWpa8voRsUu37cbwIyxilDf+EbE7taa
	wR7yluKTFmVX3bFVVPNqno/9ppdqaBo4L79r6KSbr/M4dHpAuPYWvbLodqe4O1SFR85c2Z7K0go
	QH9IsIDinRyfkQ4iv5k/m6lmSjV8ElMZ06yr7J6WVwgx/JfDLlOdWvoxcUcww2vMDzwlSrI4nZc
	hwm6iqXDvJ2liiB2+3/dSfkCp30O20GWgSAzdQgkJgzDz6TVFnKibkhToNaC8A==
X-Google-Smtp-Source: AGHT+IG3ip/jSb8wAk87NjyS3bhJUfHYby9ii42OFaym56d9/LZdyQO6xhU3OmzDIQN260D7H6jRGg==
X-Received: by 2002:a05:651c:1503:b0:302:40ee:4c34 with SMTP id 38308e7fff4ca-307e57fcee3mr25830201fa.4.1739284521295;
        Tue, 11 Feb 2025 06:35:21 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ee4173edsm6132191fa.0.2025.02.11.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:35:20 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 3/6] HID: hid-universal-pidff: Add Asetek wheelbases support
Date: Tue, 11 Feb 2025 15:35:09 +0100
Message-ID: <20250211143512.720818-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds Asetek vendor id and product ids for:
- Invicta
- Forte
- La Prima
- Tony Kanaan

v2:
- Misc spelling fix in driver loaded info

v3:
- Chanage Oleg's name order

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/hid-ids.h             |  6 ++++++
 drivers/hid/hid-universal-pidff.c | 10 +++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index dbac05649e9d..860adabbc625 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -189,6 +189,12 @@
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
 
+#define USB_VENDOR_ID_ASETEK			0x2433
+#define USB_DEVICE_ID_ASETEK_INVICTA		0xf300
+#define USB_DEVICE_ID_ASETEK_FORTE		0xf301
+#define USB_DEVICE_ID_ASETEK_LA_PRIMA		0xf303
+#define USB_DEVICE_ID_ASETEK_TONY_KANAAN	0xf306
+
 #define USB_VENDOR_ID_ASUS		0x0486
 #define USB_DEVICE_ID_ASUS_T91MT	0x0185
 #define USB_DEVICE_ID_ASUSTEK_MULTITOUCH_YFO	0x0186
diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 1b713b741d19..5b89ec7b5c26 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -4,7 +4,7 @@
  * hid-pidff wrapper for PID-enabled devices
  * Handles device reports, quirks and extends usable button range
  *
- * Copyright (c) 2024, 2025 Makarenko Oleg
+ * Copyright (c) 2024, 2025 Oleg Makarenko
  * Copyright (c) 2024, 2025 Tomasz Pakuła
  */
 
@@ -104,7 +104,7 @@ static int universal_pidff_probe(struct hid_device *hdev,
 		goto err;
 	}
 
-	hid_info(hdev, "Universal pidff driver loaded sucesfully!");
+	hid_info(hdev, "Universal pidff driver loaded sucessfully!");
 
 	return 0;
 err:
@@ -179,6 +179,10 @@ static const struct hid_device_id universal_pidff_devices[] = {
 		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LITE_STAR, USB_DEVICE_LITE_STAR_GT987_FF),
 		.driver_data = HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_INVICTA) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_FORTE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_LA_PRIMA) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASETEK, USB_DEVICE_ID_ASETEK_TONY_KANAAN) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, universal_pidff_devices);
@@ -194,5 +198,5 @@ module_hid_driver(universal_pidff);
 
 MODULE_DESCRIPTION("Universal driver for USB PID Force Feedback devices");
 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Makarenko Oleg <oleg@makarenk.ooo>");
+MODULE_AUTHOR("Oleg Makarenko <oleg@makarenk.ooo>");
 MODULE_AUTHOR("Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>");
-- 
2.48.1


