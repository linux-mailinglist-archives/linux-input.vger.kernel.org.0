Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F037A824D
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235913AbjITM7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235976AbjITM6z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:55 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FE7F5
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-0005Fz-Md; Wed, 20 Sep 2023 14:58:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-007gzX-8b; Wed, 20 Sep 2023 14:58:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmt-003IDe-VZ; Wed, 20 Sep 2023 14:58:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 19/52] input: palmas-pwrbutton - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:56 +0200
Message-Id: <20230920125829.1478827-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NqJTNFOp0K7HQWAnzO99fRjaKvsa4IOFa8o1Oimtf88=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxJr88rVmxYDbW5WeN+VAg9cOf7Npf3jOILe 77XgC3lg6mJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsSQAKCRCPgPtYfRL+ TrF2B/irNn/cnw8ow8yjGclg6bqYeJ3xTwp8JG0g5OSOWQD68B/+QfgsfOZTgS/Ij0iQPjX0Cqk SSVRCgjrFJqdEdbdqqrkwL11Jw8chBMYUnch/m9cDCJDTEUr5eZyVotuefac+r64MiZ4XdL3CUf q4S1SS2RaW8CcVh4Wi1/urCRp/6CK1jMI/At1eslJezUuz9nc4QkUTAHr8ML8Z8pUIrnSWQXRwY X9MHdjFGJTGftHxi+6vfNmu1MEnU2uyeiKNUKVpus47Sq/x6MKbEQsuuXbMF8TS8WR06CutECBK CJRQkiNKmxzVJ0Dq8v01OeMnGVGJe27EPMNH5TlcjdJvKyU=
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
 drivers/input/misc/palmas-pwrbutton.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/palmas-pwrbutton.c b/drivers/input/misc/palmas-pwrbutton.c
index 7e361727b0d9..06d5972e8e84 100644
--- a/drivers/input/misc/palmas-pwrbutton.c
+++ b/drivers/input/misc/palmas-pwrbutton.c
@@ -245,7 +245,7 @@ static int palmas_pwron_probe(struct platform_device *pdev)
  *
  * Return: 0
  */
-static int palmas_pwron_remove(struct platform_device *pdev)
+static void palmas_pwron_remove(struct platform_device *pdev)
 {
 	struct palmas_pwron *pwron = platform_get_drvdata(pdev);
 
@@ -254,8 +254,6 @@ static int palmas_pwron_remove(struct platform_device *pdev)
 
 	input_unregister_device(pwron->input_dev);
 	kfree(pwron);
-
-	return 0;
 }
 
 /**
@@ -312,7 +310,7 @@ MODULE_DEVICE_TABLE(of, of_palmas_pwr_match);
 
 static struct platform_driver palmas_pwron_driver = {
 	.probe	= palmas_pwron_probe,
-	.remove	= palmas_pwron_remove,
+	.remove_new = palmas_pwron_remove,
 	.driver	= {
 		.name	= "palmas_pwrbutton",
 		.of_match_table = of_match_ptr(of_palmas_pwr_match),
-- 
2.40.1

