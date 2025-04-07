Return-Path: <linux-input+bounces-11555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C525A7D7E1
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 10:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C7843AD062
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 08:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D248B23A6;
	Mon,  7 Apr 2025 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hUITWEUF"
X-Original-To: linux-input@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F332288C6
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014610; cv=none; b=MNGutK2zP3N8h1K79xcXXi2NgJGQIop98A8929EY3K44r1/YgceMLNZZyk1TXDDsKK3GAtONr0trp/WiSIm04hACbwf7YABPPX5TT9HMqv34WRL85LS2Nn527NdYpJOeA2UySeTzXr0LZy8XVXn0xJfNpHPtMDjT36f+eBS8WWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014610; c=relaxed/simple;
	bh=aLj7wvc4aRbVmLmOqIT/Boj8QXP71Joc96dlj/7+Z4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nmPGIpErjYqRdlHoyR4PSbOswOHkW8WdU+2NoSmeeSTf9ro0iMZQZteypaFTjP6En4L66+XSx8toB1L4ZThhCeh1O8CMpGCtG7uIVot1BszP5K1VKevRbPOxNRor2MeCelyGov4EajMcQJKg9Ow/jNpWYoCoeG54Gk0YXZSVsLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hUITWEUF; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744014606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9YMRGIFJnLx4JH/mAcbrqwA3HkZ8jRCw13qcVKYMT8Q=;
	b=hUITWEUFkJiXKzBiqjgbNCKsXh5LuM3w4UQ67FMGEyZqQXuT7fB8asLkgLFoLPIxOyQ0d5
	aYAynOaGvC7HNO+t8t4aA+nrLkHP7PQDuaWcF9RV6BWIO5TQkLqiahU+7v2FStwI27StCX
	1ya3kuJze61BM/rPDzumn38z8Kx+sLQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: appletb-kbd: Use secs_to_jiffies() instead of msecs_to_jiffies()
Date: Mon,  7 Apr 2025 10:29:30 +0200
Message-ID: <20250407082930.742229-2-thorsten.blum@linux.dev>
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

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hid/hid-appletb-kbd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index d4b95aa3eecb..2f78db891cb9 100644
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


