Return-Path: <linux-input+bounces-685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0821980D301
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 17:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B78F3281A8C
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 16:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359DD48CEA;
	Mon, 11 Dec 2023 16:57:21 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 75FDB8E;
	Mon, 11 Dec 2023 08:57:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,268,1695654000"; 
   d="scan'208";a="186065621"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Dec 2023 01:57:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.141])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F2D3B400A8A7;
	Tue, 12 Dec 2023 01:57:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] Input: da9063 - Simplify obtaining OF match data
Date: Mon, 11 Dec 2023 16:57:06 +0000
Message-Id: <20231211165708.161808-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211165708.161808-1-biju.das.jz@bp.renesas.com>
References: <20231211165708.161808-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify probe() by replacing of_match_node() for retrieving match data by
device_get_match_data().

Some minor cleanups:
 * Remove the trailing comma in the terminator entry for the OF
   table making code robust against (theoretical) misrebases or other
   similar things where the new entry goes _after_ the termination without
   the compiler noticing.
 * Move OF table near to the user.
 * Arrange variables in reverse xmas tree order in probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/input/misc/da9063_onkey.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index 74808bae326a..9351ce0bb405 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -74,13 +74,6 @@ static const struct da906x_chip_config da9062_regs = {
 	.name = "da9062-onkey",
 };
 
-static const struct of_device_id da9063_compatible_reg_id_table[] = {
-	{ .compatible = "dlg,da9063-onkey", .data = &da9063_regs },
-	{ .compatible = "dlg,da9062-onkey", .data = &da9062_regs },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, da9063_compatible_reg_id_table);
-
 static void da9063_poll_on(struct work_struct *work)
 {
 	struct da9063_onkey *onkey = container_of(work,
@@ -187,14 +180,8 @@ static irqreturn_t da9063_onkey_irq_handler(int irq, void *data)
 static int da9063_onkey_probe(struct platform_device *pdev)
 {
 	struct da9063_onkey *onkey;
-	const struct of_device_id *match;
-	int irq;
 	int error;
-
-	match = of_match_node(da9063_compatible_reg_id_table,
-			      pdev->dev.of_node);
-	if (!match)
-		return -ENXIO;
+	int irq;
 
 	onkey = devm_kzalloc(&pdev->dev, sizeof(struct da9063_onkey),
 			     GFP_KERNEL);
@@ -203,7 +190,10 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	onkey->config = match->data;
+	onkey->config = device_get_match_data(&pdev->dev);
+	if (!onkey->config)
+		return -ENXIO;
+
 	onkey->dev = &pdev->dev;
 
 	onkey->regmap = dev_get_regmap(pdev->dev.parent, NULL);
@@ -270,6 +260,13 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id da9063_compatible_reg_id_table[] = {
+	{ .compatible = "dlg,da9063-onkey", .data = &da9063_regs },
+	{ .compatible = "dlg,da9062-onkey", .data = &da9062_regs },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, da9063_compatible_reg_id_table);
+
 static struct platform_driver da9063_onkey_driver = {
 	.probe	= da9063_onkey_probe,
 	.driver	= {
-- 
2.25.1


