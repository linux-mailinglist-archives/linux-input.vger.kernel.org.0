Return-Path: <linux-input+bounces-9148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C6A0A733
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 05:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA23218857D9
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 04:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE43219FF;
	Sun, 12 Jan 2025 04:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ukr.net header.i=@ukr.net header.b="v2nRJl5c"
X-Original-To: linux-input@vger.kernel.org
Received: from frv71.fwdcdn.com (frv71.fwdcdn.com [212.42.77.71])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAD3EEBB;
	Sun, 12 Jan 2025 04:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.77.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736656135; cv=none; b=ozOk1iaoZEImUSaswZOXPplpFBXwee5GW4NcWlwdy8jLT13vHl9tgwoWjTOpL1EAv7wXlaEfkeOmWJG+mYqO9PhfCiYYYSI4kJbqb4mWlqty7taPwG/V/EL8HszZ60EbdbTZUi/O/Sp4Fc2RGElGqBWMaDTEwEo1TMCsxpJfZgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736656135; c=relaxed/simple;
	bh=hxsvDqspgQYMCoFUIng9LGPvQ3XhuxkutcqVLjX0Kak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjoNNIRVnqUfv211XCQEkN092ykp5yllugAOZ6rao3JEH5KDJGngJO8cz2oavLPQR+hMB5BwVNSTFiJZnDacgJ/MU2csI+OWQNu2QoPrKEhY4MFTqqbtjFpmZXFoWrRBKyUZkb30IpsN+Y7LO22v9BEDkuPFwTjPMtguuAYJHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ukr.net; spf=pass smtp.mailfrom=ukr.net; dkim=pass (1024-bit key) header.d=ukr.net header.i=@ukr.net header.b=v2nRJl5c; arc=none smtp.client-ip=212.42.77.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ukr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ukr.net
Received: from frv152.fwdcdn.com ([212.42.77.152]) by frv71.fwdcdn.com QID:1tWpLy-000GX2-0E/RC:2;
	Sun, 12 Jan 2025 06:13:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ukr.net;
	s=fsm; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To
	:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=RYpVg1+IcnhPEUU6BYLqAQkROe7bSQKqkThaeSjaGYo=; b=v
	2nRJl5cBVzmaV/DiITLeeRpKAUHgpUcTLSccAJIQasEfQiVAAC77afXOSDUaB+MwYMayPQ03pwHsh
	6krpQe9jc98bwoEx1JfB0FiXCGVjVqeFncesJnAUaaR3lThDHf0P0BZ+dtbvoZMlA0DsEmbD7pDiA
	1SE1dyATDVwOaDs4=;
Received: from m106073187065.v4.enabler.ne.jp ([106.73.187.65] helo=Hyperion..)
	by frv152.fwdcdn.com with esmtpsa ID 1tWpLl-000GO0-1S
	;
	Sun, 12 Jan 2025 06:13:22 +0200
From: Ievgen Vovk <YevgenVovk@ukr.net>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ievgen Vovk <YevgenVovk@ukr.net>
Subject: [PATCH] HID: hid-apple: Apple Magic Keyboard a3203 USB-C support.
Date: Sun, 12 Jan 2025 13:13:14 +0900
Message-ID: <20250112041314.11661-1-YevgenVovk@ukr.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Result: IP=106.73.187.65; mail.from=YevgenVovk@ukr.net; dkim=pass; header.d=ukr.net
X-Ukrnet-Yellow: 0

Add Apple Magic Keyboard 2024 model (with USB-C port) device ID (0320)
to those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Ievgen Vovk <YevgenVovk@ukr.net>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 7e1ae2a2bcc2..3c3f67d0bfcf 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -474,6 +474,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
 			table = magic_keyboard_2015_fn_keys;
 		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
+			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
 			table = apple2021_fn_keys;
@@ -1150,6 +1151,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 1f47fda809b9..4f583d6f2eba 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -184,6 +184,7 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
-- 
2.43.0


