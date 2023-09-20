Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6DD7A8245
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbjITM7A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbjITM6y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:54 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACEA93
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-0005AE-Ey; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwms-007gyw-B0; Wed, 20 Sep 2023 14:58:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwms-003ID9-1W; Wed, 20 Sep 2023 14:58:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 11/52] input: stmpe-keypad - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:48 +0200
Message-Id: <20230920125829.1478827-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=hR+xfy5cJ6dkQ8th8pBh40l7WaCRGUsViNGV2Mb0oP4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxAplWQj00KiMIRQDHhuLJpAfB9dxrrVT5Qi HCoNwLauoKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsQAAKCRCPgPtYfRL+ TnyxCACOa3Ln2L7fKhv1S71rT7Xi+gXAvbFtnpOMbCCHO33VIBJTKMHwMAg01d2IAEYnHSeLhgZ v5GS6g1i6z0v/GXHNVv83e2G71qIuRIJTB9HVY1KgLdEIZXH1QjJ1TE6PYZYD1hkW2WL92SDV1C 5WXLA//ljN08rcqLK33uag/bJBr1Z/SVrCksTJTMXG+/Qd+Pal5tjn+uqxZxDhLDd3RGKUufXF8 mbn1RhjTuFzlxDWDrJrUjZbcLOXhCLKurRCNCxS4RT182h2cgVfiyAQb4721edfX42fiYcKbtAR tau1r4hnHajQbYlgdRIVlzkqEi9WHkG1d5qI1hSZzpTU79xm
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
 drivers/input/keyboard/stmpe-keypad.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/stmpe-keypad.c b/drivers/input/keyboard/stmpe-keypad.c
index 2c6c53290cc0..2013c0afd0c3 100644
--- a/drivers/input/keyboard/stmpe-keypad.c
+++ b/drivers/input/keyboard/stmpe-keypad.c
@@ -404,20 +404,18 @@ static int stmpe_keypad_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int stmpe_keypad_remove(struct platform_device *pdev)
+static void stmpe_keypad_remove(struct platform_device *pdev)
 {
 	struct stmpe_keypad *keypad = platform_get_drvdata(pdev);
 
 	stmpe_disable(keypad->stmpe, STMPE_BLOCK_KEYPAD);
-
-	return 0;
 }
 
 static struct platform_driver stmpe_keypad_driver = {
 	.driver.name	= "stmpe-keypad",
 	.driver.owner	= THIS_MODULE,
 	.probe		= stmpe_keypad_probe,
-	.remove		= stmpe_keypad_remove,
+	.remove_new	= stmpe_keypad_remove,
 };
 module_platform_driver(stmpe_keypad_driver);
 
-- 
2.40.1

