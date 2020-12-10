Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF392D5CAB
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 15:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389847AbgLJOAx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 09:00:53 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9506 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389850AbgLJOAq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 09:00:46 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CsFsD6BBnzhpvs;
        Thu, 10 Dec 2020 21:59:28 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 21:59:55 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] input/rmi4: simplify the return expression of rmi_driver_of_probe()
Date:   Thu, 10 Dec 2020 22:00:24 +0800
Message-ID: <20201210140024.1665-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Simplify the return expression.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/input/rmi4/rmi_driver.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 258d5fe3d395..eec5d926da25 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -991,14 +991,8 @@ static int rmi_driver_remove(struct device *dev)
 static int rmi_driver_of_probe(struct device *dev,
 				struct rmi_device_platform_data *pdata)
 {
-	int retval;
-
-	retval = rmi_of_property_read_u32(dev, &pdata->reset_delay_ms,
+	return rmi_of_property_read_u32(dev, &pdata->reset_delay_ms,
 					"syna,reset-delay-ms", 1);
-	if (retval)
-		return retval;
-
-	return 0;
 }
 #else
 static inline int rmi_driver_of_probe(struct device *dev,
-- 
2.22.0

