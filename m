Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281AD6BFD0F
	for <lists+linux-input@lfdr.de>; Sat, 18 Mar 2023 23:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjCRWvW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Mar 2023 18:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjCRWvW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Mar 2023 18:51:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F3E25E1C
        for <linux-input@vger.kernel.org>; Sat, 18 Mar 2023 15:51:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdfOO-0006G4-Ca; Sat, 18 Mar 2023 23:51:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdfOM-0055zl-9u; Sat, 18 Mar 2023 23:51:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdfOL-005yrv-J0; Sat, 18 Mar 2023 23:51:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] Input: iqs62x-keys - Suppress duplicated error message in .remove()
Date:   Sat, 18 Mar 2023 23:51:10 +0100
Message-Id: <20230318225110.261439-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ISSrIVWJqHIKiMrx5WuU5B3o8c+0rUo9ePR1EM1577g=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhQxh5gfuTYSl32PioX5ph97ZvnFdaZVWptdxQRmh8Rb6 02P1Kp0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRtzvY/2lzsy2VlbqWYfyP r77o9PTX31Wqfr2bJt4XtlnC64D2krS4eT61LV22yl/Yk2xmS1SzZjnmr953rDTH5txezjeZswM O3jimy6C4zSVjW/tv9sWSZ45fn+o14XhlQ7DYpXBf73du2xg0OT0v3dmVw3/Gt4HzjGXcC/vGFO XFsZIcy4wCF9l+XzR/Zd7cHmbzz/rZxx5vrn3xTvflhsz1Eh5qRSukO1XkeDNLu9zsHq904baa2 h8wUf2wL4effM7fN4vV3X9EZMREslW3XXH8Lj4v9ALzvFNxygH1ljWWvFfe/pjdVqu9o+mC5NWU CHYlmULn69WLw3b279OIOCafc8Qma6nqHnuv0JAN4fEA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If a platform driver's remove callback returns non-zero the driver core
emits an error message. In such a case however iqs62x_keys_remove()
already issued a (better) message. So return zero to suppress the
generic message.

This patch has no other side effects as platform_remove() ignores the
return value of .remove() after the warning.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/keyboard/iqs62x-keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
index db793a550c25..02ceebad7bda 100644
--- a/drivers/input/keyboard/iqs62x-keys.c
+++ b/drivers/input/keyboard/iqs62x-keys.c
@@ -320,7 +320,7 @@ static int iqs62x_keys_remove(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "Failed to unregister notifier: %d\n", ret);
 
-	return ret;
+	return 0;
 }
 
 static struct platform_driver iqs62x_keys_platform_driver = {

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

