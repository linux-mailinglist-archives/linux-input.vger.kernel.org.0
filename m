Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4788B5BEA41
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 17:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbiITPaU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 11:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbiITPaR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 11:30:17 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F6C61D67
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 08:30:16 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MX55B6gXTzpTHd
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:27:26 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:30:14 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 20 Sep
 2022 23:30:14 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-input@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <yangyingliang@huawei.com>
Subject: [PATCH -next 4/5] Input: pwm-vibra - Switch to use dev_err_probe() helper
Date:   Tue, 20 Sep 2022 23:36:55 +0800
Message-ID: <20220920153656.3486879-4-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920153656.3486879-1-yangyingliang@huawei.com>
References: <20220920153656.3486879-1-yangyingliang@huawei.com>
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
 drivers/input/misc/pwm-vibra.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
index 81e777a04b88..fe6074e6fe68 100644
--- a/drivers/input/misc/pwm-vibra.c
+++ b/drivers/input/misc/pwm-vibra.c
@@ -135,21 +135,15 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
 
 	vibrator->vcc = devm_regulator_get(&pdev->dev, "vcc");
 	err = PTR_ERR_OR_ZERO(vibrator->vcc);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request regulator: %d",
-				err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "Failed to request regulator\n");
 
 	vibrator->pwm = devm_pwm_get(&pdev->dev, "enable");
 	err = PTR_ERR_OR_ZERO(vibrator->pwm);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to request main pwm: %d",
-				err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "Failed to request main pwm\n");
 
 	INIT_WORK(&vibrator->play_work, pwm_vibrator_play_work);
 
-- 
2.25.1

