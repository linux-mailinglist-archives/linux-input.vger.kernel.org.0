Return-Path: <linux-input+bounces-10228-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A018A40A32
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 17:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF7D4420E78
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 16:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC79D20AF9A;
	Sat, 22 Feb 2025 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="0ArJwH5b"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C38020AF86;
	Sat, 22 Feb 2025 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740242623; cv=none; b=PkEyBhIYU8jFLh8sHhSemSiedfpJPi2i4CkZooGdFfm1KwlNR1mjiwT2CWzsfKfiNrYfokhAzvj6xpAxGkSry9i7xxo2I34VmIIqCYGq4xWYlgs4TxFz0rGSqlPQBGRiXqDR7UFrTppTeNxS4FXuSh64QMLF1JYuH0hWl1xNcAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740242623; c=relaxed/simple;
	bh=WfYHAN1uELqEBs662nDTIN9zG57e36XSWeaUhibUWRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKqt/7Ts/QHSATrKBgyPJf6Hf9pBBUGa6GeljbJykDFp5lGsAWBWWs9E4+RARqrWkMAKlxPMX4WCbqccOTGQBx/ez3BWHD0l3/UdtHo0ibR8Clmf2xWRyih/IS4bVEBVM6suK/11VYe2f+m+aEI7nc+ZwUZ5i8oIVunFiirAPg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=0ArJwH5b; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 1D0342E08EC3;
	Sat, 22 Feb 2025 18:43:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740242620;
	bh=z3zPpL3Ulc1+itLVafzibaVNCa9hzClSE4LTuvk9Wc0=; h=From:To:Subject;
	b=0ArJwH5bA5fWzW4qIg+rEuOge/8tQjZdBkNp0dSxD2kz0dU/pQi4S03HNN4P/Iraz
	 VL77G6AHN6zdfOODtNVxM4U16ioxmpmi8ayunoBG2HTHnTyvU8L2Q3Ao7Tb1OaV+EL
	 Shx5CVUHLU+CyeZemehetjC8jg21nx6JsdtFEkvs=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 4/5] HID: Add quirk to ignore the touchscreen battery on
 OneXPlayer X1
Date: Sat, 22 Feb 2025 17:43:20 +0100
Message-ID: <20250222164321.181340-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222164321.181340-1-lkml@antheas.dev>
References: <20250222164321.181340-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174024262025.17437.4067662601537192451@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The X1 devices come with a pen-capable touchscreen, in which the HID
descriptor reports there is always a battery at 100% charge. Quirk it
to not report the battery status.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e400624908e..8e2fc152b089 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1001,6 +1001,7 @@
 #define USB_VENDOR_ID_NOVATEK		0x0603
 #define USB_DEVICE_ID_NOVATEK_PCT	0x0600
 #define USB_DEVICE_ID_NOVATEK_MOUSE	0x1602
+#define I2C_DEVICE_ID_ONEXPLAYER_X1    0xF001
 
 #define USB_VENDOR_ID_NTI               0x0757
 #define USB_DEVICE_ID_USB_SUN           0x0a00
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91eb..08e87577feef 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -390,6 +390,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C-HID devices.
 	 */
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_NOVATEK, I2C_DEVICE_ID_ONEXPLAYER_X1),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.48.1


