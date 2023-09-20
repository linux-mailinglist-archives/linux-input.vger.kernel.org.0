Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665F27A825B
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbjITM7J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbjITM7C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:02 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2D31B1
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmy-0005TE-RC; Wed, 20 Sep 2023 14:58:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-007h0X-Jw; Wed, 20 Sep 2023 14:58:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmx-003IEj-AM; Wed, 20 Sep 2023 14:58:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Chen Jun <chenjun102@huawei.com>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 35/52] input: i8042 - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:58:12 +0200
Message-Id: <20230920125829.1478827-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qXFfmH9ohm6YIWOIaXdw0iN10nBymRGUnLiv5qGF5ZE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuxbvrUAESrEhv8qOI0YBUiNY6Lj9oaVZIADM fHVbA2jt6uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsWwAKCRCPgPtYfRL+ Tr9sB/4+SrkNcESUVlrcOfXjnsStfMPu+29rghBRx6L+L/tKzmOwQGucQ0HuT8wKtdNw4UMoo35 7KE5tE7DO+oPe0ovnjekEDOUyIkPVngOIwbs5npgxB2L4npd8hF3HhWkolB6GMCuiS9XogeYLhb e3CLt9foCqzJ4GlBRsW/EYZjVDlIDXaLhwqtnS87FmibF8ouUUfJ7jdvElH61UD6fzqS4CnuxYB MdH3ZGlE55mo0ixxdgtoaejuPW0uSPxQeAHIZk4q5n5U5RBELEQtxOodajnD6GKxTdwzsJbAfch ashdU1MKRPlAVgqcpOyYKUQwAvJRIwNnHMUHHccL8jdEDKfS
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
 drivers/input/serio/i8042.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 6dac7c1853a5..9fbb8d31575a 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -1584,13 +1584,11 @@ static int i8042_probe(struct platform_device *dev)
 	return error;
 }
 
-static int i8042_remove(struct platform_device *dev)
+static void i8042_remove(struct platform_device *dev)
 {
 	i8042_unregister_ports();
 	i8042_free_irqs();
 	i8042_controller_reset(false);
-
-	return 0;
 }
 
 static struct platform_driver i8042_driver = {
@@ -1601,7 +1599,7 @@ static struct platform_driver i8042_driver = {
 #endif
 	},
 	.probe		= i8042_probe,
-	.remove		= i8042_remove,
+	.remove_new	= i8042_remove,
 	.shutdown	= i8042_shutdown,
 };
 
-- 
2.40.1

