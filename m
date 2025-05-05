Return-Path: <linux-input+bounces-12152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58EAAA762
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 02:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECBC37A487B
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 00:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB6339744;
	Mon,  5 May 2025 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9JjW+bJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A65233973F;
	Mon,  5 May 2025 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484627; cv=none; b=NVVOAj5dfQVrUx4ZUW0ziJqqLbfiY3XQ93TY8NIKUeRUqgSLoGSJofnOFajCswWagAsYW0SBWwTYIoz1ocAcffDdEkFDXxoWtt2vQDnA594/srM1UZ5XYmHxu747/M+6rhyo7vQl4iZsekolv7N++NbWMp7d2yQXlltzZwto02M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484627; c=relaxed/simple;
	bh=REwDMsG0gYftbnPiYH3na179/GzS77pzCJ82Mrmea/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WuqXSPBCgEszuefkh/dlB26u+sezaogoxjIR/cVd0SlcOaCOIMsQkvLs8D8N8JFG/WFHIDDYeXsz2T88ZhiEat7XqMcAsmZgisQdSH+1IV52B0JgptshaMhj94xJg6blaQ8MOHnE+WP8Or7bn2W6uoVx5olqgDFjqlU/uuwTz3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9JjW+bJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBB7C4CEEF;
	Mon,  5 May 2025 22:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484627;
	bh=REwDMsG0gYftbnPiYH3na179/GzS77pzCJ82Mrmea/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N9JjW+bJKuOlEHxBDUqTO/jRBb+LSiv0gFnfkVaahUE+Dxn9VjgNSuzlxjJ73I55C
	 Ht8WfHULb4Ofk6WlgW9v4ZIBRYEoabiX/wwo2lE5AI5iXNK7BnXwFjR4JJH//YTLOx
	 Pq7b+Xg8SxuhosV4fmEcipioSBD/XY7EtDx6UJIF5ku2n2jYSNnUK4Lw4LGkwiKP9c
	 XBWfSzptB/r/0q4FKPbsJ5bqHED2ueRe7Any9sXDWhy3C2InXw+vvdGuika5ukv6HB
	 +9INQGz8ebXmvi85ReSViJOMSI8zxMYrr91rWBMjFbvtphV7BqifaMkdDVcb0ZYKwe
	 ckAS6s80NeBdw==
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
Subject: [PATCH AUTOSEL 6.14 570/642] HID: usbkbd: Fix the bit shift number for LED_KANA
Date: Mon,  5 May 2025 18:13:06 -0400
Message-Id: <20250505221419.2672473-570-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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


