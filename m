Return-Path: <linux-input+bounces-3242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 489AE8B085D
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 13:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF9681F24187
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 11:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5B915A492;
	Wed, 24 Apr 2024 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="GVP2WCPU";
	dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="hVvvLzGb"
X-Original-To: linux-input@vger.kernel.org
Received: from mailrelay6-3.pub.mailoutpod2-cph3.one.com (mailrelay6-3.pub.mailoutpod2-cph3.one.com [46.30.212.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35DD1598E6
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713958370; cv=none; b=dBTrnIlV6H6jTiUdH+zfRq7xZIrXqeNN3OgXg17/DSjuS2zokmC12RI4MUOSZA0ohvO5CMRr6BbpoKSGtLLGU58FwCBWhe1Yjh8/zelEbZ9KTiO1qSwK55NHntJ3aZwGmAoaAHGqMpYWJMDCV9XoLfKXkm1jPiMfaSeVuNhCDDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713958370; c=relaxed/simple;
	bh=JCQMG7fP0cjNcmTnJ2sSDvS2UO71hAD4BPDVQWE7ZYk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=abeimY7F0Lp4nHmNCP3fEWHXIxbPxDR0hc1Z5nTqQo/tVyEVEA6leqMXry/rv87OHqgASkHAXojForstCUSp6QOEUmkpdxGhI3MVPizlyaMAZQaMdL5wZUTannMVmqvg4FLwvLAdXJx4C1U+7QvZHKbvrJhV3pODu9Z5o7MvlU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com; spf=none smtp.mailfrom=carewolf.com; dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=GVP2WCPU; dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=hVvvLzGb; arc=none smtp.client-ip=46.30.212.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=carewolf.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=La1F9GWBKgOLv3pdQd/zEdcyB837+ewuRa+W1vOfcX0=;
	b=GVP2WCPUXBc/8r+RqHisr+HQ9Hx5Qthrf1s754bea3Jd0pRDSeO1N2ev/HP5T+9K7lX3+puCd7NV0
	 1Esg/fwDvuZViReuJDI09lvNy/1vyLuLuKaj0mQ5tk0JM6HofOx+b+/RQAshFDrXAfx14DwNcliYcD
	 vbkUEdXX6qLcvKMbRnbdawBLUnCc7U8hgF9E6M6tpuULP87GfhvjwdvUZ0dYSiA/WCEJlNHS0ICoAM
	 y99pq8quIsPDkwRvG9iKcPb28LL8rzJtG/F2UqEIl/xqlhFXsfJ3f+1eX49c5LP0Dm6ZSlUt880fqk
	 +ayFa1im1WZwW3VwGSS2G3aH8Z8VURg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=La1F9GWBKgOLv3pdQd/zEdcyB837+ewuRa+W1vOfcX0=;
	b=hVvvLzGbrIiu1/uIWV5RFIPdTVhkyaeXPJiiF0BSVNIzYrzn4V+JmRmK9Bd/rWd2P4ccjX+BymW6m
	 YV+newvCg==
X-HalOne-ID: 360a4bc3-022e-11ef-8f41-f528319a6ef4
Received: from carewolf.com (dynamic-2a02-3103-004c-5300-7231-17da-dcd1-9a4a.310.pool.telefonica.de [2a02:3103:4c:5300:7231:17da:dcd1:9a4a])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 360a4bc3-022e-11ef-8f41-f528319a6ef4;
	Wed, 24 Apr 2024 11:31:38 +0000 (UTC)
From: kde@carewolf.com
To: lains@riseup.net,
	hadess@hadess.net,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Allan Sandfeld Jensen <allan.jensen@qt.io>,
	Allan Sandfeld Jensen <kde@carewolf.com>
Subject: [PATCH] Add Logitech HID++ devices
Date: Wed, 24 Apr 2024 13:31:30 +0200
Message-Id: <20240424113130.60386-1-kde@carewolf.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Allan Sandfeld Jensen <allan.jensen@qt.io>

Adds a few recognized Logitech HID++ capable mice over USB and Bluetooth

Signed-off-by: Allan Sandfeld Jensen <kde@carewolf.com>
---
 drivers/hid/hid-logitech-hidpp.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 3c00e6ac8e76..6907b8c48c4e 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4352,13 +4352,17 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081) },
 	{ /* Logitech G903 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC086) },
+	{ /* Logitech G Pro Gaming Mouse over USB */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
+	{ /* MX Vertical over USB */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC08A) },
+	{ /* Logitech G703 Hero Gaming Mouse over USB */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC090) },
 	{ /* Logitech G903 Hero Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC091) },
 	{ /* Logitech G920 Wheel over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G920_WHEEL),
 		.driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
-	{ /* Logitech G Pro Gaming Mouse over USB */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
 
 	{ /* MX5000 keyboard over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb305),
@@ -4373,13 +4377,19 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb008) },
 	{ /* MX Master mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012) },
+	{ /* MX Master 2S mouse over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019) },
 	{ /* MX Ergo trackball over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01d) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e) },
+	{ /* MX Vertical mouse over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb020) },
 	{ /* MX Master 3 mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb023) },
 	{ /* MX Master 3S mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb034) },
+	{ /* MX Anywhere 3SB mouse over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb038) },
 	{}
 };
 
-- 
2.39.2


