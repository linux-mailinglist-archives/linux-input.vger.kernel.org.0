Return-Path: <linux-input+bounces-12159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC29AAB69F
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 07:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6EC83A26F9
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 05:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129C236A97D;
	Tue,  6 May 2025 00:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ep9NsH4f"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F3A2D7AE1;
	Mon,  5 May 2025 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485726; cv=none; b=YXGtvadLoUd/UvNvxxJktTExp4mnidN9sA4IViwXMYzxTtgG8M4qGbOrEwnFOifHtF7xKwjK56ysXj1Bbc5mVb+AQ1X3P28p+pL35D9ijQ2w4aklwFkHG87utceQooJR+S3dVIOV545nPDI0xBNTP304H86hfn1hOJsxfw8x6qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485726; c=relaxed/simple;
	bh=REwDMsG0gYftbnPiYH3na179/GzS77pzCJ82Mrmea/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O+KOA9MIaIx0Eb32bC9IpqmLRBdJOj1+2EZRM9SCYtdm7rbfirQFr3fYMqNcnNwlhP5o3kpO45aHu3S31UfpEBWQOp/Pa6jIWlj1mIX9xUGMOifHvwqwMyaOxVBJA46+bYKpUDqY3TPiwWgT7rpYqq/Ps12ZsT1YO2n4ncoc0K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ep9NsH4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F4DC4CEEF;
	Mon,  5 May 2025 22:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485725;
	bh=REwDMsG0gYftbnPiYH3na179/GzS77pzCJ82Mrmea/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ep9NsH4feZI811iIcbezodjEhvQfjCsc5ZON3y4gK3RRnZx3+yW0D/9UdzNleWTN5
	 h2MsuFxCW7FBw4+MKWtaA8USNzo1ERDocWLqKRgZtO3QzFYRcCsFb8baj83s1qwupT
	 U8MzZZQ0mMOjUMytl/lF8hEvOeLOc5yj2lFpxShVaOecqBrkJ5ebtRPFeF1oufUofl
	 tEgPKx6i0bLpvwtgI1lLzVsFmLojpiMNLctVPoLLTJTRRXLB2ajPFbQYF9oggMzfQk
	 1jq1m+//xDv6in6APRcyFncYyVqa9UFzvzdxxlr7+6Hab3gCnMrNiJEAbOTfd5Wehy
	 saOGb80+zPKVg==
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
Subject: [PATCH AUTOSEL 6.12 446/486] HID: usbkbd: Fix the bit shift number for LED_KANA
Date: Mon,  5 May 2025 18:38:42 -0400
Message-Id: <20250505223922.2682012-446-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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


