Return-Path: <linux-input+bounces-371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B4800C4D
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 14:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353D21C20E19
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 13:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823F82D637;
	Fri,  1 Dec 2023 13:38:00 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9274193
	for <linux-input@vger.kernel.org>; Fri,  1 Dec 2023 05:37:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r93iL-0003Cu-9O; Fri, 01 Dec 2023 14:37:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r93iK-00CrgM-QX; Fri, 01 Dec 2023 14:37:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r93iK-00CGQd-HQ; Fri, 01 Dec 2023 14:37:52 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] Input: amimouse - convert to platform remove callback returning void
Date: Fri,  1 Dec 2023 14:37:48 +0100
Message-ID: <20231201133747.1099286-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1938; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7TTLE2suK24O+jjP9M60foS/E8Hzbz1O1+2gBEbdDG8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlaeGsEuZtv3v+ITlldwjLJ5fSPk6n1Z5ptei1x NP9vliPcfSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZWnhrAAKCRCPgPtYfRL+ TnKhB/4vVoXKIGYDp123XJwaG/u+klw2RTEr39qRgjlmHmOgN09GsWHl8tUgKxrRF6XrngKu3oF Bnzejusa+A6El8SWBaSuKarYGO77utX4vHfObmgTTd0Id9jtCt5YflNOSlqoIAwowvzloZyMXOE Dwbes5Jv9vBgp8o0i2I7yur4RB0uqOC+Sk44Z4ZWKjFD9NlUE45HrEUS3aq8TB86TLdzpXsZ+d+ n8rhRULFhb98vIixZTKv3/l8jgC8xj2m1mMHDfPJY52fCfwSrUrVJ2fqJCgn0k5tZTRk0jcET2r 8Vu5VuJ6CvUIrroGgAsZhFCBDF13NlRvNesDHTU+xgfO9x28
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

some time ago I sent a series[1] with the intention to convert all input
drivers in one go. The coccinelle script I used for that missed this
driver however because of the __exit_p usage. So here comes a separate
patch.

Best regards
Uwe

[1] https://lore.kernel.org/r/20230920125829.1478827-1-u.kleine-koenig@pengutronix.de
 drivers/input/mouse/amimouse.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/amimouse.c b/drivers/input/mouse/amimouse.c
index a50e50354832..cda0c3ff5a28 100644
--- a/drivers/input/mouse/amimouse.c
+++ b/drivers/input/mouse/amimouse.c
@@ -125,16 +125,15 @@ static int __init amimouse_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __exit amimouse_remove(struct platform_device *pdev)
+static void __exit amimouse_remove(struct platform_device *pdev)
 {
 	struct input_dev *dev = platform_get_drvdata(pdev);
 
 	input_unregister_device(dev);
-	return 0;
 }
 
 static struct platform_driver amimouse_driver = {
-	.remove = __exit_p(amimouse_remove),
+	.remove_new = __exit_p(amimouse_remove),
 	.driver   = {
 		.name	= "amiga-mouse",
 	},
-- 
2.42.0


