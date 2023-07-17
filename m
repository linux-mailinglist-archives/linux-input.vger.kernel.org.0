Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D1875645B
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 15:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjGQNT4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 09:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjGQNTo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 09:19:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 57F363C35;
        Mon, 17 Jul 2023 06:18:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="173149946"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 22:18:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 84E7141B465F;
        Mon, 17 Jul 2023 22:18:01 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Date:   Mon, 17 Jul 2023 14:17:55 +0100
Message-Id: <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
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

The exc3000_id.driver_data could store a pointer to the info,
like for ACPI/DT-based matching, making I2C, ACPI and DT-based
matching more similar.

After that, we can simplify the probe() by replacing device_get_
match_data() and i2c_match_id() by i2c_get_match_data() as we have
similar I2C, ACPI and DT-based matching table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Rb tag from Geert.
---
 drivers/input/touchscreen/exc3000.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 4c0d99aae9e0..8b65b4e2aa50 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -42,8 +42,6 @@
 #define EXC3000_RESET_MS		10
 #define EXC3000_READY_MS		100
 
-static const struct i2c_device_id exc3000_id[];
-
 struct eeti_dev_info {
 	const char *name;
 	int max_xy;
@@ -347,12 +345,10 @@ static int exc3000_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->client = client;
-	data->info = device_get_match_data(&client->dev);
-	if (!data->info) {
-		enum eeti_dev_id eeti_dev_id =
-			i2c_match_id(exc3000_id, client)->driver_data;
-		data->info = &exc3000_info[eeti_dev_id];
-	}
+	data->info = i2c_get_match_data(client);
+	if (!data->info)
+		return -ENODEV;
+
 	timer_setup(&data->timer, exc3000_timer, 0);
 	init_completion(&data->wait_event);
 	mutex_init(&data->query_lock);
@@ -445,9 +441,9 @@ static int exc3000_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id exc3000_id[] = {
-	{ "exc3000", EETI_EXC3000 },
-	{ "exc80h60", EETI_EXC80H60 },
-	{ "exc80h84", EETI_EXC80H84 },
+	{ "exc3000", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC3000] },
+	{ "exc80h60", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H60] },
+	{ "exc80h84", .driver_data = (kernel_ulong_t)&exc3000_info[EETI_EXC80H84] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, exc3000_id);
-- 
2.25.1

