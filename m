Return-Path: <linux-input+bounces-12005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F281BA9CE25
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 18:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44A981892468
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 16:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C429819F130;
	Fri, 25 Apr 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0Gcn+8m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DC19E7FA;
	Fri, 25 Apr 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598599; cv=none; b=rZtN40BwhCm0OXuHbrOta2mAuHc6TEMFfesRNkJT4fhqxZu/ftE0zRyzJeWgSEhAJbl4NXSXEFRI6uOtbl1Wgg7+rH1iTliY4mwQ1q6pM+THz8Ix4/7rdklMW9IWqb+Y6Vhy6l2dQ5CBOFrQM5hPjOpQXZ6JI5Ro8BRrZhVBzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598599; c=relaxed/simple;
	bh=VeIFEZPzptyxK0aweTFRev1zaQWjdMOGLjt9qd/lfs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+SdwZAg+11PqG3CzjPF8gef0q5ij2CIBtvdGRb9Fv6y/EKZPMi2H/BsLlnLgOa7GvivnMW0nQg5EaPX2LtukTgqYI8e7vM6qEHnhrVXBwyZhKE7MDDMqOeSM9/CrvkFMw9NkR5f79oSfE1K9eun2JQlWqKMjYQhblKSgUslp9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0Gcn+8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2EEC4CEE4;
	Fri, 25 Apr 2025 16:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745598599;
	bh=VeIFEZPzptyxK0aweTFRev1zaQWjdMOGLjt9qd/lfs0=;
	h=From:To:Cc:Subject:Date:From;
	b=O0Gcn+8mzypG2k50DgEwM7QrvxgTRqLW8l64qoj+8cFJinWa6cJ5vsNeaYS/Z3FE+
	 nvp1VvMBQALpd9DKU6HAHL8pA8zfnHP+2K/tCeVlhIRJxhJFUDEw2DBmhaL1D6LV0O
	 TXEL9RjudLHRfzI1hQkRJ0VcQkwab5m6a6x8kTImLjAKzIjqijyo1FYOCoGZ1/I5NP
	 WZ1J++UsQ84MaFha4sLA1i6dK6b1PnGyLQSFV3bw4Udi2uo1HzgkVyQ7qT1UXtLRlA
	 rYvbgH9HqDVAaXymCi/gqLiQf6c3Vz5jgpkowhLTRb77CeRDdCt6w4M7DVlMwbU8ct
	 iFHKoMDm8P6KQ==
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
Subject: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK with META + L
Date: Fri, 25 Apr 2025 11:29:48 -0500
Message-ID: <20250425162949.2021325-1-superm1@kernel.org>
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

Introduced a new Kconfig option that will change KEY_SCREENLOCK when
emitted by driver to META + L.

Link: https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec [1]
Link: https://www.logitech.com/en-us/shop/p/k860-split-ergonomic.920-009166 [2]
Suggested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * Add a break to avoid the device actually supporting KEY_SCREENLOCK
---
 drivers/input/Kconfig |  8 ++++++++
 drivers/input/input.c | 20 ++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 88ecdf5218ee9..ffb4163fe315f 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -174,6 +174,14 @@ config INPUT_APMPOWER
 	  To compile this driver as a module, choose M here: the
 	  module will be called apm-power.
 
+config INPUT_SCREENLOCK_EMULATION
+	bool "Pass KEY_SCREENLOCK as META + L"
+	help
+	  Say Y here if you want KEY_SCREENLOCK to be passed to userspace as
+	  META + L.
+
+	  If unsure, say Y.
+
 comment "Input Device Drivers"
 
 source "drivers/input/keyboard/Kconfig"
diff --git a/drivers/input/input.c b/drivers/input/input.c
index dfeace85c4710..983e3c0f88e5f 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -370,6 +370,13 @@ void input_handle_event(struct input_dev *dev,
 	}
 }
 
+static void handle_screenlock_as_meta_l(struct input_dev *dev, unsigned int type,
+					int value)
+{
+	input_handle_event(dev, type, KEY_LEFTMETA, value);
+	input_handle_event(dev, type, KEY_L, value);
+}
+
 /**
  * input_event() - report new input event
  * @dev: device that generated the event
@@ -392,6 +399,12 @@ void input_event(struct input_dev *dev,
 {
 	if (is_event_supported(type, dev->evbit, EV_MAX)) {
 		guard(spinlock_irqsave)(&dev->event_lock);
+#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
+		if (code == KEY_SCREENLOCK) {
+			handle_screenlock_as_meta_l(dev, type, value);
+			return;
+		}
+#endif
 		input_handle_event(dev, type, code, value);
 	}
 }
@@ -2134,6 +2147,13 @@ void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int
 
 	switch (type) {
 	case EV_KEY:
+#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
+		if (code == KEY_SCREENLOCK) {
+			__set_bit(KEY_L, dev->keybit);
+			__set_bit(KEY_LEFTMETA, dev->keybit);
+			break;
+		}
+#endif
 		__set_bit(code, dev->keybit);
 		break;
 
-- 
2.43.0


