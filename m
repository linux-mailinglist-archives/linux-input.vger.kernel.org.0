Return-Path: <linux-input+bounces-7885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3E9BDB53
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 02:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FB43284949
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 01:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86541865E2;
	Wed,  6 Nov 2024 01:41:08 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3A7188CC6
	for <linux-input@vger.kernel.org>; Wed,  6 Nov 2024 01:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730857268; cv=none; b=OjKR/UEjB0VPbWH3Zr4TrG+BLjrnBif24l5RSErF89l0USCeopzepYgPKMZJlZ2FEiVpvJ4l8gqrOSIFFbj/4CadYXU8CG+ki4GSJsASPw0UW/QoOlZoZ/dldz/0g37GTgTwyg+boL69r+QYwfzFCawXsKrT5JAqducYRn7SaXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730857268; c=relaxed/simple;
	bh=RssdJ9Nk/wZJOgLaSDCmeZgKZJWuZDzeH+adDD68vmg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pG7sZF28BSWv9w2An8b628h3xQwJb0XNkmP16ltxORMteIOveZ17FPPJ89qbAKE+yBx1+5Qmr3NSMwoYjVNnJMmgZcv35YMvfIV0ixkzx6hm5ZH0uCqUrhrpfKtwrmB+F+KohmYdtkHTgk/bkAeCBASlDzrdm6NzwOXlVRBpl0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XjntN2LrSzpXxV;
	Wed,  6 Nov 2024 09:39:08 +0800 (CST)
Received: from dggpeml500024.china.huawei.com (unknown [7.185.36.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 88CFF140393;
	Wed,  6 Nov 2024 09:41:02 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 6 Nov
 2024 09:41:02 +0800
From: Yuan Can <yuancan@huawei.com>
To: <jogletre@opensource.cirrus.com>, <fred.treven@cirrus.com>,
	<ben.bright@cirrus.com>, <dmitry.torokhov@gmail.com>, <jeff@labundy.com>,
	<lee@kernel.org>, <patches@opensource.cirrus.com>,
	<linux-input@vger.kernel.org>
CC: <yuancan@huawei.com>
Subject: [PATCH] Input: cs40l50 - Fix wrong usage of INIT_WORK()
Date: Wed, 6 Nov 2024 09:35:49 +0800
Message-ID: <20241106013549.78142-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)

In cs40l50_add(), the work_data is a local variable and the work_data.work
should initialize with INIT_WORK_ONSTACK() instead of INIT_WORK().
Small error in cs40l50_erase() also fixed in this commit.

Fixes: c38fe1bb5d21 ("Input: cs40l50 - Add support for the CS40L50 haptic driver")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/input/misc/cs40l50-vibra.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index 03bdb7c26ec0..dce3b0ec8cf3 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -334,11 +334,12 @@ static int cs40l50_add(struct input_dev *dev, struct ff_effect *effect,
 	work_data.custom_len = effect->u.periodic.custom_len;
 	work_data.vib = vib;
 	work_data.effect = effect;
-	INIT_WORK(&work_data.work, cs40l50_add_worker);
+	INIT_WORK_ONSTACK(&work_data.work, cs40l50_add_worker);
 
 	/* Push to the workqueue to serialize with playbacks */
 	queue_work(vib->vib_wq, &work_data.work);
 	flush_work(&work_data.work);
+	destroy_work_on_stack(&work_data.work);
 
 	kfree(work_data.custom_data);
 
@@ -467,11 +468,12 @@ static int cs40l50_erase(struct input_dev *dev, int effect_id)
 	work_data.vib = vib;
 	work_data.effect = &dev->ff->effects[effect_id];
 
-	INIT_WORK(&work_data.work, cs40l50_erase_worker);
+	INIT_WORK_ONSTACK(&work_data.work, cs40l50_erase_worker);
 
 	/* Push to workqueue to serialize with playbacks */
 	queue_work(vib->vib_wq, &work_data.work);
 	flush_work(&work_data.work);
+	destroy_work_on_stack(&work_data.work);
 
 	return work_data.error;
 }
-- 
2.17.1


