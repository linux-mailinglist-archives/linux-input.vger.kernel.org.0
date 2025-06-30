Return-Path: <linux-input+bounces-13261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D105CAEE93E
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 23:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB0271BC3621
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 21:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDF12E62A6;
	Mon, 30 Jun 2025 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyWcDfXP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E657F17BD3;
	Mon, 30 Jun 2025 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317337; cv=none; b=MXfBwp0zVa7Ii/AAZ9Df/huTkP+RYfH8z2OqkLQqDdnwkLOuomVuF1Uw633vUV5+G8sMB/hHw5ggUO+RXyZM2/n/sc9Q+3l4+0+n6zHSVZKy02ltKs7+6+DQ3FxlTI6VoMCvu6xFMsLArLAPDGAC3FhHaQ7pLSmIO4oHf0/M73I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317337; c=relaxed/simple;
	bh=4pTIzw5l3igIqYbZmswXm4JTjrnX5fAloQtapfrL4bs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CkzW5jTPo0dgOLR4Tz5FtiNTbSQGdLUfW9l3LkFdIAqG7KWeatUBSJxAVpSdw+4QU/tZV3MLAgL4EtqzEAntY0Ieqk4vxh9WOPwaBqaBHrtM3cSKP3YS9Hy3L/7PVdFJM/rPfyK/SKCIYzysUPGQMTp/hWysSiJFKNeocniKLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyWcDfXP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD47BC4CEE3;
	Mon, 30 Jun 2025 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751317336;
	bh=4pTIzw5l3igIqYbZmswXm4JTjrnX5fAloQtapfrL4bs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nyWcDfXP2kub/ThsZH080tFqu07So5tOoLJ5352M+dsRMZM1DYS8FoW2vpHV7DSsB
	 7ZmvzNE4jY2aXSz5XmcUmfPxTnGo1fqx4LbrmdRE9h+Ei00UOKxE9utZKFhczHTaJx
	 93j7bZtGYzWffAqu7jD++WLPRmFE0DZTucdnAf0eoqe7znplh/W4mzuHhgqfKOFW5Z
	 wE8GAPryPoWT29QtMhcm/RB3UomncaVeU66FrpK2kMRQzYmRwZ+grGICAkBwsVK1RU
	 9HLNJM8qA+VEES5L+m+l6qm7FgKFpGk5YaSkiYbHBy/CuIv8PqwpwmRrbo9Qk/puGP
	 OGEq7fKJJxERA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 5/6] HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY
Date: Mon, 30 Jun 2025 17:02:02 -0400
Message-Id: <20250630210203.1359628-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630210203.1359628-1-sashal@kernel.org>
References: <20250630210203.1359628-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.239
Content-Transfer-Encoding: 8bit

From: Zhang Heng <zhangheng@kylinos.cn>

[ Upstream commit 1a8953f4f7746c6a515989774fe03047c522c613 ]

MARTLINKTECHNOLOGY is a microphone device, when the HID interface in an
audio device is requested to get specific report id, the following error
may occur.

[  562.939373] usb 1-1.4.1.2: new full-speed USB device number 21 using xhci_hcd
[  563.104908] usb 1-1.4.1.2: New USB device found, idVendor=4c4a, idProduct=4155, bcdDevice= 1.00
[  563.104910] usb 1-1.4.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  563.104911] usb 1-1.4.1.2: Product: USB Composite Device
[  563.104912] usb 1-1.4.1.2: Manufacturer: SmartlinkTechnology
[  563.104913] usb 1-1.4.1.2: SerialNumber: 20201111000001
[  563.229499] input: SmartlinkTechnology USB Composite Device as /devices/pci0000:00/0000:00:07.1/0000:04:00.3/usb1/1-1/1-1.4/1-1.4.1/1-1.4.1.2/1-1.4.1.2:1.2/0003:4C4A:4155.000F/input/input35
[  563.291505] hid-generic 0003:4C4A:4155.000F: input,hidraw2: USB HID v2.01 Keyboard [SmartlinkTechnology USB Composite Device] on usb-0000:04:00.3-1.4.1.2/input2
[  563.291557] usbhid 1-1.4.1.2:1.3: couldn't find an input interrupt endpoint
[  568.506654] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
[  573.626656] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
[  578.746657] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
[  583.866655] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
[  588.986657] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)

Ignore HID interface. The device is working properly.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

1. **The commit fixes a real user-visible bug**: The device causes
   repeated USB interface timeout errors (`usb_set_interface failed
   (-110)`) that spam the kernel log and potentially interfere with
   device operation. The error log shows five consecutive timeout
   failures over 25 seconds, which would significantly impact user
   experience.

2. **The fix is minimal and contained**: The code changes are extremely
   simple - just adding two lines to define the vendor/device ID in
   `hid-ids.h` and one line to add it to the `hid_ignore_list[]` array
   in `hid-quirks.c`. This is the standard pattern for HID quirks.

3. **Similar commits were backported**: This is very similar to "Similar
   Commit #1" (Logitech GROUP) which also dealt with HID interfaces on
   audio devices causing problems. That commit added `HID_QUIRK_NOGET`
   and was backported. The pattern is identical - an audio device with a
   problematic HID interface that needs to be handled via quirks.

4. **No risk of regression**: The change only affects devices with
   vendor ID 0x4c4a and product ID 0x4155. When a device matches this
   ID, the HID subsystem will simply skip it via the `hid_ignore()`
   function check in `hid_add_device()`. This cannot affect any other
   devices.

5. **The device functions properly with the fix**: The commit message
   explicitly states "The device is working properly" - meaning the
   audio functionality works fine once the HID interface is ignored.
   This is not breaking functionality but rather preventing the HID
   subsystem from interfering with a working audio device.

6. **The error pattern indicates a hardware quirk**: The continuous
   timeout errors (-110) when trying to set the USB interface suggests
   the device's HID implementation doesn't properly respond to standard
   HID commands. This is exactly the type of hardware-specific issue
   that the HID quirks system was designed to handle.

This meets all the criteria for stable backporting: it fixes a bug
affecting users, is small and self-contained, has minimal risk, and
follows established patterns for similar fixes that were previously
backported.

 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4b8f8e0ce8ca2..981ff6b233a40 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1360,4 +1360,7 @@
 #define USB_VENDOR_ID_SIGNOTEC			0x2133
 #define USB_DEVICE_ID_SIGNOTEC_VIEWSONIC_PD1011	0x0018
 
+#define USB_VENDOR_ID_SMARTLINKTECHNOLOGY              0x4c4a
+#define USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155         0x4155
+
 #endif
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index b3e7ede8f398e..423d18a77b9e8 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -873,6 +873,7 @@ static const struct hid_device_id hid_ignore_list[] = {
 #endif
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B2K) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SMARTLINKTECHNOLOGY, USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155) },
 	{ }
 };
 
-- 
2.39.5


