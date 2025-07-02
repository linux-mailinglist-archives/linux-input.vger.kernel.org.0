Return-Path: <linux-input+bounces-13325-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F93AF098B
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 06:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7FCB189DCE8
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 04:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE7C14B950;
	Wed,  2 Jul 2025 04:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="UBhoWzTX"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76329184
	for <linux-input@vger.kernel.org>; Wed,  2 Jul 2025 04:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428937; cv=none; b=X7LTA6Y0wSOjo0661NDOsCP+4CAJat8QZvbTQd445sJYxfkMdM0ZxpnmvT+ysuwvhUe/NOnZExW9k6MqQlFeyecRHwAS1ohsLh1zzP3xeGj0y+hcW+HOjHUiyB0v5syTPQ5lIFMLJyN5z/bqRQdp1n4Jdw00iKfevXLR0V449Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428937; c=relaxed/simple;
	bh=89hBmHmN2y2jy3z0bfOjTaG+MRe06c/jDA+5T6LPZCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8mapl83pFSbNjWCCOBoUZ3CMJbwPh6+re/EeTQzixoBHbmJhmNMsfiotTkudrtyKjADOeOhQbHVufW3ueY+l+efOfYls/0zm1vzC2d3i8xBNu6nh//UjgIN4NHQR4+sjJ8Pz+uYznsQufqO6ChshfFaCCrden5Ve/r+DTAtMjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=UBhoWzTX; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1751428934; bh=89hBmHmN2y2jy3z0bfOjTaG+MRe06c/jDA+5T6LPZCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBhoWzTXogl/MFv+Z8OBg6ql0j2xspO/c6V3a9vL6cg0Py/k9NVz62yjUS6vjwICQ
	 0G/aEQh99+w/6wOPb4PuAzlmerrrZ6+7q7Qf3XdcqPPf/d9C7+9bIDVNYpOFwfa7aR
	 G2dW1IhbBv3ZSBoevC87zfFRvUUGof4fleun4uyK3oIC7s1KP96328FEVQBw3u74b2
	 7KRcawL8EKyCdrpM8s8CRyhb054Lw+3oOB9T367rS5lk5js+bammtLpkCkt8uDbNek
	 TWQ+TRXxr2rzIzTLAT3epHZk763ooF/O0ew4ST1+rzOJ06g9qZdrFXtpR7fAXpidno
	 Hh/0wx5+me8Ag==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 798D3A0EA;
	Tue,  1 Jul 2025 21:02:14 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/3] Input: Add and document BTN_GRIP*
Date: Tue,  1 Jul 2025 21:01:00 -0700
Message-ID: <20250702040102.125432-2-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702040102.125432-1-vi@endrift.com>
References: <20250702040102.125432-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many controllers these days have started including grip buttons. As there has
been no particular assigned BTN_* constants for these, they've been
hapharzardly assigned to BTN_TRIGGER_HAPPY*. Unfortunately, the assignemnt of
these has varied significantly between drivers. This patch adds and documents
new constants for these grip buttons.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 Documentation/input/gamepad.rst        | 13 +++++++++++++
 drivers/hid/hid-debug.c                |  2 ++
 include/uapi/linux/input-event-codes.h |  5 +++++
 3 files changed, 20 insertions(+)

diff --git a/Documentation/input/gamepad.rst b/Documentation/input/gamepad.rst
index eca17a7f5258..357c138eec66 100644
--- a/Documentation/input/gamepad.rst
+++ b/Documentation/input/gamepad.rst
@@ -190,6 +190,19 @@ Gamepads report the following events:
 
   Rumble is advertised as FF_RUMBLE.
 
+- Grip buttons:
+
+  Many pads include buttons on the rear, usually referred to as either grip or
+  rear buttons, or paddles. These are often reprogrammable by the firmware to
+  appear as "normal" buttons, but are sometimes exposed to software too. Some
+  notable examples of this are the Steam Deck, which has R4, R5, L4, and L5 on
+  the back; the Xbox Elite pads, which have P1-P4; and the Switch 2 Pro
+  Controller, which has GL and GR.
+
+  For these controllers, BTN_GRIPR and BTN_GRIPR2 should be used for the top
+  and bottom (if present) right grip button(s), and BTN_GRIPL and BTN_GRIPL2
+  should be used for the top and bottom (if present) left grip button(s).
+
 - Profile:
 
   Some pads provide a multi-value profile selection switch.  An example is the
diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index c6b6b1029540..b25dc3425da3 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3291,6 +3291,8 @@ static const char *keys[KEY_MAX + 1] = {
 	[BTN_TR2] = "BtnTR2",			[BTN_SELECT] = "BtnSelect",
 	[BTN_START] = "BtnStart",		[BTN_MODE] = "BtnMode",
 	[BTN_THUMBL] = "BtnThumbL",		[BTN_THUMBR] = "BtnThumbR",
+	[BTN_GRIPL] = "BtnGripL",		[BTN_GRIPR] = "BtnGripR",
+	[BTN_GRIPL2] = "BtnGripL2",		[BTN_GRIPR2] = "BtnGripR2",
 	[BTN_TOOL_PEN] = "ToolPen",		[BTN_TOOL_RUBBER] = "ToolRubber",
 	[BTN_TOOL_BRUSH] = "ToolBrush",		[BTN_TOOL_PENCIL] = "ToolPencil",
 	[BTN_TOOL_AIRBRUSH] = "ToolAirbrush",	[BTN_TOOL_FINGER] = "ToolFinger",
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 3b2524e4b667..08cb157ab593 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -601,6 +601,11 @@
 #define BTN_DPAD_LEFT		0x222
 #define BTN_DPAD_RIGHT		0x223
 
+#define BTN_GRIPL		0x224
+#define BTN_GRIPR		0x225
+#define BTN_GRIPL2		0x226
+#define BTN_GRIPR2		0x227
+
 #define KEY_ALS_TOGGLE		0x230	/* Ambient light sensor */
 #define KEY_ROTATE_LOCK_TOGGLE	0x231	/* Display rotation lock */
 #define KEY_REFRESH_RATE_TOGGLE	0x232	/* Display refresh rate toggle */
-- 
2.49.0


