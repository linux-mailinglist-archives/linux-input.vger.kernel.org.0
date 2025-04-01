Return-Path: <linux-input+bounces-11454-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC22AA777ED
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 11:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6ECB3A4336
	for <lists+linux-input@lfdr.de>; Tue,  1 Apr 2025 09:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E601EF39F;
	Tue,  1 Apr 2025 09:41:00 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077BB1EEA37;
	Tue,  1 Apr 2025 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500460; cv=none; b=WoUyZC5f4NY1vPrubT7mSrL8J9sLxQMXJfXueTnOcMmEiOyLZdrIWkWxe2V3yxfkOeyji/1/STvVr+7EcDS54pWhmDZDg1CnNrqegiAnXP2xH4gwhA4qp9erMbfSlrRfwLIdXiV7//uPqYQ8RlejygwiaFhyVl8wLxH05LhvMgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500460; c=relaxed/simple;
	bh=i087SkHF27BriGkXHUcwbKMweUsGCYWe/jV4HNjTy8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwlIph7ax8E/5nWCMSJy6NG877fwbTL+Hc423ivuwmmtDtfMvVEZgicbha4hm2RbNjQA3Ussg6Co5livHC/czJSVe1S9hcxmpyJM4M/99XPA6u4/18/iVWdQE4LlerySe7tKEFpE9TO6pHPNxiUw20WQ0+AH/G7hRRqUvtoKqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.180])
	by gateway (Coremail) with SMTP id _____8AxDGultOtnJ5ytAA--.27339S3;
	Tue, 01 Apr 2025 17:40:54 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.180])
	by front1 (Coremail) with SMTP id qMiowMCxLcWjtOtn4Y9qAA--.53650S2;
	Tue, 01 Apr 2025 17:40:52 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v2] input: atkbd: do not init atkbd_reset variable to true on Loongson
Date: Tue,  1 Apr 2025 17:41:54 +0800
Message-ID: <20250401094154.11527-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxLcWjtOtn4Y9qAA--.53650S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1xWw13uw1Duw1DWw13WrX_yoWkJwb_GF
	y29ws7Wr4kKFnFgws8twn3XFy7ur4UZF1kuFyYgrySqw1rKrW5C34q9345J3s8GwsxJF1r
	Gw1UK3sYvrsIgosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

The keyboard will not be confused on Loongson platform, so do not need a
full reset of the keyboard.

Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
v2: Put "defined(__loongarch__)" on the same line with
    "defined(__hppa__)"

 drivers/input/keyboard/atkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index adf0f31199..3ff2fcf05a 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -37,7 +37,7 @@ static int atkbd_set = 2;
 module_param_named(set, atkbd_set, int, 0);
 MODULE_PARM_DESC(set, "Select keyboard code set (2 = default, 3 = PS/2 native)");
 
-#if defined(__i386__) || defined(__x86_64__) || defined(__hppa__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__hppa__) || defined(__loongarch__)
 static bool atkbd_reset;
 #else
 static bool atkbd_reset = true;

base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.45.2


