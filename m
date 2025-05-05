Return-Path: <linux-input+bounces-12149-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F0FAA9B75
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 20:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79001189F688
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 18:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB942690DB;
	Mon,  5 May 2025 18:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="q0geENug"
X-Original-To: linux-input@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AFE25EF97
	for <linux-input@vger.kernel.org>; Mon,  5 May 2025 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469377; cv=none; b=CFIO+NSfl/OVmtuClMNMiTm97Fc/d1wDJt21OgyBWzPzBB2eKbisY/eUEyGfSN/PM82i3rsMOEfBNyudZdyk5VFOOMC8SYmVWpSWd5/h9ppWei18sL9tVfd5KPctyFkxjY/09d0UOZH2tb9OqkF43jqjquekkoj+nC7qQm5Ng0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469377; c=relaxed/simple;
	bh=DIvFcU9SIWRR97pU37OxzBO2ch3TcJq0LiuRC+SEweU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CkcZzEFYhfnAxkTv5HCfHEwT7/AKAYEYYDiHaOk1+PT3gVqMbn+hQD2BIvRMVFV11Z12ZwpDgkD/s5SkB4zeA9kXaJyNc85VGi38dgGbPHmV6SbMCztUgV1Ka7NKQ+uiKmhrLOrS2mp+4NgOM0LST2jpNLq7nEZJGHQbBGE7+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=q0geENug; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5E9C2240027
	for <linux-input@vger.kernel.org>; Mon,  5 May 2025 20:22:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1746469367; bh=DIvFcU9SIWRR97pU37OxzBO2ch3TcJq0LiuRC+SEweU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=q0geENugizVpkyDQ/bn/fAVsdMup4MQFPAY0k10QjgQ2E40y8pGAkzEzqV+UmF6zc
	 OdNSkBGxxs1uZzTkAWwXS5eFG4xzEBcDA+cXFJm6j7UoHmTmU7b7kXGWpWd9i832d8
	 zqkqcAbWCSqdtWfC1v0sqXMb8g3mHAlCF9LsBoU2nzXrFXlc6AXM0xmcH/GOjCj/gm
	 kdlqGORQS+fc8kDEP8KAZrq89/u8iSFfu15pTIdultSV+crMlY3txf1TH5p0CYGf5p
	 3aqZXWkWIgjFJKqx9zIJaDAmbbig4dgFuUPwbOYdRj9g5bTsCXlGmuIgTiAfTJZzFi
	 aqyJwgAMt6N6w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZrqdL3RQGz6tw2;
	Mon,  5 May 2025 20:22:46 +0200 (CEST)
From: Andrei Amuraritei <andamu@posteo.net>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	roderick.colenbrander@sony.com,
	jkosina@suse.cz,
	Andrei Amuraritei <andamu@posteo.net>
Subject: [PATCH] Input: joydev - blacklist motion sensors of PS5 Dualsense controllers
Date: Mon,  5 May 2025 18:22:07 +0000
Message-ID: <20250505182207.17846-1-andamu@posteo.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the motion sensors of PS5 Dualsense controllers to joydev blacklist, same as with PS4 controllers.

Requires the previous two commits, from hid.git#for-6.15/sony.

e65990eb256a75a2ace95e80cf5028d81aad7c5d

HID: Enable playstation driver for PlayStation 5 controllersfor-6.15/sony
Without entries in the hid_have_special_driver table, PS5 controllers
default to the hidraw driver instead of the hid-playstation driver.

c5cd1f0f0e742922262977fd72ae3c4ff49b7a1d

HID: Enable playstation driver independently of sony driver
PlayStation 4 controllers use the hid-playstation driver now, but they
are still not included in the hid_have_special_driver table unless the
hid-sony driver is enabled. Split up that section of the table so that
hid-playstation works even in the absence of hid-sony.

Signed-off-by: Andrei Amuraritei <andamu@posteo.net>
---
 drivers/input/joydev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
index ba2b17288bcd..f2fdbc814a8f 100644
--- a/drivers/input/joydev.c
+++ b/drivers/input/joydev.c
@@ -753,6 +753,8 @@ static void joydev_cleanup(struct joydev *joydev)
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER		0x05c4
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_2		0x09cc
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE	0x0ba0
+#define USB_DEVICE_ID_SONY_PS5_CONTROLLER		0x0ce6
+#define USB_DEVICE_ID_SONY_PS5_CONTROLLER_2		0x0df2
 
 #define USB_VENDOR_ID_THQ			0x20d6
 #define USB_DEVICE_ID_THQ_PS3_UDRAW			0xcb17
@@ -793,6 +795,8 @@ static const struct input_device_id joydev_blacklist[] = {
 	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER),
 	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2),
 	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE),
+	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER),
+	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2),
 	ACCEL_DEV(USB_VENDOR_ID_THQ, USB_DEVICE_ID_THQ_PS3_UDRAW),
 	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_PROCON),
 	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_CHRGGRIP),
-- 
2.49.0


