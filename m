Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B24ED76962C
	for <lists+linux-input@lfdr.de>; Mon, 31 Jul 2023 14:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbjGaMYb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jul 2023 08:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbjGaMYV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jul 2023 08:24:21 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E7B1724
        for <linux-input@vger.kernel.org>; Mon, 31 Jul 2023 05:23:59 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RDy4n58tCzLnyw;
        Mon, 31 Jul 2023 20:20:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 31 Jul
 2023 20:23:21 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <wsa+renesas@sang-engineering.com>,
        <christophe.jaillet@wanadoo.fr>, <linux-input@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] input: serio: fix the return value handle for platform_get_irq()
Date:   Mon, 31 Jul 2023 20:22:46 +0800
Message-ID: <20230731122246.2028651-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is no possible for platform_get_irq() to return 0,
and the return value of platform_get_irq() is more sensible
to show the error reason.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/input/serio/rpckbd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/rpckbd.c b/drivers/input/serio/rpckbd.c
index ce420eb1f51b..e8a9709f32eb 100644
--- a/drivers/input/serio/rpckbd.c
+++ b/drivers/input/serio/rpckbd.c
@@ -101,12 +101,12 @@ static int rpckbd_probe(struct platform_device *dev)
 	int tx_irq, rx_irq;
 
 	rx_irq = platform_get_irq(dev, 0);
-	if (rx_irq <= 0)
-		return rx_irq < 0 ? rx_irq : -ENXIO;
+	if (rx_irq < 0)
+		return rx_irq;
 
 	tx_irq = platform_get_irq(dev, 1);
-	if (tx_irq <= 0)
-		return tx_irq < 0 ? tx_irq : -ENXIO;
+	if (tx_irq < 0)
+		return tx_irq;
 
 	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	rpckbd = kzalloc(sizeof(*rpckbd), GFP_KERNEL);
-- 
2.34.1

