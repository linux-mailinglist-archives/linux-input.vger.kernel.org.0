Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0CF77C90E
	for <lists+linux-input@lfdr.de>; Tue, 15 Aug 2023 10:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbjHOIBg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Aug 2023 04:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234984AbjHOIB2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Aug 2023 04:01:28 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BF910D8
        for <linux-input@vger.kernel.org>; Tue, 15 Aug 2023 01:01:27 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQ3Xf3pwWzNmQh
        for <linux-input@vger.kernel.org>; Tue, 15 Aug 2023 15:57:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 15 Aug
 2023 16:01:25 +0800
From:   Li Zetao <lizetao1@huawei.com>
To:     <dmitry.torokhov@gmail.com>
CC:     <lizetao1@huawei.com>, <linux-input@vger.kernel.org>
Subject: [PATCH -next] Input: walkera0701 - Use module_parport_driver macro to simplify the code
Date:   Tue, 15 Aug 2023 16:01:07 +0800
Message-ID: <20230815080107.1089401-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the module_parport_driver macro to simplify the code, which is the
same as declaring with module_init() and module_exit().

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/input/joystick/walkera0701.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/input/joystick/walkera0701.c b/drivers/input/joystick/walkera0701.c
index 56abc8c6c763..27d95d6cf56e 100644
--- a/drivers/input/joystick/walkera0701.c
+++ b/drivers/input/joystick/walkera0701.c
@@ -296,15 +296,4 @@ static struct parport_driver walkera0701_parport_driver = {
 	.devmodel = true,
 };
 
-static int __init walkera0701_init(void)
-{
-	return parport_register_driver(&walkera0701_parport_driver);
-}
-
-static void __exit walkera0701_exit(void)
-{
-	parport_unregister_driver(&walkera0701_parport_driver);
-}
-
-module_init(walkera0701_init);
-module_exit(walkera0701_exit);
+module_parport_driver(walkera0701_parport_driver);
-- 
2.34.1

