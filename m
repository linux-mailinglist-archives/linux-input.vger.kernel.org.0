Return-Path: <linux-input+bounces-11880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ADFA950D5
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 14:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 186EA16B215
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 12:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0769263F32;
	Mon, 21 Apr 2025 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LZpQ/Pq2"
X-Original-To: linux-input@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CF728F1
	for <linux-input@vger.kernel.org>; Mon, 21 Apr 2025 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238267; cv=none; b=DFPa6FAcBzr6M9xAZW1HWP7tnZxEWzd+6khurVL6LJCJSdpOEYvV52+jJctbnKF2+P7iB0xUGT3trelMNXLM46nzJdzpZdYukbt7QYq7f1UnboiQgrRH8rqh4pGG2ATXf31cTuOYilWPspxa5lLyqJ14RUfFOHc+Nf+9QkfFn/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238267; c=relaxed/simple;
	bh=9cl03cKvKkgOt+Fch1LWUy/Ue1hSGNTt3JvE90D84XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOSlnVdR/ZqOTOyHrwuw78RmA/P9Bi9N16NnE5oxRaLd4Fp/q62BHfWt1HmmUyrkZK3UGgJd4E9nbJBh4rFeIGBj6cFaGiNJtXJg2onY96YCCCjMnl3r6OpLAW45kNXOvhQ4PK3rcD4cAJOVb/CPEcRHFPD1pe4jgM+jcyVIMcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LZpQ/Pq2; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745238263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DbnqSvSMGlnlSjIWWt6PGezYXXroKzS/LQIYWmcWWiA=;
	b=LZpQ/Pq27a1KbDalAhXNk4f6FtqXNo2oFlM9EJSrPfCyt7pBhTSh54asQ4CGptrkQQS/Ol
	/uA5iZX0Q0Rpj0A9+E2FuF2Z3aFXV5wUio37x+8cpK/CSS3mVjpgnWP1VrWatDq0t2VZa1
	Qj4052N4JY5x1vsvCoGEAPQHLMSkAJs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Aditya Garg <gargaditya08@live.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] HID: appletb-kbd: Use secs_to_jiffies() instead of msecs_to_jiffies()
Date: Mon, 21 Apr 2025 14:24:03 +0200
Message-ID: <20250421122404.363285-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use secs_to_jiffies() instead of msecs_to_jiffies() and avoid scaling
the module params 'appletb_tb_idle_timeout' and 'appletb_tb_dim_timeout'
to milliseconds. secs_to_jiffies() expands to simpler code and reduces
the size of 'hid-appletb-kbd.ko'.

Reformat the code to silence multiple checkpatch warnings.

No functional changes intended.

Reviewed-by: Aditya Garg <gargaditya08@live.com>
Tested-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hid/hid-appletb-kbd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index 029ccbaa1d12..ef51b2c06872 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -172,7 +172,8 @@ static void appletb_inactivity_timer(struct timer_list *t)
 		if (!kbd->has_dimmed) {
 			backlight_device_set_brightness(kbd->backlight_dev, 1);
 			kbd->has_dimmed = true;
-			mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_idle_timeout * 1000));
+			mod_timer(&kbd->inactivity_timer,
+				jiffies + secs_to_jiffies(appletb_tb_idle_timeout));
 		} else if (!kbd->has_turned_off) {
 			backlight_device_set_brightness(kbd->backlight_dev, 0);
 			kbd->has_turned_off = true;
@@ -188,7 +189,8 @@ static void reset_inactivity_timer(struct appletb_kbd *kbd)
 			kbd->has_dimmed = false;
 			kbd->has_turned_off = false;
 		}
-		mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
+		mod_timer(&kbd->inactivity_timer,
+			jiffies + secs_to_jiffies(appletb_tb_dim_timeout));
 	}
 }
 
@@ -407,7 +409,8 @@ static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id
 	} else {
 		backlight_device_set_brightness(kbd->backlight_dev, 2);
 		timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
-		mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
+		mod_timer(&kbd->inactivity_timer,
+			jiffies + secs_to_jiffies(appletb_tb_dim_timeout));
 	}
 
 	kbd->inp_handler.event = appletb_kbd_inp_event;
-- 
2.49.0


