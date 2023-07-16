Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C4575504B
	for <lists+linux-input@lfdr.de>; Sun, 16 Jul 2023 20:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjGPSZD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Jul 2023 14:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjGPSZC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Jul 2023 14:25:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 23FA31B0;
        Sun, 16 Jul 2023 11:25:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="169306155"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jul 2023 03:25:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A7473406DAD5;
        Mon, 17 Jul 2023 03:24:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        linux-input@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] Input: exc3000 - Simplify probe()
Date:   Sun, 16 Jul 2023 19:24:55 +0100
Message-Id: <20230716182455.216335-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The exc3000_id.driver_data could store a pointer to the info,
like for ACPI/DT-based matching, making I2C, ACPI and DT-based
matching more similar.

After that, we can simplify the probe() by replacing of_device_get_
match_data() and i2c_match_id() by i2c_get_match_data() as we have
similar I2C, ACPI and DT-based matching table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

