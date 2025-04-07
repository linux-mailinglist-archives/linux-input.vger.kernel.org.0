Return-Path: <linux-input+bounces-11565-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0599A7E4C9
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 17:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0370443698
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0D81FF7B9;
	Mon,  7 Apr 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzKf8q6S"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C271FECD7;
	Mon,  7 Apr 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039656; cv=none; b=GN2ARGSDvy96Er3P0oRWusXVLobzOLRpuKJb+fLbSJ9M4OB9EDv5YwESHPabbcjGehgW+uhkGzs24ftSyhIMO2iGOVhWfkuly+HLhYEYcXKQWUrCjsNV1JFmv6aKXTwniAfo0OEW00bo1427H9LUTSEnrBorFfGdTZhxFysGyUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039656; c=relaxed/simple;
	bh=u2II3i2hdzG9z+TnFhyJj9+LpYjrMkHbTOoqlXB+GUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQYE/IbWRBL4aKTnORsGLCrajuRKEbVPhK/6PItACGsQUIU0Isl5hWzRiV9NzP+svmqhKgQGlXi+wI3S2yQskZNHx5l9TK7fFvpA9TdNNjVn3E9Tug7bF/iC6rxL8C4qZtYVYbGFhtd/u+Tpo9gPjsmwyosnTgZbpaZ3Y6MBvrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzKf8q6S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305D2C4CEDD;
	Mon,  7 Apr 2025 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744039656;
	bh=u2II3i2hdzG9z+TnFhyJj9+LpYjrMkHbTOoqlXB+GUU=;
	h=From:To:Cc:Subject:Date:From;
	b=QzKf8q6S7mjY9zeeFEU7G6QDykS1W98rJbHIon67hHqAcuYoXT5KORPCSHKEdEhEz
	 EKRu3O727NngRu/ug4YMOqz/EYNKBKVeQB5EpnA/5wOK0uErEqIJAg0P16qm/fmE4k
	 hjM8eD/JgDUU8oeUzO7qoY8lv3wpnRUQD06pSJQbRln5RF5WyVaPeX9Pkn29cDGIQH
	 3tPsk5Obt+QppUNeqGoje9q5byy/avmdvDLho4E87K03o6bcvzuwGnPZoHebmpVv39
	 qmHEgjFpoe+0XT1Qi9hqSduPUvLzpmjw/XF3U5ctEjkSsZc7hKPSR0ozYloOXnprzI
	 KwAXYYSl8R9Lw==
From: Mario Limonciello <superm1@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list),
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH 1/2] Input: Add a helper for reporting a screen lock key sequence
Date: Mon,  7 Apr 2025 10:27:04 -0500
Message-ID: <20250407152705.1222469-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
to lock the screen. Modern hardware [2] also sends this sequence of
events for keys with a silkscreen for screen lock.

Introduced a helper input_report_lock_sequence() for drivers to utilize
if they want to send this sequence.

Link: https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec [1]
Link: https://www.logitech.com/en-us/shop/p/k860-split-ergonomic.920-009166 [2]
Suggested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/input/input.c | 20 ++++++++++++++++++++
 include/linux/input.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ec4346f20efdd..dfeace85c4710 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -508,6 +508,26 @@ void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
 }
 EXPORT_SYMBOL(input_copy_abs);
 
+/**
+ * input_report_lock_sequence - Report key combination to lock the screen
+ * @dev: input device
+ *
+ * Key combination used in the PC industry since Windows 7 for locking display
+ * is META + L. This is also used in GNOME and KDE by default.
+ * See https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec
+ */
+void input_report_lock_sequence(struct input_dev *dev)
+{
+	input_report_key(dev, KEY_LEFTMETA, 1);
+	input_report_key(dev, KEY_L, 1);
+	input_sync(dev);
+	input_report_key(dev, KEY_L, 0);
+	input_sync(dev);
+	input_report_key(dev, KEY_LEFTMETA, 0);
+	input_sync(dev);
+}
+EXPORT_SYMBOL(input_report_lock_sequence);
+
 /**
  * input_grab_device - grabs device for exclusive use
  * @handle: input handle that wants to own the device
diff --git a/include/linux/input.h b/include/linux/input.h
index 7d7cb0593a63e..16f7bef12f1c1 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -492,6 +492,8 @@ void input_set_abs_params(struct input_dev *dev, unsigned int axis,
 void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
 		    const struct input_dev *src, unsigned int src_axis);
 
+void input_report_lock_sequence(struct input_dev *dev);
+
 #define INPUT_GENERATE_ABS_ACCESSORS(_suffix, _item)			\
 static inline int input_abs_get_##_suffix(struct input_dev *dev,	\
 					  unsigned int axis)		\
-- 
2.43.0


