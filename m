Return-Path: <linux-input+bounces-16477-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D61CAB09F
	for <lists+linux-input@lfdr.de>; Sun, 07 Dec 2025 04:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D897B31371C1
	for <lists+linux-input@lfdr.de>; Sun,  7 Dec 2025 03:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B35726E6F9;
	Sun,  7 Dec 2025 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lynthium.com header.i=@lynthium.com header.b="2A6M+Msg"
X-Original-To: linux-input@vger.kernel.org
Received: from pmg03-out5.zxcs.nl (pmg03-out5.zxcs.nl [185.104.31.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666A7269CE1
	for <linux-input@vger.kernel.org>; Sun,  7 Dec 2025 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.104.31.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765076517; cv=none; b=raBD52qhAAJRJR3B5xMQ1M76qJGpJqCNhaFoMKxC5F91vp68VE1hLirLuMgpHGfVLEQt9oEW9g7S7wQ8+XzKPxqPVOLBWh8odchkWGq78SBr/4zu4B5AnVRJLUNYv8PpMEl/Xb/XKJYHZIiIW/1J31TC9o4U0QHKBdvG2rpzSME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765076517; c=relaxed/simple;
	bh=Fg6MlCJ0+1qMspD9550F3Sa9O2Fv9opivGs/TMIKuik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kjwUTcng3fW0xC0evlQc62v2aMD8QcbdVE69OFkbBztOui9gsdF+HEWzfH6EdKYZ38daZhqy17atbXtj62wPc7qLJuSLurop8f3+rl6nbdTdf4bC7pN0UQttAhBqJU6EiLqlAT/W37SBnEACF8OeD2neKmOZda+GKE8D7sbzAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lynthium.com; spf=fail smtp.mailfrom=lynthium.com; dkim=pass (2048-bit key) header.d=lynthium.com header.i=@lynthium.com header.b=2A6M+Msg; arc=none smtp.client-ip=185.104.31.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lynthium.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lynthium.com
Received: from pmg03.zxcs.nl (localhost.localdomain [127.0.0.1])
	by pmg03.zxcs.nl (ZXCS) with ESMTP id 853DC1E8E3A;
	Sun, 07 Dec 2025 03:46:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lynthium.com; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date
	:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=G8lGZ8LUOwbW6oTyQIxke2rj/HT1qDg3yWSwR0kdRYY=; b=2A6M+Msg2BZxa6tZHtpRzErwyh
	D1B4mvLRwimo4X31SYv0do5QceAYUczYwMNUjZCng6tDdtIs9qyO3ErNnDI7eUDYlkAu1ujVCzs1V
	mNa9kxvNzR2f1pPnUpYR3fYHNhY+DrqrWMhG9x/aVBtqwi17ehSgwC/9bbpspQLjJ8X0Q9g0GqLO2
	iFaHmW29ItfWT/Pg4Yr5RbHRXGbpH+lYSEoy4zfVj9KqSlH7Nz/zhmhUijIqzH5OHzl8dvIHKme61
	G8499YoGEu0P7HtGmcn5Q8F82wGdkhgqOKl7IhW+LMnEmi3dzafHySbumJGwiO1ymPTp+Eo8qPPk3
	XLmv9g4A==;
From: Arnoud Willemsen <mail@lynthium.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnoud Willemsen <mail@lynthium.com>
Subject: [PATCH] HID: Elecom: Add support for ELECOM M-XT3DRBK (018C)
Date: Sun,  7 Dec 2025 03:43:19 +0100
Message-ID: <20251207024318.14666-2-mail@lynthium.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: mail@lynthium.com

Wireless/new version of the Elecom trackball mouse M-XT3DRBK has a
product id that differs from the existing M-XT3DRBK.
The report descriptor format also seems to have changed and matches
other (newer?) models instead (except for six buttons instead of eight).
This patch follows the same format as the patch for the M-XT3URBK (018F)
by Naoki Ueki (Nov 3rd 2025) to enable the sixth mouse button.

dmesg output:
[  292.074664] usb 1-2: new full-speed USB device number 7 using xhci_hcd
[  292.218667] usb 1-2: New USB device found, idVendor=056e, idProduct=018c, bcdDevice= 1.00
[  292.218676] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  292.218679] usb 1-2: Product: ELECOM TrackBall Mouse
[  292.218681] usb 1-2: Manufacturer: ELECOM

usbhid-dump output:
001:006:000:DESCRIPTOR         1765072638.050578
 05 01 09 02 A1 01 09 01 A1 00 85 01 05 09 19 01
 29 05 15 00 25 01 95 08 75 01 81 02 95 01 75 00
 81 01 05 01 09 30 09 31 16 00 80 26 FF 7F 75 10
 95 02 81 06 C0 A1 00 05 01 09 38 15 81 25 7F 75
 08 95 01 81 06 C0 A1 00 05 0C 0A 38 02 95 01 75
 08 15 81 25 7F 81 06 C0 C0 06 01 FF 09 00 A1 01
 85 02 09 00 15 00 26 FF 00 75 08 95 07 81 02 C0
 05 0C 09 01 A1 01 85 05 15 00 26 3C 02 19 00 2A
 3C 02 75 10 95 01 81 00 C0 05 01 09 80 A1 01 85
 03 19 81 29 83 15 00 25 01 95 03 75 01 81 02 95
 01 75 05 81 01 C0 06 BC FF 09 88 A1 01 85 04 95
 01 75 08 15 00 26 FF 00 19 00 2A FF 00 81 00 C0
 06 02 FF 09 02 A1 01 85 06 09 02 15 00 26 FF 00
 75 08 95 07 B1 02 C0

Signed-off-by: Arnoud Willemsen <mail@lynthium.com>
---
 drivers/hid/hid-elecom.c | 15 +++++++++++++--
 drivers/hid/hid-ids.h    |  3 ++-
 drivers/hid/hid-quirks.c |  3 ++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
index 981d1b6e9658..2003d2dcda7c 100644
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -77,7 +77,7 @@ static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		break;
 	case USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB:
 	case USB_DEVICE_ID_ELECOM_M_XT3URBK_018F:
-	case USB_DEVICE_ID_ELECOM_M_XT3DRBK:
+	case USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC:
 	case USB_DEVICE_ID_ELECOM_M_XT4DRBK:
 		/*
 		 * Report descriptor format:
@@ -102,6 +102,16 @@ static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		 */
 		mouse_button_fixup(hdev, rdesc, *rsize, 12, 30, 14, 20, 8);
 		break;
+	case USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C:
+		/*
+		 * Report descriptor format:
+		 * 22: button bit count
+		 * 30: padding bit count
+		 * 24: button report size
+		 * 16: button usage maximum
+		 */
+		mouse_button_fixup(hdev, rdesc, *rsize, 22, 30, 24, 16, 6);
+		break;
 	case USB_DEVICE_ID_ELECOM_M_DT2DRBK:
 	case USB_DEVICE_ID_ELECOM_M_HT1DRBK_011C:
 		/*
@@ -122,7 +132,8 @@ static const struct hid_device_id elecom_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XGL20DLBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_018F) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d31711f1aaec..e1dbb3107fb3 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -451,7 +451,8 @@
 #define USB_DEVICE_ID_ELECOM_M_XGL20DLBK	0x00e6
 #define USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB	0x00fb
 #define USB_DEVICE_ID_ELECOM_M_XT3URBK_018F	0x018f
-#define USB_DEVICE_ID_ELECOM_M_XT3DRBK	0x00fc
+#define USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC	0x00fc
+#define USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C	0x018c
 #define USB_DEVICE_ID_ELECOM_M_XT4DRBK	0x00fd
 #define USB_DEVICE_ID_ELECOM_M_DT1URBK	0x00fe
 #define USB_DEVICE_ID_ELECOM_M_DT1DRBK	0x00ff
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c89a015686c0..77e0f3e885b3 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -412,7 +412,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XGL20DLBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_018F) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
-- 
2.52.0



