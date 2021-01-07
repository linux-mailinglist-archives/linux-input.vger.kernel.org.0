Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEFE2EE911
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbhAGWph (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:45:37 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9981 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbhAGWph (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:45:37 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DBh9k3sg4zj3bs;
        Fri,  8 Jan 2021 06:44:10 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.201.115) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 06:44:46 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v3 05/12] Input: bu21029_ts - request_irq by IRQF_NO_AUTOEN and remove irq_set_status_flags
Date:   Fri, 8 Jan 2021 11:39:19 +1300
Message-ID: <20210107223926.35284-6-song.bao.hua@hisilicon.com>
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

