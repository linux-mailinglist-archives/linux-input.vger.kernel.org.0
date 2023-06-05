Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC69A722C4A
	for <lists+linux-input@lfdr.de>; Mon,  5 Jun 2023 18:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbjFEQPG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Jun 2023 12:15:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjFEQPF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Jun 2023 12:15:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810C694
        for <linux-input@vger.kernel.org>; Mon,  5 Jun 2023 09:15:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6CrG-0002xW-30; Mon, 05 Jun 2023 18:15:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6CrF-005JW0-BT; Mon, 05 Jun 2023 18:15:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6CrE-00BRk0-Ao; Mon, 05 Jun 2023 18:15:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] Input: tps65219-pwrbutton - Use regmap_set_bits()
Date:   Mon,  5 Jun 2023 18:14:58 +0200
Message-Id: <20230605161458.117361-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
References: <20230605161458.117361-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CcuJ7Vkcfsguse7bcy6sSyb07PU1bTkz5StQYJP+6Ds=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkfgoBs3Vl5ts91I9mwEVx0oxmp44Qe4BctCW/w EUzcvy4rreJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZH4KAQAKCRCPgPtYfRL+ Ts9lB/wIy2qbqMKcXUKP4ccwR8VEeJW9a6AKJjiInvyTh8ALbL5GdjASgVWxmvxca0QXEY044hk J3gSmGglXbPWvDXSAIpakPgbh3WejUbNOyhdQV9vXqgt8N0nuTTA6RKoIrxiiNZ/uJyHEeqDItR ej2zl+5MAPmETMMXwzyiW/e1L+8qOWvdamKd3ZGe40BZlzmFQLKoVwHL403q1SafNteAcPAYZYw GAB2QWigzkeTJc6ADxLl+k7kpOAeVJtVnpEGzdKsaV7MECLZuqZT34ICV5x9Ne07oxMNWPymxjR sfE2MRbMt1opKIg2UQmeG0bXn6Az85Q3of7LopTksGAw3ovE
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

regmap_set_bits() is equivalent to regmap_update_bits() if mask == val.
The probe function uses regmap_clear_bits() to enable irqs, so
symmetrically make use of regmap_set_bits() to disable them. There is no
semantic difference.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/misc/tps65219-pwrbutton.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/tps65219-pwrbutton.c b/drivers/input/misc/tps65219-pwrbutton.c
index b2d9e5d2bcfd..eeb9f2334ab4 100644
--- a/drivers/input/misc/tps65219-pwrbutton.c
+++ b/drivers/input/misc/tps65219-pwrbutton.c
@@ -123,9 +123,8 @@ static void tps65219_pb_remove(struct platform_device *pdev)
 	int ret;
 
 	/* Disable interrupt for the pushbutton */
-	ret = regmap_update_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
-				 TPS65219_REG_MASK_INT_FOR_PB_MASK,
-				 TPS65219_REG_MASK_INT_FOR_PB_MASK);
+	ret = regmap_set_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
+			      TPS65219_REG_MASK_INT_FOR_PB_MASK);
 	if (ret)
 		dev_warn(&pdev->dev, "Failed to disable irq (%pe)\n", ERR_PTR(ret));
 }
-- 
2.39.2

