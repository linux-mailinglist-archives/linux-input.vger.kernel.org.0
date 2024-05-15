Return-Path: <linux-input+bounces-3711-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9088C5F65
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 05:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4DF41F21A42
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 03:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F94374FF;
	Wed, 15 May 2024 03:31:37 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC233998;
	Wed, 15 May 2024 03:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715743897; cv=none; b=gcc5QXNLKcdnritd6ZhiCn0C3BbfTuBHQKurQDR7l4Rqzrq7puf0gLlwWr/MVa+mbmUtzIQcVBz1mBQnhUSZC0TkUsnNOuzpbO5bpYY3vFkF5EXxNWABr+A5cGsAmxMhnuiPiIuyoWp1tw+p22UU5xOcsRHHMTKkoxzg9+2f0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715743897; c=relaxed/simple;
	bh=GJnhp0nIlkpaw2pXsx815X3mkKAsAEMrxdQGpI8uPIo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pDZOVJwNziNeRxaBuXswspkWaRMK+E/ZWTRHBmlz5yMRe04dmcwIrz/bGYQm3Qh+Uy/ndp9LLhGhZKYw5vOvdEPsXx3a/v09/WDFg9maZYpStzB6/107RXqunqAFS9+FcN2ZoNlATkDN9Na0N36TfyIkcLs5rMIvURxq9tDmRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAnLACLLERmZKZACw--.9681S2;
	Wed, 15 May 2024 11:31:23 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: rrameshbabu@nvidia.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] HID: nvidia-shield: Add missing check for input_ff_create_memless
Date: Wed, 15 May 2024 11:30:51 +0800
Message-Id: <20240515033051.2693390-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnLACLLERmZKZACw--.9681S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4rJryDJw4rtryfGF48WFg_yoW3Kwb_Kr
	W0ganxWr4UKwnakrnrJr4fAFyIvayYqFWfXr1vqr4ayry29wsxX3yjgrnxG34UCa4jqa4r
	Kw4rGr1fArsIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUnpnQUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add check for the return value of input_ff_create_memless() and return
the error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/hid/hid-nvidia-shield.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shield.c
index 58b15750dbb0..ff9078ad1961 100644
--- a/drivers/hid/hid-nvidia-shield.c
+++ b/drivers/hid/hid-nvidia-shield.c
@@ -283,7 +283,9 @@ static struct input_dev *shield_haptics_create(
 		return haptics;
 
 	input_set_capability(haptics, EV_FF, FF_RUMBLE);
-	input_ff_create_memless(haptics, NULL, play_effect);
+	ret = input_ff_create_memless(haptics, NULL, play_effect);
+	if (ret)
+		goto err;
 
 	ret = input_register_device(haptics);
 	if (ret)
-- 
2.25.1


