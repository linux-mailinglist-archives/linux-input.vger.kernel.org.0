Return-Path: <linux-input+bounces-775-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE218120E4
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 22:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A684A1F21911
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 21:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CD07FBB2;
	Wed, 13 Dec 2023 21:48:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96363E0;
	Wed, 13 Dec 2023 13:48:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,273,1695654000"; 
   d="scan'208";a="186385648"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Dec 2023 06:48:17 +0900
Received: from localhost.localdomain (unknown [10.26.240.14])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 98DFA40BB731;
	Thu, 14 Dec 2023 06:48:14 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] Input: da9063 - Drop redundant prints in probe()
Date: Wed, 13 Dec 2023 21:48:01 +0000
Message-Id: <20231213214803.9931-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
References: <20231213214803.9931-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocation core code already prints error message in case of
OOM. So, drop additional print messages for OOM cases.

While at it, input_register_device() is already printing error messages on
failure. Drop the redundant print.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/input/misc/da9063_onkey.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index 9351ce0bb405..80878274204e 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -185,10 +185,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 
 	onkey = devm_kzalloc(&pdev->dev, sizeof(struct da9063_onkey),
 			     GFP_KERNEL);
-	if (!onkey) {
-		dev_err(&pdev->dev, "Failed to allocate memory.\n");
+	if (!onkey)
 		return -ENOMEM;
-	}
 
 	onkey->config = device_get_match_data(&pdev->dev);
 	if (!onkey->config)
@@ -206,10 +204,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 						  "dlg,disable-key-power");
 
 	onkey->input = devm_input_allocate_device(&pdev->dev);
-	if (!onkey->input) {
-		dev_err(&pdev->dev, "Failed to allocated input device.\n");
+	if (!onkey->input)
 		return -ENOMEM;
-	}
 
 	onkey->input->name = onkey->config->name;
 	snprintf(onkey->phys, sizeof(onkey->phys), "%s/input0",
@@ -221,12 +217,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 
 	error = devm_delayed_work_autocancel(&pdev->dev, &onkey->work,
 					     da9063_poll_on);
-	if (error) {
-		dev_err(&pdev->dev,
-			"Failed to add cancel poll action: %d\n",
-			error);
+	if (error)
 		return error;
-	}
 
 	irq = platform_get_irq_byname(pdev, "ONKEY");
 	if (irq < 0)
@@ -250,14 +242,7 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 	else
 		device_init_wakeup(&pdev->dev, true);
 
-	error = input_register_device(onkey->input);
-	if (error) {
-		dev_err(&pdev->dev,
-			"Failed to register input device: %d\n", error);
-		return error;
-	}
-
-	return 0;
+	return input_register_device(onkey->input);
 }
 
 static const struct of_device_id da9063_compatible_reg_id_table[] = {
-- 
2.25.1


