Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7D2269C3B
	for <lists+linux-input@lfdr.de>; Tue, 15 Sep 2020 05:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgIODEC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 23:04:02 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41340 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726089AbgIODD7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 23:03:59 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 895B6863343CCAEE14C4;
        Tue, 15 Sep 2020 11:03:56 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 11:03:48 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] Input: da9034-ts - simplify the return expression of da9034_touch_probe()
Date:   Tue, 15 Sep 2020 11:26:26 +0800
Message-ID: <20200915032626.1772465-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/input/touchscreen/da9034-ts.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/da9034-ts.c b/drivers/input/touchscreen/da9034-ts.c
index 2943f6a58388..dfb2604381d2 100644
--- a/drivers/input/touchscreen/da9034-ts.c
+++ b/drivers/input/touchscreen/da9034-ts.c
@@ -298,7 +298,6 @@ static int da9034_touch_probe(struct platform_device *pdev)
 	struct da9034_touch_pdata *pdata = dev_get_platdata(&pdev->dev);
 	struct da9034_touch *touch;
 	struct input_dev *input_dev;
-	int error;
 
 	touch = devm_kzalloc(&pdev->dev, sizeof(struct da9034_touch),
 			     GFP_KERNEL);
@@ -344,11 +343,7 @@ static int da9034_touch_probe(struct platform_device *pdev)
 	touch->input_dev = input_dev;
 	input_set_drvdata(input_dev, touch);
 
-	error = input_register_device(input_dev);
-	if (error)
-		return error;
-
-	return 0;
+	return input_register_device(input_dev);
 }
 
 static struct platform_driver da9034_touch_driver = {
-- 
2.25.1

