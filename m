Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52DE310B017
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 14:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfK0NXL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 08:23:11 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54821 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbfK0NXK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 08:23:10 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxHe-0001hI-6L; Wed, 27 Nov 2019 14:23:06 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iZxHd-000620-PC; Wed, 27 Nov 2019 14:23:05 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Adam.Thomson.Opensource@diasemi.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: [PATCH v2 2/3] input: misc: da9063_onkey: add mode change support
Date:   Wed, 27 Nov 2019 14:23:03 +0100
Message-Id: <20191127132304.22924-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127132304.22924-1-m.felsch@pengutronix.de>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
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
v2:
- make use of da906x_chip_config
- rm unnecessary key_opmode

 drivers/input/misc/da9063_onkey.c | 16 ++++++++++++++++
 drivers/mfd/da9062-core.c         |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index 79851923ee57..3a3f06a33eda 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -19,6 +19,7 @@
 
 struct da906x_chip_config {
 	/* REGS */
+	int onkey_config;
 	int onkey_status;
 	int onkey_pwr_signalling;
 	int onkey_fault_log;
@@ -26,6 +27,7 @@ struct da906x_chip_config {
 	/* MASKS */
 	int onkey_nonkey_mask;
 	int onkey_nonkey_lock_mask;
+	int onkey_nonkey_pin_mask;
 	int onkey_key_reset_mask;
 	int onkey_shutdown_mask;
 	/* NAMES */
@@ -44,6 +46,7 @@ struct da9063_onkey {
 
 static const struct da906x_chip_config da9063_regs = {
 	/* REGS */
+	.onkey_config = DA9063_REG_CONFIG_I,
 	.onkey_status = DA9063_REG_STATUS_A,
 	.onkey_pwr_signalling = DA9063_REG_CONTROL_B,
 	.onkey_fault_log = DA9063_REG_FAULT_LOG,
@@ -51,6 +54,7 @@ static const struct da906x_chip_config da9063_regs = {
 	/* MASKS */
 	.onkey_nonkey_mask = DA9063_NONKEY,
 	.onkey_nonkey_lock_mask = DA9063_NONKEY_LOCK,
+	.onkey_nonkey_pin_mask = DA9063_NONKEY_PIN_MASK,
 	.onkey_key_reset_mask = DA9063_KEY_RESET,
 	.onkey_shutdown_mask = DA9063_SHUTDOWN,
 	/* NAMES */
@@ -59,6 +63,7 @@ static const struct da906x_chip_config da9063_regs = {
 
 static const struct da906x_chip_config da9062_regs = {
 	/* REGS */
+	.onkey_config = DA9062AA_CONFIG_I,
 	.onkey_status = DA9062AA_STATUS_A,
 	.onkey_pwr_signalling = DA9062AA_CONTROL_B,
 	.onkey_fault_log = DA9062AA_FAULT_LOG,
@@ -66,6 +71,7 @@ static const struct da906x_chip_config da9062_regs = {
 	/* MASKS */
 	.onkey_nonkey_mask = DA9062AA_NONKEY_MASK,
 	.onkey_nonkey_lock_mask = DA9062AA_NONKEY_LOCK_MASK,
+	.onkey_nonkey_pin_mask = DA9062AA_NONKEY_PIN_MASK,
 	.onkey_key_reset_mask = DA9062AA_KEY_RESET_MASK,
 	.onkey_shutdown_mask = DA9062AA_SHUTDOWN_MASK,
 	/* NAMES */
@@ -193,6 +199,7 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 {
 	struct da9063_onkey *onkey;
 	const struct of_device_id *match;
+	unsigned int val;
 	int irq;
 	int error;
 
@@ -220,6 +227,15 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 	onkey->key_power = !of_property_read_bool(pdev->dev.of_node,
 						  "dlg,disable-key-power");
 
+	if (!of_property_read_u32(pdev->dev.of_node, "dlg,key-opmode", &val)) {
+		error = regmap_update_bits(onkey->regmap,
+					   onkey->config->onkey_config,
+					   onkey->config->onkey_nonkey_pin_mask,
+					   val);
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

