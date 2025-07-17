Return-Path: <linux-input+bounces-13574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D10B0813B
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 02:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B8D58257D
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 00:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DB4BE5E;
	Thu, 17 Jul 2025 00:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="euNpGr/4"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5023BE46
	for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 00:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752710573; cv=none; b=ZVtxTO1TZEMrJDN2Hp95aZukwt73CLC7mbXdbt77CMZf/DBNnDZU7/IC627/Fds/xilZZXbSZuRwOzyTJa6XVUhjDaoReZjZRegYJwrQ9H5s5vNnleQUDeG8wSBOifi30IT77bCoLhi67v5YGgWy2nyIIa8UuP1FQuD4p1MTqN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752710573; c=relaxed/simple;
	bh=89hBmHmN2y2jy3z0bfOjTaG+MRe06c/jDA+5T6LPZCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZhrMoD9Fv9/ZGLQUirRhAIvjrpgH3WFyw8xpgQLTKlmWoNQCJKYj2qOt5BY5vCGKbd6HCvtDLoXbIBxWDXYZ8rRbhfCC+L9Kvcp3g+3VPzhYFd5qhiqpOqOjjeSaA54AoCX/oVIFiastvas7sB+0k4bLg/VtUAixFP6whmg6SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=euNpGr/4; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1752710571; bh=89hBmHmN2y2jy3z0bfOjTaG+MRe06c/jDA+5T6LPZCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=euNpGr/4lpXC/wawn6u2IgR/wdk+z17Q9z7Px0oECKobDp5Ec6XSTRJXmluqpfLxW
	 2Yo0ETg1EWVDI7zB4LLjvT5VqLOhf9nHU32eOf85u/6YwFMA+2EmbY2nGxP72BwT8y
	 PkGog9HJM6GJOodtIuZ+9ay7hbMA91gzHb9Nw6NuFx5cKLGc9enJwtVmmqVxHHyGU8
	 5TnEnAeFHvt8KgCgkmW2snjH7YWQhNj2lxQ8TushG2B5u7anj5k3a5xr7DxBKUEq+c
	 1kyinRQ6bMMXm9OHVbQKhLYbMLUT/3dQPM9wMNuNdkqS8Jp6l1DBTsrmut5XWlBC9N
	 cu524if6JG3dQ==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id ECADFA196;
	Wed, 16 Jul 2025 17:02:50 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 1/3] Input: Add and document BTN_GRIP*
Date: Wed, 16 Jul 2025 17:01:38 -0700
Message-ID: <20250717000143.1902875-2-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717000143.1902875-1-vi@endrift.com>
References: <20250717000143.1902875-1-vi@endrift.com>
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


