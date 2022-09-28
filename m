Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85535EDE90
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 16:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbiI1OPt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 10:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234283AbiI1OPr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 10:15:47 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E198160688
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 07:15:44 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mcz1B2qhtzHtf7;
        Wed, 28 Sep 2022 22:10:54 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 22:15:41 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <eajames@linux.ibm.com>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <liwei391@huawei.com>,
        <zengheng4@huawei.com>
Subject: [PATCH -next] misc: ibm-panel: add missing MODULE_DEVICE_TABLE
Date:   Wed, 28 Sep 2022 22:31:33 +0800
Message-ID: <20220928143133.1809491-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition
which generates correct modalias for automatic loading
of this driver when it is built as an external module.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/input/misc/ibm-panel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-panel.c
index 094bcdb568f1..a8fba0054719 100644
--- a/drivers/input/misc/ibm-panel.c
+++ b/drivers/input/misc/ibm-panel.c
@@ -183,6 +183,7 @@ static const struct of_device_id ibm_panel_match[] = {
 	{ .compatible = "ibm,op-panel" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, ibm_panel_match);
 
 static struct i2c_driver ibm_panel_driver = {
 	.driver = {
-- 
2.25.1

