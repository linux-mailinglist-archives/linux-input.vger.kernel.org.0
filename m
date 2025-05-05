Return-Path: <linux-input+bounces-12157-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 789FEAAADE4
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 04:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 102B63A24E9
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 02:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC423110C1;
	Mon,  5 May 2025 23:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3naPKB3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF8D2FBAC9;
	Mon,  5 May 2025 23:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487442; cv=none; b=H80zjiDk/VHZiz/nsiJR/PsM3n1R/T1UhlGtU0NScf+f0vPdO/RJoRF16tPNsyJWKpPo3Sn04crSpGUumdLC112rVXDwPSiYXCZHX3mXxNL1MVcP8CJU9K5nZL03pZD6Kb2z+f6oHmMeaVXcXCZU2MGcOHgZjgURUXr+Gj64x0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487442; c=relaxed/simple;
	bh=+9wgd69+q8mhtvzBwj+DAjUx/KgGqujnSK1ZuuoQSbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oXYXyiBCEQzMhwgzOxANRrTs7/0wgS2VFUSIrJa9bW7Cr8z5sPsUcaISCGihP6wzY6Zt+Jnt8LmKcU17R877hfN8S/lodvr0GHfwF7zyV8HMimFG/ySHRiy6rGkLBPrrVbX8UepqAj6e1w1ArJK/fmGurZBqybmvGuHl4s/XUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3naPKB3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A25C4CEEE;
	Mon,  5 May 2025 23:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487442;
	bh=+9wgd69+q8mhtvzBwj+DAjUx/KgGqujnSK1ZuuoQSbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d3naPKB3fjNk2UroWbj+Ps7Nrvc3qg9607k9t4QDTOVEEaU9lxB2UIFGLl/VGboXo
	 B+rC028t9+CX3AJ+SVP1UUKYzBFRQwUsCDO4jSLUANIKL1Tf3PGnw1rUBjL6HB+sxX
	 9Ju7OfQSFcSLnbfJBeIqglwwsMkljmdMBtTdyr5ZhpiR82U8LSJy/lCFgQQYSyrIlj
	 looPVowhkPSENDEkQ6+gNmRAQBeun4J6kd/ULtQXniWjNJ4gbCGGdABp+AG7NtHlss
	 YPVcrm4rvjkuKA1XE26VW9FbUmDdS8F3RlJqCwZi2akNj8FiGHriwqEPDolMpEKb0E
	 VtGAFVskWXMXA==
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
Subject: [PATCH AUTOSEL 5.4 74/79] HID: usbkbd: Fix the bit shift number for LED_KANA
Date: Mon,  5 May 2025 19:21:46 -0400
Message-Id: <20250505232151.2698893-74-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505232151.2698893-1-sashal@kernel.org>
References: <20250505232151.2698893-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
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


