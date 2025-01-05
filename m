Return-Path: <linux-input+bounces-8888-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7BFA018D8
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 10:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67C9A188325A
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 09:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F90814658F;
	Sun,  5 Jan 2025 09:30:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D90145B1B;
	Sun,  5 Jan 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736069430; cv=none; b=fVeHen3VrMtLRVB2BY8paLqUTshDEpgzZUx1fvz1YLfTWGz6RWXLmWwbTdpR4MCnnF8axXvq2dFmfCfWE8Wdm0XbFhEMb3oWam4i2KsKAqZLSdkY9NgYXG691ztTUFChJyLC2il8mym/N7mePP3PxWsJYOGNJuTc2JRMU4xu4Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736069430; c=relaxed/simple;
	bh=TVMqGAG0XT5b8NvL4x4ucjp6Nq+VFv7MWyyogfn9l14=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rIQl6Q4n/2BIY61nITu6O469LfxTCO6n4R4avLYT2akm6OhQRBRmNHJbp1cwv1D7RFrwrYQQIsnZKqzway1dPLEqXDowtNJRr67pHo2MRkRVBVk1HmSgD376aosDOtl05tFkUzAkT959+49ERwonuRyqfvXIcrbHIi6bSWG8QPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowABHTiroT3pnSrFwBQ--.1141S2;
	Sun, 05 Jan 2025 17:24:59 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] Input: Fix error handling in input_register_device()
Date: Sun,  5 Jan 2025 17:24:48 +0800
Message-Id: <20250105092448.274424-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHTiroT3pnSrFwBQ--.1141S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWxCF1rXr47Ar43Zr4kCrg_yoWkXrgE9r
	y0v3s7Xw1jk3WrKrsIyrnIvrn7KrnFqrWruF1aqF95G3y5XrZ8u34DXr45Zr4jqanrCF1D
	J3WkGr48Zw4fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUvg4fUUUUU=
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

When device_add(&dev->dev) failed, calling put_device() to explicitly
release dev->dev. Otherwise, it could cause double free problem.

As comment of device_add() says, if device_add() succeeds, you should
call device_del() when you want to get rid of it. If device_add() has
not succeeded, use only put_device() to drop the reference count.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/input/input.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 7f0477e04ad2..a0a36aa90ecc 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2456,8 +2456,10 @@ int input_register_device(struct input_dev *dev)
 		input_dev_poller_finalize(dev->poller);
 
 	error = device_add(&dev->dev);
-	if (error)
+	if (error) {
+		put_device(&dev->dev);
 		goto err_devres_free;
+	}
 
 	path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
 	pr_info("%s as %s\n",
-- 
2.25.1


