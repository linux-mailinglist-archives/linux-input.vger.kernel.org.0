Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5EFEB3C1B
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 16:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbfIPOEE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 10:04:04 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45777 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388215AbfIPOEE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 10:04:04 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rbk-0000tD-Fg; Mon, 16 Sep 2019 16:04:00 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rbj-0008GA-S4; Mon, 16 Sep 2019 16:03:59 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/4] input: misc: da9063_onkey: add mode change support
Date:   Mon, 16 Sep 2019 16:03:56 +0200
Message-Id: <20190916140358.30036-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916140358.30036-1-m.felsch@pengutronix.de>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The pmic state machine behaviour upon a 'onkey press' event can be
configured using the ONKEY_PIN bit field. Most the time this is
configured correct by the OTP but sometimes we need to adjust the
behaviour so we need to add the support here.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/misc/da9063_onkey.c | 10 ++++++++++
 drivers/mfd/da9062-core.c         |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index fd355cf59397..bc982fcc87eb 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -40,6 +40,7 @@ struct da9063_onkey {
 	const struct da906x_chip_config *config;
 	char phys[32];
 	bool key_power;
+	u8 key_opmode;
 };
 
 static const struct da906x_chip_config da9063_regs = {
@@ -193,6 +194,7 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 {
 	struct da9063_onkey *onkey;
 	const struct of_device_id *match;
+	unsigned int val;
 	int irq;
 	int error;
 
@@ -220,6 +222,14 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 	onkey->key_power = !of_property_read_bool(pdev->dev.of_node,
 						  "dlg,disable-key-power");
 
+	if (!of_property_read_u32(pdev->dev.of_node, "dlg,key-opmode", &val)) {
+		error = regmap_update_bits(onkey->regmap, DA9062AA_CONFIG_I,
+					   DA9062AA_NONKEY_PIN_MASK,
+					   val << DA9062AA_NONKEY_PIN_SHIFT);
+		if (error)
+			return error;
+	}
+
 	onkey->input = devm_input_allocate_device(&pdev->dev);
 	if (!onkey->input) {
 		dev_err(&pdev->dev, "Failed to allocated input device.\n");
diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index e69626867c26..aaa1f1841bc3 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -510,6 +510,7 @@ static const struct regmap_range da9062_aa_writeable_ranges[] = {
 	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
 	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
 	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
+	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
 };
 
 static const struct regmap_range da9062_aa_volatile_ranges[] = {
-- 
2.20.1

