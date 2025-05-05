Return-Path: <linux-input+bounces-12154-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED2FAAAC7C
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 04:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3723E3B898F
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 02:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5926C39AC50;
	Mon,  5 May 2025 23:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kboh582Z"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A99C38AF3B;
	Mon,  5 May 2025 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486779; cv=none; b=a3YFFrSO52VKlPG8BWqZyZEzhe3DvpBgsGH6SXoiRH1PgF45OJ5ttvBl93n3IoommLynxwvrVMYkA+9BxLwMQD+vHoIKuVEty32ey7odV1YvzGkuIFT8wST/qJsoMgqTEC0w2XBJRJ4fKO5z7AMKj5UrChff9Jv+Jna1M1HTnWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486779; c=relaxed/simple;
	bh=REwDMsG0gYftbnPiYH3na179/GzS77pzCJ82Mrmea/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7z8EPtn2q3XyOl6PK+j2n85lBLxSOQORPBdokbZl0svWBsS4Ptj5YNDmltVWjWVXUFsyEH+rHQlLg5HpKMJz+iMKd5bIW/Dk9mhl7X2vCJvNvAZxPnjVJOxBQKYvz0XAT4EBcuTbRGQeo8XB8iXlipuPBvoDSunfFT3mh3AovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kboh582Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49697C4CEED;
	Mon,  5 May 2025 23:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486779;
	bh=REwDMsG0gYftbnPiYH3na179/GzS77pzCJ82Mrmea/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kboh582ZknFMEJVEYusYnT7mN5F39+61GKTtZ9PZUEwZXxj6hGLkiwIDoga/spmof
	 e2/e7bks15/ghzcDtt0G5meTLN1rmp59d5LnRbiF10Nk+dmv4vf444m+mfM4qumqvC
	 teMWnovLW4gcaK1AGnifSFCbu+tQPBP1ybOY8o9BoNbMl0+17Mh9hcUwPfKJHnKtdK
	 wP2emY0xYTYgn8LnhTikJa4H7CpAzC3t0p1sTOL23eOx+c/EnrnsscSowWLja+ScVk
	 C3ILmUS1oPP4V3EM8jsmKUXnuVPpZWERDq0JbutjmM3xzub9vIuNtwQElAtCJjV+1q
	 6MssGQFDip66Q==
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
Subject: [PATCH AUTOSEL 6.1 199/212] HID: usbkbd: Fix the bit shift number for LED_KANA
Date: Mon,  5 May 2025 19:06:11 -0400
Message-Id: <20250505230624.2692522-199-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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


