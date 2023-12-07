Return-Path: <linux-input+bounces-578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4D28080F4
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 07:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2D551F213B5
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 06:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CD77E8;
	Thu,  7 Dec 2023 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="QdMVj81P"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB0010C4
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 22:44:01 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id EC957A2AC;
	Wed,  6 Dec 2023 22:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1701930869; bh=lmiCqfNSVoqjQzNW2pRae5gjNIsS0E0cWUeYhrGPa/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QdMVj81PZxhe1NTKXS3aogktGYlDc32DCMr47FLD7a75ZrvtF1DXGaX1cGIwwd3zp
	 RiKfJVblGphvIU5VAPKPAIeEkDvoB6nNZ/z9KYrsNLp8666gYyCRmmdWTzLzFu62N/
	 uWKZcaSfYodHtgKCnMsrvJKPTOKSX3BkyxHHThYDKG0St9W/aTKuID46fHQ3J0zxpo
	 XFxlASScFIci1OQ7tdhU5hufjQgL8+eEqRtPX5L+rzUqLOQBJQp1F9LfXB0bDgV4mD
	 hEBXdZkcvDHT0Uo/lI9nhW4CegadQLQLa1tfN5XqQYX0V78nB/tzcilSwBTACiB7jY
	 Sz1w6ZcuzPS3w==
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 2/2] Input: uinput - Release mutex while unregistering input device
Date: Wed,  6 Dec 2023 22:34:06 -0800
Message-ID: <20231207063406.556770-3-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207063406.556770-1-vi@endrift.com>
References: <20231207063406.556770-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any pending requests may be holding a mutex from its own subsystem, e.g.
evdev, while waiting to be able to claim the uinput device mutex.
However, unregistering the device may try to claim that mutex, leading
to a deadlock. To prevent this from happening, we need to temporarily
give up the lock before calling input_unregister_device.

Fixes: e8b95728f724 ("Input: uinput - avoid FF flush when destroying device")
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/misc/uinput.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 0330e72798db..ac6e5baa2093 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -296,17 +296,34 @@ static void uinput_destroy_device(struct uinput_device *udev)
 	udev->state = UIST_NEW_DEVICE;
 
 	if (dev) {
+		udev->dev = NULL;
 		name = dev->name;
 		phys = dev->phys;
 		if (old_state == UIST_CREATED) {
 			uinput_flush_requests(udev);
+
+			/*
+			 * Any pending requests may be holding a mutex from its
+			 * own subsystem, e.g. evdev, while waiting to be able
+			 * to claim the uinput device mutex. However,
+			 * unregistering the device may try to claim that
+			 * mutex, leading to a deadlock. To prevent this from
+			 * happening, we need to temporarily give up the lock.
+			 *
+			 * Since this function is only called immediately
+			 * before the caller exits the critical section without
+			 * doing any further operations on the device, this
+			 * is safe and we can immediately reclaim the mutex
+			 * when done so the unlock is still balanced.
+			 */
+			mutex_unlock(&udev->mutex);
 			input_unregister_device(dev);
+			mutex_lock(&udev->mutex);
 		} else {
 			input_free_device(dev);
 		}
 		kfree(name);
 		kfree(phys);
-		udev->dev = NULL;
 	}
 }
 
@@ -745,7 +762,16 @@ static int uinput_release(struct inode *inode, struct file *file)
 {
 	struct uinput_device *udev = file->private_data;
 
+	int retval;
+
+	retval = mutex_lock_interruptible(&udev->mutex);
+	if (retval)
+		return retval;
+
 	uinput_destroy_device(udev);
+
+	mutex_unlock(&udev->mutex);
+
 	kfree(udev);
 
 	return 0;
-- 
2.43.0


