Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11A437A586
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 13:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbhEKLPZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 07:15:25 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2695 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhEKLPW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 07:15:22 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfZxK4Z9kz1BJbS
        for <linux-input@vger.kernel.org>; Tue, 11 May 2021 19:11:33 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 19:14:07 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] Input: olpc_apsp - Remove redundant error printing in olpc_apsp_probe()
Date:   Tue, 11 May 2021 19:13:21 +0800
Message-ID: <20210511111321.5209-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/input/serio/olpc_apsp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/serio/olpc_apsp.c b/drivers/input/serio/olpc_apsp.c
index 59de8d9b6710e34..ef0a16d4c8f46de 100644
--- a/drivers/input/serio/olpc_apsp.c
+++ b/drivers/input/serio/olpc_apsp.c
@@ -180,10 +180,8 @@ static int olpc_apsp_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(priv->base)) {
-		dev_err(&pdev->dev, "Failed to map WTM registers\n");
+	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
-	}
 
 	priv->irq = platform_get_irq(pdev, 0);
 	if (priv->irq < 0)
-- 
2.26.0.106.g9fadedd


