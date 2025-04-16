Return-Path: <linux-input+bounces-11801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779AA8AE52
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 04:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C94D44071F
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 02:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C842139B1;
	Wed, 16 Apr 2025 02:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="gs96T9PA"
X-Original-To: linux-input@vger.kernel.org
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114BA2BAF4;
	Wed, 16 Apr 2025 02:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744772296; cv=none; b=oRHlcQPqNwfSt8nLT+/unTeVm5fwEZJpj+4rpMV2T6dZUAsNXYknJf0sOVNv3LBXPy/j8H2ePdmCcHuoPsBwHu7cFKGxLdeY0DnEaLaGTc3oy1VyC3Z7UKEnXQDAh4Mi00dqVfECfJc+pFPU/sKcb72AhhB1enES3KN2/9MxfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744772296; c=relaxed/simple;
	bh=d/6+sdskCrLsKwy62dtHiSyR9XRXAzvVqNbASfas5l0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hphO2SOZmeL8MRmYfgnYBCT3Sx/XKAOJK4yMbumtKM5oRshXG2od3mrSo9uPgdCTL+qB75LWllaM3nwI1ABXGOA6HnA2wxCYjE9a/8OtmqWgweGjU8Nar8WqGECasAboLX+xpGNG4vKIf1PS38n3XSYdC6gMybxpFXOSpnLHLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=gs96T9PA; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744772290; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=Xt9y/TXOKzJQAIbUnGUu3h8qY8Wn1nW44gkteQt3rNo=;
	b=gs96T9PA4D201PzV/JzZ22rpSnslRRZPxzqQg1i1TnaOMzSs7DlvpCl+ZeGrA8OgrZfJDrYkNIYPCCm0sgzYLM4oZ1vleghTcdab3iNZgvFk6TrQjGUHtOiX6nGAd5E9wtyqMhoWTl2BmWiYpChiuci2y3Sn91hSwICKX0WLCBs=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0WX74JhJ_1744772284 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Apr 2025 10:58:10 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] HID: hid-steam: Remove the unused variable connected
Date: Wed, 16 Apr 2025 10:58:03 +0800
Message-Id: <20250416025803.9078-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Variable connected is not effectively used, so delete it.

drivers/hid/hid-steam.c:1153:7: warning: variable ‘connected’ set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=20462
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hid/hid-steam.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index dfd9d22ed559..949d307c66a8 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -1150,11 +1150,9 @@ static void steam_client_ll_close(struct hid_device *hdev)
 	struct steam_device *steam = hdev->driver_data;
 
 	unsigned long flags;
-	bool connected;
 
 	spin_lock_irqsave(&steam->lock, flags);
 	steam->client_opened--;
-	connected = steam->connected && !steam->client_opened;
 	spin_unlock_irqrestore(&steam->lock, flags);
 
 	schedule_work(&steam->unregister_work);
-- 
2.32.0.3.g01195cf9f


