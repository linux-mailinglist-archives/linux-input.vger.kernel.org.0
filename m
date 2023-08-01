Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4BC76B3D1
	for <lists+linux-input@lfdr.de>; Tue,  1 Aug 2023 13:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbjHALvi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Aug 2023 07:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjHALvh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Aug 2023 07:51:37 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AC510E
        for <linux-input@vger.kernel.org>; Tue,  1 Aug 2023 04:51:36 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RFYMZ1KrQz1GDHv;
        Tue,  1 Aug 2023 19:50:34 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 19:51:34 +0800
From:   Zhu Wang <wangzhu9@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <rafael@kernel.org>,
        <christophe.jaillet@wanadoo.fr>, <gregkh@linuxfoundation.org>,
        <linux-input@vger.kernel.org>
CC:     <wangzhu9@huawei.com>
Subject: [PATCH -next] Input: serio - fix possible memory leak while device_add() fails
Date:   Tue, 1 Aug 2023 19:51:05 +0800
Message-ID: <20230801115105.76690-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If device_add() returns error, the name allocated by dev_set_name() need
be freed. As comment of device_add() says, it should use put_device() to
release the reference in the error path. So fix this by calling
put_device, then the name can be freed in kobject_cleanp().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/input/serio/serio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
index 767fc9efb4a8..d3bb6ec91326 100644
--- a/drivers/input/serio/serio.c
+++ b/drivers/input/serio/serio.c
@@ -537,10 +537,12 @@ static void serio_add_port(struct serio *serio)
 		serio->start(serio);
 
 	error = device_add(&serio->dev);
-	if (error)
+	if (error) {
+		put_device(&serio->dev);
 		dev_err(&serio->dev,
 			"device_add() failed for %s (%s), error: %d\n",
 			serio->phys, serio->name, error);
+	}
 }
 
 /*
-- 
2.17.1

