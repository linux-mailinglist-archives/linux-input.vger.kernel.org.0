Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87ED308138
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 23:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhA1Wmq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 17:42:46 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11215 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhA1WmR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 17:42:17 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DRb5G2Bv4zlCG2;
        Fri, 29 Jan 2021 06:40:02 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.74) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 06:41:24 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <tglx@linutronix.de>, <dmitry.torokhov@gmail.com>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v4 05/12] Input: bu21029_ts - request_irq by IRQF_NO_AUTOEN and remove irq_set_status_flags
Date:   Fri, 29 Jan 2021 11:35:31 +1300
Message-ID: <20210128223538.20272-6-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20210128223538.20272-1-song.bao.hua@hisilicon.com>
References: <20210128223538.20272-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.203.74]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Right now, irq core supports requesting irq with IRQF_NO_AUTOEN, this means
the driver doesn't need to call irq_set_status_flags any more.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/input/touchscreen/bu21029_ts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 341925edb8e6..392950aa7856 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -401,10 +401,10 @@ static int bu21029_probe(struct i2c_client *client,
 
 	input_set_drvdata(in_dev, bu21029);
 
-	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, bu21029_touch_soft_irq,
-					  IRQF_ONESHOT, DRIVER_NAME, bu21029);
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  DRIVER_NAME, bu21029);
 	if (error) {
 		dev_err(&client->dev,
 			"unable to request touch irq: %d\n", error);
-- 
2.25.1

