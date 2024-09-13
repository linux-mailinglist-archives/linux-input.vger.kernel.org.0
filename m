Return-Path: <linux-input+bounces-6489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A39779C9
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 09:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE36DB25CC4
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 07:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342AB1BC089;
	Fri, 13 Sep 2024 07:37:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116E77107;
	Fri, 13 Sep 2024 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726213049; cv=none; b=MmEM3KL3ay0LFUtK6OfiT1gUBHqVycQ83qLaV3Jqs1PWeLE7qk58HEiRpdJ3aP7WHmGxW9feqTkrMFttZF05QSN+tdWpWFfVdh6+7cgrYch0y85C993VSUjiOpe+lfX0ybdk6Rh2CszbwubnseXwW6Y+pjYw5rqrWe2cKT+B5uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726213049; c=relaxed/simple;
	bh=ygXM6bE7jasdjGQ6vo8Hfb3kcdQ8JlLfufUUYvobN1M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GT7Mc+Ngf9ath/kIHKbx2ZhZ+kL1XZbumEzgJRiXBml7RkYykRaCGeZRwnRDjmGWZi53qpYUN2l4QH4bdLxP6iNGcVc/ULDmy9Tu0VJ2g/2qhLVENOjj5g9q6/AvdHP/Kim66/ZQquuuq5yu/XamQlZxm+83C0P3EVpfZS4Q85E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X4mNW3b5gz20nsT;
	Fri, 13 Sep 2024 15:37:15 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 7E301140134;
	Fri, 13 Sep 2024 15:37:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 13 Sep
 2024 15:37:22 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <linux-input@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] hid: cp2112: Use irq_get_trigger_type() helper
Date: Fri, 13 Sep 2024 15:46:32 +0800
Message-ID: <20240913074632.3779321-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use irq_get_trigger_type() to replace irq_get_irq_data() and then
irqd_get_trigger_type(), if the irq data is NULL it will return 0.

No functional changed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/hid/hid-cp2112.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 20a0d1315d90..dae2b84a1490 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1094,7 +1094,6 @@ static void cp2112_gpio_poll_callback(struct work_struct *work)
 {
 	struct cp2112_device *dev = container_of(work, struct cp2112_device,
 						 gpio_poll_worker.work);
-	struct irq_data *d;
 	u8 gpio_mask;
 	u32 irq_type;
 	int irq, virq, ret;
@@ -1111,12 +1110,10 @@ static void cp2112_gpio_poll_callback(struct work_struct *work)
 		if (!irq)
 			continue;
 
-		d = irq_get_irq_data(irq);
-		if (!d)
+		irq_type = irq_get_trigger_type(irq);
+		if (!irq_type)
 			continue;
 
-		irq_type = irqd_get_trigger_type(d);
-
 		if (gpio_mask & BIT(virq)) {
 			/* Level High */
 
-- 
2.34.1


