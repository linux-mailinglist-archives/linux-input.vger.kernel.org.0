Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6E930813F
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 23:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhA1WnM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 17:43:12 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:11469 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhA1Wmq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 17:42:46 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRb661KWbzjDdF;
        Fri, 29 Jan 2021 06:40:46 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.74) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 06:41:36 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <tglx@linutronix.de>, <dmitry.torokhov@gmail.com>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v4 10/12] Input: cyttsp - request_irq by IRQF_NO_AUTOEN and remove disable_irq
Date:   Fri, 29 Jan 2021 11:35:36 +1300
Message-ID: <20210128223538.20272-11-song.bao.hua@hisilicon.com>
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
 drivers/input/touchscreen/cyttsp_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 73c854f35f33..d5c933604168 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -652,7 +652,8 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 	}
 
 	error = devm_request_threaded_irq(dev, ts->irq, NULL, cyttsp_irq,
-					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
+					  IRQF_NO_AUTOEN,
 					  "cyttsp", ts);
 	if (error) {
 		dev_err(ts->dev, "failed to request IRQ %d, err: %d\n",
@@ -660,8 +661,6 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 		return ERR_PTR(error);
 	}
 
-	disable_irq(ts->irq);
-
 	cyttsp_hard_reset(ts);
 
 	error = cyttsp_power_on(ts);
-- 
2.25.1

