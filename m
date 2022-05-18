Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833D652C4AE
	for <lists+linux-input@lfdr.de>; Wed, 18 May 2022 22:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242698AbiERUtM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 May 2022 16:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242696AbiERUtL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 May 2022 16:49:11 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B89E1C94CC
        for <linux-input@vger.kernel.org>; Wed, 18 May 2022 13:49:10 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 42EA7840DD;
        Wed, 18 May 2022 22:49:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1652906947;
        bh=XBqfKgLraEKIYEFZFeR2OqTYoyiBkz55i1A/38yJx/A=;
        h=From:To:Cc:Subject:Date:From;
        b=NuxBK3oIYWVprU9K74WFDPRCAQDN/m00egDhzYbfjZQvcMn3C3VlWQTdZarq1TNBC
         yxG69gO1s2O6puCG3bET+dlSDBtoAAMWrG223XhgDJ+9NLlkwn0FsjnyippPd7JnRy
         K2VD3vKxnrQ2XwOVI77+9X3gQh2gmdC+Qgwz7x2zuUB75yngrWj1OgejGlE4+tfuVe
         0QEUQbA1B03vYWcAXzwGNpFER0bSGJzCb5FHGv0bPjfeWaOCu5gi8V2e/+Ey3DWwuh
         RpE9XQtTqfkiuD2JygOTrwa73w395T0AvBk5f04xSk4QLjWpDoWhxS+wFFjaasr7Ur
         CzpFu3lyoVJ6A==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] Input: ili210x - Fix reset timing
Date:   Wed, 18 May 2022 22:49:01 +0200
Message-Id: <20220518204901.93534-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to Ilitek "231x & ILI251x Programming Guide" Version: 2.30
"2.1. Power Sequence", "T4 Chip Reset and discharge time" is minimum
10ms and "T2 Chip initial time" is maximum 150ms. Adjust the reset
timings such that T4 is 12ms and T2 is 160ms to fit those figures.

This prevents sporadic touch controller start up failures when some
systems with at least ILI251x controller boot, without this patch
the systems sometimes fail to communicate with the touch controller.

Fixes: 201f3c803544c ("Input: ili210x - add reset GPIO support")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
V2: Use usleep_range() for shorter 12..15ms delay
---
 drivers/input/touchscreen/ili210x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 2bd407d86bae5..3a48262fb3d35 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -951,9 +951,9 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 		if (error)
 			return error;
 
-		usleep_range(50, 100);
+		usleep_range(12000, 15000);
 		gpiod_set_value_cansleep(reset_gpio, 0);
-		msleep(100);
+		msleep(160);
 	}
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-- 
2.35.1

