Return-Path: <linux-input+bounces-11264-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220E1A7099B
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E56DB189E32D
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDE71F3FE2;
	Tue, 25 Mar 2025 18:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="CGZGfSEw"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF361F3BA3;
	Tue, 25 Mar 2025 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928378; cv=none; b=hNDZimzB6fJyffe6qURz3r5LA9zsWoAJmj+SqsCJy9XpIFBDk0UchmXoWjEkVQ6XyewVgEWOHgKmtdt1bmYaV6BD7cgZOLyLO08AOtiLlzcTbfd5IsKTUfy+Spf0qK8u0N6JojpG3pL7BOCdjljk85xx96RBqgOrWEPjzBmaiAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928378; c=relaxed/simple;
	bh=bzHAFZlqpycd+y3xworuJn4ht3p2an0/1qPK6N/8rAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaivsNYWC3AnnkKjBXEXlzwnHJMGaICVD1KCnwoxYK159BjIUsTWkN7rqB9Ay11JU/Uuirf4Fos0KYWhMsyukwJO69cHDCGkMOwYNumfI6Z92rbRJvYr/ejuKbHqUBqg/+v0xGg9X0NyGBVK08JPpWuSlIaiJD+HGEWj25kopQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=CGZGfSEw; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 427F62E098AC;
	Tue, 25 Mar 2025 20:46:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928372;
	bh=qO2ABiP2VcZoKwfQCx+dw5dTpRGLGWJaqQilS9O8+jI=; h=From:To:Subject;
	b=CGZGfSEwZfdFGKq00LWZCseLhDQRKRbtA21jNdwFbViwkkdja3eNbbX2/4qjsoWUb
	 nKwLUg4ok0MadzlrwR0jiA4ihWQUesx5WUQUwrAF776EXvS0bpqaP2sUd1tyKnY5sX
	 tXB+t5hmAF0J9qRUh6UqWbk9YyZZ0HK9bqET4X3Q=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
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
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v5 03/11] HID: asus: add Z13 folio to generic group for
 multitouch to work
Date: Tue, 25 Mar 2025 19:45:52 +0100
Message-ID: <20250325184601.10990-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325184601.10990-1-lkml@antheas.dev>
References: <20250325184601.10990-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174292837227.7838.820531500827221007@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The Asus Z13 folio has a multitouch touchpad that needs to bind
to the hid-multitouch driver in order to work properly. So bind
it to the HID_GROUP_GENERIC group to release the touchpad and
move it to the bottom so that the comment applies to it.

While at it, change the generic KEYBOARD3 name to Z13_FOLIO.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 6 +++---
 drivers/hid/hid-ids.h  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 7269ddc690bca..7f070474ef8b4 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1313,9 +1313,6 @@ static const struct hid_device_id asus_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
-	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
@@ -1345,6 +1342,9 @@ static const struct hid_device_id asus_devices[] = {
 	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard
 	 * part, while letting hid-multitouch.c handle the touchpad.
 	 */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
 	{ }
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e400624908e3..b1fe7582324ff 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -209,7 +209,7 @@
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2	0x19b6
-#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3	0x1a30
+#define USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO		0x1a30
 #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR		0x18c6
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X		0x1b4c
-- 
2.49.0


