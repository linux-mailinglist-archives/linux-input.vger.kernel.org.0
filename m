Return-Path: <linux-input+bounces-4925-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C8792C02C
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 18:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40CB11F2225E
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 16:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2B919F49B;
	Tue,  9 Jul 2024 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LB6vaNsj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E1119F497;
	Tue,  9 Jul 2024 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542149; cv=none; b=LoY10sj/F5vfMl1bExLvqEPFpYmll8+TKTt6U/nvO1Wn2u6GBugvKz0km9tGtKa3NVTc9dKvKEo6CHcxe6VgF6JQzH+xoklvzsgjH5ExTm+NzVBtCPc5NVv+5dHTOTD8QnFYJgEfHUJCn+djMdF57BaPaTfPjv69GMQpuVDG9Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542149; c=relaxed/simple;
	bh=FAAQ7hUngIYfV+m+yhEiNqSqomtGq42oNGZTyjozpxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLEycySwkYITRBt4t1mUCCgK9w2+nOY0TN/3YEZi0oosNKHVsKrFaGo8olJ3/ruaLf5RoYL1dvhRp1bcyn0+gZXC5ysTnsPEFZSZP1ptnH6xS8pIsdGdhdIPNMwyEKj2EWyz/Q98qWw7aRTf4NDw0ATrOdp01rFTtJEhVbHalgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LB6vaNsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628C2C3277B;
	Tue,  9 Jul 2024 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542149;
	bh=FAAQ7hUngIYfV+m+yhEiNqSqomtGq42oNGZTyjozpxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LB6vaNsjld6jhiwpkQKBsoGeQuO++C5D5HSzJuOGotd98rbFPP1zEAQJoozk40NZm
	 uPhcEMCx98y0fp8791X8svBcwZMx4MGbXUGyXdtMjJVeRhkdPdA5TxvOwkSo0GNGe8
	 hwmBR21aKhi+UvP8LOA3cMrdXnHkOyeVU628ohJeuhmV7Ro7Fnj8Q7Ygf/bYyI57EG
	 kDhYxI7W2zH3CH7t86x6GYGYfqkwtNizUKmWsOL04kbFsy0USK6WJSCOjwbMZp0uK0
	 S9KX/3twzovBEhDiMkaBYHDguMAobtJ0amvypI857yDWt+t9I4/oRMLjQSmgiyV+tB
	 69cRgR+7bj3kA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	szfabian@bluemarch.art,
	wse@tuxedocomputers.com,
	eshimanovich@chromium.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 02/33] Input: i8042 - add Ayaneo Kun to i8042 quirk table
Date: Tue,  9 Jul 2024 12:21:28 -0400
Message-ID: <20240709162224.31148-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162224.31148-1-sashal@kernel.org>
References: <20240709162224.31148-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.38
Content-Transfer-Encoding: 8bit

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

[ Upstream commit 955af6355ddfe35140f9706a635838212a32513b ]

See the added comment for details. Also fix a typo in the
quirk's define.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Link: https://lore.kernel.org/r/20240531190100.3874731-1-tjakobi@math.uni-bielefeld.de
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/serio/i8042-acpipnpio.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index dfc6c581873b7..5b50475ec4140 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -76,7 +76,7 @@ static inline void i8042_write_command(int val)
 #define SERIO_QUIRK_PROBE_DEFER		BIT(5)
 #define SERIO_QUIRK_RESET_ALWAYS	BIT(6)
 #define SERIO_QUIRK_RESET_NEVER		BIT(7)
-#define SERIO_QUIRK_DIECT		BIT(8)
+#define SERIO_QUIRK_DIRECT		BIT(8)
 #define SERIO_QUIRK_DUMBKBD		BIT(9)
 #define SERIO_QUIRK_NOLOOP		BIT(10)
 #define SERIO_QUIRK_NOTIMEOUT		BIT(11)
@@ -1332,6 +1332,20 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
 					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
 	},
+	{
+		/*
+		 * The Ayaneo Kun is a handheld device where some the buttons
+		 * are handled by an AT keyboard. The keyboard is usually
+		 * detected as raw, but sometimes, usually after a cold boot,
+		 * it is detected as translated. Make sure that the keyboard
+		 * is always in raw mode.
+		 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_MATCH(DMI_BOARD_NAME, "KUN"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_DIRECT)
+	},
 	{ }
 };
 
@@ -1655,7 +1669,7 @@ static void __init i8042_check_quirks(void)
 		if (quirks & SERIO_QUIRK_RESET_NEVER)
 			i8042_reset = I8042_RESET_NEVER;
 	}
-	if (quirks & SERIO_QUIRK_DIECT)
+	if (quirks & SERIO_QUIRK_DIRECT)
 		i8042_direct = true;
 	if (quirks & SERIO_QUIRK_DUMBKBD)
 		i8042_dumbkbd = true;
-- 
2.43.0


