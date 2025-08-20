Return-Path: <linux-input+bounces-14171-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091DB2D52E
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 09:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A2A21BA708F
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 07:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D5D2BEFEE;
	Wed, 20 Aug 2025 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIifpEJd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011E27B516;
	Wed, 20 Aug 2025 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755676210; cv=none; b=Sy3Bj6/eG4GyQsXKXAfpjCRpYsQ9KB8F12ghHe4eXwEMDDU4vMr1EGDN6NeVtj6XumFlZvR5U020pZFtxNZaP3xrXJZKMJBYWsUxOW2E/rwhvhzrvOVzFuamyOc0b0+6NcwRtHyX0HUQ+zbrriUnz0CLLydkPQQOBrK/KEWS94E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755676210; c=relaxed/simple;
	bh=DaW8SCHTtoLkWNW3hvfigTxkiKow9gP26cs7z2w/gRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdiL3flpmA3krxGoZArfLcskYOjfrYFWm4ZzaySEXbMdgTton/+yTUEbPxZMS06HSIwtiw1/R0ygX6RxDlVfObYSj/s0BO4HikLhB8ah6p53Ec2aGxb9egGiPUf1QwgRmQeIiYaXAX+MG21xiTOyWzS/7XrjnWwpDp4sPnwNuPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIifpEJd; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-30ccebb0cc3so4272777fac.3;
        Wed, 20 Aug 2025 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755676208; x=1756281008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knxd7v2annobANxgViOKFr2kXBozAFDwgP3xIcbqAB4=;
        b=MIifpEJdovOpeursJ/reqlmojc3Vb9Cl3yZMvowp2wVRrsUK8Urlvi7O7/vfyDdf05
         Ogo0A2blv8aJmDdDZWSCqZ+rr3Ciuu7Soz0b5wDtzoWiMOSRz4TMVY2XUAzKM+eXH8JY
         ojT7gYCfJL8JqojH66QYRd3L9DTW282W4/htwA2HkhrsbJ5TLRaRAwOnK/rro/9mCZOz
         M5imqFPw4k7E4w7S5YEIJNC3H3y8DPut2IQNZ/tu1tBD3NZdUjGOEp32WC9iX4O42Pax
         jVZm/9MFZoEsFLL/7PdzAZ2FRb8pA10AsQSI6PQRnwZeveqSSeT/SDTD1GxmtzfnrVrv
         tOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755676208; x=1756281008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knxd7v2annobANxgViOKFr2kXBozAFDwgP3xIcbqAB4=;
        b=Ctw3D1nTzmw/byDQHM80K4FIpW+SzHRW4lW+fO0CqzWczQuXj7dJF34KPKJh+iOChP
         8JdYo51QadEIFKD1EkTWEmC7nqPkhU/RmkVU0yNg1WWYz+zZt0Cnd+ED2KxhH1G4cCuX
         0jP+sYsyEpNMO7UZ5ilRCrMwYWschmrtsOTyx+q+EC32X1+CwetOSBVOvFC1nPUMiC80
         HNJ2js3tLjHnUmRraCHUzf7rO1FNV7qqX87jyPv6+97ZThxRDtArn+ukI10nxFV6Mi1P
         hLS66BIUr08pbGnadnNDr/D7vHcP05uPau/K7G17xwGxon8+k4lmPzQD9aMvjtsvNaVt
         Aecw==
X-Forwarded-Encrypted: i=1; AJvYcCWQfSBq6N9rinoyTJNaaVrHVWWroGghiOY0aRMHn7MVx/Nc9oGBq7JqLYOJarUHt0lZxWfG6z4zSsCAaO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCriGnfylPbNS1no02uplDM0CeVMH+2bho9r6xEcgizELHN7h
	nG3d7XscKLznQMFKEaBA3gCMTz2cvqzTsX/T0hTKirnyKxSEbXs7PFmxgSNFtC6UVog=
X-Gm-Gg: ASbGncuAvXT5QNZxw1ACU21D7pH1XuvhmUw904COzIW/zkaEKeTtpkB5Jms7YFBl0sW
	aFvN49bqS1/ZtIIWPEOTzQV5qcZX8NeUP72KaegzNOGWHL/+38Wez9zzN9/mA1UF9Gs1X4E2Ytb
	+s+Oa70LJOiqhJQhZboGSbeVyocaN77mPQg6xb5mHLQahriz7666YIOPY1JdoqPEY6hOApm7A0U
	TMJQtB5XC6FVWOknJIg02rvChgMftYcieY2bpJ6QeE3lhOeY0/hu8KvHGmdKx/+cREf/S4Cdaz/
	8MfhsYW26dFQLS8eut0LD/AH1ZWR5ygl/QzYcKjuX3/BwbD5KRWBqTPx/fuCiNqdJgK9kM+Wdqs
	vI//9paVFktrlLKJkSCnd
X-Google-Smtp-Source: AGHT+IHo7Js4roJf/pmGWppb/wsL8mD0p5FBXOIr9x115cGKzx8NGoZLLIl3P6FjCRyiQpjjUEJdUQ==
X-Received: by 2002:a05:6870:e070:b0:30b:aeca:d9b1 with SMTP id 586e51a60fabf-31122a56200mr1028255fac.38.1755676208022;
        Wed, 20 Aug 2025 00:50:08 -0700 (PDT)
Received: from localhost ([2602:61:7a62:400:ca7f:54ff:fe0b:ceef])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-310ab88051asm4078366fac.2.2025.08.20.00.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 00:50:07 -0700 (PDT)
From: Matt Coffin <mcoffin13@gmail.com>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-kernel@vger.kernel.org,
	Matt Coffin <mcoffin13@gmail.com>
Subject: [PATCH] HID: logitech: Add ids for G PRO 2 LIGHTSPEED
Date: Wed, 20 Aug 2025 01:49:51 -0600
Message-ID: <20250820074951.1120397-1-mcoffin13@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the G PRO 2 LIGHTSPEED Wireless via it's nano receiver
or directly. This nano receiver appears to work identically to the 1_1
receiver for the case I've verified, which is the battery status through
lg-hidpp.

The same appears to be the case wired, sharing much with the Pro X
Superlight 2; differences seemed to lie in userland configuration rather
than in interfaces used by hid_logitech_hidpp on the kernel side.

I verified the sysfs interface for battery charge/discharge status, and
capacity read to be working on my 910-007290 device (white).

Signed-off-by: Matt Coffin <mcoffin13@gmail.com>
---
 drivers/hid/hid-ids.h            | 1 +
 drivers/hid/hid-logitech-dj.c    | 4 ++++
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5a1096283855..37dc42380373 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -907,6 +907,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2		0xc534
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2	0xc543
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
 #define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER	0xc548
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 34fa71ceec2b..cce54dd9884a 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1983,6 +1983,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
 	 .driver_data = recvr_type_gaming_hidpp},
+	{ /* Logitech lightspeed receiver (0xc543) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2),
+	 .driver_data = recvr_type_gaming_hidpp},
 
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 10a3bc5f931b..aaef405a717e 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4596,6 +4596,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC094) },
 	{ /* Logitech G Pro X Superlight 2 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC09b) },
+	{ /* Logitech G PRO 2 LIGHTSPEED Wireless Mouse over USB */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xc09a) },
 
 	{ /* G935 Gaming Headset */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0x0a87),
-- 
2.50.1


