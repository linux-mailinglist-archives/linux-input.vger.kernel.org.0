Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01219271D07
	for <lists+linux-input@lfdr.de>; Mon, 21 Sep 2020 10:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgIUIDq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Sep 2020 04:03:46 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:35244 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726475AbgIUICX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Sep 2020 04:02:23 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 466FE2FF4B7E5FC02B6C;
        Mon, 21 Sep 2020 16:02:20 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:11 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] Input: synaptics-rmi4 - simplify the return expression of rmi_driver_of_probe
Date:   Mon, 21 Sep 2020 16:24:35 +0800
Message-ID: <20200921082435.2591409-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
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
2.25.1

