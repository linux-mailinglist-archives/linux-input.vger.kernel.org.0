Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA7B2E8644
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 05:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbhABEey (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Jan 2021 23:34:54 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9665 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbhABEey (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Jan 2021 23:34:54 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D78CM2gQ2z15f6p;
        Sat,  2 Jan 2021 12:33:19 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.201.27) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Sat, 2 Jan 2021 12:34:02 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>,
        Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH] Input: ar1021 - use IRQ_NOAUTOEN flags to replace disable_irq
Date:   Sat, 2 Jan 2021 17:29:02 +1300
Message-ID: <20210102042902.41664-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.201.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

disable_irq() after request_irq is unsafe as it gives a time gap which
irq can come before disable_irq(). IRQ_NOAUTOEN is the common way to
avoid enabling IRQ due to requesting IRQ.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/input/touchscreen/ar1021_i2c.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ar1021_i2c.c b/drivers/input/touchscreen/ar1021_i2c.c
index c0d5c2413356..c9e98ed4520e 100644
--- a/drivers/input/touchscreen/ar1021_i2c.c
+++ b/drivers/input/touchscreen/ar1021_i2c.c
@@ -123,6 +123,11 @@ static int ar1021_i2c_probe(struct i2c_client *client,
 
 	input_set_drvdata(input, ar1021);
 
+	/*
+	 * Don't enable the IRQ automatically, we'll enable it in
+	 * ar1021_i2c_open()
+	 */
+	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, ar1021_i2c_irq,
 					  IRQF_ONESHOT,
@@ -133,9 +138,6 @@ static int ar1021_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
-	/* Disable the IRQ, we'll enable it in ar1021_i2c_open() */
-	disable_irq(client->irq);
-
 	error = input_register_device(ar1021->input);
 	if (error) {
 		dev_err(&client->dev,
-- 
2.25.1

