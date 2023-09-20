Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40F77A8246
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236027AbjITM7B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235445AbjITM6z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:55 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16969F9
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-0005IQ-Lj; Wed, 20 Sep 2023 14:58:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmv-007gzs-8x; Wed, 20 Sep 2023 14:58:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-003IDz-W9; Wed, 20 Sep 2023 14:58:41 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 24/52] input: soc_button_array - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:01 +0200
Message-Id: <20230920125829.1478827-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YmjGKkTPHuYKN4wdZRhWUzLBi3NLKI6aYICnJ852VXo=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlSuN/6ppRGObw5apzKHxAcdSZn0/K3jvzTlR87Ff7rDe Nv33v3XyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBE5pxi/59dxFc/pZOn9fyJ lcWuxu3bU71e27Xt83370udMbJNn9aqJ+y7t0ReUko5bW8nK+Fq14RDrlgUT6zephipsE9yw/kP PZkaZQ9vDBOxTT3cdUzZe/KEhOFfhyjRj4f0Xvbs43MPWnVl2RfAg2yGrR0v0Trto7Hzjuq8uqE UnufN3wlcRz7xjchFW1cnidTPibqwNdFOfrlidyb9R7rv1xXVZWsJuh/TUasI0Jq4J5uf7orFou Xv+zbO77vCUOoedjFraW3o0rOue/MuljKceTMwOEdyq+HX614ccQnWpSobLNF2PGdXslz1t9VFi wyfvMMnXka68f6aeXtuxsaG29LqpEKOXsfR/g5DdSrwKAA==
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
 drivers/input/misc/soc_button_array.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index e79f5497948b..08bcee3d6bcc 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -411,7 +411,7 @@ static struct soc_button_info *soc_button_get_button_info(struct device *dev)
 	return button_info;
 }
 
-static int soc_button_remove(struct platform_device *pdev)
+static void soc_button_remove(struct platform_device *pdev)
 {
 	struct soc_button_data *priv = platform_get_drvdata(pdev);
 
@@ -420,8 +420,6 @@ static int soc_button_remove(struct platform_device *pdev)
 	for (i = 0; i < BUTTON_TYPES; i++)
 		if (priv->children[i])
 			platform_device_unregister(priv->children[i]);
-
-	return 0;
 }
 
 static int soc_button_probe(struct platform_device *pdev)
@@ -609,7 +607,7 @@ MODULE_DEVICE_TABLE(acpi, soc_button_acpi_match);
 
 static struct platform_driver soc_button_driver = {
 	.probe          = soc_button_probe,
-	.remove		= soc_button_remove,
+	.remove_new	= soc_button_remove,
 	.driver		= {
 		.name = KBUILD_MODNAME,
 		.acpi_match_table = ACPI_PTR(soc_button_acpi_match),
-- 
2.40.1

