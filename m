Return-Path: <linux-input+bounces-15854-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA965C27BFD
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 11:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BB231A234D0
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 10:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E702D77E6;
	Sat,  1 Nov 2025 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="g8y/m8CD"
X-Original-To: linux-input@vger.kernel.org
Received: from relay14.grserver.gr (relay14.grserver.gr [46.224.16.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42A52D593D;
	Sat,  1 Nov 2025 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.224.16.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761994045; cv=none; b=Q/MI/n6nxlmTCm5KbQcXPCylwJyYW9M5tR1Z/oKzr/ze2Jk7tvreoL3U7djErPpzCjXkrHpJX4V0g/V7GKgOweC9HTMHp+IOBkELHc9lyocgTCxwFpfiiH83WUPp1lSr6QEf/ExH8CKiXMkfQCaL4RxdMso/xTi0DFiYsXyx7PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761994045; c=relaxed/simple;
	bh=isjzd5ksZHnrqxaachHQisgZp6mPlr30IorV4Yd8olw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjLQtEtVSfuWoHW91CFfG50pj4gipt/DEq9v6i0gReRi57Bwi4AEfl9/TwgCFVxAGbvyttq3fo79lhdQO6KdhUsrdZ38jXjw0lbSbcVjGTRKsx5hz7D7ClQcedAB7AbIcNkewKfWSFnNrA/9Rql1T8uqeOICNQaQSewXiZLWokw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=g8y/m8CD; arc=none smtp.client-ip=46.224.16.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 5507F43D1F;
	Sat,  1 Nov 2025 10:47:20 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id B044243D11;
	Sat,  1 Nov 2025 10:47:19 +0000 (UTC)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id CF674201E6F;
	Sat,  1 Nov 2025 12:47:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761994039;
	bh=i5+uSgUiR32f+7oalVlvJwAuka7WUscUO2PT+s80XuI=; h=From:To:Subject;
	b=g8y/m8CDvktAGNYvi284+SDgBAVh3cgdcnWOCuyeDUK2r7fSNKL1FXQ35E+GMWRAZ
	 /dbEzUq3O+M7jcZxxZgq0quj1SHRtxCLr6cSOTn3dgEdiHrxK8d7ry1nSOLJic8Qag
	 XpwwyO9mSP3wgRTWcHMCCzOIm8QQP1RIc2Pfgdnjv6TuVjMSJrtjrC0CEkPHK3fYLd
	 S9GRZXvwSHlZyg5TxboJQmaHbu2+klSPTFNlyV2OE/0qEPJzt5qrxhG2eYkbyCb7r9
	 mTD2aD6/iU1PQ61OaOT0XB0zg/kuzcjZVtXM5n8s3AY601qNuEgVrNUajgz6+seivH
	 6ZUOx2LldRAzw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for old
 NKEY keyboards
Date: Sat,  1 Nov 2025 11:47:07 +0100
Message-ID: <20251101104712.8011-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101104712.8011-1-lkml@antheas.dev>
References: <20251101104712.8011-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176199403936.3745725.1466774852186976742@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

These keyboards have always had initialization in the kernel for 0x5d.
At this point, it is hard to verify again and we risk regressions by
removing this. Therefore, initialize with 0x5d as well.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 726f5d8e22d1..221c7195e885 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_ROG_ALLY_XPAD		BIT(13)
 #define QUIRK_SKIP_REPORT_FIXUP		BIT(14)
+#define QUIRK_ROG_NKEY_LEGACY		BIT(15)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	if (ret < 0)
 		return ret;
 
+	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
+		/*
+		 * These keyboards might need 0x5d for shortcuts to work.
+		 * As it has been more than 5 years, it is hard to verify.
+		 */
+		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
+		if (ret < 0)
+			return ret;
+	}
+
 	/* Get keyboard functions */
 	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
 	if (ret < 0)
@@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
-- 
2.51.2



