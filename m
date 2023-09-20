Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A867A8243
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235840AbjITM67 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235913AbjITM6x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:53 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC20192
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-000598-CK; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmr-007gyq-Sv; Wed, 20 Sep 2023 14:58:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmr-003ID0-JT; Wed, 20 Sep 2023 14:58:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 09/52] input: sh_keysc - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:46 +0200
Message-Id: <20230920125829.1478827-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=si1Zq7PbnoLR8C6Vk0+95TiCWhbJeEvCoeN23l/FiEY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuw9Gq+iACu+iO2T67G9ZjDbm0nOKBtA6UIPz Z8VHSwBb6WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsPQAKCRCPgPtYfRL+ Tn8DCACe1tA8pYCcIMnY2OUxhWAMQd69+7DZt2j3KIAIOkPLdEmMRm5d00nBGg58/N6c65WKJ33 S2fHpaWRpQtk5lLeVHlUJlh5xqlDkYa0aGQzUHbFtMQwNuTg2eVrw/ryjsBFUFpvtmqG1VF50Eg ohs3aqFu/oYNf+42kA6UhQKQGyrbjrDg0EtEJr/V5YyVxJ5SuAAYN8vVVfAalIRoJjUzJ8lD4hl hLDmuEmUB5KwZeGluegnaFNgnzt1rDeuRV1AM2qUj6FiJfLl68+X1CY63h/9AtJQU1vzt9tLZAl F+DPc7rx37AwZVWE7A4N6IxmVIzB4qC2geHZUn1ebX1HKdAz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/keyboard/sh_keysc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/sh_keysc.c b/drivers/input/keyboard/sh_keysc.c
index 2c00320f739f..4ea4fd25c5d2 100644
--- a/drivers/input/keyboard/sh_keysc.c
+++ b/drivers/input/keyboard/sh_keysc.c
@@ -265,7 +265,7 @@ static int sh_keysc_probe(struct platform_device *pdev)
 	return error;
 }
 
-static int sh_keysc_remove(struct platform_device *pdev)
+static void sh_keysc_remove(struct platform_device *pdev)
 {
 	struct sh_keysc_priv *priv = platform_get_drvdata(pdev);
 
@@ -279,8 +279,6 @@ static int sh_keysc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	kfree(priv);
-
-	return 0;
 }
 
 static int sh_keysc_suspend(struct device *dev)
@@ -321,7 +319,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(sh_keysc_dev_pm_ops,
 
 static struct platform_driver sh_keysc_device_driver = {
 	.probe		= sh_keysc_probe,
-	.remove		= sh_keysc_remove,
+	.remove_new	= sh_keysc_remove,
 	.driver		= {
 		.name	= "sh_keysc",
 		.pm	= pm_sleep_ptr(&sh_keysc_dev_pm_ops),
-- 
2.40.1

