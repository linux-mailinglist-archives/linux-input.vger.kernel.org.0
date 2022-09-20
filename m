Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283275BEA13
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 17:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiITPYE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 11:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiITPYC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 11:24:02 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2282965812
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 08:24:01 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MX4wT0xFVz14R0P
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:19:53 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:23:58 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 23:23:58 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-input@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>
Subject: [PATCH -next 3/4] Input: gpio_keys - Switch to use dev_err_probe() helper
Date:   Tue, 20 Sep 2022 23:30:54 +0800
Message-ID: <20220920153055.3465115-3-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920153055.3465115-1-yangyingliang@huawei.com>
References: <20220920153055.3465115-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/input/keyboard/gpio_keys.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index a5dc4ab87fa1..ac74e85006a8 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -530,10 +530,8 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 				 */
 				bdata->gpiod = NULL;
 			} else {
-				if (error != -EPROBE_DEFER)
-					dev_err(dev, "failed to get gpio: %d\n",
-						error);
-				return error;
+				return dev_err_probe(dev, error,
+						     "failed to get gpio\n");
 			}
 		}
 	} else if (gpio_is_valid(button->gpio)) {
-- 
2.25.1

