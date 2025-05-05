Return-Path: <linux-input+bounces-12160-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B7CAAB394
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 06:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EF1A1BA30BE
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 04:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B284824DFF1;
	Tue,  6 May 2025 00:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akO0J9CB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4F239E65;
	Mon,  5 May 2025 23:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486347; cv=none; b=NDw19Wrmw2LTshQHqogMdOSJ2MpUt7DIDioNl2NtZ1dq0Pp6XXqcJj3+iTdWgLtRT+zpJIIHz9DZGivmOqo3JcOmWl0g1oer8wOuycHH+5yDzQ4u5Amdjd4Xz8Gp4tAJUoLzdOndZwEWhT3xhnXVqmbsIdZmFdgrJNcdL18Nx1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486347; c=relaxed/simple;
	bh=REwDMsG0gYftbnPiYH3na179/GzS77pzCJ82Mrmea/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TQCGFGyX6M0MM/w/1QOv66ct7yx4dtwkOWgYxlcEdrVU2IFc3JqEu4Zay13qT0KVR/roOFSMJjn82O48NPDBDb/z3yz7U9ZqtRktfNxyj1BduEQS78MiP/YHcfa+gb+FnEGDfOgZD4SlcfF5aaHUu0/Lsob0t+2fkhB8BaC6mFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akO0J9CB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C68C4CEF1;
	Mon,  5 May 2025 23:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486346;
	bh=REwDMsG0gYftbnPiYH3na179/GzS77pzCJ82Mrmea/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=akO0J9CBlOTyigepToDwNIHqyrEmPKzAEqXD+W+gA2C5M1i/0z5eB0w0ZuAh/meol
	 rHh79rjf8xolKvx/4yeIJMpWLXardVob1iHEfALfH5cx3dZmQDDGqL1rH1kJ2zLCp2
	 lItP7UaPy3zxHxnn3gDrBfyqwv6tGnj7lJ/hfB2bvayY0zMm3gGYSlHMAZgY0KJx+r
	 sVyhD/pDHTgSKcCE/JR5+uxmeEmxxOQsZMQVYp0RpbTEXk4cmEg7JLgORueeiiSYWV
	 zsvzeY7tM6tHoSmYULS1nDgEU4nWDaWMPr/o/f8s1tROScTdjJ9yP7pai95kttEBd8
	 ahWHxSgv9V5eQ==
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
Subject: [PATCH AUTOSEL 6.6 272/294] HID: usbkbd: Fix the bit shift number for LED_KANA
Date: Mon,  5 May 2025 18:56:12 -0400
Message-Id: <20250505225634.2688578-272-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index c439ed2f16dbc..af6bc76dbf649 100644
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


