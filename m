Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2C030813D
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 23:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhA1WnK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 17:43:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11214 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbhA1WmR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 17:42:17 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DRb5G1xmtzlCDW;
        Fri, 29 Jan 2021 06:40:02 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.74) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 06:41:26 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <tglx@linutronix.de>, <dmitry.torokhov@gmail.com>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v4 06/12] Input: stmfts - request_irq by IRQF_NO_AUTOEN and remove irq_set_status_flags
Date:   Fri, 29 Jan 2021 11:35:32 +1300
Message-ID: <20210128223538.20272-7-song.bao.hua@hisilicon.com>
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
 drivers/input/touchscreen/stmfts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 9a64e1dbc04a..bc11203c9cf7 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -691,10 +691,9 @@ static int stmfts_probe(struct i2c_client *client,
 	 * interrupts. To be on the safe side it's better to not enable
 	 * the interrupts during their request.
 	 */
-	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	err = devm_request_threaded_irq(&client->dev, client->irq,
 					NULL, stmfts_irq_handler,
-					IRQF_ONESHOT,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					"stmfts_irq", sdata);
 	if (err)
 		return err;
-- 
2.25.1

