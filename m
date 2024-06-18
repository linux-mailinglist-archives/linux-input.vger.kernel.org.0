Return-Path: <linux-input+bounces-4410-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF490CC4D
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 14:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F531F21C3D
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 12:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711D215FD0F;
	Tue, 18 Jun 2024 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toIqyaYu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05115FCFC;
	Tue, 18 Jun 2024 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714270; cv=none; b=kRTUdPV8JmlRsVg+5ak6CSHE9uJODu+/OmYkoYF1Ag1XMS92sGOVpmgA1yYk5ao+IK9oKh4voRVZJIPSvspo6SS7E5xatC/jjF7yOwfpEWxlHtHedtiNNJQMaTT1vOteNm4IRs7UL05eE5ao3z3ktLqvTN3m3DZHeaqN/gUikl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714270; c=relaxed/simple;
	bh=xKbLMgiN5IAoLyVRzguxR4ESonXkAZtyPLydiw8fPjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzqwqwtFO7H01tMNHkwAjEPuWnpGnJFbxy3JmkkKh3TGIbRLnzJJUiQepFdaLcdHAIZCSSROp1LSTAZTyMj68LPG3pclzAxpeNhqBGQLO7oZCwADuD7VZf1QxtZ+hsbnbjo/gbqXBuHMcdsuv2NtzJJA01X5KeCheOk2P8Lli+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toIqyaYu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E2DC3277B;
	Tue, 18 Jun 2024 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714270;
	bh=xKbLMgiN5IAoLyVRzguxR4ESonXkAZtyPLydiw8fPjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=toIqyaYuX3pGmtqPo44ViFDqBx1llNN2UsyWxW2tlZR74HedK1e7Nqur0LeeII/AF
	 H4QyQ+NJtYLU1TAZwO7g7cjrBlaPHI7EIfyeBIot4kn7gxUxouqTdWIuJb1Q0mAANO
	 zzSDRnsWp2UYUuxPeGowDCV4WLfKMImwVWHDuCgPDMhPZLg7StnygssQWdZrYNXZjV
	 uXkEl1odR1S8za3+49PlHqV8Qpjxy8Z4QlYmcdM2Yg21ZXszN+U89Nows5HBcsvRxG
	 kow5sgoHBDTMOHgFK670QyEkSmBTl1mw+D6OAuXD8IW+4TnhTJJ9ts2NciIGNPfrOq
	 ReZQGyJEWvyLA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aseda Aboagye <aaboagye@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 42/44] input: Add event code for accessibility key
Date: Tue, 18 Jun 2024 08:35:23 -0400
Message-ID: <20240618123611.3301370-42-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618123611.3301370-1-sashal@kernel.org>
References: <20240618123611.3301370-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.5
Content-Transfer-Encoding: 8bit

From: Aseda Aboagye <aaboagye@chromium.org>

[ Upstream commit 0c7dd00de018ff70b3452c424901816e26366a8a ]

HUTRR116 added support for a new usage titled "System Accessibility
Binding" which toggles a system-wide bound accessibility UI or command.
This commit simply adds a new event code for the usage.

Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/Zl-e97O9nvudco5z@google.com
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-debug.c                | 1 +
 drivers/hid/hid-input.c                | 1 +
 include/uapi/linux/input-event-codes.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 7dd83ec74f8a9..c629ab161d5b2 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -974,6 +974,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_CAMERA_ACCESS_ENABLE] = "CameraAccessEnable",
 	[KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
 	[KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
+	[KEY_ACCESSIBILITY] = "Accessibility",
 	[KEY_DICTATE] = "Dictate",
 	[KEY_MICMUTE] = "MicrophoneMute",
 	[KEY_BRIGHTNESS_MIN] = "BrightnessMin",
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e03d300d2bac4..d5a6e89c3086e 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -836,6 +836,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		if ((usage->hid & 0xf0) == 0xa0) {	/* SystemControl */
 			switch (usage->hid & 0xf) {
 			case 0x9: map_key_clear(KEY_MICMUTE); break;
+			case 0xa: map_key_clear(KEY_ACCESSIBILITY); break;
 			default: goto ignore;
 			}
 			break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 03edf2ccdf6c8..39f11ec676fae 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -618,6 +618,7 @@
 #define KEY_CAMERA_ACCESS_ENABLE	0x24b	/* Enables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_DISABLE	0x24c	/* Disables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_TOGGLE	0x24d	/* Toggles the current state of the camera access control. (HUTRR72) */
+#define KEY_ACCESSIBILITY		0x24e	/* Toggles the system bound accessibility UI/command (HUTRR116) */
 
 #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
-- 
2.43.0


