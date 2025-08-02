Return-Path: <linux-input+bounces-13763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA6B18EC5
	for <lists+linux-input@lfdr.de>; Sat,  2 Aug 2025 15:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D542189BDA0
	for <lists+linux-input@lfdr.de>; Sat,  2 Aug 2025 13:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878B01E519;
	Sat,  2 Aug 2025 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="C1xgKKfx"
X-Original-To: linux-input@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A9D23BCE7
	for <linux-input@vger.kernel.org>; Sat,  2 Aug 2025 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754142369; cv=none; b=kZ0jGUIPbZX2m1pBJLAx28gXOy9Q6Ta24CvHC5fLmFYJnrsTFrNM0TL46VoEkGLh1PO/IQT+ODkoEBYZSazwIbvz+zjY/dStf8KCXz28eq8CFFAwj7e0WI1y5IdmwqHYXJWyZABwhl5Z7QzWcFSujRlBLcYqnxoZIdEeFnQjwI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754142369; c=relaxed/simple;
	bh=NXGZV+eWjal/j8I5d/z3GchjI6sUsX4UHc+bLHtVPe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SpwMokzjk7nFACAraq6NPgXWdB0wZVfNCOlozKVgU7YnWg/U8ejFMQj5O015dUnNv5iE37ZO8tS4m1VnYb/gMx27Oz6FpUY7jl+ROhnKFx59YDA3ruRxLxE9llz39wrK/nB3ZeDhW9Izp0Udn4ayYBN5tSXMiAJGB1L0GQXSgzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=C1xgKKfx; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4AE1C240103
	for <linux-input@vger.kernel.org>; Sat,  2 Aug 2025 15:45:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1754142360; bh=MdHIJppBkLN8gYJiKRNyD2UBKFvXcGrHkaAKVD9Vc+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=C1xgKKfxinzMu0uYmo/r57fhBzIHK4kSjiE5XYFV7HXlXjoXXxx7OVFOFjYr4TG4a
	 U5qtwDPzVtJ5XNOIwTFOnN07XYq4y2GMOhMXnejleTpS7araMetYJ/SxaHC8k8YuIx
	 f9NBL6AVeC88Dg16SBxSD6Hd6niVmVEoR8DR4wxjRrgcfHuoTfbd1cujhfquz0ESX2
	 2STSuAuywXNgoSshEbOXqLH9V4bIsGwffbCJjoqQ50Dk5KcyOQjhG74cPg8S84tmQj
	 l19dFKXgsSXDTFnPOhEyFxwQEhY/QPzG9ANhkwzr4Dmp/E3BhHh0+Z4lssRsxOI1UI
	 I7JSLG/Si7/pg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bvPGp4m0Rz6tlh;
	Sat,  2 Aug 2025 15:45:54 +0200 (CEST)
From: Martin Hilgendorf <martin.hilgendorf@posteo.de>
To: Jiri Kosina <jikos@kernel.org>
Cc: Martin Hilgendorf <martin.hilgendorf@posteo.de>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: elecom: add support for ELECOM M-DT2DRBK
Date: Sat, 02 Aug 2025 13:45:55 +0000
Message-ID: <20250802134542.21692-1-martin.hilgendorf@posteo.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT2DRBK trackball has 8 buttons, but the report descriptor only
specifies 5. This patch adds the device ID and performs a similar fixup as
for other ELECOM devices to enable the remaining 3 buttons.

Signed-off-by: Martin Hilgendorf <martin.hilgendorf@posteo.de>
---
 drivers/hid/hid-elecom.c | 2 ++
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 3 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
index 0ad7d25d9864..69771fd35006 100644
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -101,6 +101,7 @@ static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		 */
 		mouse_button_fixup(hdev, rdesc, *rsize, 12, 30, 14, 20, 8);
 		break;
+	case USB_DEVICE_ID_ELECOM_M_DT2DRBK:
 	case USB_DEVICE_ID_ELECOM_M_HT1DRBK_011C:
 		/*
 		 * Report descriptor format:
@@ -123,6 +124,7 @@ static const struct hid_device_id elecom_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT2DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1URBK_010C) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1URBK_019B) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1DRBK_010D) },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5a1096283855..6dc797de3117 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -451,6 +451,7 @@
 #define USB_DEVICE_ID_ELECOM_M_XT4DRBK	0x00fd
 #define USB_DEVICE_ID_ELECOM_M_DT1URBK	0x00fe
 #define USB_DEVICE_ID_ELECOM_M_DT1DRBK	0x00ff
+#define USB_DEVICE_ID_ELECOM_M_DT2DRBK	0x018d
 #define USB_DEVICE_ID_ELECOM_M_HT1URBK_010C	0x010c
 #define USB_DEVICE_ID_ELECOM_M_HT1URBK_019B	0x019b
 #define USB_DEVICE_ID_ELECOM_M_HT1DRBK_010D	0x010d
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index ff11f1ad344d..5c15af9afa98 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -411,6 +411,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT2DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1URBK_010C) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1URBK_019B) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_HT1DRBK_010D) },
-- 
2.50.1


