Return-Path: <linux-input+bounces-4382-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E590B108
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 16:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D4CCB33F3A
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 13:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D402A1B4C21;
	Mon, 17 Jun 2024 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qsq8MMoJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79241B3F3A;
	Mon, 17 Jun 2024 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630548; cv=none; b=q2COXJ8dnyrcX3Da4Y/RKeOvTn10BIjLgZ+ADdJQ6HoHBIaFbqSESNZUx4oLSX47em8l+Sk17ISvnD1hoO+x6FtzK1Q1bNgfupbFjBsK4+kBkuAqTzHQyRTqxWXHZZpD9NlKWcr3QpuFsYmqmZ82LDphKwYshLGlJXiFpPhrLWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630548; c=relaxed/simple;
	bh=fTypj0pLySXTgmrYxzbve/VcRyKTFDL9FMJi/IuO0xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h754SSx6qkbJfUIis0vX5C33W18ITPsneYXKzKsynUo5gNRSxnu9IRUFvt3acs8CHqNw1ExBCTAf1fwSvUkVQmDZj75cQJso9wdvww6CB2nxyhCpLu44vO6/xLj4TBKpJngB7g0YoQ2Sz8xatZ9SALUgO897tn2TPDGSmiQoKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qsq8MMoJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A72CC4AF1D;
	Mon, 17 Jun 2024 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630548;
	bh=fTypj0pLySXTgmrYxzbve/VcRyKTFDL9FMJi/IuO0xE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qsq8MMoJdq3bklNlC6v4gY9dp/Zs2utayJZXkRDqgvf2D8FwtYAQQcn/OPHhrSgIC
	 J261ivhgkFFIjPSZTOPU26D6u6mgkVcYdrjqAjIBd/DffxTaeG1md6HGn6SZ/L2L12
	 BcvJQB39cjYX2oDybkInaHhHW0PbfF6vDJ7dnoTL+5jazpfgM60bwEsQ7fwZEfkk/N
	 TfnJMy4zeHX+ziU8bGf9vXLCPjXp/6LcLg4porll2OV+GpTT8/ic7WRjay49ofVTwW
	 va0uIkSOUXsv22MjNUOlFJCwvh1UWuggnHrvUhCUPOyTcvmADJQFYPZPiooWPXKWLK
	 avhud/F2/R/JA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aseda Aboagye <aaboagye@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 43/44] input: Add support for "Do Not Disturb"
Date: Mon, 17 Jun 2024 09:19:56 -0400
Message-ID: <20240617132046.2587008-43-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132046.2587008-1-sashal@kernel.org>
References: <20240617132046.2587008-1-sashal@kernel.org>
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

[ Upstream commit 22d6d060ac77955291deb43efc2f3f4f9632c6cb ]

HUTRR94 added support for a new usage titled "System Do Not Disturb"
which toggles a system-wide Do Not Disturb setting. This commit simply
adds a new event code for the usage.

Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/r/Zl-gUHE70s7wCAoB@google.com
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-debug.c                | 1 +
 drivers/hid/hid-input.c                | 8 ++++++++
 include/uapi/linux/input-event-codes.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index c629ab161d5b2..5302bfd527d86 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -975,6 +975,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
 	[KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
 	[KEY_ACCESSIBILITY] = "Accessibility",
+	[KEY_DO_NOT_DISTURB] = "DoNotDisturb",
 	[KEY_DICTATE] = "Dictate",
 	[KEY_MICMUTE] = "MicrophoneMute",
 	[KEY_BRIGHTNESS_MIN] = "BrightnessMin",
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index d5a6e89c3086e..8bb16e9b94aa5 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -833,6 +833,14 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			break;
 		}
 
+		if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
+			switch (usage->hid & 0xf) {
+			case 0xb: map_key_clear(KEY_DO_NOT_DISTURB); break;
+			default: goto ignore;
+			}
+			break;
+		}
+
 		if ((usage->hid & 0xf0) == 0xa0) {	/* SystemControl */
 			switch (usage->hid & 0xf) {
 			case 0x9: map_key_clear(KEY_MICMUTE); break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 39f11ec676fae..a4206723f5033 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -619,6 +619,7 @@
 #define KEY_CAMERA_ACCESS_DISABLE	0x24c	/* Disables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_TOGGLE	0x24d	/* Toggles the current state of the camera access control. (HUTRR72) */
 #define KEY_ACCESSIBILITY		0x24e	/* Toggles the system bound accessibility UI/command (HUTRR116) */
+#define KEY_DO_NOT_DISTURB		0x24f	/* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
 
 #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
-- 
2.43.0


