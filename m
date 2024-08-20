Return-Path: <linux-input+bounces-5710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E33958933
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 16:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AF281C20F28
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206144D8C1;
	Tue, 20 Aug 2024 14:25:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E653D982;
	Tue, 20 Aug 2024 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724163942; cv=none; b=Q2Y1xdLmMvYEbFCo7Z+tvNCAhlG9mHDQf2Kb1TvjRjzq3tKNXIGqrUxzyrT6QF/ahH6rGV3/sBzdNWEIhYr9w7HS87qW3L42i6bN0100+sRWrBvWb983a/3Bnp5KlC3lWuxNzvZ+DeVjy/JsBLPVLRa8YCtLc7tw/4Q2280vVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724163942; c=relaxed/simple;
	bh=ffglQCRh40cNviNlchMu5io+mIU9YBfAb+D6ZnPp1HI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t52FtZrVcxnMbTTOtn/Ce3VIK5mM3GfA8ex4PF8fc/IFXPz2dQU6/Q9krEOTJlXBAH52yu5q1ROXQDkH2bbvrge16jCeNWtMse8TfM4OlmBzpHhAHjA6W4wKYZGLo8oYX5m5dFruvSgnZAYEw1abPv4yT6khcrJ9hF3gwvMEnV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 36EA1FFE4E;
	Tue, 20 Aug 2024 14:25:36 +0000 (UTC)
From: Max Staudt <max@enpas.org>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	max@enpas.org
Subject: [PATCH v4] hid-playstation: DS4: Update rumble and lightbar together
Date: Tue, 20 Aug 2024 16:25:29 +0200
Message-Id: <20240820142529.9380-1-max@enpas.org>
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

Let's maximise compatibility for these controllers by sending rumble
and lightbar updates together, even when only one has been scheduled.

The quirky controllers are matched by a known CRC32 over their HID
report descriptor (hdev->rdesc), since they seem to share the same
descriptor, while pretending to be a Sony DS4 v2.0.

Signed-off-by: Max Staudt <max@enpas.org>
---
Changes in v3 -> v4:
 - Reduced quirk matching to exact values of hdev->rsize.
 - Adjusted comments to describe quirk detection.
   The patch no longer applies to all controllers.

Changes in v2 -> v3:
 - Introduced a quirk bit, so this hack only applies to controllers
   known to be quirky.

Changes in v1 -> v2:
 - Simplified the code, comment, and commit message.
---
 drivers/hid/hid-playstation.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index e7c309cfe3a0..0b48ca7bfe22 100644
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
@@ -2143,6 +2148,20 @@ static void dualshock4_output_worker(struct work_struct *work)
 
 	spin_lock_irqsave(&ds4->base.lock, flags);
 
+	/*
+	 * Some 3rd party gamepads expect updates to rumble and lightbar
+	 * together, and sending only one at a time may cancel the other.
+	 *
+	 * If this is such a quirky controller, force sending both
+	 * updates, even if only one has been scheduled.
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
@@ -2558,6 +2577,30 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	 */
 	hdev->version |= HID_PLAYSTATION_VERSION_PATCH;
 
+	/*
+	 * Some 3rd party gamepads expect updates to rumble and lightbar
+	 * together, and sending only one at a time may cancel the other.
+	 *
+	 * Set a quirk bit if this is a controller known to behave this way.
+	 */
+	if (hdev->vendor == USB_VENDOR_ID_SONY &&
+	    hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) {
+		/* Match quirky controllers by their HID report descriptor. */
+		if (hdev->bus == BUS_USB && hdev->rsize >= 507 &&
+		    crc32_le(0xffffffff, hdev->rdesc, 507) == 0xabc63a20)
+			ds4->quirks |= DS4_QUIRK_OUTPUT_LIGHTBAR_RUMBLE_TOGETHER;
+
+		/*
+		 * The descriptor via Bluetooth differs from the USB one.
+		 * Allow for 1 byte extra, because there may be a trailing
+		 * 0x00 byte.
+		 */
+		if (hdev->bus == BUS_BLUETOOTH &&
+		    (hdev->rsize == 430 || hdev->rsize == 431) &&
+		    crc32_le(0xffffffff, hdev->rdesc, 430) == 0x4194b762)
+			ds4->quirks |= DS4_QUIRK_OUTPUT_LIGHTBAR_RUMBLE_TOGETHER;
+	}
+
 	ps_dev = &ds4->base;
 	ps_dev->hdev = hdev;
 	spin_lock_init(&ps_dev->lock);
-- 
2.39.2


