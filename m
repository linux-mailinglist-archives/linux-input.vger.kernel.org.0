Return-Path: <linux-input+bounces-11815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE80A9113C
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 03:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B44673AE412
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 01:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECE41A5BA6;
	Thu, 17 Apr 2025 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbDeBJBW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1D184E;
	Thu, 17 Apr 2025 01:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853848; cv=none; b=IMNiQoDvg7Cw3jG/C1RzMf/KZCLv9MRGTtoA8vBACi6pJV6TugeXV80HfJaUhtMBgujdpQEBqiM0t0Vm1MnpECQOg75suX/dBCrJiVYTXSuAtT8qc/fLzhLeATUgD+EBCDVTs0r8/E3nRTW5cBGOQHsiSEUhYjjs29NdbXXFgHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853848; c=relaxed/simple;
	bh=naFJ//8u1SLM3gWsJv/jw8t60Qpo42QfRvPCnltX5f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=loN9en2RKRMZxaTGoqpxhVmhNkZfsLyDSWU/ZpinqyUgwhdI538LeiGFXncpnMUwIQUn6BnBJ1b2ByBWaUVoTG9E8AV/TgHQ7A9KwIuv8p65V8MStHqyDJRXq3DYV7iw73U3JbvhpLBfAWZfJpxLPe67AWYJHkB7JJKTBuwrEgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbDeBJBW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB22C4CEE2;
	Thu, 17 Apr 2025 01:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744853847;
	bh=naFJ//8u1SLM3gWsJv/jw8t60Qpo42QfRvPCnltX5f0=;
	h=From:To:Cc:Subject:Date:From;
	b=QbDeBJBWsWxyiyke2jp/6f3csFGrpNMQzYAWGuwNlHqVp1fYKVV/PDu+jRx+KgkiC
	 Xh3AOO51+bVQgLmnTnLaklkgwqY7+AOcuBJ+Xo/wmc4P4C1gKUZzywNME2HakryJN5
	 kUHgHZmh70T45uGziindDFFqzz8iATSYGZchsp2n73lq3Vfp1g6UJULR2eLN7tY++Z
	 vswlrhi04CJgf2pGPM+LHbYXtFtwl1l42aF4G2eHxXxI9MxFoOHidiWchFdJsXPPb7
	 o+ddc2+6tsfGL9G+ovebQcmovdIVGTKvOq/mOpBRLl6qht7GrD815ChUFOX5NdixWB
	 MQh2GBQIDDDog==
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
Subject: [PATCH v3 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK with META + L
Date: Wed, 16 Apr 2025 20:37:21 -0500
Message-ID: <20250417013722.435751-1-superm1@kernel.org>
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
v3:
 * Emulation in the input core instead

 drivers/input/Kconfig |  8 ++++++++
 drivers/input/input.c | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+)

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
index dfeace85c4710..08a857cea0c5d 100644
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
@@ -2134,6 +2147,12 @@ void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int
 
 	switch (type) {
 	case EV_KEY:
+#ifdef CONFIG_INPUT_SCREENLOCK_EMULATION
+		if (code == KEY_SCREENLOCK) {
+			__set_bit(KEY_L, dev->keybit);
+			__set_bit(KEY_LEFTMETA, dev->keybit);
+		}
+#endif
 		__set_bit(code, dev->keybit);
 		break;
 
-- 
2.43.0


