Return-Path: <linux-input+bounces-14995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD7CB935FF
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 23:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7CCB3B9DC4
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 21:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AF32FD1C2;
	Mon, 22 Sep 2025 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JReZdjMM"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B574D26A0BD;
	Mon, 22 Sep 2025 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758576662; cv=none; b=kVp1sJzTKCVGIbXzYWZT5pdkqtKsrPPzZjAE4C6dZqesBlyM5/Cz0JfeQlGw1m6DScv/JknWicEp2cDjpbjAXN2oEb6au/J2Ra4PK4DUMc94xeq1myDNXJNSkwihMd+M0VOLBNLGA7H5TFpyNZJ23n1c+HqBoou+F3GCsZtxg94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758576662; c=relaxed/simple;
	bh=oNbcqTZ43yhtoO7bFrpbdi7x+RN6hiRQ9jNRuQrG9b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MLLFVCtVvsPPakLfnRRamE0zfLpajBZw7z18D6d1Cyrrph0tHYG3wVZrGk5f3crDk8U8UONlMZq9Nj77NMHvdV50J5+qciLVQQGnWcpdp6tb4tZXF9Ej48UnETyws8w9IpTrCAajtCAxMeIixDONk4Vs0f03Cl37lrvBP3kFax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JReZdjMM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758576659;
	bh=oNbcqTZ43yhtoO7bFrpbdi7x+RN6hiRQ9jNRuQrG9b8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JReZdjMMbVxkZZvCRCMEkaBSyqYqH7UjkHrIF6c76ZdCG9pW6tel4W96AZSVjI1hN
	 c+QC2wxg3+VVN3MDE/hEt46ZEVVxqFpkQxla/Lrz/4zXg9eQ1jjU3bEQY0Ba2od7yb
	 OOYNiA79YDw68/Uz87G71MDCagSdHVMmVr86t5Ah2EIljxXlFM3BAPOaEa4/Y1XWKS
	 ctNX6dgRqjx0lP36F+Qa/hzduCPGrmVh9ZoT71kmZG2S3E+OQ3foyjQ3UfCV3ID6Fq
	 r/k5iKfAZVkesaCTnHOgqFCzcH+/gkigjSlozStU4ufIOVlVMs7OGK0XkyqOdZ+AvO
	 OZE7VN3md7jmA==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id D72E217E12A7;
	Mon, 22 Sep 2025 23:30:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 23 Sep 2025 00:29:41 +0300
Subject: [PATCH 2/3] HID: playstation: Silence sparse warnings for locking
 context imbalances
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-ps5-hid-fixes-v1-2-4b994c54e512@collabora.com>
References: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
In-Reply-To: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

It seems sparse has some difficulties with guard() handling or when
mixing it with scoped_guard(), as it shows a bunch lock related
warnings:

  hid-playstation.c:1230:32: warning: context imbalance in 'dualsense_player_led_set_brightness' - wrong count at exit
  hid-playstation.c:1414:12: warning: context imbalance in 'dualsense_parse_report' - wrong count at exit
  hid-playstation.c:1615:12: warning: context imbalance in 'dualsense_play_effect' - different lock contexts for basic block
  hid-playstation.c:1668:13: warning: context imbalance in 'dualsense_set_lightbar' - wrong count at exit
  hid-playstation.c:1680:13: warning: context imbalance in 'dualsense_set_player_leds' - wrong count at exit
  hid-playstation.c:2185:33: warning: context imbalance in 'dualshock4_led_set_blink' - wrong count at exit
  hid-playstation.c:2226:33: warning: context imbalance in 'dualshock4_led_set_brightness' - wrong count at exit
  hid-playstation.c:2596:12: warning: context imbalance in 'dualshock4_play_effect' - different lock contexts for basic block
  hid-playstation.c:2634:13: warning: context imbalance in 'dualshock4_set_bt_poll_interval' - wrong count at exit
  hid-playstation.c:2642:13: warning: context imbalance in 'dualshock4_set_default_lightbar_colors' - wrong count at exit

Silent them by switching from guard() to scoped_guard() in
{dualsense|dualshock4}_schedule_work().

Reported-by: Benjamin Tissoires <bentiss@kernel.org>
Suggested-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index e03ab8a92bca9416787caceb4682be253efe54a2..87038dacebe7bae72621e3a14dfc39693a316782 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1274,9 +1274,10 @@ static void dualsense_init_output_report(struct dualsense *ds,
 
 static inline void dualsense_schedule_work(struct dualsense *ds)
 {
-	guard(spinlock_irqsave)(&ds->base.lock);
-	if (ds->output_worker_initialized)
-		schedule_work(&ds->output_worker);
+	/* Using scoped_guard() instead of guard() to make sparse happy */
+	scoped_guard(spinlock_irqsave, &ds->base.lock)
+		if (ds->output_worker_initialized)
+			schedule_work(&ds->output_worker);
 }
 
 /*
@@ -2626,9 +2627,10 @@ static void dualshock4_remove(struct ps_device *ps_dev)
 
 static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
 {
-	guard(spinlock_irqsave)(&ds4->base.lock);
-	if (ds4->output_worker_initialized)
-		schedule_work(&ds4->output_worker);
+	/* Using scoped_guard() instead of guard() to make sparse happy */
+	scoped_guard(spinlock_irqsave, &ds4->base.lock)
+		if (ds4->output_worker_initialized)
+			schedule_work(&ds4->output_worker);
 }
 
 static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, u8 interval)

-- 
2.51.0


