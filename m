Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B9E414574
	for <lists+linux-input@lfdr.de>; Wed, 22 Sep 2021 11:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbhIVJpQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Sep 2021 05:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbhIVJpA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Sep 2021 05:45:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AB4C0613E1
        for <linux-input@vger.kernel.org>; Wed, 22 Sep 2021 02:43:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mSymY-0006R9-0F; Wed, 22 Sep 2021 11:43:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mSymV-0003RD-MQ; Wed, 22 Sep 2021 11:43:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mSymV-0005IU-LS; Wed, 22 Sep 2021 11:43:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH] Input: snvs_pwrkey - Add clk handling
Date:   Wed, 22 Sep 2021 11:43:00 +0200
Message-Id: <20210922094300.354227-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=8JEC9qWxA9J2PUg0PTv7WfZdxr0e8sHBys7YS0hRcZ8=; m=ZSCscfW1kNsEKkMpUkLsQz442RNF2ZAWxTwuboFAW68=; p=bA1CI9yE9a7Onbrq0rhp15sp9QjTfrGm8j1olzBd3kE=; g=0451fe6636105faf1af7d3c46c2720ecd348f8c8
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFK+p8ACgkQwfwUeK3K7AkxiQf9Gyj v3ppcynAM/Ga9f0PGDlDQtrX4O0HT2K94tvykHB8WgZkfaOhnr3hm1BfZ1XyV1sbT0AySCVErhCSw 21aUZTHztOLiYV8rO5P9p+L4kkvrX0LqtsyCgyM/ePwXWiHFUVBNjXPK+w5sI69OEVQpQVbAZIfhC mlHWAmy5xD8rJJuSBmtZO+A2pHnouytdPemoy8x8J1y1qckztABC+zU0zI1UMzEZwYjTTvcA8Rfen WwKkW3R9nDWhdJAUwhI5zLyrHhcWdiMxWEW1QjxjtnaVFhC6bSKJ/AChJjXbcefvOdDSVhoNwKsif kH6slfUjVz99/gzPi3cpJufDzyS6h0w==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On i.MX7S and i.MX8M* (but not i.MX6*) the pwrkey device has an
associated clock. Accessing the registers requires that this clock is
enabled. Binding the driver on at least i.MX7S and i.MX8MP while not
having the clock enabled results in a complete hang of the machine.
(This usually only happens if snvs_pwrkey is built as a module and the
rtc-snvs driver isn't already bound because at bootup the required clk
is on and only gets disabled when the clk framework disables unused clks
late during boot.)

This completes the fix in commit 135be16d3505 ("ARM: dts: imx7s: add
snvs clock to pwrkey").

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/keyboard/snvs_pwrkey.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index 2f5e3ab5ed63..b79a559b8329 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -3,6 +3,7 @@
 // Driver for the IMX SNVS ON/OFF Power Key
 // Copyright (C) 2015 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -99,6 +100,11 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void imx_snvs_pwrkey_disable_clk(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
 static void imx_snvs_pwrkey_act(void *pdata)
 {
 	struct pwrkey_drv_data *pd = pdata;
@@ -111,6 +117,7 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	struct pwrkey_drv_data *pdata;
 	struct input_dev *input;
 	struct device_node *np;
+	struct clk *clk;
 	int error;
 	u32 vid;
 
@@ -134,6 +141,19 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
 	}
 
+	clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to get clock\n");
+
+	error = clk_prepare_enable(clk);
+	if (error)
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to enable clock\n");
+
+	error = devm_add_action_or_reset(&pdev->dev, imx_snvs_pwrkey_disable_clk, clk);
+	if (error)
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "Failed to register clock cleanup handler\n");
+
 	pdata->wakeup = of_property_read_bool(np, "wakeup-source");
 
 	pdata->irq = platform_get_irq(pdev, 0);

base-commit: 7d2a07b769330c34b4deabeed939325c77a7ec2f
-- 
2.30.2

