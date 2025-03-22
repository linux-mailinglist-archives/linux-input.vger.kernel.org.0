Return-Path: <linux-input+bounces-11099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929CA6CCF0
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 22:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8AFB7A79CD
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 21:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1AF54654;
	Sat, 22 Mar 2025 21:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="KZdpRUyt"
X-Original-To: linux-input@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E231E8325
	for <linux-input@vger.kernel.org>; Sat, 22 Mar 2025 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742680729; cv=none; b=WOvT6sQaHPfL5GDBBUIhPtUEek4ylEh0Sg5NGK3eCydKKnWSi48Zn8y1fNoWHBsLxYdC/0aH0G8tiuAcLoxLjrHHCmRVA9QF0u6+TBydgVApPmdp9ieSGYJJmQB7M4kYF2CpR+g4IZCqXBFjY2O87WFQ4/S4l2UB/X1X/FGmEP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742680729; c=relaxed/simple;
	bh=1hy6mefMd9aPEX1qaFZtYW295KspH+vYVb54UHd5otQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUCewb59e9+79Snf8bOhHVe0b6S35Pru6604lCupeY9L6LXs3pPi/7ZkH7Y7dbvpzAfU7DxdwSLZ0QW6NuT5AkSnyg46NNOyloAhMiueFYq7pdjiaMvNpe0NEt8KBlDNFIjaGPN8ye3CGGEt3DeqxKGDbE1DCeFmFVsfz6eO0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=KZdpRUyt; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9017A240027
	for <linux-input@vger.kernel.org>; Sat, 22 Mar 2025 22:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1742680718; bh=1hy6mefMd9aPEX1qaFZtYW295KspH+vYVb54UHd5otQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=KZdpRUytyX4b3c1JCPzWF/S6OtEYR1TDfmg1+D47sI6aJ/eG9Iggr+uOE8/HUdf/Z
	 JJmV+22u8ZkF4vCf2uYgd/j3YKILVG72Z/gOxFg80AncUgoCbN6jJhFx0/9LGRjUx6
	 /GTqzCjmWRjC7YRYwF53lPDOPQn729Uj14nlEP4atWVRtk5obJofLvaDX1XcDKf6Kn
	 XhPOrHQpOwv6HTuGoPhRWZYJGeLRteL8FoWaoeplo0A1+EiN/DPHWKCqVbOwFLO3BZ
	 7ofHs+zS4lblHXLAXZ5zrmgQ+voHlpTsoHvLmmegIPZbFdlB8Ed+pwPxUx4j7Y8g4s
	 SINM/VfHS6N7g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZKtVj5Bmwz6tm8;
	Sat, 22 Mar 2025 22:58:37 +0100 (CET)
From: Andrei Amuraritei <andamu@posteo.net>
To: andamu@posteo.net
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	roderick.colenbrander@sony.com,
	jkosina@suse.cz
Subject: [PATCH] Input: joydev - blacklist PS5 controller motion sensors
Date: Sat, 22 Mar 2025 21:58:27 +0000
Message-ID: <20250322215830.39327-1-andamu@posteo.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PS5 controllers motion sensors to blacklist, same as with PS4
controllers.

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


