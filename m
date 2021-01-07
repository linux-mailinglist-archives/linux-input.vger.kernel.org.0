Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C882EE90E
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbhAGWpc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:45:32 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10560 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbhAGWpc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:45:32 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DBh965JXXzMFKB;
        Fri,  8 Jan 2021 06:43:38 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.201.115) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 06:44:41 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v3 03/12] Input: atmel_mxt_ts - request_irq by IRQF_NO_AUTOEN and remove disable_irq
Date:   Fri, 8 Jan 2021 11:39:17 +1300
Message-ID: <20210107223926.35284-4-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20210107223926.35284-1-song.bao.hua@hisilicon.com>
References: <20210107223926.35284-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.201.115]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 383a848eb601..3c837c7b24b3 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3156,15 +3156,14 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 
 	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, mxt_interrupt, IRQF_ONESHOT,
+					  NULL, mxt_interrupt,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					  client->name, data);
 	if (error) {
 		dev_err(&client->dev, "Failed to register interrupt\n");
 		return error;
 	}
 
-	disable_irq(client->irq);
-
 	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
 				      data->regulators);
 	if (error) {
-- 
2.25.1

