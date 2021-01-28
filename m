Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996FC308140
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 23:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbhA1Wn0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 17:43:26 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11617 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbhA1Wmr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 17:42:47 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DRb5k5zH0z1612F;
        Fri, 29 Jan 2021 06:40:26 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.74) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 06:41:31 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <tglx@linutronix.de>, <dmitry.torokhov@gmail.com>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v4 08/12] Input: mms114 - request_irq by IRQF_NO_AUTOEN and remove disable_irq
Date:   Fri, 29 Jan 2021 11:35:34 +1300
Message-ID: <20210128223538.20272-9-song.bao.hua@hisilicon.com>
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

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/input/touchscreen/mms114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 16557f51b09d..7043f57ea2dd 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -530,13 +530,13 @@ static int mms114_probe(struct i2c_client *client,
 	}
 
 	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, mms114_interrupt, IRQF_ONESHOT,
+					  NULL, mms114_interrupt,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					  dev_name(&client->dev), data);
 	if (error) {
 		dev_err(&client->dev, "Failed to register interrupt\n");
 		return error;
 	}
-	disable_irq(client->irq);
 
 	error = input_register_device(data->input_dev);
 	if (error) {
-- 
2.25.1

