Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88A6435767
	for <lists+linux-input@lfdr.de>; Thu, 21 Oct 2021 02:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbhJUA0J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Oct 2021 20:26:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:43754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232114AbhJUAZP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Oct 2021 20:25:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8D3C61057;
        Thu, 21 Oct 2021 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634775780;
        bh=7bLD1MUDdpch80iXr8BwoGJ4m7QmXbw+3iJAhOjMmvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q6b0FQMdCZ9U8xmFLBPtl+0TzqnA4NEerVLWQkNTmNUv8/2V441hKM2N0LWQZ/NIQ
         PCRC9mVQjUG8yq9rWQfoV5IGcduIk5DX2GCjjvQw04YaVe04glj9tfx7FSeU4Tr1Mg
         q/M/FPe6NfWhzDFobrT5aMVo4wt/8Bg1MtAf8S5eh7t/CImbumAE392ASi6XMAdIS5
         X294gE9rPxAQFA9BCETBf8YS/C4hDe33Bc7t+albzJ4ITyvOaWFkZAX3XqTP5JahAm
         iSjuWARhr2j6P3gqaIKEjEOpbNLAeIGoutcaBQrMhmVgBOAti2N1Bz0krbWLWMmN7i
         sJogI37Gn1MRA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/11] Input: snvs_pwrkey - add clk handling
Date:   Wed, 20 Oct 2021 20:22:36 -0400
Message-Id: <20211021002238.1129482-10-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021002238.1129482-1-sashal@kernel.org>
References: <20211021002238.1129482-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[ Upstream commit d997cc1715df7b6c3df798881fb9941acf0079f8 ]

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
Link: https://lore.kernel.org/r/20211013062848.2667192-1-u.kleine-koenig@pengutronix.de
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/keyboard/snvs_pwrkey.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index e76b7a400a1c..248bb86f4b3f 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -3,6 +3,7 @@
 // Driver for the IMX SNVS ON/OFF Power Key
 // Copyright (C) 2015 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -81,6 +82,11 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
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
@@ -93,6 +99,7 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	struct pwrkey_drv_data *pdata = NULL;
 	struct input_dev *input = NULL;
 	struct device_node *np;
+	struct clk *clk;
 	int error;
 
 	/* Get SNVS register Page */
@@ -115,6 +122,28 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
 	}
 
+	clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(&pdev->dev, "Failed to get snvs clock (%pe)\n", clk);
+		return PTR_ERR(clk);
+	}
+
+	error = clk_prepare_enable(clk);
+	if (error) {
+		dev_err(&pdev->dev, "Failed to enable snvs clock (%pe)\n",
+			ERR_PTR(error));
+		return error;
+	}
+
+	error = devm_add_action_or_reset(&pdev->dev,
+					 imx_snvs_pwrkey_disable_clk, clk);
+	if (error) {
+		dev_err(&pdev->dev,
+			"Failed to register clock cleanup handler (%pe)\n",
+			ERR_PTR(error));
+		return error;
+	}
+
 	pdata->wakeup = of_property_read_bool(np, "wakeup-source");
 
 	pdata->irq = platform_get_irq(pdev, 0);
-- 
2.33.0

