Return-Path: <linux-input+bounces-7640-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D29AC6B6
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 11:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4678A28574D
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA6218E34A;
	Wed, 23 Oct 2024 09:34:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612014F9ED;
	Wed, 23 Oct 2024 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729676092; cv=none; b=PxIW8d60uKf9d8AAvSJdcUSiCDsS/uByKiwyBzFj6RW4K42dLQc8JFO8pygHRnlrN8kRKIrgGgUfTNq7bqDU2TExrVRW8WO/8gGOjcttZ69fKbQ9d0swS5g9NTI5I3KUxvXz8dApA1nit8DwC8QcIMwbjzvKPE98BHL3lXpD8Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729676092; c=relaxed/simple;
	bh=t6B5b3AVVJ4QXRbI1MLQOW+02n+pMTKVviKx7HGfHvc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QnpzQdUVyb40U7k9ycsfgwBLbYHbKgGjNVX3z36zWKNwA15KvRhQZBcU29xbR1Biqfh9JtLRQOjOX9sJrpKKQ4+LoEUiKNdHRB9rf7oMU6f/4CuFZgqrTPP8n9EX6ipYq71vd7kfFWmABdXO+BV3yj27KGD7jbQUczBv0I6nXdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYP3K2R2Lz10N6K;
	Wed, 23 Oct 2024 17:32:45 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A1691401E0;
	Wed, 23 Oct 2024 17:34:47 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 23 Oct
 2024 17:34:46 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <raymondhackley@protonmail.com>, <dmitry.torokhov@gmail.com>,
	<markuss.broks@gmail.com>
CC: <linux-input@vger.kernel.org>, <bobo.shaobowang@huawei.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] input/touchscreen: imagis: Fix not used variable 'imagis_3038_data'
Date: Wed, 23 Oct 2024 17:48:31 +0800
Message-ID: <20241023094831.1680214-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)

Fix the following compilation warnings:
drivers/input/touchscreen/imagis.c:422:39: warning: ‘imagis_3038c_data’
defined but not used [-Wunused-const-variable=]
  422 | static const struct imagis_properties imagis_3038c_data = {
drivers/input/touchscreen/imagis.c:415:39: warning: ‘imagis_3038b_data’
defined but not used [-Wunused-const-variable=]
  415 | static const struct imagis_properties imagis_3038b_data = {
drivers/input/touchscreen/imagis.c:407:39: warning: ‘imagis_3038_data’
defined but not used [-Wunused-const-variable=]
  407 | static const struct imagis_properties imagis_3038_data = {
drivers/input/touchscreen/imagis.c:398:39: warning: ‘imagis_3032c_data’
defined but not used [-Wunused-const-variable=]
  398 | static const struct imagis_properties imagis_3032c_data = {

Only define the variables 'imagis_303*_data' when the CONFIG_OF
is enabled.

Fixes: 1e48ee99f603 ("Input: imagis - add supports for Imagis IST3038")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/input/touchscreen/imagis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen/imagis.c
index aeabf8d057de..abeae9102323 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -395,6 +395,7 @@ static int imagis_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(imagis_pm_ops, imagis_suspend, imagis_resume);
 
+#ifdef CONFIG_OF
 static const struct imagis_properties imagis_3032c_data = {
 	.interrupt_msg_cmd = IST3038C_REG_INTR_MESSAGE,
 	.touch_coord_cmd = IST3038C_REG_TOUCH_COORD,
@@ -427,7 +428,6 @@ static const struct imagis_properties imagis_3038c_data = {
 	.protocol_b = true,
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id imagis_of_match[] = {
 	{ .compatible = "imagis,ist3032c", .data = &imagis_3032c_data },
 	{ .compatible = "imagis,ist3038", .data = &imagis_3038_data },
-- 
2.25.1


