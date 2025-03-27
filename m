Return-Path: <linux-input+bounces-11305-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E7A728E5
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 03:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED47E174700
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 02:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E911A5BAF;
	Thu, 27 Mar 2025 02:58:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E358479;
	Thu, 27 Mar 2025 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743044326; cv=none; b=Ku+8d7WCDABEpoNRoG9ekTA49mwfQADzUF18YxSEbQOLoqrdjmxv6ZvE7A+JTtXbHSH0KYWHp8CwHMVicWK/n4L5OaF9r47s8QsU45O1y7FmX0SKuo+la1E2xq871GJbt4IW9SCaqAz8bekmYZkzRW+ttGETQZe+AviI7T/6fhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743044326; c=relaxed/simple;
	bh=2cmGfu/5nXx+612IUO3LnA3MfzSO+Spn+rPWHrmVV5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRu+2ynttwHGO6wfuoH6kVeS9uPRoypzmTXjAdlvkiQ9qs25ERDkhCzlPJejX/jTQK1gFWk+iKvEhX8p0uKSfDf8qi/+z6CsvLRMZzdOfnx3KFOhOozgTG16jf6WSXf2eoQIdLmoKdZr4Y9SGqMd/9Evc+LGJBTuADDoG3E9zyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.180])
	by gateway (Coremail) with SMTP id _____8DxvnPavuRnTcSnAA--.52120S3;
	Thu, 27 Mar 2025 10:58:34 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.180])
	by front1 (Coremail) with SMTP id qMiowMDxH+XZvuRnj3piAA--.31115S2;
	Thu, 27 Mar 2025 10:58:33 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH] input: atkbd: do not init atkbd_reset variable to true on Loongson
Date: Thu, 27 Mar 2025 10:59:42 +0800
Message-ID: <20250327025942.137057-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+XZvuRnj3piAA--.31115S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw1xWw13CFWrtF47tw1fAFc_yoWfAwb_Ga
	42vws7Wr4vkry2grs8twn3XFy7ur18ZF18ua4YgrySq348KrW5C34q9a45J3s8WrsxJF1r
	Jw4UK3sYyrsIgosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UAMa8UUUUU=

The keyboard will not be confused on Loongson platform, so do not need a
full reset of the keyboard.

Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 drivers/input/keyboard/atkbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index adf0f31199..f8ef3e929a 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -37,7 +37,8 @@ static int atkbd_set = 2;
 module_param_named(set, atkbd_set, int, 0);
 MODULE_PARM_DESC(set, "Select keyboard code set (2 = default, 3 = PS/2 native)");
 
-#if defined(__i386__) || defined(__x86_64__) || defined(__hppa__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__hppa__) ||	\
+	defined(__loongarch__)
 static bool atkbd_reset;
 #else
 static bool atkbd_reset = true;
-- 
2.45.2


