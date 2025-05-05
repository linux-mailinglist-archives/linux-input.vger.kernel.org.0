Return-Path: <linux-input+bounces-12156-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F36AAB05A
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 05:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13D967B1E3F
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 03:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE043B6B99;
	Mon,  5 May 2025 23:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aloiVM0U"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36F3B7AA3;
	Mon,  5 May 2025 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487299; cv=none; b=GUC7/EQRaqAy3UhfI7SP2EileULbpNTZl/pv+rNCc9N+mQu5EK6J2hlYdPvntlPBfZOQKbnhniknMpOU9xWCqfruwzF+uU6EP05iisqwm/TVgn4sqH9cjSN2GzTmPbA4BfCz2dg+VpkI89HWcso/G+UakIRzwpkBOD7U7qOe+Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487299; c=relaxed/simple;
	bh=+9wgd69+q8mhtvzBwj+DAjUx/KgGqujnSK1ZuuoQSbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DOXrrnbyxijyCCKeQP48OkX6LSZ7eGOXFEdb/DpScSjgITn2gECXvMiKdsdh6IjtG+/B1UnnQo8UbzgANaIi5mL5GhfDk+NBglNACFv3XqbibUY9w6JJzef3VRSLEmP8s3FCv5mze2xsbkjqRZCQHxV2ONrb10dDGFsZAuu47Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aloiVM0U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D947C4CEEE;
	Mon,  5 May 2025 23:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487298;
	bh=+9wgd69+q8mhtvzBwj+DAjUx/KgGqujnSK1ZuuoQSbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aloiVM0UhCsLIQ/sDGeZohYl5A66KEACoibFv2voD1uRxsurRCqbs6c8kgG8C86mq
	 YBpfRWUfXDaERYkNg9hprXqlN1x8Jj2/2vNfDDcTjEy3vCJkG5976pkXroYMnqcNoY
	 58R+mqvWnPBdIzeHEYgp6WFvu+8LJidlrxrXRJQm9mgOIv72Qk8EFJZilx4GuBn8Pi
	 uyKs6GqayfjFKOb3tvDR0KXpJRf1j1rC84fa7gZlbZQpm+l70mPV+qESIgaLQ9wzv+
	 9vjA0J6R1FdRzo9lTl1Hiz8cSI/4lk1WRfFLB54p6k0zncFOPh3HZFzxIzMrpASYNZ
	 q95/x2VmnoGdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: junan <junan76@163.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 106/114] HID: usbkbd: Fix the bit shift number for LED_KANA
Date: Mon,  5 May 2025 19:18:09 -0400
Message-Id: <20250505231817.2697367-106-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: junan <junan76@163.com>

[ Upstream commit d73a4bfa2881a6859b384b75a414c33d4898b055 ]

Since "LED_KANA" was defined as "0x04", the shift number should be "4".

Signed-off-by: junan <junan76@163.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/usbkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index d5b7a696a68c5..50c5b204bf04c 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -160,7 +160,7 @@ static int usb_kbd_event(struct input_dev *dev, unsigned int type,
 		return -1;
 
 	spin_lock_irqsave(&kbd->leds_lock, flags);
-	kbd->newleds = (!!test_bit(LED_KANA,    dev->led) << 3) | (!!test_bit(LED_COMPOSE, dev->led) << 3) |
+	kbd->newleds = (!!test_bit(LED_KANA,    dev->led) << 4) | (!!test_bit(LED_COMPOSE, dev->led) << 3) |
 		       (!!test_bit(LED_SCROLLL, dev->led) << 2) | (!!test_bit(LED_CAPSL,   dev->led) << 1) |
 		       (!!test_bit(LED_NUML,    dev->led));
 
-- 
2.39.5


