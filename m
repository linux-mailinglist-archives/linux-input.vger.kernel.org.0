Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357AE5BEA3F
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 17:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbiITPaS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 11:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiITPaQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 11:30:16 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639BE62A80
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 08:30:15 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MX53v0MDMzmVX8
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:26:19 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:30:13 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 23:30:12 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-input@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <yangyingliang@huawei.com>
Subject: [PATCH -next 1/5] Input: da7280 - Switch to use dev_err_probe() helper
Date:   Tue, 20 Sep 2022 23:36:52 +0800
Message-ID: <20220920153656.3486879-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
 drivers/input/misc/da7280.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index b08610d6e575..b1ca4fd94e9e 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -1166,12 +1166,9 @@ static int da7280_probe(struct i2c_client *client,
 	if (haptics->const_op_mode == DA7280_PWM_MODE) {
 		haptics->pwm_dev = devm_pwm_get(dev, NULL);
 		error = PTR_ERR_OR_ZERO(haptics->pwm_dev);
-		if (error) {
-			if (error != -EPROBE_DEFER)
-				dev_err(dev, "Unable to request PWM: %d\n",
-					error);
-			return error;
-		}
+		if (error)
+			return dev_err_probe(dev, error,
+					     "Unable to request PWM\n");
 
 		/* Sync up PWM state and ensure it is off. */
 		pwm_init_state(haptics->pwm_dev, &state);
-- 
2.25.1

