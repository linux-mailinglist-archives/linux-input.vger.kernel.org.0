Return-Path: <linux-input+bounces-5692-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71ED95771D
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 00:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91D6A285B04
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 22:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BE115AD83;
	Mon, 19 Aug 2024 22:05:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8CA14D70E;
	Mon, 19 Aug 2024 22:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105148; cv=none; b=DOLSVXsTLB4Rz3mnOjNk4CjIFRTX8vUr6ix/jWH3O/LMoHfH3ZR/WfMKvfCouZP6vPmMvh7GKyTl3MmXXQsH/z7KKWezgWh1faN5JGuOlpXLuDr++f+7t+yHB1LTE0ScHF5oJFf5EZuLQMb3j3AvoSoC6fi1BP/rOWUM7ShEVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105148; c=relaxed/simple;
	bh=D4mzeqALWxf8qhSRtufcseiFNTV6DElEz2L+bTGS6N0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mo/UHciQMi+Fren9+RSIsGGoi7JGU3BC+ISnCykGnCBBWEhfXnzULrFgDpdpx/NP7aLsEpWhbMjjg2QdGQGJMr8+AHXJA4vz/xCTEDtk7UwZzWkBIbdGB9Tl3U2mMVZePQkvssCN/MhA8+1GpvzNfvQkpWBye7qM/yyW+Tlrhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 13E6DFFA73;
	Mon, 19 Aug 2024 22:05:43 +0000 (UTC)
From: Max Staudt <max@enpas.org>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	max@enpas.org
Subject: [PATCH v3] hid-playstation: DS4: Update rumble and lightbar together
Date: Tue, 20 Aug 2024 00:05:18 +0200
Message-Id: <20240819220518.13250-1-max@enpas.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some 3rd party gamepads expect updates to rumble and lightbar together,
and setting one may cancel the other.

Let's maximise compatibility by always sending rumble and lightbar
updates together, even when only one has been scheduled.

Further background reading:

- Apparently the PS4 always sends rumble and lightbar updates together:

  https://eleccelerator.com/wiki/index.php?title=DualShock_4#0x11_2

- 3rd party gamepads may not implement lightbar_blink, and may simply
  ignore updates with 0x07 set, according to:

  https://github.com/Ryochan7/DS4Windows/pull/1839

Signed-off-by: Max Staudt <max@enpas.org>
---
Changes in v2 -> v3:
 - Introduced a quirk bit, so this hack only applies to controllers known
   to be quirky.
---
 drivers/hid/hid-playstation.c | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index e7c309cfe3a0..79482c56fc40 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -356,6 +356,9 @@ struct dualsense_output_report {
 #define DS4_TOUCHPAD_WIDTH	1920
 #define DS4_TOUCHPAD_HEIGHT	942
 
+/* Quirks for third-party controllers */
+#define DS4_QUIRK_OUTPUT_LIGHTBAR_RUMBLE_TOGETHER	BIT(0)
+
 enum dualshock4_dongle_state {
 	DONGLE_DISCONNECTED,
 	DONGLE_CALIBRATING,
@@ -405,6 +408,8 @@ struct dualshock4 {
 	struct work_struct output_worker;
 	bool output_worker_initialized;
 	void *output_report_dmabuf;
+
+	unsigned long quirks;
 };
 
 struct dualshock4_touch_point {
@@ -2143,6 +2148,28 @@ static void dualshock4_output_worker(struct work_struct *work)
 
 	spin_lock_irqsave(&ds4->base.lock, flags);
 
+	/*
+	 * Some 3rd party gamepads expect updates to rumble and lightbar
+	 * together, and setting one may cancel the other.
+	 *
+	 * Let's maximise compatibility by always sending rumble and lightbar
+	 * updates together, even when only one has been scheduled, resulting
+	 * in:
+	 *
+	 *   ds4->valid_flag0 >= 0x03
+	 *
+	 * Hopefully this will maximise compatibility with third-party pads.
+	 *
+	 * Any further update bits, such as 0x04 for lightbar blinking, will
+	 * be or'd on top of this like before.
+	 */
+	if (DS4_QUIRK_OUTPUT_LIGHTBAR_RUMBLE_TOGETHER) {
+		if (ds4->update_rumble || ds4->update_lightbar) {
+			ds4->update_rumble = true; /* 0x01 */
+			ds4->update_lightbar = true; /* 0x02 */
+		}
+	}
+
 	if (ds4->update_rumble) {
 		/* Select classic rumble style haptics and enable it. */
 		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_MOTOR;
@@ -2558,6 +2585,29 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	 */
 	hdev->version |= HID_PLAYSTATION_VERSION_PATCH;
 
+	/*
+	 * Some 3rd party gamepads expect updates to rumble and lightbar
+	 * together, and setting one may cancel the other.
+	 *
+	 * Set a quirk bit if this is a controller known to behave this way.
+	 */
+	if (hdev->vendor == USB_VENDOR_ID_SONY &&
+	    hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) {
+		/*
+		 * Match quirky controllers by their HID report descriptor.
+		 * Check for >= instead of == because there may be a trailing
+		 * 0x00 or the like.
+		 */
+		if (hdev->bus == BUS_USB && hdev->rsize >= 507 &&
+		    crc32_le(0xffffffff, hdev->rdesc, 507) == 0xabc63a20)
+			ds4->quirks |= DS4_QUIRK_OUTPUT_LIGHTBAR_RUMBLE_TOGETHER;
+
+		/* The descriptor via Bluetooth differs from the USB one. */
+		if (hdev->bus == BUS_BLUETOOTH && hdev->rsize >= 430 &&
+		    crc32_le(0xffffffff, hdev->rdesc, 430) == 0x4194b762)
+			ds4->quirks |= DS4_QUIRK_OUTPUT_LIGHTBAR_RUMBLE_TOGETHER;
+	}
+
 	ps_dev = &ds4->base;
 	ps_dev->hdev = hdev;
 	spin_lock_init(&ps_dev->lock);
-- 
2.39.2


