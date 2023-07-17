Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE4675645D
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 15:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbjGQNT4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 09:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbjGQNTo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 09:19:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0C6503C3A;
        Mon, 17 Jul 2023 06:18:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="173149956"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 22:18:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D08BA4208E5B;
        Mon, 17 Jul 2023 22:18:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        linux-input@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] Input: exc3000 - Drop enum eeti_dev_id and split exc3000_info[]
Date:   Mon, 17 Jul 2023 14:17:56 +0100
Message-Id: <20230717131756.240645-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Drop enum eeti_dev_id and split the array exc3000_info[] as individual
variables, and make lines shorter by referring to e.g. &exc3000_info
instead of &exc3000_info[EETI_EXC3000].

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/input/touchscreen/exc3000.c | 42 +++++++++++++----------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 8b65b4e2aa50..b124a64f8164 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -47,25 +47,19 @@ struct eeti_dev_info {
 	int max_xy;
 };
 
-enum eeti_dev_id {
-	EETI_EXC3000,
-	EETI_EXC80H60,
-	EETI_EXC80H84,
+static const struct eeti_dev_info exc3000_info = {
+	.name = "EETI EXC3000 Touch Screen",
+	.max_xy = SZ_4K - 1
 };
 
-static struct eeti_dev_info exc3000_info[] = {
-	[EETI_EXC3000] = {
-		.name = "EETI EXC3000 Touch Screen",
-		.max_xy = SZ_4K - 1,
-	},
-	[EETI_EXC80H60] = {
-		.name = "EETI EXC80H60 Touch Screen",
-		.max_xy = SZ_16K - 1,
-	},
-	[EETI_EXC80H84] = {
-		.name = "EETI EXC80H84 Touch Screen",
-		.max_xy = SZ_16K - 1,
-	},
+static const struct eeti_dev_info exc80h60_info = {
+	.name = "EETI EXC80H60 Touch Screen",
+	.max_xy = SZ_16K - 1
+};
+
+static const struct eeti_dev_info exc80h84_info = {
+	.name = "EETI EXC80H84 Touch Screen",
+	.max_xy = SZ_16K - 1
 };
 
 struct exc3000_data {
@@ -441,18 +435,18 @@ static int exc3000_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id exc3000_id[] = {
-	{ "exc3000", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC3000] },
-	{ "exc80h60", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H60] },
-	{ "exc80h84", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H84] },
+	{ "exc3000", .driver_data = (kernel_ulong_t)&exc3000_info },
+	{ "exc80h60", .driver_data = (kernel_ulong_t)&exc80h60_info },
+	{ "exc80h84", .driver_data = (kernel_ulong_t)&exc80h84_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, exc3000_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id exc3000_of_match[] = {
-	{ .compatible = "eeti,exc3000", .data = &exc3000_info[EETI_EXC3000] },
-	{ .compatible = "eeti,exc80h60", .data = &exc3000_info[EETI_EXC80H60] },
-	{ .compatible = "eeti,exc80h84", .data = &exc3000_info[EETI_EXC80H84] },
+	{ .compatible = "eeti,exc3000", .data = &exc3000_info },
+	{ .compatible = "eeti,exc80h60", .data = &exc80h60_info },
+	{ .compatible = "eeti,exc80h84", .data = &exc80h84_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, exc3000_of_match);
@@ -460,7 +454,7 @@ MODULE_DEVICE_TABLE(of, exc3000_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id exc3000_acpi_match[] = {
-	{ "EGA00001", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H60] },
+	{ "EGA00001", .driver_data = (kernel_ulong_t)&exc80h60_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, exc3000_acpi_match);
-- 
2.25.1

