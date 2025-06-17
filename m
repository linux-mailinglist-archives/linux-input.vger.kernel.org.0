Return-Path: <linux-input+bounces-12921-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457BADC184
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 07:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83D421892F94
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 05:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0349323B61B;
	Tue, 17 Jun 2025 05:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fxinjpNn"
X-Original-To: linux-input@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D511DE8AD
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 05:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137645; cv=none; b=BxlMk82SriX2DsTw0OfKG7WFXw8DZVLZ6lJywMSeFK3EUwzYKzr3DCGE7OiGUN9ldGcLtQsoOxVwGOb8NgkQhdN5roBiSCWO7icnZRR/PidU7OmMQle5Toc/sUFfeJ1scEqzo7ILcdZhoSXAnwk5b/t8Oko9ZThuSYgIFZ4fxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137645; c=relaxed/simple;
	bh=1BIZ6afFx9HVZFv5oJW0yzLP2jd/Ne/MsLEQjcssqhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a58xVIw41coEuDLM98wEqbe3mrjA6HTUAbrMAfGHctfClIl79+7IPdfsZ79xId47yRKszW4FT/kmeSMg2mTH7kQjFBDctRzsv0Rb4HHP8bQpxa6J3MuSC9sEPc2p1NRzeYVJYDnXFzxKsGMpxDwK2xPv4jaB8v1GQJmVBfg5BF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fxinjpNn; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750137640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8OmQDwZFVLOE6ShjwZClJJTCME86c8R6giamtzP3j/4=;
	b=fxinjpNn4H+qdw+HVq43ym3uevB3l0IJ+Xf5x5IvuxurL39D4v/UPxAOE+6abxdudvZKoF
	qlPBnvZFDYTXltWr0DFZ1d/VK+ZjdPD/5uHmYT98CTFkbVctubGlG3IEcb+Nr9VbDDqH1J
	AltU0+Hj3GHi+md3pvvDXXbgQ1axBM4=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 1/2] Input: i8042 - Add nokbdwakeup quirk to stop keyboard wakeup from s2idle
Date: Mon, 16 Jun 2025 22:19:29 -0700
Message-ID: <20250617051930.3376981-2-matthew.schwartz@linux.dev>
In-Reply-To: <20250617051930.3376981-1-matthew.schwartz@linux.dev>
References: <20250617051930.3376981-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Some platforms will register volume buttons via an i8042 keyboard device,
even though they lack a physical keyboard or lid like a traditional laptop.
In such cases, allowing the i8042 keyboard to wake the device from s2idle 
may not be desirable behavior.

In order to account for this, add a new quirk, nokbdwakeup, to disable
the keyboard wakeup functionality in i8042 on such platforms.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/input/serio/i8042-acpipnpio.h | 8 ++++++--
 drivers/input/serio/i8042.c           | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 6ed9fc34948cb..6dbe9d8523f49 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -84,6 +84,7 @@ static inline void i8042_write_command(int val)
 #define SERIO_QUIRK_DRITEK		BIT(13)
 #define SERIO_QUIRK_NOPNP		BIT(14)
 #define SERIO_QUIRK_FORCENORESTORE	BIT(15)
+#define SERIO_QUIRK_NOKBDWAKEUP		BIT(16)
 
 /* Quirk table for different mainboards. Options similar or identical to i8042
  * module parameters.
@@ -1725,6 +1726,8 @@ static void __init i8042_check_quirks(void)
 #endif
 	if (quirks & SERIO_QUIRK_FORCENORESTORE)
 		i8042_forcenorestore = true;
+	if (quirks & SERIO_QUIRK_NOKBDWAKEUP)
+		i8042_nokbdwakeup = true;
 }
 #else
 static inline void i8042_check_quirks(void) {}
@@ -1758,7 +1761,7 @@ static int __init i8042_platform_init(void)
 
 	i8042_check_quirks();
 
-	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
 		i8042_nokbd ? " nokbd" : "",
 		i8042_noaux ? " noaux" : "",
 		i8042_nomux ? " nomux" : "",
@@ -1782,7 +1785,8 @@ static int __init i8042_platform_init(void)
 #else
 		"",
 #endif
-		i8042_forcenorestore ? " forcenorestore" : "");
+		i8042_forcenorestore ? " forcenorestore" : "",
+		i8042_nokbdwakeup ? " nokbdwakeup" : "");
 
 	retval = i8042_pnp_init();
 	if (retval)
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index cab5a4c5baf52..056a83cb69d66 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -49,6 +49,10 @@ static bool i8042_probe_defer;
 module_param_named(probe_defer, i8042_probe_defer, bool, 0);
 MODULE_PARM_DESC(probe_defer, "Allow deferred probing.");
 
+static bool i8042_nokbdwakeup;
+module_param_named(nokbdwakeup, i8042_nokbdwakeup, bool, 0);
+MODULE_PARM_DESC(nokbdwakeup, "Disable keyboard port from waking up the system.");
+
 enum i8042_controller_reset_mode {
 	I8042_RESET_NEVER,
 	I8042_RESET_ALWAYS,
@@ -423,13 +427,13 @@ static int i8042_start(struct serio *serio)
 	/*
 	 * On platforms using suspend-to-idle, allow the keyboard to
 	 * wake up the system from sleep by enabling keyboard wakeups
-	 * by default.  This is consistent with keyboard wakeup
+	 * by default unless quirked. This is consistent with keyboard wakeup
 	 * behavior on many platforms using suspend-to-RAM (ACPI S3)
 	 * by default.
 	 */
 	if (pm_suspend_default_s2idle() &&
 	    serio == i8042_ports[I8042_KBD_PORT_NO].serio) {
-		device_set_wakeup_enable(&serio->dev, true);
+		device_set_wakeup_enable(&serio->dev, !i8042_nokbdwakeup);
 	}
 
 	guard(spinlock_irq)(&i8042_lock);
-- 
2.49.0


