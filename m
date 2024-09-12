Return-Path: <linux-input+bounces-6435-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D56975FA0
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 05:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD582849C7
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 03:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FC078B4E;
	Thu, 12 Sep 2024 03:21:10 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671D57581A
	for <linux-input@vger.kernel.org>; Thu, 12 Sep 2024 03:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726111270; cv=none; b=d70cwPma27EJSNKrNly+lgmJeEMd9pG35tPNFHJ4xgOLMj2J4ZXjsSQNYgV7fljE7sqsf2rs3xHNxJO+p9UPqrwR+IAk0U1Akl9q097ac2XVI5/5gcXet+hxCSdsQPVxAHPFdQQWHXTHdo7x5kNbGOTDEjr0oNUwteXwjBMWw1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726111270; c=relaxed/simple;
	bh=T7CR8S4Gdu3BnPyWkXpX1ML8wZ8BhkLHAr1nbl/T13U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aWjwwdlVv1Y8TRSfK9kYgN3BwEPAHai3qe5mZgCKnHoLvKIfUbTdXFUEPyCYBaTJ//AB4WS2Qt/q7YvjfXT731zS7vPiYli9apV06C2yYS9s8NlXoKRVatZNmfAlEnAY0l/s5HzMjPK5NHSvqrceX8s5bcK29TYbptJSEE9uq/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X42k50MNnzyRKB;
	Thu, 12 Sep 2024 11:19:57 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id CEE861400E3;
	Thu, 12 Sep 2024 11:21:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Sep
 2024 11:21:04 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <dmitry.torokhov@gmail.com>, <erick.archer@outlook.com>,
	<u.kleine-koenig@pengutronix.de>, <danilokrummrich@dk-develop.de>,
	<linus.walleij@linaro.org>, <robh@kernel.org>, <linux-input@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] Input: ps2-gpio - Use IRQF_NO_AUTOEN flag in request_irq()
Date: Thu, 12 Sep 2024 11:30:13 +0800
Message-ID: <20240912033013.2610949-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable when request IRQ.

Fixes: 9ee0a0558819 ("Input: PS/2 gpio bit banging driver for serio bus")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/input/serio/ps2-gpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index 0c8b390b8b4f..3a431395c464 100644
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -429,16 +429,14 @@ static int ps2_gpio_probe(struct platform_device *pdev)
 	}
 
 	error = devm_request_irq(dev, drvdata->irq, ps2_gpio_irq,
-				 IRQF_NO_THREAD, DRIVER_NAME, drvdata);
+				 IRQF_NO_THREAD | IRQF_NO_AUTOEN, DRIVER_NAME,
+				 drvdata);
 	if (error) {
 		dev_err(dev, "failed to request irq %d: %d\n",
 			drvdata->irq, error);
 		goto err_free_serio;
 	}
 
-	/* Keep irq disabled until serio->open is called. */
-	disable_irq(drvdata->irq);
-
 	serio->id.type = SERIO_8042;
 	serio->open = ps2_gpio_open;
 	serio->close = ps2_gpio_close;
-- 
2.34.1


