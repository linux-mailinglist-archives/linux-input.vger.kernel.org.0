Return-Path: <linux-input+bounces-8297-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554E9DB180
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 03:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07A4E166516
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 02:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F4041C94;
	Thu, 28 Nov 2024 02:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DZpyTLxW"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2B117BA5;
	Thu, 28 Nov 2024 02:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732761388; cv=none; b=jRn25Zv/UIOhZ0ZcYxlc8DZ8OcpLJwiL/KUoJlWcEiz7HuULMqymIoiOFqx//eSw47JAytpQYP7LPT634oMCLXUXQQH3pkCOAFolv+XAWuSb2BvD4c9vGot5AwSR/47wPBZl5arb5zqCW298qhdwkyqrCtwfHkjHfaTQPTEGhRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732761388; c=relaxed/simple;
	bh=CDWtJA22XxWPUqAzFUdqwiKlqqD4AMX1Fb9SNu4k9ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mW969vBnRiDyMuupxCiLH01u9Ia5dcTsVr1N3SgaP2lEQ0jLTKaizXFh1NOR+Kpdrka/M+SoYmocsGGLxyVWfmybZJOFtUaO+46tcgIM0UWD82qdE4Phb8P4JZXHmUQd7WFkbb+BvFkySvhq17n7wiw3j0JEJWMNagjdLQskiAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DZpyTLxW; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=wYpyv
	YO0SbkKvoEUs6cEl+NAs+sVqb4AFuBouUZl2E0=; b=DZpyTLxWIcIJUbFEilHj4
	TJQKIC8mwGRtu209/GBmpPqUZiPoi7zTeZLvpE/VSJmGZ3cnIvp23eUCGzPlEs2f
	dA2f7VdOqMzMtUitzH/wss17biVqYPCpjPC76PrQdoHYMzjZ5Lf1o9e+zl+RDY5o
	p7cZBhWMNUZDjZ79+2wFCM=
Received: from ubuntu.. (unknown [171.213.136.25])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAnT98U10dnVPtOBg--.23721S2;
	Thu, 28 Nov 2024 10:36:05 +0800 (CST)
From: junan <junan76@163.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	junan <junan76@163.com>
Subject: [PATCH] HID: Fix the bit shift number for LED_KANA.
Date: Thu, 28 Nov 2024 10:35:18 +0800
Message-ID: <20241128023518.23372-1-junan76@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnT98U10dnVPtOBg--.23721S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryfCw4rKw48XFWkCrW7Jwb_yoWfCrbE9r
	45ur9Fkr15JFs3Wr4kXrWFyasayw1DXw4jqr4S9rW3W34akw45ZrWDXw1rZw1Y9w4rGF92
	yrZ8KFyfC3W3ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuGQh3UUUUU==
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbBFQylsWdHzbL07gAAsI

Since "LED_KANA" was defined as "0x04", the shift number should be "4".

Signed-off-by: junan <junan76@163.com>
---
 drivers/hid/usbhid/usbkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index c439ed2f16db..af6bc76dbf64 100644
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
2.43.0


