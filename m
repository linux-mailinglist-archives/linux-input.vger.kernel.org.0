Return-Path: <linux-input+bounces-5505-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C594E153
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 15:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2697BB20E49
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 13:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EEB5FBB7;
	Sun, 11 Aug 2024 13:15:03 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C5942A84;
	Sun, 11 Aug 2024 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723382103; cv=none; b=lR6+XH+eGCEyunt29go7dCq11cjmdhOCE85fwhfNC7AgrukOqOkS6EkprCzT3oeSGW2Im5ZHuSjUPF0wOjS+1OpjM5+Wzz/OWyxV4LiisVF+mzchTwduA//47ikVpUWgnApU7R6eN3dMITL/eJ1eIh2e9cPIzy11ZRa+KksXvnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723382103; c=relaxed/simple;
	bh=ad8d/JqYEJFM0N5MU6T8ZfI3tOH0BAclbmDCzdU/z/g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JAWEjE4InjST24wLnh/JcdiuptJIQUeYS5bou9qlp2IcE1kRy87FBRlACf/BL0xyTyHZfaarHixEAnmAyTKgBTR6feVlpouuqYdK5/tN02KsVf/srsisDlF3ODyAEWMgRxXK8GmmrKmoyZkj01mVG+Ed/29otJHZqjL0eNWZaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 7F838FFE4E;
	Sun, 11 Aug 2024 13:09:16 +0000 (UTC)
From: Max Staudt <max@enpas.org>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	max@enpas.org
Subject: [PATCH v2] hid-playstation: DS4: Update rumble and lightbar together
Date: Sun, 11 Aug 2024 22:09:06 +0900
Message-Id: <20240811130906.3682-1-max@enpas.org>
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
---
Changes in v1 -> v2:
 - Simplified the code, comment, and commit message.
---
 drivers/hid/hid-playstation.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index e7c309cfe3a0..0d90d7ee693c 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2143,6 +2143,26 @@ static void dualshock4_output_worker(struct work_struct *work)
 
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
+	if (ds4->update_rumble || ds4->update_lightbar) {
+		ds4->update_rumble = true; /* 0x01 */
+		ds4->update_lightbar = true; /* 0x02 */
+	}
+
 	if (ds4->update_rumble) {
 		/* Select classic rumble style haptics and enable it. */
 		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_MOTOR;
-- 
2.39.2


