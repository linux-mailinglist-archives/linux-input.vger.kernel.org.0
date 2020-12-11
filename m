Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923E62D723D
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 09:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437073AbgLKIvJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 03:51:09 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9869 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405501AbgLKIux (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 03:50:53 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CskxF0Pbrz7C84;
        Fri, 11 Dec 2020 16:49:37 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 16:50:04 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] input: misc: convert comma to semicolon
Date:   Fri, 11 Dec 2020 16:50:32 +0800
Message-ID: <20201211085032.2598-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/input/misc/ixp4xx-beeper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/ixp4xx-beeper.c b/drivers/input/misc/ixp4xx-beeper.c
index 794ecc9a552d..05018d0c97c7 100644
--- a/drivers/input/misc/ixp4xx-beeper.c
+++ b/drivers/input/misc/ixp4xx-beeper.c
@@ -97,7 +97,7 @@ static int ixp4xx_spkr_probe(struct platform_device *dev)
 
 	input_set_drvdata(input_dev, (void *) dev->id);
 
-	input_dev->name = "ixp4xx beeper",
+	input_dev->name = "ixp4xx beeper";
 	input_dev->phys = "ixp4xx/gpio";
 	input_dev->id.bustype = BUS_HOST;
 	input_dev->id.vendor  = 0x001f;
-- 
2.22.0

