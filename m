Return-Path: <linux-input+bounces-15620-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAB5BF214A
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 17:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8E3D4F6D23
	for <lists+linux-input@lfdr.de>; Mon, 20 Oct 2025 15:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0195268688;
	Mon, 20 Oct 2025 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9CPgIqz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DCF242D9B;
	Mon, 20 Oct 2025 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973816; cv=none; b=Jog5hFJWrzjB5mkL/+guNy6b+rIwm0CmPcx+SORfcoLek71I74hpQqMVBFtc+3CLQyiE447L3y/FMK+FwvvJMftOmdgXYbF5rTNkO1GTDcpVtai5XH4biWNCkSmje+H/7s1ZZgEf+bxzUe05zXy3KocTNTb0mpUmbdRwZPfBAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973816; c=relaxed/simple;
	bh=vUd/OO8eCvfXsHxdHOd9/l9Gs1HYDrEI3B7xM9vD1aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o132H7Yc5f55g241SN6jE1op9FDLrpQsXeAeTj2uaS/2zyD9LVzOo8mrv0gSG3HNlG0keXsLcsEE9Tjy/T4w7ubpz3dsB27TWrhL62DVK3puJ0ELLaVuAvx4iipkYhcyR0v+mSeMp8xDqGMS4nH61SsgudICEm+pC1RaLePEGhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9CPgIqz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD32DC4AF09;
	Mon, 20 Oct 2025 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760973816;
	bh=vUd/OO8eCvfXsHxdHOd9/l9Gs1HYDrEI3B7xM9vD1aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H9CPgIqzCNutQZ6+fqq5FQyO9weqdbnLRJvAs/0cS0QkwF6JV7QAtrE0OqT8n/MIQ
	 gXG4A0dhFX0ARqvltez3d6YYycoMg5R4X5WH1OTY9HSA8Q7JkEGJ8GT5HHlepGbmpc
	 Vq+kiYzItz1C9MErCWeAXXIQ5GCK1Wjr+zzyreWFZhdPSo1Yb2Kj8D9d+xqv+Mv3ke
	 gbuFgY1UxPDNhBSJgnN67F7CkxBUmeKIGbPkEc006WQ8izqX4CBkrUAryK4bHj830F
	 Z57ZI4j80FyXfx7U4drY4+gDcKUeJ/70CeUBTy6yDuMIbj+m8jIY7iQnTH24hHfGg9
	 XnfYaxsTW9dfg==
From: Hans de Goede <hansg@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] Input: Add keycodes for electronic privacy screen on/off hotkeys
Date: Mon, 20 Oct 2025 17:23:30 +0200
Message-ID: <20251020152331.52870-2-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020152331.52870-1-hansg@kernel.org>
References: <20251020152331.52870-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add keycodes for hotkeys toggling the electronic privacy screen found on
some laptops on/off.

There already is an API for eprivacy screens as kernel-mode-setting drm
connector object properties:
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties

this API also supports reporting when the eprivacy screen is turned on/off
by the embedded-controller (EC) in response to hotkey presses.

But on some laptops (e.g. the Dell Latitude 7300) the firmware does not
allow querying the presence nor the status of the eprivacy screen at boot.
This makes it impossible to implement the drm connector properties API
since drm objects do not allow adding new properties after creation and
the presence of the eprivacy cannot be detected at boot.

The first notice of the presence of an eprivacy screen on these laptops is
an EC generated (WMI) event when the eprivacy screen hotkeys are pressed.

In this case the new keycodes this change adds can be generated to notify
userspace of the eprivacy screen on/off hotkeys being pressed, so that
userspace can show the usual on-screen-display (OSD) notification for eprivacy
screen on/off to the user. This is similar to how e.g. touchpad on/off
keycodes are used to show the touchpad on/off OSD.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 include/uapi/linux/input-event-codes.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index ca5851e97fac..d2987786c28e 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -630,6 +630,18 @@
 #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
 
+/*
+ * Keycodes for hotkeys toggling the electronic privacy screen found on some
+ * laptops on/off. Note when the embedded-controller turns on/off the eprivacy
+ * screen itself then the state should be reported through drm connecter props:
+ * https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties
+ * Except when implementing the drm connecter properties API is not possible
+ * because e.g. the firmware does not allow querying the presence and/or status
+ * of the eprivacy screen at boot.
+ */
+#define KEY_EPRIVACY_SCREEN_ON		0x252
+#define KEY_EPRIVACY_SCREEN_OFF		0x253
+
 #define KEY_KBDINPUTASSIST_PREV		0x260
 #define KEY_KBDINPUTASSIST_NEXT		0x261
 #define KEY_KBDINPUTASSIST_PREVGROUP		0x262
-- 
2.51.0


