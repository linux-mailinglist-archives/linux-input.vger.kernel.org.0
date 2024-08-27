Return-Path: <linux-input+bounces-5901-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 645FD960AB5
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 14:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6DECB211AB
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 12:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C89019A29A;
	Tue, 27 Aug 2024 12:42:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41211448C7;
	Tue, 27 Aug 2024 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762550; cv=none; b=SbTW/NnGPxvzZRK7eKm2lPhYvpDAPmxflhlKn6K2eSPI7Xc0iftd4k58aqCLYGJGq9DqA7srH3mHPCTuXwvJqPq5wTyOhvzcl2XOaObyNkwbwK7CBrxFtNYSq6R/3v2FgfhFdDFu74YseLvpkcYj+3OXqDciVwrXMcT6RlZb1fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762550; c=relaxed/simple;
	bh=OYAq5Vgl8foLYGx1ASjn55CHE3VsBoyl3epNmL2KGp8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=emS9DnNgvRQnn04f78jLJMj9Dg7DUC2WY0osd1DGKqJx9w+QjixUtSzmd+6hY37SIwEUNwhrD9zB+/U2eqO77pXXXugsmkIoSBGfIy8YixOB58dPrAV9DO5y9tTisQ7U49ne0oGuhD72SY1gndmuDelj6nCVh681AslYZoJpHWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtRwW4FfvzpTr6;
	Tue, 27 Aug 2024 20:40:43 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 397BE1800D3;
	Tue, 27 Aug 2024 20:42:24 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 20:42:23 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <mkorpershoek@baylibre.com>, <dmitry.torokhov@gmail.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH -next] Input: mt6779-keypad - fix module autoloading
Date: Tue, 27 Aug 2024 12:34:11 +0000
Message-ID: <20240827123411.431388-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 19f69d167fbd..6d2557a9b9f5 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -260,6 +260,7 @@ static const struct of_device_id mt6779_keypad_of_match[] = {
 	{ .compatible = "mediatek,mt6873-keypad" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, mt6779_keypad_of_match);
 
 static struct platform_driver mt6779_keypad_pdrv = {
 	.probe = mt6779_keypad_pdrv_probe,
-- 
2.34.1


