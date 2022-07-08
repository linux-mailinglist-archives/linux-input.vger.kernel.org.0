Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D69656B2C5
	for <lists+linux-input@lfdr.de>; Fri,  8 Jul 2022 08:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237167AbiGHG1j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jul 2022 02:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237028AbiGHG1j (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jul 2022 02:27:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB2C4D4FC
        for <linux-input@vger.kernel.org>; Thu,  7 Jul 2022 23:27:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o9hSh-0005t4-6f; Fri, 08 Jul 2022 08:27:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o9hSW-0056Sx-W4; Fri, 08 Jul 2022 08:27:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o9hSZ-003jLd-Q7; Fri, 08 Jul 2022 08:27:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] Input: wm97xx: Make .remove() obviously always return 0
Date:   Fri,  8 Jul 2022 08:27:18 +0200
Message-Id: <20220708062718.240013-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077; h=from:subject; bh=bO8JFhgUTLYRHlTzYIQPw2IDBYXgeAjQjkNehBYhAn8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBix85CHgM7oqFEpQrxjR3jpHMGbivTtBR7Kyx0dRqa N0YC1aOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsfOQgAKCRDB/BR4rcrsCRh8B/ 4+DveUAZUajHxS+QICqUbz5ywQDYbD+evLbMFuaJ6U+cxR5oBzarU3a5V+OzoSzbWx1aLHMQs+2v9E KvH+naTs9EyXskYfW/5yLb5YuoQkK39qTwlv6ugorelfgE4xwGwIcYqzoFGLLAg2qsNIhYpNrJ8epQ Rnjeq88fyzU+betlThaFUsYDYgenj/s+VuqTQScv1gsRtCYeAUSYZqY32++nnjBxJerxkBouWZ05wo k0PVTv0O9J0+7NALeQpKIhf9lyv9R3uKzsPA79WG+FhGN8nfpuzpM9VKYLo1QbMvz1QNuKLKehq3Kd HsXH7aVskKuE7N6eWcjHogwM8JF6uK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

wm97xx_remove() returns zero unconditionally. To prepare changing the
prototype for platform remove callbacks to return void, make it explicit
that wm97xx_mfd_remove() always returns zero.

The prototype for wm97xx_remove cannot be changed, as it's also used as
a plain device remove callback.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/touchscreen/wm97xx-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 2757c7768ffe..f51ab5614532 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -758,7 +758,9 @@ static int wm97xx_mfd_probe(struct platform_device *pdev)
 
 static int wm97xx_mfd_remove(struct platform_device *pdev)
 {
-	return wm97xx_remove(&pdev->dev);
+	wm97xx_remove(&pdev->dev);
+
+	return 0;
 }
 
 static int __maybe_unused wm97xx_suspend(struct device *dev)

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

