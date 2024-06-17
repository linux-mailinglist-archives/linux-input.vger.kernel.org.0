Return-Path: <linux-input+bounces-4381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8790B05A
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 15:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AE70B33D97
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 13:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC6E1B3F25;
	Mon, 17 Jun 2024 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqAkeAhP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BCF1B3F21;
	Mon, 17 Jun 2024 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630547; cv=none; b=cQ3xtyOixdzHd9sEyVJWXTcbfbEwFDqGS3qPWE1Sv6njQC/85vHCC3wiMOFVdTI2AcYY+94DjWXuEl4iDO1BZKKII/J39RDESDjsDWF7NDrDGbJG5eF6j7yu29qgYO1D+CFqnGcNsAXrrrXRkeoXTe28ykiHHoeQ48bMPOzVR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630547; c=relaxed/simple;
	bh=xKbLMgiN5IAoLyVRzguxR4ESonXkAZtyPLydiw8fPjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+t6QKlOqwO7hRE8sZntsn5zHPWdJdkb1gEq0AXASP6yHfCsduDvpYAWq+uODX48lNon+molbEp4GwD719UUdLn0Bm5Ui9v77lwYAWLubYaNhuMOiV5fLQpFlE9zAsxYtpcjHXDtByRNGUAlN/zQ7EHcASI/Qi0h5JaVRVg7xvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqAkeAhP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272D6C4AF49;
	Mon, 17 Jun 2024 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630547;
	bh=xKbLMgiN5IAoLyVRzguxR4ESonXkAZtyPLydiw8fPjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqAkeAhPy7wrDhLC2wvuf+EAb0/PIBmH8B8aZMjszK12cAomfYGJXb82c+T35gu/u
	 Hc/pN+UCRT7vztWRZrBtgtr/0L0HruESC1h/6xujjLfIoeUFgy0EpEnZT2iSM97xmB
	 QCi5QH4ydCmFixZaVMXVecZVyFVSDB1NE9MwlF7b4EHe50yZdgUn925WJqyEJg/kZK
	 t6mtifzOWKlBF3odG/Rpzw/cMaXcyw0tqOWaRTgFMA3gjdPMoJdqB5KphG8QdQtAGD
	 Rpza+cLTwrp1WWxsAVULD+Y0GnjGHDWbp8GrDD3/AD3MPBokQFd0nzAShnm7YLolRN
	 qnWyWLmSg9Hvg==
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
Date: Mon, 17 Jun 2024 09:19:55 -0400
Message-ID: <20240617132046.2587008-42-sashal@kernel.org>
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


