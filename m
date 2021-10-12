Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2335542A874
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 17:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237509AbhJLPl7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 11:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237491AbhJLPl6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 11:41:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290E3C061745
        for <linux-input@vger.kernel.org>; Tue, 12 Oct 2021 08:39:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maJsd-0008NT-Up; Tue, 12 Oct 2021 17:39:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maJsc-0004ik-Q7; Tue, 12 Oct 2021 17:39:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1maJsb-0004Y5-OP; Tue, 12 Oct 2021 17:39:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Cc:     Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v2 05/20] input: adxl34xx: Make adxl34x_remove() return void
Date:   Tue, 12 Oct 2021 17:39:30 +0200
Message-Id: <20211012153945.2651412-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=wc1dQ8068Cu8i6oLG4jCUQi32w4OqgSEom4N8oawnTg=; m=Z35zEqGg82zhKujZki3WXSREWKfbS0aTa8UkTMklTJg=; p=QT+3ZtPBPblOHahXh7QoMrpcjZbKAO38bG2mksoUihY=; g=d0f6a150c9b3211526c2456a0a1697e753433591
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFlrAcACgkQwfwUeK3K7Am60Qf+OLq TRNUKjj9ZdPMZz9LSWQ7qRcyA2ecYCox73W++UjSX0A5IB0wlkQbV1/sINvSF7VBGY/rZSp5NvwWw RbxGIvUEAgA3gUfMWSLFG9g2loJw2uxJ4ocFSnRw23ajBJxAk5o5LQDjNoo//53mPWJaqvia6yrop hnBi4YW76IxRDG3jux0GSWLeqC0Jy3iDOZnl3lFzfHTPTolz1H6wmodw6cNFVsUY8o4EsDQJzN2iV 5ieTv16jymTfxb04ewbC2f7PJI019gPPWOaoyuIBsgVqUskIXgb+SuvKuxw0phecmkv008IXxWyer pDPBsy+h+g3TSFpHZXZN+yAm7Ihgzfg==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Up to now adxl34x_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/misc/adxl34x-i2c.c | 4 +++-
 drivers/input/misc/adxl34x-spi.c | 4 +++-
 drivers/input/misc/adxl34x.c     | 4 +---
 drivers/input/misc/adxl34x.h     | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34x-i2c.c
index e64368a63346..a3b5f88d2bd1 100644
--- a/drivers/input/misc/adxl34x-i2c.c
+++ b/drivers/input/misc/adxl34x-i2c.c
@@ -103,7 +103,9 @@ static int adxl34x_i2c_remove(struct i2c_client *client)
 {
 	struct adxl34x *ac = i2c_get_clientdata(client);
 
-	return adxl34x_remove(ac);
+	adxl34x_remove(ac);
+
+	return 0;
 }
 
 static int __maybe_unused adxl34x_i2c_suspend(struct device *dev)
diff --git a/drivers/input/misc/adxl34x-spi.c b/drivers/input/misc/adxl34x-spi.c
index df6afa455e46..6e51c9bc619f 100644
--- a/drivers/input/misc/adxl34x-spi.c
+++ b/drivers/input/misc/adxl34x-spi.c
@@ -91,7 +91,9 @@ static int adxl34x_spi_remove(struct spi_device *spi)
 {
 	struct adxl34x *ac = spi_get_drvdata(spi);
 
-	return adxl34x_remove(ac);
+	adxl34x_remove(ac);
+
+	return 0;
 }
 
 static int __maybe_unused adxl34x_spi_suspend(struct device *dev)
diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index 4cc4e8ff42b3..34beac80e6f0 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -896,15 +896,13 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 }
 EXPORT_SYMBOL_GPL(adxl34x_probe);
 
-int adxl34x_remove(struct adxl34x *ac)
+void adxl34x_remove(struct adxl34x *ac)
 {
 	sysfs_remove_group(&ac->dev->kobj, &adxl34x_attr_group);
 	free_irq(ac->irq, ac);
 	input_unregister_device(ac->input);
 	dev_dbg(ac->dev, "unregistered accelerometer\n");
 	kfree(ac);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(adxl34x_remove);
 
diff --git a/drivers/input/misc/adxl34x.h b/drivers/input/misc/adxl34x.h
index 83a0eeccf613..febf85270fff 100644
--- a/drivers/input/misc/adxl34x.h
+++ b/drivers/input/misc/adxl34x.h
@@ -25,6 +25,6 @@ void adxl34x_resume(struct adxl34x *ac);
 struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 			      bool fifo_delay_default,
 			      const struct adxl34x_bus_ops *bops);
-int adxl34x_remove(struct adxl34x *ac);
+void adxl34x_remove(struct adxl34x *ac);
 
 #endif
-- 
2.30.2

