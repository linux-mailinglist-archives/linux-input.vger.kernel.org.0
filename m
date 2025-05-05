Return-Path: <linux-input+bounces-12155-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5581FAAACF5
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 04:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C07189A561
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 02:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8943CFAC2;
	Mon,  5 May 2025 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvQzOmV2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4913A91AB;
	Mon,  5 May 2025 23:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487083; cv=none; b=kVfKneNJ+fb1q77rWbFx4zFpXi5MGOT6ETcv8/a4LqoqfjfXatZQOr5r4UOSXeSegV+mTMRfYoJt+NGMQZoZTyG3uqH1X1PsJadessiRy3SWXp7JmsPptzGuQHjDnHrcOzTyL4gKEl48knwlmZWlKnpBkfTh9/F0PMkdHdk1AGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487083; c=relaxed/simple;
	bh=Q5HBnP8a1kUf13Gm4zsvVjnT7DLr3v++THNIQz6dZRA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XthSHMB5VEI17OH8QdiPZRPo+u4nnUVtE3oLOqB1BnR0kBIv6FvoKvPBDORnjA0RBkOVytMuTqr20gfugovkDI+1CQPUWEC//nJ1+q8vQ/JLwTnc52SkXWec1hWokfdBtxSKbgUlVaDyrueT/J3CTb/ueJf4E3lajaS/E1DeNYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OvQzOmV2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EE8C4CEF1;
	Mon,  5 May 2025 23:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487082;
	bh=Q5HBnP8a1kUf13Gm4zsvVjnT7DLr3v++THNIQz6dZRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OvQzOmV2kafjMlIfmGOdCBEeA4SuHpBa8ZPnwb/ZS4DbdfVu4mrvaaX+4EiFeROmj
	 AAE0HaMJrD4zrMWyZlAZvOyr6CB/kgRjUTyJ500/g0E3RuqwlKYTQ9JMpzq2I9IMdL
	 JgfYz1me1EIb+WTTmNgipRoPKiN3QJ/Xyddlm0XnOw/aYHbqEjQKQeuE2WFn3t5Xi+
	 /qbaBgt+ic+2xZUtyt1OXan8ySeCinPiPuxZi5ir79D0ZUa3wu9+LtGRIUCPRUkZHj
	 NAMSUNuXdgWQDBcTGZGjznOPOG+wF1E8hat9q02U6GJdiWApd56bJyBHSLTZEaehoR
	 FrFh4Oolq45GQ==
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
Subject: [PATCH AUTOSEL 5.15 144/153] HID: usbkbd: Fix the bit shift number for LED_KANA
Date: Mon,  5 May 2025 19:13:11 -0400
Message-Id: <20250505231320.2695319-144-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index df02002066cef..1d94d246f8162 100644
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


