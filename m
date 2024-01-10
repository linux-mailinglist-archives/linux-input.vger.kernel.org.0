Return-Path: <linux-input+bounces-1083-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB174822054
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 18:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27495B22289
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 17:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46497154A1;
	Tue,  2 Jan 2024 17:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="CKQCDkU3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7EB15499;
	Tue,  2 Jan 2024 17:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse.fritz.box (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 413822FC006B;
	Tue,  2 Jan 2024 18:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1704216238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJNhvlNEbhz6wkYNou1HHqLAU/bd7n4aZ11XtrXYphc=;
	b=CKQCDkU3nVmX4X+Tb8kWWiWEteSFK+tfZ+cjadUZCnGpt44o0syE42h2RCjUCjghAqJTH3
	b5tD5YpiyM9pUAWMGU+kBT5D/cnsinsWDSejJywFzcCVuOqXrsmI066y2veY5LlpaLCYgS
	5PwOKzOOmpLOQ1odD1O3LfEcr9dQHAQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] i8042: Add forcenorestore quirk to leave controller untouched even on s3
Date: Tue,  2 Jan 2024 18:23:54 +0100
Message-Id: <20240102172356.78978-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On s3 resume the i8042 driver tries to restore the controller to a known
state by reinitializing things, however can this confuses the controller
with different effects. Mostly occasionally unresponsive keyboards after
resume.

These issues do not rise on s0ix resume as here the controller is assumed
to preserved its state from before suspend.

This patch adds a quirk for devices where the reinitialization on s3 resume
is not needed and might be harmful as described above. It does this by
using the s0ix resume code path at selected locations.

This new quirk goes beyond what the preexisting reset=never quirk does,
which only skips some reinitialization steps.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
 drivers/input/serio/i8042-acpipnpio.h | 10 +++++++---
 drivers/input/serio/i8042.c           | 10 +++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index b585b1dab870e..10ec4534e5e14 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -83,6 +83,7 @@ static inline void i8042_write_command(int val)
 #define SERIO_QUIRK_KBDRESET		BIT(12)
 #define SERIO_QUIRK_DRITEK		BIT(13)
 #define SERIO_QUIRK_NOPNP		BIT(14)
+#define SERIO_QUIRK_FORCENORESTORE	BIT(15)
 
 /* Quirk table for different mainboards. Options similar or identical to i8042
  * module parameters.
@@ -1657,6 +1658,8 @@ static void __init i8042_check_quirks(void)
 	if (quirks & SERIO_QUIRK_NOPNP)
 		i8042_nopnp = true;
 #endif
+	if (quirks & SERIO_QUIRK_FORCENORESTORE)
+		i8042_forcenorestore = true;
 }
 #else
 static inline void i8042_check_quirks(void) {}
@@ -1690,7 +1693,7 @@ static int __init i8042_platform_init(void)
 
 	i8042_check_quirks();
 
-	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
 		i8042_nokbd ? " nokbd" : "",
 		i8042_noaux ? " noaux" : "",
 		i8042_nomux ? " nomux" : "",
@@ -1710,10 +1713,11 @@ static int __init i8042_platform_init(void)
 		"",
 #endif
 #ifdef CONFIG_PNP
-		i8042_nopnp ? " nopnp" : "");
+		i8042_nopnp ? " nopnp" : "",
 #else
-		"");
+		"",
 #endif
+		i8042_forcenorestore ? " forcenorestore" : "");
 
 	retval = i8042_pnp_init();
 	if (retval)
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 9fbb8d31575ae..2233d93f90e81 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -115,6 +115,10 @@ module_param_named(nopnp, i8042_nopnp, bool, 0);
 MODULE_PARM_DESC(nopnp, "Do not use PNP to detect controller settings");
 #endif
 
+static bool i8042_forcenorestore;
+module_param_named(forcenorestore, i8042_forcenorestore, bool, 0);
+MODULE_PARM_DESC(forcenorestore, "Force no restore on s3 resume, copying s2idle behaviour");
+
 #define DEBUG
 #ifdef DEBUG
 static bool i8042_debug;
@@ -1232,7 +1236,7 @@ static int i8042_pm_suspend(struct device *dev)
 {
 	int i;
 
-	if (pm_suspend_via_firmware())
+	if (!i8042_forcenorestore && pm_suspend_via_firmware())
 		i8042_controller_reset(true);
 
 	/* Set up serio interrupts for system wakeup. */
@@ -1248,7 +1252,7 @@ static int i8042_pm_suspend(struct device *dev)
 
 static int i8042_pm_resume_noirq(struct device *dev)
 {
-	if (!pm_resume_via_firmware())
+	if (i8042_forcenorestore || !pm_resume_via_firmware())
 		i8042_interrupt(0, NULL);
 
 	return 0;
@@ -1271,7 +1275,7 @@ static int i8042_pm_resume(struct device *dev)
 	 * not restore the controller state to whatever it had been at boot
 	 * time, so we do not need to do anything.
 	 */
-	if (!pm_suspend_via_firmware())
+	if (i8042_forcenorestore || !pm_suspend_via_firmware())
 		return 0;
 
 	/*
-- 
2.34.1


