Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B8F7756F5
	for <lists+linux-input@lfdr.de>; Wed,  9 Aug 2023 12:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjHIKRE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Aug 2023 06:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjHIKRD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Aug 2023 06:17:03 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923161FEA
        for <linux-input@vger.kernel.org>; Wed,  9 Aug 2023 03:17:02 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLQqv4yb1z9tqh;
        Wed,  9 Aug 2023 18:13:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 18:16:59 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-input@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
        <krzysztof.kozlowski@linaro.org>, <hdegoede@redhat.com>,
        <andy.shevchenko@gmail.com>, <frank.li@vivo.com>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] Input: bcm-keypad - Remove redundant of_match_ptr()
Date:   Wed, 9 Aug 2023 18:16:26 +0800
Message-ID: <20230809101626.2664651-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/input/keyboard/bcm-keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
index f3c3746acd4c..6b46f83a9edb 100644
--- a/drivers/input/keyboard/bcm-keypad.c
+++ b/drivers/input/keyboard/bcm-keypad.c
@@ -418,7 +418,7 @@ static struct platform_driver bcm_kp_device_driver = {
 	.probe		= bcm_kp_probe,
 	.driver		= {
 		.name	= "bcm-keypad",
-		.of_match_table = of_match_ptr(bcm_kp_of_match),
+		.of_match_table = bcm_kp_of_match,
 	}
 };
 
-- 
2.34.1

