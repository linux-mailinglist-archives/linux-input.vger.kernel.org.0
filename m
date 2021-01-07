Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0756D2EE91D
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbhAGWpx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:45:53 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10040 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729140AbhAGWpw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:45:52 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DBh9p4rbQzj4tG;
        Fri,  8 Jan 2021 06:44:14 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.201.115) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 8 Jan 2021 06:45:01 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <dmitry.torokhov@gmail.com>, <tglx@linutronix.de>,
        <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v3 11/12] Input: tegra-kbc - request_irq by IRQF_NO_AUTOEN and remove disable_irq
Date:   Fri, 8 Jan 2021 11:39:25 +1300
Message-ID: <20210107223926.35284-12-song.bao.hua@hisilicon.com>
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
 drivers/input/keyboard/tegra-kbc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index 9671842a082a..570fe18c0ce9 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -694,14 +694,13 @@ static int tegra_kbc_probe(struct platform_device *pdev)
 	input_set_drvdata(kbc->idev, kbc);
 
 	err = devm_request_irq(&pdev->dev, kbc->irq, tegra_kbc_isr,
-			       IRQF_TRIGGER_HIGH, pdev->name, kbc);
+			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+			       pdev->name, kbc);
 	if (err) {
 		dev_err(&pdev->dev, "failed to request keyboard IRQ\n");
 		return err;
 	}
 
-	disable_irq(kbc->irq);
-
 	err = input_register_device(kbc->idev);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register input device\n");
-- 
2.25.1

